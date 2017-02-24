ImaginaryApplication.controller('essayIndexCtrl', [ '$scope', function($scope) {
    $scope.init = function () {
        $scope.essays = gon.essays;
    };
}]);