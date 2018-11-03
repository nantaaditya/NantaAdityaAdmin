angular.module('blogService', ['ngResource']);
angular.module('blogService').factory('SaveBlogFactory',
    function ($resource, RequestIdFactory, BaseURLFactory) {
      return $resource(BaseURLFactory.get() + '/api/blog', null, {
        post: {
          method: 'POST',
          params: {
            'requestId': RequestIdFactory.get()
          }
        }
      });
    });

angular.module('blogService').factory('GetBlogFactory',
    function ($resource, RequestIdFactory, BaseURLFactory) {
      return $resource(BaseURLFactory.get() + '/api/blog', null, {
        get: {
          method: 'GET',
          cache: false,
          headers: {'Cache-Control': 'no-cache'},
          params: {
            'requestId': RequestIdFactory.get(),
            'client': 'ADMIN'
          }
        }
      });
    });
angular.module('blogService').factory('TogglePostFactory',
    function ($resource, RequestIdFactory, BaseURLFactory) {
      return $resource(BaseURLFactory.get() + '/api/post/toggle/:id',
          {id: '@id'}, {
            put: {
              method: 'PUT',
              params: {
                'requestId': RequestIdFactory.get()
              }
            }
          });
    });
angular.module('blogService').factory('FindPostFactory',
    function ($resource, RequestIdFactory, BaseURLFactory) {
      return $resource(BaseURLFactory.get() + '/api/post/:titleId', {titleId: '@titleId'}, {
        get: {
          method: 'GET',
          cache: false,
          headers: {'Cache-Control': 'no-cache'},
          params: {
            'requestId': RequestIdFactory.get()
          }
        }
      });
    });

angular.module('blogService').factory('UpdatePostFactory',
    function ($resource, RequestIdFactory, BaseURLFactory) {
      return $resource(BaseURLFactory.get() + '/api/post', null, {
        put: {
          method: 'PUT',
          params: {
            'requestId': RequestIdFactory.get()
          }
        }
      });
    });
