angular.module('educationService', ['ngResource']);
angular.module('educationService').factory('SaveEducationFactory',
    function ($resource, RequestIdFactory, BaseURLFactory) {
      return $resource(BaseURLFactory.get() + '/api/curriculum-vitae', null, {
        post: {
          method: 'POST',
          params: {
            'requestId': RequestIdFactory.get()
          }
        }
      });
    });
angular.module('educationService').factory('GetEducationFactory',
    function ($resource, RequestIdFactory, BaseURLFactory) {
      return $resource(BaseURLFactory.get() + '/api/curriculum-vitae', null, {
        get: {
          method: 'GET',
          params: {
            'requestId': RequestIdFactory.get()
          }
        }
      });
    });
angular.module('educationService').factory('DeleteEducationFactory',
    function ($resource, RequestIdFactory, BaseURLFactory) {
      return $resource(BaseURLFactory.get() + '/api/curriculum-vitae/:id', {'id': '@id'}, {
        delete: {
          method: 'DELETE',
          params: {
            'requestId': RequestIdFactory.get()
          }
        }
      });
    });
