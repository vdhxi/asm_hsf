<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
  <title>FUCarRentingSystem &mdash;</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700;900&display=swap" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

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
            <a href="${pageContext.request.contextPath}/home"><strong>CarRental</strong></a>
          </div>
        </div>

        <div class="col-9  text-right">

          <span class="d-inline-block d-lg-none"><a href="#" class=" site-menu-toggle js-menu-toggle py-5 "><span class="icon-menu h3 text-black"></span></a></span>

          <nav class="site-navigation text-right ml-auto d-none d-lg-block" role="navigation">
            <ul class="site-menu main-menu js-clone-nav ml-auto ">
              <li class="active"><a href="${pageContext.request.contextPath}/home" class="nav-link">Home</a></li>
              <li><a href="${pageContext.request.contextPath}/listing" class="nav-link">Listing</a></li>
              <li><a href="${pageContext.request.contextPath}/review" class="nav-link">Reviews</a></li>
              <li><a href="${pageContext.request.contextPath}/profile" class="nav-link">Profile</a></li>
              <li><a href="${pageContext.request.contextPath}/management" class="nav-link">Management</a></li>
              <li><a href="${pageContext.request.contextPath}/logout" class="nav-link">Logout</a></li>
            </ul>
          </nav>
        </div>


      </div>
    </div>

  </header>


  <div class="hero inner-page" style="background-image: url('${pageContext.request.contextPath}images/hero_1_a.jpg');">

    <div class="container">
      <div class="row align-items-end ">
        <div class="col-lg-5">

          <div class="intro">
            <h1><strong>Listings</strong></h1>
            <div class="custom-breadcrumbs"><a href="index.html">Home</a> <span class="mx-2">/</span> <strong>Listings</strong></div>
          </div>

        </div>
      </div>
    </div>
  </div>

  <!-- Listing section -->
  <div class="site-section bg-light">
    <div class="container">
      <div class="row">
        <div class="col-lg-7">
          <h2 class="section-heading"><strong>Car Listings</strong></h2>
          <p class="mb-5">Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
        </div>
      </div>
      <div class="row mb-5">
        <!-- Sort By -->
        <div class="col-md-4">
          <h5 class="fw-bold">Sort By</h5>
          <ul class="list-unstyled">
            <li><a href="/search/ascending" class="text-decoration-none text-dark">Price: Low to High</a></li>
            <li><a href="/search/descending" class="text-decoration-none text-dark">Price: High to Low</a></li>
          </ul>
        </div>

        <!-- Price -->
        <div class="col-md-4">
          <h5 class="fw-bold">Price</h5>
            <form action="/search/price">
              <input class="col-md-2" type="text" name="min"> -
              <input class="col-md-2" type="text" name="max">
              <input type="submit" class="btn btn-sm" value="Search">
            </form>
        </div>

        <!-- Tags -->
        <div class="col-md-4">
          <h5 class="fw-bold">Manufacture</h5>
          <div class="d-flex">
            <div>
              <form action="/search/manufacture">
                <button class="btn btn-outline-secondary btn-sm me-2 mb-2">All</button>
                <input type="hidden" name="id" value="0">
              </form>
            </div>
            <c:forEach items="${carProducerList}" var="carProducer">
              <div>
                <form action="/search/manufacture">
                  <button class="btn btn-outline-secondary btn-sm me-2 mb-2">${carProducer.producerName}</button>
                  <input type="hidden" name="id" value="${carProducer.id}">
                </form>
              </div>
            </c:forEach>
          </div>
        </div>
      </div>

      <div class="row">
        <c:forEach items="${carList}" var="car">
          <div class="col-md-6 col-lg-4 mb-4">
            <div class="listing d-block  align-items-stretch">
              <div class="listing-img h-100 mr-4">
                <img src="${car.url}" alt="Image" class="img-fluid" style="width: 300px; height: 200px">
              </div>
              <div class="listing-contents h-100">
                <h2><strong>${car.carName}</strong></h2>
                <h4>${car.producer.producerName}</h4>
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
                  <p>${car.description}</p>
                  <p><a href="/detail/${car.id}" class="btn btn-primary btn-sm">Rent Now</a></p>
                </div>
              </div>
            </div>
          </div>
        </c:forEach>
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

<script src="js/jquery-3.3.1.min.js"></script>
<script src="js/popper.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/owl.carousel.min.js"></script>
<script src="js/jquery.sticky.js"></script>
<script src="js/jquery.waypoints.min.js"></script>
<script src="js/jquery.animateNumber.min.js"></script>
<script src="js/jquery.fancybox.min.js"></script>
<script src="js/jquery.easing.1.3.js"></script>
<script src="js/bootstrap-datepicker.min.js"></script>
<script src="js/aos.js"></script>

<script src="js/main.js"></script>

</body>

</html>

