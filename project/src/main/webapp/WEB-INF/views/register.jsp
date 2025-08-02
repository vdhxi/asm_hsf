<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

<head>
    <title>FUCarRentingSystem - Register</title>
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
    <header class="site-navbar site-navbar-target bg-white" role="banner">

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

    <div class="hero" style="background-image: url(https://ggofzyfoccoknwqvheka.supabase.co/storage/v1/object/public/image//bg.jpg);">

        <div class="container">
            <div class="row align-items-center justify-content-center">
                <div class="col-lg-10">



                    <form class="trip-form" action="/user/add" method="post">
                        <h3><strong>Fill out to start your journey now</strong></h3>
                        <br>
                        <div class="row align-items-center">
                            <div class="mb-6 mb-md-0 col-md-6">
                                Name
                                <div class="form-control-wrap">
                                    <input type="text" name="name" placeholder="How we call you?" class="form-control" required>
                                </div>
                            </div>
                            <div class="mb-3 mb-md-0 col-md-3">
                                Phone number
                                <div class="form-control-wrap">
                                    <input type="text" name="mobile" placeholder="Leave the number" class="form-control" required>
                                </div>
                            </div>
                            <div class="mb-3 mb-md-0 col-md-3">
                                Date of birth
                                <div class="form-control-wrap">
                                    <input type="date" name="dob" placeholder="Date of birth" class="form-control" required>
                                </div>
                            </div>
                            <div class="mb-6 mb-md-0 col-md-6">
                                Identity number
                                <div class="form-control-wrap">
                                    <input type="text" name="identity" placeholder="Identity number" class="form-control" required>
                                </div>
                            </div>
                            <div class="mb-3 mb-md-0 col-md-3">
                                Licence number
                                <div class="form-control-wrap">
                                    <input type="text" name="licenceNumber" placeholder="Licence number" class="form-control" required>
                                </div>
                            </div>
                            <div class="mb-3 mb-md-0 col-md-3">
                                Licence date
                                <div class="form-control-wrap">
                                    <input type="date" name="licenceDate" placeholder="Licence date" class="form-control" required>
                                </div>
                            </div>
                            <div class="mb-6 mb-md-0 col-md-6">
                                Email
                                <div class="form-control-wrap">
                                    <input type="email" name="email" placeholder="Email" class="form-control" required>
                                </div>
                            </div>
                            <div class="mb-3 mb-md-0 col-md-3">
                                Password
                                <div class="form-control-wrap">
                                    <input type="password" name="password" placeholder="Password" class="form-control" required>
                                </div>
                            </div>
                            <div class="mb-3 mb-md-0 col-md-3">
                                <p></p>
                                <input type="submit" value="Register" class="btn btn-primary btn-block py-3">
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