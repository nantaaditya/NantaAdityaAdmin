angular.module(
        'dashboardApp',
        ['requestInterceptor', 'responseInterceptor', 'utilService',
            'securityService', 'dashboardController',
            'loginService']).config(function($httpProvider) {
  $httpProvider.interceptors.push('RequestInterceptorFactory');
  $httpProvider.interceptors.push('ResponseInterceptorFactory');
});