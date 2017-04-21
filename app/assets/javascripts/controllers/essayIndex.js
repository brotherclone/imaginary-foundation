ImaginaryApplication.controller('essayIndexCtrl', [ '$scope', '$window',function($scope,$window) {
    $scope.init = function () {
        $scope.essays = gon.essays;
    };
    $scope.selectCard = function(path){
        $window.location.href = path;
    };
}]);