ImaginaryApplication.directive('sharingLink', ['$window', '$rootScope', function($window, $rootScope){
    return{
        link: function(scope, element, attr){
            element.on('mousedown',function(event){
                switch (attr.sharingPlatform){
                    case 'facebook':
                        $window.location.href = 'http://www.facebook.com/sharer.php?u='+$rootScope.sitePath+attr.sharingUrl;
                        break;
                    case 'linkedin':
                        $window.location.href = 'https://www.linkedin.com/shareArticle?mini=true&url='+ $rootScope.sitePath+attr.sharingUrl +'&title='+encodeURIComponent(attr.sharingTitle)+'&summary='+encodeURIComponent(attr.sharingDescription)+'&source='+encodeURIComponent($rootScope.siteTile);
                        break;
                    case 'twitter':
                        $window.location.href = '"http://twitter.com/share?text='+encodeURIComponent(attr.sharingTitle)+'&url='+$rootScope.sitePath+attr.sharingUrl;
                        break;
                    default:
                        $window.location.href = 'http://www.facebook.com/sharer.php?u='+$rootScope.sitePath+attr.sharingUrl;
                }
            });
        }
    }
}]);