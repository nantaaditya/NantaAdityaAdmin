angular.module('requestInterceptor', []);
angular.module('requestInterceptor').factory('RequestInterceptorFactory',
        function(SessionFactory) {
          var requestInterceptor = {
            request: function(config) {
              config.headers['Authorization'] = SessionFactory.token();
              return config;
            }
          };
          return requestInterceptor;
        });