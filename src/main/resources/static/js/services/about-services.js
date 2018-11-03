angular.module('aboutService', ['ngResource']);
angular.module('aboutService').factory('UpdateAboutFactory',
    function ($resource, RequestIdFactory, BaseURLFactory) {
      return $resource(BaseURLFactory.get() + '/api/about-me', null, {
        put: {
          method: 'PUT',
          params: {
            'requestId': RequestIdFactory.get()
          }
        }
      });
    });
angular.module('aboutService').factory('GetAboutFactory',
    function ($resource, RequestIdFactory, BaseURLFactory) {
      return $resource(BaseURLFactory.get() + '/api/about-me', null, {
        get: {
          method: 'GET',
          params: {
            'requestId': RequestIdFactory.get()
          }
        }
      });
    });
