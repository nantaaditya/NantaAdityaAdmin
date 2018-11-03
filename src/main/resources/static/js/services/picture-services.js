angular.module('pictureService', ['ngResource']);
angular.module('pictureService').factory('SavePictureFactory', function($http, RequestIdFactory, BaseURLFactory) {
  return {
    post: function(image, pictureDto) {
      var formData = new FormData();
      formData.append('file', image);
      formData.append('pictureDto', new Blob([angular.toJson(pictureDto)], {
        type: 'application/json'
      }));
      return $http.post(BaseURLFactory.get()+'/api/picture?requestId='+RequestIdFactory.get(), formData, {
        transformRequest: angular.identity,
        headers: {
          'Content-Type': undefined
        }
      }).then(function(response) {
        return response.data;
      }, function(response) {
        return response;
      });
    }
  }
});

angular.module('pictureService').factory('GetPictureFactory',
        function($resource, RequestIdFactory, BaseURLFactory) {
          return $resource(BaseURLFactory.get() + '/api/picture', null, {
            get: {
              method: 'GET',
              params: {
                'requestId': RequestIdFactory.get()
              }
            }
          });
        });
angular.module('pictureService').factory('DeletePictureFactory',
        function($resource, RequestIdFactory, BaseURLFactory) {
          return $resource(BaseURLFactory.get() + '/api/picture', null, {
            delete: {
              method: 'DELETE',
              params: {
                'requestId': RequestIdFactory.get(),
                'path':'@path'
              }
            }
          });
        });
angular.module('pictureService').factory('TogglePictureFactory',
        function($resource, RequestIdFactory, BaseURLFactory) {
          return $resource(BaseURLFactory.get() + '/api/picture/:id', {id:'@id'}, {
            put: {
              method: 'PUT',
              params: {
                'requestId': RequestIdFactory.get(),
                'status':'@status'
              }
            }
          });
        });
angular.module('pictureService').factory('GetPictureActiveFactory',
        function($resource, RequestIdFactory, BaseURLFactory) {
          return $resource(BaseURLFactory.get() + '/api/picture/true', null, {
            get: {
              method: 'GET',
              params: {
                'requestId': RequestIdFactory.get()                
              }
            }
          });
        });
