<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

      <div class="hero inner-page" style="background-image: url('${pageContext.request.contextPath}images/hero_1_a.jpg');">
        <div class="container">
          <div class="row align-items-end">
            <div class="col-lg-5">
              <div class="intro">
                <h1><strong>CAR</strong></h1>
                <h2> MANAGEMENT</h2>
              </div>
            </div>
          </div>
        </div>
      </div>

      <div class="site-section bg-light">
        <div class="container">
          <!-- Statistics Cards -->
          <div class="row mb-5">
            <div class="col-md-3">
              <div class="card bg-light text-white">
                <div class="card-body">
                  <h5 class="card-title">Total</h5>
                  <h2 class="card-text">120</h2>
                </div>
              </div>
            </div>
            <div class="col-md-3">
              <div class="card bg-light text-white">
                <div class="card-body">
                  <h5 class="card-title">Current Car Renting</h5>
                  <h2 class="card-text">15</h2>
                </div>
              </div>
            </div>
            <div class="col-md-3">
              <div class="card bg-light text-white">
                <div class="card-body">
                  <h5 class="card-title">Total Revenue</h5>
                  <h2 class="card-text">100000</h2>
                </div>
              </div>
            </div>
          </div>

          <!-- Brand List Section -->
          <div class="row mb-5">
            <div class="col-12">
              <div class="card">
                <div class="card-header d-flex justify-content-between align-items-center">
                  <h3 class="mb-0">ALL RENTAL</h3>
                </div>
                <div class="card-body">
                  <table class="table">
                    <thead>
                      <tr>
                        <th>Name</th>
                        <th>Address</th>
                        <th>Country</th>
                        <th>Total cars</th>
                        <th></th>
                      </tr>
                    </thead>
                    <c:forEach items="${carProducerList}" var="carProducer">
                      <tbody>
                      <tr>
                        <td>${carProducer.producerName}</td>
                        <td>${carProducer.address}</td>
                        <td>${carProducer.country}</td>
                        <td>${carProducer.cars.size()}</td>
                        <td>
                          <div class="d-flex col-md-4">
                            <div class="listing-feature pr-4">
                              <button type="button" class="btn btn-outline-primary btn-block" data-toggle="modal" data-target="#editBrandModal_${carProducer.id}">
                                UPDATE
                              </button>
                            </div>
                            <div class="listing-feature pr-4">
                              <button type="button" class="btn btn-outline-danger btn-block" data-toggle="modal" data-target="#deleteBrandModal_${carProducer.id}">
                                VIEW
                              </button>
                            </div>
                          </div>
                        </td>
                      </tr>
                      </tbody>
                    </c:forEach>
                  </table>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>


      <!-- Dynamic Brand Modals -->
      <c:forEach items="${carProducerList}" var="carProducer">
        <!-- Dynamic Edit Brand Modal -->
        <div class="modal fade" id="editBrandModal_${carProducer.id}" tabindex="-1" role="dialog" aria-hidden="true">
          <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
              <div class="modal-header bg3">
                <h5 class="modal-title text-black">Edit Brand</h5>
                <button type="button" class="close text-black" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <form action="/management/manufacture/update" method="post" enctype="multipart/form-data">
                <div class="modal-body">
                  <input type="hidden" name="id" value="${carProducer.id}">
                  <div class="form-group">
                    <label>Manufacture Name</label>
                    <input type="text" name="name" class="form-control" value="${carProducer.producerName}" required>
                  </div>
                  <div class="form-group">
                    <label>Address</label>
                    <input type="text" name="address" class="form-control" value="${carProducer.address}" required>
                  </div>
                  <div class="form-group">
                    <label>Country</label>
                    <input type="text" name="country" class="form-control" value="${carProducer.country}" required>
                  </div>
                </div>
                <div class="modal-footer">
                  <button type="submit" class="btn btn-primary bg3">Save Changes</button>
                </div>
              </form>
            </div>
          </div>
        </div>
        <!-- Dynamic Delete Brand Modal -->
        <div class="modal fade" id="deleteBrandModal_${carProducer.id}" tabindex="-1" role="dialog" aria-hidden="true">
          <div class="modal-dialog" role="document">
            <div class="modal-content">
              <div class="modal-header bg-danger text-black">
                <h5 class="modal-title">Confirm Delete</h5>
                <button type="button" class="close text-black" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <div class="modal-body">
                <p>Are you sure you want to delete this manufacture?</p>
                <p><strong>${carProducer.producerName}</strong></p>
                <p>This action cannot be undone. All cars associated with this brand will also be deleted.</p>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                <form action="/management/manufacture/delete" method="post">
                  <input type="hidden" name="id" value="${carProducer.id}">
                  <button type="submit" class="btn btn-danger">Delete</button>
                </form>
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
    <script>
      // Add this to your existing scripts
      $(document).ready(function() {
        // Toggle sidebar on mobile
        $('.toggle-sidebar').click(function() {
          $('.sidebar').toggleClass('active');
        });

        // Initialize file input display
        $('.custom-file-input').on('change', function() {
          var fileName = $(this).val().split('\\').pop();
          $(this).next('.custom-file-label').html(fileName);
        });
      });

      // Function to preview images before upload
      function previewImage(input, previewId) {
        if (input.files && input.files[0]) {
          var reader = new FileReader();

          reader.onload = function(e) {
            $('#' + previewId).attr('src', e.target.result);
            $('#' + previewId).css('display', 'block');
          }

          reader.readAsDataURL(input.files[0]);
        }
      }
    </script>
  </body>
</html>