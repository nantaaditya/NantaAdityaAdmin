angular.module(
        'imageApp',
        ['requestInterceptor', 'responseInterceptor', 'utilService',
            'securityService', 'imageController', 'loginService',
            'imageService', 'angularUtils.directives.dirPagination',
            'angularFileUpload', 'ngclipboard']).config(function($httpProvider) {
  $httpProvider.interceptors.push('RequestInterceptorFactory');
  $httpProvider.interceptors.push('ResponseInterceptorFactory');
});
