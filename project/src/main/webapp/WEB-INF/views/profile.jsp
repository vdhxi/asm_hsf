<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

  <head>
    <title>FUCarRentingSystem &mdash;</title>
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
                <a href="${pageContext.request.contextPath}/home"><strong>CarRental</strong></a>
              </div>
            </div>

            <div class="col-9  text-right">

              <span class="d-inline-block d-lg-none"><a href="#" class=" site-menu-toggle js-menu-toggle py-5 "><span class="icon-menu h3 text-black"></span></a></span>

              <nav class="site-navigation text-right ml-auto d-none d-lg-block" role="navigation">
                <ul class="site-menu main-menu js-clone-nav ml-auto ">
                  <li class="active"><a href="${pageContext.request.contextPath}/home" class="nav-link">Home</a></li>
                  <li><a href="${pageContext.request.contextPath}/listing" class="nav-link">Listing</a></li>
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
                <h1><strong>Contact</strong></h1>
                <div class="custom-breadcrumbs"><a href="${pageContext.request.contextPath}/home.jsp">Home</a> <span class="mx-2">/</span> <strong>Contact</strong></div>
              </div>

            </div>
          </div>
        </div>
      </div>

    

    <div class="site-section bg-light" id="contact-section">
      <div class="container">
        <div class="row justify-content-center text-center">
      </div>
        <div class="row">
          <div class="col-lg-8 mb-5" >
            <div class="form-group row">
              <c:forEach items="${carRentalList}" var="carRental">
                <div class="col-md-12">
                  <label>Rent #${carRental.id}</label>
                  <button type="button" class="form-control btn-white" data-toggle="modal" data-target="#detailModal_${carRental.id}"><strong>${carRental.status}</strong></button>
                </div>
              </c:forEach>
            </div>
          </div>

          <div class="col-lg-4 ml-auto">
            <div class="bg-white p-3 p-md-5">
              <h3 class="text-black mb-4">${customer.customerName}</h3>
              <ul class="list-unstyled footer-link">
                <li class="d-block mb-3">
                  <span class="d-block text-black">Email:</span>
                  <span>${customer.email}</span>
                </li>
                <li class="d-block mb-3">
                  <span class="d-block text-black">Phone number:</span>
                  <span>${customer.mobile}</span>
                </li>
                <li class="d-block mb-3 align-content-center">
                  <button type="button" class="btn btn-outline-primary btn-block" data-toggle="modal" data-target="#editProfileModal">
                    UPDATE
                  </button>
                </li>
                <li class="d-block mb-3 align-content-center">
                  <button type="button" class="btn btn-outline-dark btn-block" data-toggle="modal" data-target="#changePasswordModal">
                    CHANGE PASSWORD
                  </button>
                </li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>

      <!-- Update profile modal-->
      <div class="modal fade" id="editProfileModal" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
          <div class="modal-content">
            <div class="modal-header bg3">
              <h5 class="modal-title text-black">Edit Profile</h5>
              <button type="button" class="close text-black" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <form action="/user/update" method="post" enctype="multipart/form-data">
              <div class="modal-body">
                <div class="row">
                  <div class="col-md-6 form-group">
                    <label>Name</label>
                    <input type="text" name="name" class="form-control" value="${customer.customerName}" required>
                  </div>
                  <div class="col-md-6 form-group">
                    <label>Mobile</label>
                    <input type="text" name="mobile" class="form-control" value="${customer.mobile}" required>
                  </div>
                </div>
                <div class="row">
                  <div class="col-md-6 form-group">
                    <label>Licence Number</label>
                    <input type="text" name="licenceNumber" class="form-control" value="${customer.licenceNumber}" required>
                  </div>
                  <div class="col-md-6 form-group">
                    <label>Licence Date</label>
                    <input type="date" name="licenceDate" class="form-control" value="${customer.licenceDate}" required>
                  </div>
                </div>
              </div>
              <div class="modal-footer">
                <button type="submit" class="btn btn-primary bg3">Save Changes</button>
              </div>
            </form>
          </div>
        </div>
      </div>
      <!-- Change password modal-->
      <div class="modal fade" id="changePasswordModal" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
          <div class="modal-content">
            <div class="modal-header bg3">
              <h5 class="modal-title text-black">Change password</h5>
              <button type="button" class="close text-black" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <form action="/user/changePassword" method="post" enctype="multipart/form-data">
              <div class="modal-body">
                <div class="row">
                  <div class="col-md-6 form-group">
                    <label>Current Password</label>
                    <input type="password" name="oldPassword" class="form-control" required>
                  </div>
                  <div class="col-md-6 form-group">
                    <label>New Password</label>
                    <input type="password" name="newPassword" class="form-control"  required>
                  </div>
                </div>
              </div>
              <div class="modal-footer">
                <button type="submit" class="btn btn-primary bg3">Save Changes</button>
              </div>
            </form>
          </div>
        </div>
      </div>
      <!-- View detail modal-->
      <c:forEach items="${carRentalList}" var="carRental">
        <div class="modal fade" id="detailModal_${carRental.id}" tabindex="-1" role="dialog" aria-hidden="true">
          <div class="modal-dialog modal-lg col-md-6 col-lg-6 mb-4" role="document">
            <div class="modal-content col-md-6 col-lg-8 mb-4">
              <div class="modal-header bg3">
                <h5 class="modal-title text-black">Rent Detail</h5>
                <button type="button" class="close text-black" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
                <div class="modal-body">
                  <div class="">
                    <div class="listing d-block  align-items-stretch">
                      <div class="listing-img h-100 mr-4">
                        <img src="${carRental.car.url}?timestamp=${System.currentTimeMillis()}" alt="Image" class="img-fluid" style="width: 300px; height: 200px">
                      </div>
                      <div class="listing-contents h-100">
                        <h2><strong>${carRental.car.carName}</strong></h2>
                        <h4>${carRental.car.producer.producerName}</h4>
                        <div class="d-block d-md-flex mb-3 border-bottom pb-3">
                          <div class="rent-price">
                            <strong>$${carRental.rentPrice}</strong>
                          </div>
                        </div>
                        <div class="d-block d-md-flex mb-3 border-bottom pb-3">
                          <div class="listing-feature pr-4">
                            <span class="caption">Capacity:</span>
                            <span class="number">${carRental.car.capacity}</span>
                          </div>
                          <div class="listing-feature pr-4">
                            <span class="caption">Color:</span>
                            <span class="number">${carRental.car.color}</span>
                          </div>
                          <div class="listing-feature pr-4">
                            <span class="caption">Year Model:</span>
                            <span class="number">${carRental.car.carModelYear}</span>
                          </div>
                        </div>
                        <div class="d-block d-md-flex mb-3 border-bottom pb-3">
                          <div class="listing-feature pr-4">
                            <span class="caption">Pickup date:</span>
                            <span class="number">${carRental.pickupDate}</span>
                          </div>
                        </div>
                        <div class="d-block d-md-flex mb-3 border-bottom pb-3">
                          <div class="listing-feature pr-4">
                            <span class="caption">Return date:</span>
                            <span class="number">${carRental.returnDate}</span>
                          </div>
                        </div>
                        <div class="d-block d-md-flex mb-3 border-bottom pb-3">
                          <div class="listing-feature pr-4">
                            <span class="caption">Status:</span>
                            <span class="number">${carRental.status}</span>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
            </div>
          </div>
        </div>
      </c:forEach>



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