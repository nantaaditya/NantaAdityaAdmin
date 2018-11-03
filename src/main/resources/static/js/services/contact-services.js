angular.module('contactService', ['ngResource']);
angular.module('contactService').factory('SaveContactFactory',
    function ($resource, RequestIdFactory, BaseURLFactory){
      return $resource(BaseURLFactory.get() + '/api/message', null, {
        post: {
          method: 'POST',
          params: {
            'requestId': RequestIdFactory.get()
          }
        }
      });
    });

angular.module('contactService').factory('GetContactFactory',
    function ($resource, RequestIdFactory, BaseURLFactory) {
      return $resource(BaseURLFactory.get() + '/api/message', null, {
        get: {
          method: 'GET',
          params: {
            'requestId': RequestIdFactory.get()
          }
        }
      });
    });
angular.module('contactService').factory('FindContactFactory',
    function ($resource, RequestIdFactory, BaseURLFactory) {
      return $resource(BaseURLFactory.get() + '/api/message/:id', {
        id: '@id'
      }, {
        get: {
          method: 'GET',
          params: {
            'requestId': RequestIdFactory.get()
          }
        }
      });
    });
angular.module('contactService').factory('ReplyContactFactory',
    function ($resource, RequestIdFactory, BaseURLFactory) {
      return $resource(BaseURLFactory.get() + '/api/message', null, {
        post: {
          method: 'PUT',
          params: {
            'requestId': RequestIdFactory.get()
          }
        }
      });
    });
