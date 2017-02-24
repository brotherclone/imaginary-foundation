ImaginaryApplication.controller('projectIndexCtrl', [ '$scope', function($scope) {
    $scope.init = function () {
       $scope.projects = gon.projects;
    };
}]);