angular.module('dashboardController', []);
angular.module('dashboardController').controller(
        'dashboardCtrl',
        function($scope, LoadingFactory, CookiesFactory, CustomSessionFactory,
                SessionFactory, LogoutFactory, ChangePasswordFactory) {
          // VARIABLE
          $scope.oldPassword;
          $scope.newPassword;
          // HANDLER
          var initHandler = function() {
            if (isEmpty(SessionFactory.token())) {
              window.location = '/nanta-aditya-admin/login';
            } else {
              usernameHandler();
            }
          }

          var isEmpty = function(value) {
            return typeof value === 'undefined' || value === null
                    || value === '';
          }

          var logoutHandler = function() {
            CookiesFactory.remove('username');
            SessionFactory.remove();
            CustomSessionFactory.remove('username');
            window.location.href = "/nanta-aditya-admin/login";
          }

          var usernameHandler = function() {
            $scope.username = CustomSessionFactory.get('username');
          }

          var changePasswordHandler = function() {
            $scope.oldPassword = null;
            $scope.newPassword = null;
            $('#change-password-modal').modal('hide');
          }
          // FACTORY

          var logoutFactory = function() {
            LogoutFactory.get({}, function(response) {
              if (response.success) {
                logoutHandler();
              } else {
                sweetAlert("Error", response.message, "error");
              }
            }, function(response) {
            });
          }

          var changePasswordFactory = function() {
            LoadingFactory.increase('change-password');
            ChangePasswordFactory.put({
              'username': $scope.username,
              'oldPassword': $scope.oldPassword,
              'newPassword': $scope.newPassword
            }, function(response) {
              if (response.success) {
                changePasswordHandler();
                sweetAlert("Success", response.message, "success");
              } else {
                sweetAlert("Error", response.message, "error");
              }
              LoadingFactory.decrease('change-password');
            }, function(response) {
              LoadingFactory.decrease('change-password');
            });
          }
          // EVENT
          $scope.unauthenticate = function() {
            logoutFactory();
          }

          $scope.changePassword = function() {
            changePasswordFactory();
          }

          // INIT
          var init = function() {
            console.log("DASHBOARD");
            $scope.loadings = LoadingFactory;
            initHandler();
          }
          init();
        });
