<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Nanta Aditya's Admin Panel</title>
    <link rel="stylesheet"
          href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css"/>
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css">
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/admin-lte/2.3.11/css/skins/skin-blue.css"/>
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css"/>
    <link rel="stylesheet" href="${path}/css/AdminLTE.min.css"/>
    <link rel="stylesheet" href="${path}/css/skin-blue-light.css"/>
    <link rel="stylesheet" href="${path}/css/main.css"/>

    <script
            src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.6/angular.min.js"></script>
    <script
            src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.6/angular-resource.min.js"></script>
    <script
            src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.6/angular-cookies.min.js"></script>
    <script
            src="https://cdnjs.cloudflare.com/ajax/libs/angular-i18n/1.6.6/angular-locale_id-id.js  "></script>
    <script
            src="https://cdnjs.cloudflare.com/ajax/libs/angular-file-upload/2.5.0/angular-file-upload.min.js"></script>
    <script src="https://cdn.rawgit.com/zenorocha/clipboard.js/master/dist/clipboard.min.js"></script>
    <script src="${path}/js/interceptor/request-interceptor.js"></script>
    <script src="${path}/js/interceptor/response-interceptor.js"></script>
    <script src="${path}/js/util/util-service.js"></script>
    <script src="${path}/js/util/ngclipboard.min.js"></script>
    <script src="${path}/js/security/security-service.js"></script>
    <script src="${path}/js/services/login-services.js"></script>
    <script src="${path}/js/services/dirPagination.js"></script>
    <script src="${path}/js/services/image-services.js"></script>
    <script src="${path}/js/administrator/image/controllers.js"></script>
    <script src="${path}/js/administrator/image/app.js"></script>
</head>

<body
        class="hold-transition skin-blue-light sidebar-collapse sidebar-mini"
        ng-app="imageApp" ng-controller="imageCtrl">
