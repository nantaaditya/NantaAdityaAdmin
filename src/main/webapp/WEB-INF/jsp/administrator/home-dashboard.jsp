<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Nanta</title>
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
            src="https://cdnjs.cloudflare.com/ajax/libs/angular-sanitize/1.5.6/angular-sanitize.js"></script>
    <script
            src="https://cdnjs.cloudflare.com/ajax/libs/angular-file-upload/2.5.0/angular-file-upload.min.js"></script>
    <script src="${path}/js/interceptor/request-interceptor.js"></script>
    <script src="${path}/js/interceptor/response-interceptor.js"></script>
    <script src="${path}/js/util/util-service.js"></script>
    <script src="${path}/js/security/security-service.js"></script>
    <script src="${path}/js/services/login-services.js"></script>
    <script src="${path}/js/services/dirPagination.js"></script>
    <script src="${path}/js/services/about-services.js"></script>
    <script src="${path}/js/services/education-services.js"></script>
    <script src="${path}/js/services/skill-services.js"></script>
    <script src="${path}/js/services/project-services.js"></script>
    <script src="${path}/js/administrator/home/controllers.js"></script>
    <script src="${path}/js/administrator/home/app.js"></script>
</head>

<body
        class="hold-transition skin-blue-light sidebar-collapse sidebar-mini"
        ng-app="homeApp" ng-controller="homeCtrl">
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
                <b>Home Dashboard</b>
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
                                <button type="submit" class="btn btn-block btn-flat btn-success" ng-if="!loadings.status('change-password')">
                                    <i class="fa fa-save"></i> Simpan
                                </button>
                                <p class="text-right"><i class="fa fa-cog fa-spin" ng-if="loadings.status('change-password')"></i></p>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section class="content">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="btn-group pull-right">
                        <div class="btn btn-success" data-toggle="modal"
                             data-target="#add-education">
                            <i class="fa fa-plus"></i> Education
                        </div>
                        <div class="btn btn-success" data-toggle="modal"
                             data-target="#add-skill">
                            <i class="fa fa-plus"></i> Skill
                        </div>
                        <div class="btn btn-success" data-toggle="modal"
                             data-target="#add-project">
                            <i class="fa fa-plus"></i> Project
                        </div>
                    </div>
                </div>
                <br/> <br/>
                <!--ABOUT ME-->
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="panel panel-default" style="cursor: pointer">
                        <div class="panel-heading" data-toggle="collapse"
                             data-target="#about">About Me
                        </div>
                        <div class="panel-body collapse" id="about">
                            <div class="table-responsive">
                                <table class="table table-hover table-striped table-condensed">
                                    <thead>
                                    <tr>
                                        <td class="bg-blue text-center">About me</td>
                                        <td class="bg-blue text-center">Option</td>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr ng-show="loadings.status('get-about')">
                                        <td colspan="2">
                                            <i class="fa fa-cog fa-spin"></i>
                                        </td>
                                    </tr>
                                    <tr ng-show="!loadings.status('get-about')">
                                        <td ng-bind-html="about.description" class="text-justify"></td>
                                        <td class="text-center">
                                            <button class="btn btn-warning" data-toggle="modal" data-target="#edit-about">
                                                <i class="fa fa-pencil"></i>
                                            </button>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>

                            <div id="edit-about" class="modal fade" role="dialog">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal">&times;
                                            </button>
                                            <h4 class="modal-title">About me</h4>
                                        </div>
                                        <div class="modal-body">
                                            <form ng-submit="updateAbout()">
                                                <div class="form-group">
                                                    <label class="label label-primary">Description</label>
                                                    <textarea class="form-control" rows="8" ng-model="about.description"></textarea>
                                                </div>
                                                <button type="submit" class="btn btn-primary btn-block" ng-if="!loadings.status('update-about')">
                                                    <i class="fa fa-save"></i> Update
                                                </button>
                                                <p class="text-right" ng-if="loadings.status('update-about')"><i class="fa fa-cog fa-spin" ></i></p>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!--EDUCATION-->
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div id="add-education" class="modal fade" role="dialog">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal">
                                        &times;
                                    </button>
                                    <h4 class="modal-title">Education</h4>
                                </div>
                                <div class="modal-body">
                                    <form ng-submit="addEducation()">
                                        <div class="form-group">
                                            <label class="label label-primary">Name</label> <input
                                                type="text" class="form-control"
                                                ng-model="education.name"/>
                                        </div>
                                        <div class="form-group">
                                            <label class="label label-primary">Start</label> <input
                                                type="text" class="form-control"
                                                ng-model="education.timeStart"/>
                                        </div>
                                        <div class="form-group">
                                            <label class="label label-primary">End</label> <input
                                                type="text" class="form-control"
                                                ng-model="education.timeEnd"/>
                                        </div>
                                        <div class="form-group">
                                            <label class="label label-primary">Description</label>
                                            <textarea type="text" class="form-control"
                                                      ng-model="education.description"></textarea>
                                        </div>
                                        <button type="submit" class="btn btn-success btn-block" ng-if="!loadings.status('add-education')">
                                            <i class="fa fa-save"></i> Save
                                        </button>
                                        <p class="text-right" ng-if="loadings.status('add-education')"><i class="fa fa-cog fa-spin"></i></p>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="panel panel-default" style="cursor: pointer">
                        <div class="panel-heading" data-toggle="collapse"
                             data-target="#education">Education
                        </div>
                        <div class="panel-body collapse" id="education">
                            <div class="table-responsive">
                                <table class="table table-hover table-striped table-condensed">
                                    <thead>
                                    <tr>
                                        <td class="bg-blue text-center">Name</td>
                                        <td class="bg-blue text-center">Year</td>
                                        <td class="bg-blue text-center">Description</td>
                                        <td class="bg-blue text-center">Option</td>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr ng-show="loadings.status('get-education')">
                                        <td colspan="4"><i class="fa fa-cog fa-spin"></i></td>
                                    </tr>
                                    <tr dir-paginate="e in educations | itemsPerPage: '5'" pagination-id="educationPage"
                                        ng-show="!loadings.status('get-education')">
                                        <td>{{e.name}}</td>
                                        <td>{{e.timeStart}} - {{e.timeEnd}}</td>
                                        <td>{{e.description}}</td>
                                        <td class="text-center">
                                            <button class="btn btn-danger"
                                                    ng-click="deleteEducation(e.id)">
                                                <i class="fa fa-close"></i>
                                            </button>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="pull-right">
                                <dir-pagination-controls max-size="5" direction-links="true"
                                                         boundary-links="true"
                                                         pagination-id="educationPage"></dir-pagination-controls>
                            </div>
                        </div>
                    </div>
                </div>

                <!--SKILLSET-->
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div id="add-skill" class="modal fade" role="dialog">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal">
                                        &times;
                                    </button>
                                    <h4 class="modal-title">Skillset</h4>
                                </div>
                                <div class="modal-body">
                                    <form ng-submit="addSkill()">
                                        <div class="form-group">
                                            <label class="label label-primary">Name</label> <input
                                                type="text" class="form-control"
                                                ng-model="skill.name"/>
                                        </div>
                                        <div class="form-group">
                                            <label class="label label-primary">Percentage</label>
                                            <input
                                                    type="number" class="form-control"
                                                    ng-model="skill.percentage"/>
                                        </div>
                                        <button type="submit" class="btn btn-success btn-block" ng-if="!loadings.status('add-skill')">
                                            <i class="fa fa-save"></i> Save
                                        </button>
                                        <p class="text-right" ng-if="loadings.status('add-skill')"><i class="fa fa-cog fa-spin"></i></p>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="panel panel-default" style="cursor: pointer">
                        <div class="panel-heading" data-toggle="collapse"
                             data-target="#skill">Skillset
                        </div>
                        <div class="panel-body collapse" id="skill">
                            <div class="table-responsive">
                                <table class="table table-hover table-striped table-condensed">
                                    <thead>
                                    <tr>
                                        <td class="bg-blue text-center">Name</td>
                                        <td class="bg-blue text-center">Percentage</td>
                                        <td class="bg-blue text-center">Option</td>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr ng-show="loadings.status('get-skill')">
                                        <td colspan="3"><i class="fa fa-cog fa-spin"></i></td>
                                    </tr>
                                    <tr dir-paginate="s in skills | itemsPerPage: '5'" pagination-id="skillPage"
                                        ng-show="!loadings.status('get-skill')">
                                        <td>{{s.name}}</td>
                                        <td>{{s.percentage}}</td>
                                        <td class="text-center">
                                            <div class="btn-group">
                                                <button class="btn btn-danger" ng-click="deleteSkill(s.id)">
                                                    <i class="fa fa-close"></i>
                                                </button>
                                            </div>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="pull-right">
                                <dir-pagination-controls max-size="5" direction-links="true"
                                                         boundary-links="true"
                                                         pagination-id="skillPage"></dir-pagination-controls>
                            </div>
                        </div>
                    </div>
                </div>

                <!--PROJECT-->
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div id="add-project" class="modal fade" role="dialog">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal">
                                        &times;
                                    </button>
                                    <h4 class="modal-title">Project</h4>
                                </div>
                                <div class="modal-body">
                                    <form ng-submit="addProject()">
                                        <div class="form-group">
                                            <label class="label label-primary">Name</label> <input
                                                type="text" class="form-control"
                                                ng-model="project.name"/>
                                        </div>
                                        <div class="form-group">
                                            <label class="label label-primary">Url</label> <input
                                                type="url" class="form-control"
                                                ng-model="project.url"/>
                                        </div>
                                        <div class="form-group">
                                            <label class="label label-primary">Image URL</label> <input
                                                type="url" class="form-control"
                                                ng-model="project.imageURL"/>
                                        </div>
                                        <button type="submit" class="btn btn-success btn-block" ng-if="!loadings.status('add-project')">
                                            <i class="fa fa-save"></i> Save
                                        </button>
                                        <p class="text-right" ng-if="loadings.status('add-project')"><i class="fa fa-cog fa-spin"></i></p>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="panel panel-default" style="cursor: pointer">
                        <div class="panel-heading" data-toggle="collapse"
                             data-target="#project">Project
                        </div>
                        <div class="panel-body collapse" id="project">
                            <div class="table-responsive">
                                <table class="table table-hover table-striped table-condensed">
                                    <thead>
                                    <tr>
                                        <td class="bg-blue text-center">Name</td>
                                        <td class="bg-blue text-center">Image</td>
                                        <td class="bg-blue text-center">Site</td>
                                        <td class="bg-blue text-center">Option</td>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr ng-show="loadings.status('get-project')">
                                        <td colspan="4"><i class="fa fa-cog fa-spin"></i></td>
                                    </tr>
                                    <tr dir-paginate="p in projects | itemsPerPage: '5'" pagination-id="projectPage"
                                        ng-show="!loadings.status('get-project')">
                                        <td>{{p.name}}</td>
                                        <td><img ng-src="{{p.imageURL}}" alt="{{p.name}}"
                                                 style="max-width:200px; max-height:200px"/></td>
                                        <td><a href="{{p.url}}" target="_blank">Open</a></td>
                                        <td class="text-center">
                                            <div class="btn-group">
                                                <button class="btn btn-danger"
                                                        ng-click="deleteProject(p.id)">
                                                    <i class="fa fa-close"></i>
                                                </button>
                                            </div>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="pull-right">
                                <dir-pagination-controls max-size="5" direction-links="true"
                                                         boundary-links="true"
                                                         pagination-id="projectPage"></dir-pagination-controls>
                            </div>
                        </div>
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
