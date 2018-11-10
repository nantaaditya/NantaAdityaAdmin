<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Nanta Aditya's Login</title>
    <meta
            content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
            name="viewport">
    <link rel="stylesheet"
          href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css">
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-social/5.1.1/bootstrap-social.css">
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css"/>
    <link rel="stylesheet" href="${path}/css/AdminLTE.min.css"/>
    <link rel="stylesheet" href="${path}/css/skin-blue-light.css"/>
    <link rel="stylesheet" href="${path}/css/main.css"/>
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

    <!-- Google Font -->
    <link rel="stylesheet"
          href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
    <script
            src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.6/angular.min.js"></script>
    <script
            src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.6/angular-resource.min.js"></script>
    <script
            src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.6/angular-cookies.min.js"></script>
    <script
            src="https://cdnjs.cloudflare.com/ajax/libs/angular-i18n/1.6.6/angular-locale_id-id.js  "></script>
    <script src="https://www.google.com/recaptcha/api.js" async defer></script>
    <script src="${path}/js/interceptor/request-interceptor.js"></script>
    <script src="${path}/js/interceptor/response-interceptor.js"></script>
    <script src="${path}/js/util/util-service.js"></script>
    <script src="${path}/js/security/security-service.js"></script>
    <script src="${path}/js/login/app.js"></script>
    <script src="${path}/js/login/controllers.js"></script>
    <script src="${path}/js/services/login-services.js"></script>
</head>

<body class="hold-transition skin-blue-light layout-top-nav fixed"
      ng-app="loginApp">
<div class="wrapper">
    <!--HEADER-->
    <header class="main-header">
        <nav class="navbar navbar-static-top">
            <div class="container">
                <div class="navbar-header">
                    <a href="#" class="navbar-brand">Nanta</a>
                    <button type="button" class="navbar-toggle collapsed"
                            data-toggle="collapse" data-target="#navbar-collapse">
                        <i class="fa fa-bars"></i>
                    </button>
                </div>
            </div>
        </nav>
    </header>
    <!--/HEADER-->

    <!--CONTENT WRAPPER-->
    <div class="content-wrapper">
        <div class="container">
            <section class="content-header">
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <h1 class="text-blue text-center">LOGIN</h1>
                    </div>
                </div>
                <!--CONTENT-->
                <div class="row">
                    <div
                            class="col-lg-6 col-md-6 col-sm-12 col-xs-12 col-lg-push-3 col-md-push-3"
                            ng-controller="loginCtrl">
                        <div class="panel panel-default">
                            <div class="panel-heading">Login Form</div>
                            <div class="panel-body">
                                <form ng-submit="authenticate()">
                                    <div class="form-group">
                                        <label class="label label-default">Username</label> <input
                                            type="text" class="form-control" ng-model="username"/>
                                    </div>
                                    <div class="form-group">
                                        <label class="label label-default">Password</label> <input
                                            type="password" class="form-control"
                                            ng-model="password"/>
                                    </div>
                                    <div class="form-group">
                                        <div class="g-recaptcha" data-sitekey="{{captchaPublicKey}}"
                                             id="captcha"></div>
                                    </div>
                                    <div class="form-group">
                                        <button type="submit" class="btn btn-success pull-right" ng-if="!loadings.status( 'login') ">
                                            <i class="fa fa-sign-in"></i> Login
                                        </button>
                                    </div>
                                </form>
                            </div>
                            <div class="box-footer ">
                                <p class="text-right"><i class="fa fa-cog fa-spin" ng-if="loadings.status('login')"></i></p>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!--CONTENT-->
        </div>
        <!-- /CONTAINER -->
    </div>
    <!-- /CONTENT-WRAPPER -->

    <!--FOOTER-->
    <footer class="main-footer">
        <div class="container">
            <div class="navbar navbar-default"
                 style="background-color: transparent; border: 0px">
                <div class="row aligned-row">
                    <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                        <h3 class="text-center text-blue">Nanta</h3>
                        <h4 class="text-center text-blue">
                            Copyright &#9400; Nanta 2017 <br/>Created By Nanta
                        </h4>
                    </div>
                    <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                        <h4 class="text-blue text-center">MENU</h4>
                        <nav class="footer-menu">
                            <ul class="no-style text-center">
                                <li><a href="https://www.nantaaditya.com">Home</a></li>
                                <br/>
                                <li><a href="https://www.nantaaditya.com/blog">Blog</a></li>
                                <br/>
                                <li><a href="https://www.nantaaditya.com/about">Contact</a></li>
                                <br/>
                            </ul>
                        </nav>
                    </div>
                    <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                        <h4 class="text-blue text-center">SOCIAL MEDIA</h4>
                        <div class="row">
                            <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
                                <p class="text-center">
                                    <a
                                            href="mailto:pramuditya.social@gmail.com?Subject=Nanta%20Web"
                                            target="_top"><i class="fa fa-3x fa-envelope-o"></i></a>
                                </p>
                            </div>
                            <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
                                <p class="text-center">
                                    <a href="https://www.facebook.com/Indigo.Boyss"><i
                                            class="fa fa-3x fa-facebook"></i></a>
                                </p>
                            </div>
                            <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
                                <p class="text-center">
                                    <a href="https://twitter.com/PramudityaAN"><i
                                            class="fa fa-3x fa-twitter"></i></a>
                                </p>
                            </div>
                            <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
                                <p class="text-center">
                                    <a
                                            href="http://linkedin.com/in/pramuditya-anantanur-013859136"><i
                                            class="fa fa-3x fa-linkedin"></i></a>
                                </p>
                            </div>
                            <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
                                <p class="text-center">
                                    <a href="http://github.com/nantaaditya"><i
                                            class="fa fa-3x fa-github"></i></a>
                                </p>
                            </div>
                            <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
                                <p class="text-center">
                                    <a href="https://bitbucket.org/NantaAditya/"><i
                                            class="fa fa-3x fa-bitbucket"></i></a>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!--/FOOTER-->

</div>
<!--/WRAPPER -->

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
