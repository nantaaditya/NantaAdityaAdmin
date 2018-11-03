angular.module('securityService', ['ngCookies']);
angular.module('securityService').factory('CookiesFactory', function($cookies) {
  var cookiesManager = {
    get: function(key) {
      var value = $cookies.get(key);
      return typeof value == 'undefined' || value == 'null' ? null : value;
    },
    put: function(key, value) {
      $cookies.put(key, value, {
        path: '/'
      });
    },
    remove: function(key) {
      $cookies.remove(key, {
        path: '/'
      });
    }
  };
  return cookiesManager;
});
angular.module('securityService').factory('SessionFactory',
        function(CookiesFactory) {
          var sessionManager = {
            init: function(token) {
              CookiesFactory.put('token', token);
            },
            token: function() {
              return CookiesFactory.get('token');
            },
            remove: function() {
              CookiesFactory.remove('token');
            }
          };
          return sessionManager;
        });
angular.module('securityService').factory('CustomSessionFactory',
        function(CookiesFactory) {
          var sessionManager = {
            set: function(key, value) {
              CookiesFactory.put(key, value);
            },
            get: function(key) {
              return CookiesFactory.get(key);
            },
            remove: function(key) {
              CookiesFactory.remove(key);
            }
          };
          return sessionManager;
        });