ImaginaryApplication.controller('goodWordCtrl', [ '$scope', '$http', '$timeout', function($scope, $http, $timeout){
    $scope.init = function(){

    };
    $scope.selectCandidates = function(copy){
        words = copy.split(' ');
        $scope.candidates = [];
        for(var i=0; i<words.length; i++){
            var item = {
                isDecided: false,
                word: words[i],
                fromURL: $scope.goodInputURL
            };
            $scope.candidates.push(item);
        }
    };
    $scope.chooseCandidate = function(word, choose){
        word.isDecided = true;
        word.good = choose;
        $http({
            url: 'http://localhost:3000/goodwords.json',
            dataType: 'json',
            method: 'POST',
            data: {
                word: word.word,
                good: word.good,
                fromURL: word.fromURL
            },
            headers: {
                "Content-Type": "application/json"
            }

        }).success(function(response){
            // do something
        }).error(function(error){
            // do something
        });

    };
    $scope.clearForm = function(){

    };
}]);