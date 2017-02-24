var ImaginaryApplication = angular.module('ImaginaryApplication',[]);
$(document).on('turbolinks:load', function() {
    return angular.bootstrap(document.body, ['ImaginaryApplication']);
});
