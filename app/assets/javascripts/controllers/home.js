ImaginaryApplication.controller('homeCtrl', [ '$scope', '$window', function($scope, $window){
    $scope.init = function(){

    };
    $scope.selectCard = function(path){
        $window.location.href = path;
    };
}]);