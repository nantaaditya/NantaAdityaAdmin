angular.module('projectService', ['ngResource']);
angular.module('projectService').factory('SaveProjectFactory',
    function ($resource, RequestIdFactory, BaseURLFactory) {
      return $resource(BaseURLFactory.get() + '/api/project', null, {
        post: {
          method: 'POST',
          params: {
            'requestId': RequestIdFactory.get(),
          }
        }
      });
    });

angular.module('projectService').factory('GetProjectFactory',
    function ($resource, RequestIdFactory, BaseURLFactory) {
      return $resource(BaseURLFactory.get() + '/api/project', null, {
        get: {
          method: 'GET',
          params: {
            'requestId': RequestIdFactory.get()
          }
        }
      });
    });
angular.module('projectService').factory('DeleteProjectFactory',
    function ($resource, RequestIdFactory, BaseURLFactory) {
      return $resource(BaseURLFactory.get() + '/api/project/:id', {'id':'@id'}, {
        delete: {
          method: 'DELETE',
          params: {
            'requestId': RequestIdFactory.get(),
          }
        }
      });
    });
