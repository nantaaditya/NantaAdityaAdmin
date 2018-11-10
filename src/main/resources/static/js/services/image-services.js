angular.module('imageService', ['ngResource']);
angular.module('imageService').factory('SaveImageFactory',
    function ($http, RequestIdFactory, BaseURLFactory) {
      return {
        post: function (projectImage, projectDto) {
          var formData = new FormData();
          formData.append('file', projectImage);
          formData.append('request', new Blob([angular.toJson(projectDto)], {
            type: 'application/json'
          }));
          return $http.post(BaseURLFactory.get() + '/api/image?requestId='
              + RequestIdFactory.get(), formData, {
            transformRequest: angular.identity,
            headers: {
              'Content-Type': undefined
            }
          }).then(function (response) {
            return response.data;
          }, function (response) {
            return response;
          });
        }
      }
    });


angular.module('imageService').factory('GetImageFactory',
    function ($resource, RequestIdFactory, BaseURLFactory) {
      return $resource(BaseURLFactory.get() + '/api/image', null, {
        get: {
          method: 'GET',
          params: {
            'requestId': RequestIdFactory.get()
          }
        }
      });
    });
