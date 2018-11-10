angular.module('loginController', []);
angular
.module('loginController')
.controller(
    'loginCtrl',
    function ($scope, LoadingFactory, CookiesFactory,
        CustomSessionFactory, SessionFactory, LoginFactory,
        LogoutFactory, ChangePasswordFactory) {
      // VARIABLE
      $scope.oldPassword;
      $scope.newPassword;
      $scope.user = {};
      $scope.profile = "production";

      // HANDLER
      var initHandler = function () {
        if (SessionFactory.token() != null) {
          usernameHandler();
          window.location = '/nanta-aditya-admin/dashboard';
        }
      }

      var loginHandler = function (username, token) {
        CookiesFactory.put('username', username);
        SessionFactory.init(token);
        initHandler();
      }

      var usernameHandler = function () {
        $scope.username = CustomSessionFactory.get('username');
      }

      // FACTORY
      var loginFactory = function (user) {
        CustomSessionFactory.set('username', $scope.username);
        LoadingFactory.increase('login');
        LoginFactory.post($scope.user, function (response) {
          if (response.success) {
            loginHandler($scope.username, response.data);
          } else {
            sweetAlert("Error", response.message, "error");
          }
          LoadingFactory.decrease('login');
        }, function (response) {
          LoadingFactory.decrease('login');
        });
      }

      // EVENT
      $scope.authenticate = function () {
        $scope.user.username = $scope.username;
        $scope.user.password = $scope.password;
        $scope.user.captchaResponse = grecaptcha.getResponse();
        loginFactory($scope.user);
      }

      // INIT
      var init = function () {
        console.log("LOGIN");
        $scope.loadings = LoadingFactory;
        if ($scope.profile == "production") {
          $scope.captchaPublicKey = "6LeO4UYUAAAAALeGqo6BbKWPkMkAVDmVltXJgsXj";
        } else if ($scope.profile == "development") {
          $scope.captchaPublicKey = "6Len4UYUAAAAAGj6vm-Wgnrt5Q_78rVBMQu14JrL";
        }
        initHandler();
      }
      init();
    });
