angular.module('imageController', []);
angular.module('imageController').controller(
    'imageCtrl',
    function ($scope, LoadingFactory, CookiesFactory, CustomSessionFactory,
        SessionFactory, FileUploader, LogoutFactory, ChangePasswordFactory,
        SaveImageFactory, GetImageFactory) {
      // VARIABLE
      $scope.oldPassword;
      $scope.newPassword;
      $scope.images = [];
      $scope.imageUrl = '';
      $scope.searchKeyword='';
      var uploader = $scope.uploader = new FileUploader();

      uploader.filters.push({
        name: 'imageFilter',
        fn: function (item, options) {
          var type = '|' + item.type.slice(item.type.lastIndexOf('/') + 1)
              + '|';
          if (typeof item.type == 'undefined' || item.type == null || item.type
              == '') {
            type = '|' + item.name.slice(item.name.lastIndexOf('.') + 1) + '|';
          }

          // max item size 2097152
          if (item.size > 2097152) {
            swal('Information', 'Your file must below 2 MB', 'warning');
            return false;
          } else {
            if ('|jpeg|'.indexOf(type) !== -1) {
              return true;
            } else if ('|jpg|'.indexOf(type) !== -1) {
              return true;
            } else if ('|png|'.indexOf(type) !== -1) {
              return true;
            } else if ('|gif|'.indexOf(type) !== -1) {
              return true;
            } else if ('|bmp|'.indexOf(type) !== -1) {
              return true;
            } else {
              swal('Error', 'File types are not allowed! Only image format.',
                  'error');
              return false;
            }
          }
        }
      });

      // HANDLER
      var initHandler = function () {
        if (isEmpty(SessionFactory.token())) {
          window.location = '/nanta-aditya-admin/login';
        } else {
          usernameHandler();
          getImageFactory();
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

      var getImageHandler = function (images) {
        $scope.images = images;
      }

      var saveImageHandler = function () {
        $scope.image = {};
        uploader.clearQueue();
        getImageFactory();
        $('#add-image').modal('hide');
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

      var getImageFactory = function () {
        LoadingFactory.increase('get-image');
        GetImageFactory.get({}, function (response) {
          if (response.success) {
            getImageHandler(response.data);
          } else {
            sweetAlert("Error", response.message, "error");
          }
          LoadingFactory.decrease('get-image');
        }, function (response) {
          LoadingFactory.decrease('get-image');
        });
      }

      var saveImageFactory = function (file, pictureDto) {
        LoadingFactory.increase('add-image');
        SaveImageFactory.post(file, pictureDto).then(function (response) {
          LoadingFactory.decrease('add-image');
          if (response.success) {
            saveImageHandler();
            sweetAlert("Success", response.message, "success");
          } else {
            sweetAlert("Error", response.message, "error");
          }
        }, function (response) {
          LoadingFactory.decrease('add-image');
        });
      }

      // EVENT
      $scope.unauthenticate = function () {
        logoutFactory();
      }

      $scope.changePassword = function () {
        changePasswordFactory();
      }

      $scope.addImage = function () {
        saveImageFactory(uploader.queue[0]._file, angular.copy($scope.image));
      }

      $scope.show = function(url){
        $scope.imageUrl = url;
        LoadingFactory.increase("show-image");
        $('#show-image').modal('show');
        LoadingFactory.decrease("show-image");
      }

      $scope.clickBrowse = function () {
        uploader.queue = [];
      }

      // INIT
      var init = function () {
        console.log("IMAGE");
        $scope.loadings = LoadingFactory;
        initHandler();
      }
      init();
    });
