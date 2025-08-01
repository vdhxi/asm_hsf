<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                            <li><a href="${pageContext.request.contextPath}/profile" class="nav-link">Profile</a></li>
                            <c:choose>
                                <c:when test="${not empty sessionScope.customer}">
                                    <li><a href="${pageContext.request.contextPath}/logout" class="nav-link">Logout</a></li>
                                </c:when>
                                <c:otherwise>
                                    <li><a href="${pageContext.request.contextPath}/login" class="nav-link">Login</a></li>
                                </c:otherwise>
                            </c:choose>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>

    </header>

    <div class="hero" style="background-image: url('${pageContext.request.contextPath}/images/hero_1_a.jpg');">

        <div class="container">
            <div class="row align-items-center justify-content-center">
                <div class="col-lg-10 b">
                    <div class="row mb-5">
                        <div class="col-lg-7 intro">
                            <h1><strong>CarRentDetail</strong></h1>
                        </div>
                    </div>
                    <div class="trip-form">
                        <div class="row d-flex mb-5">
                            <div class="col-md-6 col-lg-8 p-b-30">
                                <div class="p-l-25 p-r-30 p-lr-0-lg">
                                    <div class="wrap-slick3 flex-sb flex-w">
                                        <img src="${car.url}" class="img-fluid">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6 col-lg-4 p-b-30">
                                <div class="listing-contents h-100">
                                    <h5>${car.producer.producerName}</h5>
                                    <h2><strong>${car.carName}</strong></h2>
                                    <div class="rent-price">
                                        <strong>$${car.rentPrice}</strong><span class="mx-1">/</span>day
                                    </div>
                                    <div class="d-block d-md-flex mb-3 border-bottom pb-3">
                                        <div class="listing-feature pr-4">
                                            <span class="caption">Capacity:</span>
                                            <span class="number">${car.capacity}</span>
                                        </div>
                                        <div class="listing-feature pr-4">
                                            <span class="caption">Color:</span>
                                            <span class="number">${car.color}</span>
                                        </div>
                                        <div class="listing-feature pr-4">
                                            <span class="caption">Model year:</span>
                                            <span class="number">${car.carModelYear}</span>
                                        </div>
                                    </div>
                                    <div>
                                        <form action="/rent" method="post">
                                            <input type="hidden" name="id" value="${car.id}">
                                            <button type="submit" class="btn btn-primary btn-sm">Rent</button>
                                        </form>
                                        <p>${car.description}</p>
                                    </div>
                                </div>
                                <div class="p-r-50 p-t-5 p-lr-0-lg">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-7">
                                <h2 class="section-heading"><strong>Review</strong></h2>
                                <p class="mb-5">From customers who have experienced our services.</p>
                            </div>
                        </div>
                        <div class="row">
                            <c:forEach items="${reviewList}" var="review">
                                <div class="col-lg-4 mb-4">
                                    <div class="testimonial-2">
                                        <div class="d-flex v-card align-items-center">
                                            <div class="author-name">
                                                <span class="d-block"><strong>${review.customer.customerName}</strong></span>
                                                <a href="/detail/${review.car.id}">${review.car.carName}</a>
                                            </div>
                                        </div>
                                        <blockquote class="mb-4">
                                            <p>${review.comment}</p>
                                        </blockquote>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
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