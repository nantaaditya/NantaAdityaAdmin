angular.module('skillService', ['ngResource']);
angular.module('skillService').factory('SaveSkillFactory',
    function ($resource, RequestIdFactory, BaseURLFactory) {
      return $resource(BaseURLFactory.get() + '/api/skill', null, {
        post: {
          method: 'POST',
          params: {
            'requestId': RequestIdFactory.get()
          }
        }
      });
    });
angular.module('skillService').factory('GetSkillFactory',
    function ($resource, RequestIdFactory, BaseURLFactory) {
      return $resource(BaseURLFactory.get() + '/api/skill', null, {
        get: {
          method: 'GET',
          params: {
            'requestId': RequestIdFactory.get()
          }
        }
      });
    });
angular.module('skillService').factory('DeleteSkillFactory',
    function ($resource, RequestIdFactory, BaseURLFactory) {
      return $resource(BaseURLFactory.get() + '/api/skill/:id', {'id':'@id'}, {
        delete: {
          method: 'DELETE',
          params: {
            'requestId': RequestIdFactory.get()
          }
        }
      });
    });
