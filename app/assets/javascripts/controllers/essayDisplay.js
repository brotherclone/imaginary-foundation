ImaginaryApplication.controller('essayCtrl', [ '$scope', '$sce', function($scope, $sce) {
    $scope.init = function () {
        $scope.essay = gon.essay;
        $scope.embedItems($scope.essay.body);

    };
    $scope.embedItems = function(text){
        var reg = /(\|\|\[)(.*)(]\|\|)/g;
        var test = text.match(reg);
        var body = text.replace(reg,'');
        $scope.essay.html =  $sce.trustAsHtml(body);
    };
}]);