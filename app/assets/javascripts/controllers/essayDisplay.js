ImaginaryApplication.controller('essayCtrl', [ '$scope', function($scope) {
    $scope.init = function () {
        $scope.essay = gon.essay;
    };
}]);