angular.module('contactController', []);
angular.module('contactController').controller(
    'contactCtrl',
    function ($scope, LoadingFactory, CookiesFactory, CustomSessionFactory,
        SessionFactory, LogoutFactory, ChangePasswordFactory,
        GetContactFactory, FindContactFactory, ReplyContactFactory) {
      // VARIABLE
      $scope.oldPassword;
      $scope.newPassword;
      $scope.id;
      $scope.email;
      $scope.subject;
      $scope.message;

      // HANDLER
      var initHandler = function () {
        if (isEmpty(SessionFactory.token())) {
          window.location = '/nanta-aditya-admin/login';
        } else {
          usernameHandler();
          getContactFactory();
        }
      }

      var isEmpty = function (value) {
        return typeof value === 'undefined' || value === null
            || value === '';
      }

      var logoutHandler = function () {
        CookiesFactory.remove('username');
        SessionFactory.remove();
        CustomSessionFactory.remove('username');
        window.location.href = "/nanta-aditya-admin/login";
      }

      var usernameHandler = function () {
        $scope.username = CustomSessionFactory.get('username');
      }

      var changePasswordHandler = function () {
        $scope.oldPassword = null;
        $scope.newPassword = null;
        $('#change-password-modal').modal('hide');
      }

      var getContactHandler = function (contacts) {
        $scope.contacts = contacts;
      }

      var findContactHandler = function (contact) {
        $scope.contact = contact;
        $scope.email = contact.email;
        $('#reply-modal').modal('show');
        getContactFactory();
      }

      var replyContactHandler = function () {
        $scope.contact = {};
        $scope.id = null;
        $scope.email = null;
        $scope.subject = null;
        $scope.message = null;
        $('#reply-modal').modal('hide');
      }

      var alertHandler = function (response) {
        var alertMessage = "";
        for (var k in response.errors) {
          if(response.errors.hasOwnProperty(k)) {
            alertMessage += response.errors[k] + "<br/>";
          }
        }
        swal({
          title: response.message,
          text: "<p class='text-red'>" + alertMessage + "</p>",
          html: true,
          type: "error"
        });
      }
      // FACTORY
      var logoutFactory = function () {
        LogoutFactory.get({}, function (response) {
          if (response.success) {
            logoutHandler();
          } else {
            sweetAlert("Error", response.message, "error");
          }
        }, function (response) {
        });
      }

      var changePasswordFactory = function () {
        LoadingFactory.increase('change-password');
        ChangePasswordFactory.put({
          'username': $scope.username,
          'oldPassword': $scope.oldPassword,
          'newPassword': $scope.newPassword
        }, function (response) {
          if (response.success) {
            changePasswordHandler();
            sweetAlert("Success", response.message, "success");
          } else {
            alertHandler(response);
          }
          LoadingFactory.decrease('change-password');
        }, function (response) {
          LoadingFactory.decrease('change-password');
        });
      }

      var getContactFactory = function () {
        LoadingFactory.increase('get-contact');
        GetContactFactory.get({}, function (response) {
          if (response.success) {
            getContactHandler(response.data);
          } else {
            sweetAlert("Error", response.message, "error");
          }
          LoadingFactory.decrease('get-contact');
        }, function (response) {
          LoadingFactory.decrease('get-contact');
        });
      }

      var findContactFactory = function (id) {
        LoadingFactory.increase('find-contact'+id);
        FindContactFactory.get({
          'id': id
        }, function (response) {
          if (response.success) {
            findContactHandler(response.data)
          } else {
            sweetAlert("Error", response.message, "error");
          }
          LoadingFactory.decrease('find-contact'+id);
        }, function (response) {
          LoadingFactory.decrease('find-contact'+id);
        });
      }

      var replyContactFactory = function (id) {
        LoadingFactory.increase('reply-contact');
        ReplyContactFactory.post({
          'id': id,
          'email': $scope.email,
          'subject': $scope.subject,
          'message': $scope.message
        }, function (response) {
          if (response.success) {
            replyContactHandler();
            sweetAlert("Success", response.message, "success");
          } else {
            sweetAlert("Error", response.message, "error");
          }
          LoadingFactory.decrease('reply-contact');
        }, function (response) {
          LoadingFactory.decrease('reply-contact');
        });
      }

      // EVENT
      $scope.unauthenticate = function () {
        logoutFactory();
      }

      $scope.changePassword = function () {
        changePasswordFactory();
      }

      $scope.read = function (id) {
        $scope.id = id;
        findContactFactory(id);
      }

      $scope.reply = function () {
        replyContactFactory($scope.id);
      }

      // INIT
      var init = function () {
        console.log("CONTACT");
        $scope.loadings = LoadingFactory;
        initHandler();
      }
      init();
    });
