ImaginaryApplication.controller('essayCtrl', [ '$scope', '$sce', '$controller','$http', '$q', function($scope, $sce,$controller,$http,$q) {
    angular.extend(this, $controller('parsingEmbedsCtrl', {
        $scope: $scope,
        $http: $http,
        $q: $q
    }));
    $scope.init = function () {
        $scope.essay = gon.essay;
        $scope.parseHTML($scope.essay.body);
        $scope.$watch('processedHTML', function(){
            var body = $scope.cleanUpCommas($scope.processedHTML);
            $scope.essay.html = $sce.trustAsHtml(body);
            $scope.displayEmbeds = true;
        });
    };
    // Well this is stupid.
    $scope.cleanUpCommas = function(txt){
        txt = txt.replace("<p>,</p>", '');
        txt = txt.replace(",<pull", '<pull');
        txt = txt.replace(",<imag", '<imag');
        txt = txt.replace("quote>,", 'quote>');
        txt = txt.replace("image>,", 'image>');
        return txt;
    };
}]);


