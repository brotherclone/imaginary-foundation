var ImaginaryApplication = angular.module('ImaginaryApplication',[])
    .run(function($rootScope){
       $rootScope.sitePath = 'http://www.imaginary.foundation';
        $rootScope.siteName = 'The Imaginary Foundation';
    });


$(document).on('turbolinks:load', function() {
    return angular.bootstrap(document.body, ['ImaginaryApplication']);
});
