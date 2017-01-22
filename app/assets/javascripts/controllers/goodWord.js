ImaginaryApplication.controller('goodWordCtrl', [ '$scope', '$http', function($scope, $http){
    $scope.init = function(){
        $scope.checkList = $scope.createCurrentList(gon.goodwords);
        $scope.editMode = false;
        $scope.clearForm();
    };
    $scope.selectCandidates = function(copy){
        words = copy.split(' ');
        $scope.candidates = [];
        for(var i=0; i<words.length; i++){
            if($scope.currentWords.indexOf(words[i])==-1){
                var item = {
                    isDecided: false,
                    word: words[i],
                    fromURL: $scope.goodWordForm.goodInputURL
                };
                $scope.candidates.push(item);
            }
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
    $scope.createCurrentList = function(currentData){
        $scope.currentWords = [];
      for(var i=0; i<currentData.length; i++){
          $scope.currentWords.push(currentData[i].word);
      }
    };
    $scope.toggleMode = function(){
      $scope.editMode = !$scope.editMode;
    };
}]);