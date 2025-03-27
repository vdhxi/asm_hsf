<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

<head>
    <title>FUCarRentingSystem</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700;900&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/fonts/icomoon/style.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery.fancybox.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/owl.carousel.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/fonts/flaticon/font/flaticon.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/aos.css">

    <!-- MAIN CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">

</head>

<body>
<div class="site-wrap" id="home-section">
    <header class="site-navbar site-navbar-target" role="banner">

        <div class="container">
            <div class="row align-items-center position-relative">

                <div class="col-3">
                    <div class="site-logo">
                        <a href="${pageContext.request.contextPath}/home"><strong>FUCarRentingSystem</strong></a>
                    </div>
                </div>

                <div class="col-9  text-right">

                    <span class="d-inline-block d-lg-none"><a href="#" class=" site-menu-toggle js-menu-toggle py-5 "><span class="icon-menu h3 text-black"></span></a></span>

                    <nav class="site-navigation text-right ml-auto d-none d-lg-block" role="navigation">
                        <ul class="site-menu main-menu js-clone-nav ml-auto ">
                            <li class="active"><a href="${pageContext.request.contextPath}/home" class="nav-link">Home</a></li>
                            <li><a href="${pageContext.request.contextPath}/listing" class="nav-link">Listing</a></li>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>

    </header>

    <div class="hero" style="background-image: url('${pageContext.request.contextPath}/images/hero_1_a.jpg');">

        <div class="container">
            <div class="row align-items-center justify-content-center">
                <div class="col-lg-10">

                    <div class="row mb-5">
                        <div class="col-lg-7 intro">
                            <h1><strong>Rent a car</strong> is within your finger tips.</h1>
                        </div>
                    </div>

                    <form class="trip-form" action="/login" method="post">
                        <h3><strong>Login to continue your trip</strong></h3>
                        <br>
                        <div class="row align-items-center">
                            <div class="mb-3 mb-md-0 col-md-3">
                                <div class="form-control-wrap">
                                    <input type="text" name="email" placeholder="Email" class="form-control">

                                </div>
                            </div>
                            <div class="mb-3 mb-md-0 col-md-3">
                                <div class="form-control-wrap">
                                    <input type="password" name="password" placeholder="Password" class="form-control">
                                </div>
                            </div>
                            <div class="mb-3 mb-md-0 col-md-3">
                                <input type="submit" value="Login" class="btn btn-primary btn-block py-3">
                            </div>
                            <div class="mb-3 mb-md-0 col-md-3">
                                <a href="/register">Don't have an account? Click here</a>
                            </div>
                        </div>

                    </form>

                </div>
            </div>
        </div>
    </div>

    <footer class="container">
        <div class="row pt-5 mt-5 text-center">
            <div class="col-md-12">
                <div class="border-top pt-5">
                    <p>
                        <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                        Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="icon-heart text-danger" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank" >Colorlib</a>
                        <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                    </p>
                </div>
            </div>
        </div>
    </footer>

</div>

<script src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/popper.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/js/owl.carousel.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.sticky.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.waypoints.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.animateNumber.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.fancybox.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.easing.1.3.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap-datepicker.min.js"></script>
<script src="${pageContext.request.contextPath}/js/aos.js"></script>

<script src="${pageContext.request.contextPath}/js/main.js"></script>

</body>

</html>