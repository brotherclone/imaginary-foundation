ImaginaryApplication.controller('projectCtrl', [ '$scope', function($scope) {
    $scope.init = function () {
        $scope.project = gon.project;
    };
    function extractDomain(url) {
        var hostname;
        if (url.indexOf("://") > -1) {
            hostname = url.split('/')[2];
        } else {
            hostname = url.split('/')[0];
        }
        hostname = hostname.split(':')[0];
        var splitArr = hostname.split('.');
        var arrLen = splitArr.length;
        if (arrLen > 2) {
            hostname = splitArr[arrLen - 2] + '.' + splitArr[arrLen - 1];
        }
        return hostname;
    }
    $scope.getLinkIcon = function(url){
        var iconClass= 'icon-';
        switch (extractDomain(url)){
            case 'github.com':
                iconClass += 'octoface';
                break;
            case 'behance.net':
                iconClass += 'behance2';
                break;
            default:
                iconClass += 'link-external';
        }
        return iconClass;
    };
}]);