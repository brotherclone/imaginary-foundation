
ImaginaryApplication.controller('recordCollectionCtrl', [ '$scope', function($scope){
    $scope.init = function(){
        $scope.currentGroup = gon.currentGroup;
        $scope.recordCollection = gon.recordCollection;
    };
    $scope.paginate = function(advance){
        if(advance){
            if(($scope.currentGroup+1) < $scope.recordCollection.length-1){
                $scope.currentGroup++;
            }
        }else{
            if(($scope.currentGroup-1) >= 0){
                $scope.currentGroup--;
            }
        }
    };
}]);