<div class="wrapper">
    <header class="main-header">
        <a href="" class="logo"> <span class="logo-mini"><b>N</b></span>
            <span class="logo-lg"><b>Nanta</b> System</span>
        </a>
        <nav class="navbar navbar-static-top">
            <a href="#" class="sidebar-toggle" data-toggle="push-menu"
               role="button"> <span class="sr-only">Toggle navigation</span> <span
                    class="icon-bar"></span> <span class="icon-bar"></span> <span
                    class="icon-bar"></span>
            </a>
            <div class="navbar-custom-menu">
                <ul class="nav navbar-nav">
                    <li class="dropdown user user-menu"><a href="#"
                                                           class="dropdown-toggle"
                                                           data-toggle="dropdown"> <img
                            src="http://placehold.it/200x200/39CCCC/ffffff&text=O"
                            class="user-image" alt="User Image"> <span
                            class="hidden-xs">{{username}}</span>
                    </a>
                        <ul class="dropdown-menu">
                            <li class="user-header"><img
                                    src="http://placehold.it/200x200/39CCCC/ffffff&text=O"
                                    class="img-circle" alt="User Image">
                                <p>
                                    {{username}}
                                    <small>Administrator</small>
                                </p>
                            </li>
                            <li class="user-body"></li>
                            <li class="user-footer">
                                <div class="btn-group-vertical btn-block">
                                    <button class="btn btn-flat btn-warning" data-toggle="modal"
                                            data-target="#change-password-modal">
                                        <i class="fa fa-unlock-alt"></i> Ganti Kata Sandi
                                    </button>
                                    <button class="btn btn-flat btn-danger"
                                            ng-show="!loadings.status('change-password')"
                                            ng-click="unauthenticate()">
                                        <i class="fa fa-sign-out"></i> Keluar
                                    </button>
                                </div>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
        </nav>
    </header>

    <!-- ============================SIDEBAR============================ -->
    <aside class="main-sidebar">
        <section class="sidebar">
            <ul class="sidebar-menu" data-widget="tree">
                <li class="header">MAIN NAVIGATION</li>
                <li class="active"><a href="${path}/dashboard"><i
                        class="fa fa-dashboard"></i> <span>Dashboard</span></a></li>
                <li><a href="${path}/home-dashboard"><i
                        class="fa fa-home"></i> <span>Home</span></a></li>
                <li><a href="${path}/blog-dashboard"><i
                        class="fa fa-pencil"></i> <span>Blog</span></a></li>
                <li><a href="${path}/image-dashboard"><i
                        class="fa fa-image"></i> <span>Image</span></a></li>
                <li><a href="${path}/contact-dashboard"><i
                        class="fa fa-user"></i> <span>Contact</span></a></li>
                <%--<li><a href="/admin/administrator/reminder-dashboard"><i--%>
                <%--class="fa fa-calendar"></i> <span>Reminder</span></a></li>--%>
            </ul>
        </section>
    </aside>
    <!-- ============================CONTENT============================ -->
    <div class="content-wrapper">
        <section class="content-header">
            <h3 class="text-center text-blue">
                <b>Image Dashboard</b>
            </h3>
            <div id="change-password-modal" class="modal fade" role="dialog">
                <div class="modal-dialog modal-sm">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;
                            </button>
                            <h4 class="modal-title">Ganti Kata Sandi</h4>
                        </div>
                        <div class="modal-body">
                            <form ng-submit="changePassword()">
                                <div class="form-group">
                                    <label class="label label-default">Username</label> <input
                                        type="text" class="form-control" ng-model="username"
                                        disabled/>
                                </div>
                                <div class="form-group">
                                    <label class="label label-default">Kata Sandi Lama</label>
                                    <input
                                            type="password" class="form-control"
                                            ng-model="oldPassword"/>
                                </div>
                                <div class="form-group">
                                    <label class="label label-default">Kata Sandi Baru</label>
                                    <input
                                            type="password" class="form-control"
                                            ng-model="newPassword"/>
                                </div>
                                <button type="submit" class="btn btn-block btn-flat btn-success"
                                        ng-if="!loadings.status('change-password')">
                                    <i class="fa fa-save"></i> Simpan
                                </button>
                                <p class="text-center" ng-if="loadings.status('change-password')"><i class="fa fa-cog fa-spin"></i></p>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section class="content">

            <div class="row">
                <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 col-lg-push-8 col-md-push-8">
                    <label class="label label-default">Search</label>
                    <div class="input-group">
                        <div class="input-group-addon">
                            <i class="fa fa-search"></i>
                        </div>
                        <input type="text" class="form-control" ng-model="searchKeyword" />
                        <span class="input-group-btn">
								<button class="btn btn-primary pull-right" data-toggle="modal"
                                        data-target="#add-image"><i class="fa fa-plus"></i> Add Image
                                </button>
                        </span>
                    </div>
                </div>
            </div>

            <br/><br/>

            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div id="add-image" class="modal fade" role="dialog">
                        <div class="modal-dialog modal-sm">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal">
                                        &times;
                                    </button>
                                    <h4 class="modal-title">Image</h4>
                                </div>
                                <div class="modal-body">
                                    <form ng-submit="addImage()">
                                        <div class="form-group">
                                            <label class="label label-primary">Image</label>
                                            <span
                                                    id="uploader-file" class="input-group-addon"
                                                    ng-click="clickBrowse()"> <input
                                                    id="browse-mockup-file" type="file"
                                                    class="input-file"
                                                    nv-file-select uploader="uploader"
                                                    filter="jsonFilter"
                                                    ng-required="!uploader.queue[0].file.name">
											</span>
                                        </div>
                                        <div class="form-group">
                                            <label class="label label-primary">Name</label> <input
                                                type="text" class="form-control"
                                                ng-model="image.name" required/>
                                        </div>
                                        <div class="form-group">
                                            <div class="radio">
                                                <label>
                                                    <input type="radio" name="optionsRadios" id="optionsRadios1" value="/post/" ng-model="image.imageGroup">
                                                    Image Post
                                                </label>
                                            </div>
                                            <div class="radio">
                                                <label>
                                                    <input type="radio" name="optionsRadios" id="optionsRadios2" value="/project/" ng-model="image.imageGroup">
                                                    Image Project (401*250)
                                                </label>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="label label-primary">Width</label> <input
                                                type="number" class="form-control"
                                                ng-model="image.width"/>
                                        </div>
                                        <div class="form-group">
                                            <label class="label label-primary">Height</label> <input
                                                type="number" class="form-control"
                                                ng-model="image.height"/>
                                        </div>
                                        <button type="submit" class="btn btn-success btn-block" ng-if="!loadings.status('add-image')">
                                            <i class="fa fa-save"></i> Save
                                        </button>
                                        <p class="text-center" ng-if="loading.status('add-image')"><i class="fa fa-cog fa-spin"></i></p>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div id="show-image" class="modal fade" role="dialog">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal">
                                        &times;
                                    </button>
                                    <h4 class="modal-title">Image</h4>
                                </div>
                                <div class="modal-body">
                                    <p ng-if="loadings.status('show-image')"><i class="fa fa-cog fa-spin"></i></p>
                                    <img class="img-responsive img-center" ng-src="{{imageUrl}}" ng-if="!loadings.status('show-image')">
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="table-responsive">
                        <table class="table table-hover table-striped table-condensed">
                            <thead>
                            <tr>
                                <td class="bg-blue text-center">Name</td>
                                <td class="bg-blue text-center">URL</td>
                                <td class="bg-blue text-center">Option</td>
                            </tr>
                            </thead>
                            <tbody>
                            <tr ng-show="loadings.status('get-image')">
                                <td colspan="3"><i class="fa fa-cog fa-spin"></i></td>
                            </tr>
                            <tr dir-paginate="i in images|filter:searchKeyword|itemsPerPage: '10'" pagination-id="imagePage"
                                ng-show="!loadings.status('get-image')">
                                <td>{{i.name}}</td>
                                <td><a ng-href="{{i.url}}" target="_blank">{{i.url}}</a></td>
                                <td>
                                    <div class="button-group">
                                        <button class="btn btn-primary"
                                                ng-click="show(i.url)">
                                            <i class="fa fa-eye"></i>
                                        </button>
                                        <button class="btn btn-warning" ngclipboard data-clipboard-text="{{i.url}}">
                                            <i class="fa fa-clipboard"></i>
                                        </button>
                                    </div>
                                </td>

                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="pull-right">
                        <dir-pagination-controls max-size="10" direction-links="true"
                                                 boundary-links="true"
                                                 pagination-id="imagePage"></dir-pagination-controls>
                    </div>

                </div>
            </div>
        </section>
    </div>
    <!-- ============================FOOTER============================ -->
    <footer class="main-footer">
        <div class="navbar navbar-default navbar-fixed-bottom">
            <p class="pull-right">
                <strong>Copyright &copy; 2017. Pramuditya Anantanur.</strong> All
                rights reserved.
            </p>
        </div>
    </footer>
</div>
<script
        src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
        src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script
        src="https://cdnjs.cloudflare.com/ajax/libs/jQuery-slimScroll/1.3.8/jquery.slimscroll.min.js"></script>
<script
        src="https://cdnjs.cloudflare.com/ajax/libs/fastclick/1.0.6/fastclick.min.js"></script>
<script
        src="https://cdnjs.cloudflare.com/ajax/libs/admin-lte/2.4.2/js/adminlte.min.js"></script>
<script
        src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
<script
        src="http://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.2/modernizr.js"></script>
</body>

</html>
