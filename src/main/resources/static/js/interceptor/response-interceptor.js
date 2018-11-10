angular.module('responseInterceptor', []);
angular.module('responseInterceptor').factory('ResponseInterceptorFactory',
        function() {
          var responseInterceptor = {
            response: function(response) {
              // do something to response if success
              return response;
            },
            responseError: function(response) {
              // do something to response if error
              return response;
            }
          };
          return responseInterceptor;
        });