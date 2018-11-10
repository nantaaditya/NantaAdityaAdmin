angular.module(
        'blogApp',
        ['requestInterceptor', 'responseInterceptor', 'utilService',
            'securityService', 'blogController', 'loginService', 'blogService',
            'angularUtils.directives.dirPagination', 'angularFileUpload'])
        .config(function($httpProvider) {
          $httpProvider.interceptors.push('RequestInterceptorFactory');
          $httpProvider.interceptors.push('ResponseInterceptorFactory');
        });