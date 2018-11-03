angular.module(
        'contactApp',
        ['requestInterceptor', 'responseInterceptor', 'utilService',
            'securityService', 'contactController', 'loginService',
            'contactService', 'angularUtils.directives.dirPagination']).config(function($httpProvider) {
  $httpProvider.interceptors.push('RequestInterceptorFactory');
  $httpProvider.interceptors.push('ResponseInterceptorFactory');
});