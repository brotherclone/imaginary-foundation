ImaginaryApplication.controller('navigationCtrl', [ '$scope', function($scope) {

    $scope.init = function () {
        $scope.mobileNavOpen = false;
    };

    $scope.toggleMobileNav = function(){
        $scope.mobileNavOpen = !$scope.mobileNavOpen;
        if($scope.mobileNavOpen){
            $('.navigation-menu').addClass('open');
        }else{
            $('.navigation-menu').removeClass('open');
        }
    };
}]);