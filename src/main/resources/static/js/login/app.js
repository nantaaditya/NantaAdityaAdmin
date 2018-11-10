angular.module(
        'loginApp',
        ['requestInterceptor', 'responseInterceptor', 'utilService',
            'securityService', 'loginController', 'loginService']).config(
        function($httpProvider) {
          $httpProvider.interceptors.push('RequestInterceptorFactory');
          $httpProvider.interceptors.push('ResponseInterceptorFactory');
        });