ImaginaryApplication.controller('projectIndexCtrl', [ '$scope','$window', function($scope,$window) {
    $scope.init = function () {
       $scope.projects = gon.projects;
    };
    $scope.selectCard = function(path){
        $window.location.href = path;
    };
}]);