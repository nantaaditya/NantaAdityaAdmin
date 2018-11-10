angular.module('blogController', []);
angular.module('blogController').controller(
    'blogCtrl',
    function ($scope, LoadingFactory, CookiesFactory, CustomSessionFactory,
        SessionFactory, FileUploader, LogoutFactory,
        ChangePasswordFactory, SaveBlogFactory, GetBlogFactory,
        TogglePostFactory, FindPostFactory, UpdatePostFactory, RepublishNotification) {
      // VARIABLE
      $scope.oldPassword;
      $scope.newPassword;
      $scope.blog = {};

      // HANDLER
      var initHandler = function () {
        if (isEmpty(SessionFactory.token())) {
          window.location = '/nanta-aditya-admin/login';
        } else {
          usernameHandler();
          getBlogFactory();
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

      var getBlogHandler = function (blogs) {
        $scope.blogs = blogs;
      }

      var saveBlogHandler = function () {
        $scope.blog = {};
        CKEDITOR.instances['text-create'].setData($scope.blog);
        getBlogFactory();
        $('#add-blog').modal('hide');
      }

      var toggleBlogHandler = function () {
        $scope.blogs = null;
        getBlogFactory();
      }

      var findPostHandler = function (blog) {
        $scope.activeBlog = blog;
        $scope.titleId = blog.titleId;
        CKEDITOR.instances['text-edit'].setData(blog.post);
        $('#edit-blog').modal('show');
      }

      var updateBlogHandler = function () {
        $scope.activeBlog = {};
        $scope.id = null;
        CKEDITOR.instances['text-edit'].setData(null);
        $('#edit-blog').modal('hide');
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

      var getBlogFactory = function () {
        LoadingFactory.increase('get-blog');
        GetBlogFactory.get({}, function (response) {
          if (response.success) {
            getBlogHandler(response.data);
          } else {
            sweetAlert("Error", response.message, "error");
          }
          LoadingFactory.decrease('get-blog');
        }, function (response) {
          LoadingFactory.decrease('get-blog');
        });
      }

      var saveBlogFactory = function () {
        LoadingFactory.increase('add-blog');
        SaveBlogFactory.post($scope.blog, function (response) {
          if (response.success) {
            saveBlogHandler();
            sweetAlert("Success", response.message, "success");
          } else {
            sweetAlert("Error", response.message, "error");
          }
          LoadingFactory.decrease('add-blog');
        }, function (response) {
          LoadingFactory.decrease('add-blog');
        });
      }

      var toggleBlogFactory = function (id) {
        LoadingFactory.increase('toggle-blog'+id);
        TogglePostFactory.put({
          'id': id
        }, function (response) {
          if (response.success) {
            toggleBlogHandler();
            sweetAlert("Success", response.message, "success");
          } else {
            sweetAlert("Error", response.message, "error");
          }
          LoadingFactory.decrease('toggle-blog'+id);
        }, function (response) {
          LoadingFactory.decrease('toggle-blog'+id);
        });
      }

      var findPostFactory = function (titleId) {
        LoadingFactory.increase('find-blog'+titleId);
        FindPostFactory.get({
          'titleId': titleId,
        }, function (response) {
          if (response.success) {
            findPostHandler(response.data);
          } else {
            sweetAlert("Error", response.message, "error");
          }
          LoadingFactory.decrease('find-blog'+titleId);
        }, function (response) {
          LoadingFactory.decrease('find-blog'+titleId);
        });
      }

      var updateBlogFactory = function () {
        LoadingFactory.increase('update-blog');
        UpdatePostFactory.put($scope.activeBlog, function (response) {
          if (response.success) {
            updateBlogHandler();
            sweetAlert("Success", response.message, "success");
          } else {
            alertHandler(response);
          }
          LoadingFactory.decrease('update-blog');
        }, function (response) {
          LoadingFactory.decrease('update-blog');
        });
      }

      var republishNotification = function(titleId) {
        LoadingFactory.increase("republish-"+titleId);
        RepublishNotification.post({
          'titleId': titleId
        }, function(response){
            if(response.success){
              sweetAlert("Success", response.message, "success");
            } else {
              alertHandler(response);
            }
          LoadingFactory.decrease("republish-"+titleId);
         }, function(response){
          LoadingFactory.decrease("republish-"+titleId);
         });
      }

      // EVENT
      $scope.unauthenticate = function () {
        logoutFactory();
      }

      $scope.changePassword = function () {
        changePasswordFactory();
      }

      $scope.addBlog = function () {
        $scope.blog.post = CKEDITOR.instances['text-create'].getData();
        if($scope.notification === "enable")
          $scope.blog.notification = true;
        else
          $scope.blog.notification = false;
        saveBlogFactory();
      };

      $scope.toggleBlog = function (titleId) {
        toggleBlogFactory(titleId);
      }

      $scope.open = function (titleId) {
        findPostFactory(titleId);
      }

      $scope.update = function () {
        $scope.activeBlog.post = CKEDITOR.instances['text-edit'].getData();
        $scope.activeBlog.titleId = $scope.titleId;
        updateBlogFactory();
      }

      $scope.republish = function(titleId){
        republishNotification(titleId);
      }

      // INIT
      var init = function () {
        console.log("BLOG");
        $scope.loadings = LoadingFactory;
        initHandler();
      }
      init();
    });
