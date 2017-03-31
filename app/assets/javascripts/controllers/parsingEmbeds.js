ImaginaryApplication.controller('parsingEmbedsCtrl', ['$scope', '$http', '$q', function ($scope, $http, $q) {
    $scope.parseHTML = function (text) {
        if(!$scope.parsingCompleted ){
            $scope.processedHTML = '<p>Loading...</p><br><br><br>';
        }
        $scope.embedStrings = {
            open: '||[',
            close: ']||',
            replacement: '@if@',
            embedKeys: ['typeName', 'id'],
            fullEmbedRegEx: /(\|\|\[)(.*)(]\|\|)/g
        };
        var splitBody = text.split($scope.embedStrings.fullEmbedRegEx);
        var matchBody = text.match($scope.embedStrings.fullEmbedRegEx);
        var delimitedText = $scope.replaceEmbedsWithDelimiter(splitBody);
        var readyToAdd = $scope.getEmbeds(matchBody);
        var promise = $scope.getPromisedEmbeds($scope.addDirectiveMarkUp(readyToAdd));
        promise.then(function(embeds) {
            if(embeds && delimitedText){
                var embedIndex = 0;
                for(var i=0; i<delimitedText.length; i++){
                    if(delimitedText[i]==$scope.embedStrings.replacement){
                        if( embeds[embedIndex] && embeds[embedIndex] !== undefined && embeds[embedIndex] != 'undefined' ){
                            delimitedText[i] = embeds[embedIndex];
                            console.log('you got comma?',embeds[embedIndex]);
                            embedIndex++;
                        }else{
                            delimitedText.splice(i,1);
                        }
                    }
                }
                $scope.processedHTML =  delimitedText.join();
            }
        }, function(reason) {
            console.log('embeds failed', reason);
            $scope.processedHTML =  text.replace($scope.embedStrings.fullEmbedRegEx, '');
        });
        $scope.parsingCompleted = true;
    };

    $scope.replaceEmbedsWithDelimiter = function (text) {
        var collector = [];
        var skipNext = 0;
        for (var i = 0; i < text.length; i++) {
            if (text[i] === $scope.embedStrings.open) {
                collector.push($scope.embedStrings.replacement);
                skipNext = 2;
            } else {
                if (skipNext <= 0) {
                    collector.push(text[i]);
                } else {
                    skipNext--;
                }
            }
        }
        return collector;
    };
    $scope.getEmbeds = function (incomingArray) {
        if(incomingArray){
            if(incomingArray.length){
                var collect = [];
                for (var i = 0; i < incomingArray.length; i++) {
                    var unOpenTag = incomingArray[i].replace($scope.embedStrings.open, '');
                    var unCloseTag = unOpenTag.replace($scope.embedStrings.close, '');
                    var preObj = unCloseTag.split(',');
                    var embedObj = {embedType: preObj[0], embedId: preObj[1]};
                    collect.push(embedObj);
                }
                return collect;
            }
        }
    };

    $scope.addDirectiveMarkUp = function (embeds) {
        if(embeds){
            var collector = [];
            $scope.embedsProcessed = 0;
            $scope.embedsSent = embeds.length;
            for (var i = 0; i < embeds.length; i++) {
                switch (embeds[i].embedType) {
                    case 'image':
                        var imageInfo;
                        $http.get('/images/'+ embeds[i].embedId + '.json').then(function successCallback(response,i) {
                            if (response.success) {
                                imageInfo = JSON.parse(response.data);
                                collector.push('<photo photo-id="' + embeds[i].embedId + '"></photo>');
                                $scope.embedsProcessed += 1;
                            }else{
                                console.log('Error' + response);
                                $scope.embedsProcessed += 1;
                            }
                        }, function errorCallback(response) {
                            console.log('Error' + response);
                            $scope.embedsProcessed += 1;
                        });
                        break;
                    case 'pull-quote':
                        var quoteInfo;
                        $http.get('/pull_quotes/'+ embeds[i].embedId + '.json').then(function successCallback(response) {
                            if (response.status == 200) {
                                if($scope.isItJSON(response.data)){
                                    quoteInfo = JSON.parse(response.data);
                                }else{
                                    quoteInfo = response.data;
                                }
                                collector.push('<div class="pull-quote" id="pull-quote-embed-' +quoteInfo.id + '">' +
                                                '<i class="open" role="presentation"></i>'+
                                                    '<h3>'+ quoteInfo.quote +'</h3>' +
                                                '<i class="open" role="presentation"></i>'+
                                                '</div>');
                            } else {
                                console.log('Error' + response.statusText);
                                $scope.embedsProcessed += 1;
                            }
                        }, function errorCallback(response) {
                            console.log('Error' + response.status);
                            $scope.embedsProcessed += 1;
                        });
                        break;
                    default:
                        collector.push('</br>');
                }
            }
            $scope.embedsProcessed += 1;
            return collector;
        }
    };
    $scope.getPromisedEmbeds = function(embeds) {
        return $q(function(resolve, reject) {
            setTimeout(function() {
                if ( $scope.embedsProcessed >= $scope.embedsSent) {
                    resolve(embeds);
                } else {
                    reject('Failed to retrieve embeds');
                }
            }, 2000);
        });
    };
    $scope.isItJSON = function(test){
        try {
            JSON.parse(test);
        } catch (e) {
            return false;
        }
        return true;
    };

}]);