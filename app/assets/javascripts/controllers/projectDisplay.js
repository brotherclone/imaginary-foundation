ImaginaryApplication.controller('projectCtrl', [ '$scope', function($scope) {
    $scope.init = function () {
        $scope.project = gon.project;
    };
}]);