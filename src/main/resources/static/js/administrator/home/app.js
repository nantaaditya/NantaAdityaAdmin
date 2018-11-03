angular.module(
        'homeApp',
        ['ngSanitize','requestInterceptor', 'responseInterceptor', 'utilService',
            'securityService', 'homeController', 'loginService',
            'aboutService', 'educationService', 'skillService',
            'projectService','angularUtils.directives.dirPagination','angularFileUpload']).config(function($httpProvider) {
  $httpProvider.interceptors.push('RequestInterceptorFactory');
  $httpProvider.interceptors.push('ResponseInterceptorFactory');
});