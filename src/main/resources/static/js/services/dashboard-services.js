angular.module('loginService', ['ngResource']);
angular.module('loginService').factory('LoginFactory',
        function($resource, RequestIdFactory, BaseURLFactory) {
          return $resource(BaseURLFactory.get() + '/api/login', null, {
            post: {
              method: 'POST',
              params: {
                'requestId': RequestIdFactory.get()
              }
            }
          });
        });
angular.module('loginService').factory('LogoutFactory',
        function($resource, RequestIdFactory, BaseURLFactory) {
          return $resource(BaseURLFactory.get() + '/api/logout', null, {
            get: {
              method: 'GET',
              params: {
                'requestId': RequestIdFactory.get()
              }
            }
          });
        });
angular.module('loginService').factory('ChangePasswordFactory',
        function($resource, RequestIdFactory, BaseURLFactory) {
          return $resource(BaseURLFactory.get() + '/api/change-password', null, {
            put: {
              method: 'POST',
              params: {
                'requestId': RequestIdFactory.get()
              }
            }
          });
        });
