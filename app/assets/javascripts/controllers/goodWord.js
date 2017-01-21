ImaginaryApplication.controller('goodWordCtrl', [ '$scope', '$http', function($scope, $http){
    $scope.init = function(){
        $scope.clearForm();
    };
    $scope.selectCandidates = function(copy){
        words = copy.split(' ');
        $scope.candidates = [];
        for(var i=0; i<words.length; i++){
            var item = {
                isDecided: false,
                word: words[i],
                fromURL: $scope.goodWordForm.goodInputURL
            };
            $scope.candidates.push(item);
        }
    };
    $scope.chooseCandidate = function(word, choose){
        word.good = choose;
        $http({
            url: 'http://localhost:3000/goodwords.json',
            dataType: 'json',
            method: 'POST',
            data: {
                goodword:{
                    word: word.word,
                    good: word.good,
                    fromURL: word.fromURL
                }
            },
            headers: {
                "Content-Type": "application/json"
            }
        }).then(function successCallback(response) {
            word.isDecided = true;
            console.log('Created', response)
        }, function errorCallback(response) {
            console.log('Error ', response)
        });

    };
    $scope.clearForm = function(){
        $scope.goodWordForm ={};
    };
}]);