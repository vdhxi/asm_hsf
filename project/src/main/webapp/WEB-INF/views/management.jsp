<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">

  <head>
    <title>FUCarRentingSystem - Management</title>
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
                  <li class="active"><a href="${pageContext.request.contextPath}/management" class="nav-link">Management</a></li>
                  <li><a href="/management/rental" class="nav-link">Rental Management</a></li>
                  <li><a href="/management/user" class="nav-link">User Management</a></li>
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

      <div class="hero inner-page" style="background-image: url(https://ggofzyfoccoknwqvheka.supabase.co/storage/v1/object/public/image//bg.jpg);">
      </div>

      <div class="site-section bg-light">
        <div class="container">
          <div class="row d-flex">
            <div class="col-lg-7">
              <h2 class="section-heading"><strong>CAR MANAGEMENT</strong></h2>
            </div>
          </div>

          <!-- Statistics Cards -->
          <div class="row mb-5">
            <div class="col-md-3">
              <div class="card bg-light text-white">
                <div class="card-body">
                  <h5 class="card-title">Total Car Manufacture</h5>
                  <h2 class="card-text">${totalCarManufacture}</h2>
                </div>
              </div>
            </div>
            <div class="col-md-3">
              <div class="card bg-light text-white">
                <div class="card-body">
                  <h5 class="card-title">Total Car</h5>
                  <h2 class="card-text">${totalCar}</h2>
                </div>
              </div>
            </div>
            <div class="col-md-3">
              <div class="card bg-light text-white">
                <div class="card-body">
                  <h5 class="card-title">Car Renting</h5>
                  <h2 class="card-text">${totalCarRenting}</h2>
                </div>
              </div>
            </div>
            <div class="col-md-3">
              <div class="card bg-light text-white">
                <div class="card-body">
                  <h5 class="card-title">Car Available</h5>
                  <h2 class="card-text">${totalCarAvailable}</h2>
                </div>
              </div>
            </div>
          </div>

          <!-- Brand List Section -->
          <div class="row mb-5">
            <div class="col-12">
              <div class="card">
                <div class="card-header d-flex justify-content-between align-items-center">
                  <h3 class="mb-0">ALL MANUFACTURE</h3>
                  <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#addBrandModal">
                    <i class="zmdi zmdi-plus mr-2"></i> ADD NEW MANUFACTURE
                  </button>
                </div>
                <div class="card-body">
                  <table class="table">
                    <thead>
                      <tr>
                        <th>Name</th>
                        <th>Country</th>
                        <th></th>
                      </tr>
                    </thead>
                    <c:forEach items="${carProducerList}" var="carProducer">
                      <tbody>
                      <tr>
                        <td>${carProducer.producerName}</td>
                        <td>${carProducer.country}</td>
                        <td>
                          <div class="d-flex col-md-4">
                            <div class="listing-feature pr-4">
                              <button type="button" class="btn btn-outline-primary btn-block" data-toggle="modal" data-target="#editBrandModal_${carProducer.id}">
                                UPDATE
                              </button>
                            </div>
                            <div class="listing-feature pr-4">
                              <button type="button" class="btn btn-outline-danger btn-block" data-toggle="modal" data-target="#deleteBrandModal_${carProducer.id}">
                                DELETE
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

          <!-- Products List Section -->
          <div class="row" style="margin-bottom: 50px">
            <div class="col-12">
              <div class="card">
                <div class="card-header d-flex justify-content-between align-items-center">
                  <h3 class="mb-0">ALL CARS</h3>
                  <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#addProductModal">
                    ADD NEW CAR
                  </button>
                </div>
              </div>
            </div>
          </div>

          <div class="row">
              <c:forEach items="${carList}" var="car">
                <div class="col-md-6 col-lg-4 mb-4">
                <div class="listing d-block  align-items-stretch">
                  <div class="listing-img h-100 mr-4">
                    <img src="${car.url}?timestamp=${System.currentTimeMillis()}" alt="Image" class="img-fluid" style="width: 300px; height: 200px">
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
                        <span class="caption">Year Model:</span>
                        <span class="number">${car.carModelYear}</span>
                      </div>
                    </div>
                    <div class="d-block d-md-flex mb-3 border-bottom pb-3">
                      <div class="listing-feature pr-4">
                        <span class="badge ${car.rented ? 'badge-danger' : 'badge-success'}">
                            ${car.rented ? 'Rented' : 'Available'}
                        </span>
                      </div>
                      <div class="listing-feature pr-4">
                        <button type="button" class="btn btn-outline-primary btn-block" data-toggle="modal" data-target="#editProductModal_${car.id}">
                          UPDATE
                        </button>
                      </div>
                      <div class="listing-feature pr-4">
                        <button type="button" class="btn btn-outline-danger btn-block" data-toggle="modal" data-target="#deleteProductModal_${car.id}">
                          DELETE
                        </button>
                      </div>
                    </div>
                    <div class="d-block d-md-flex mb-3 border-bottom pb-3">
                      <div class="listing-feature pr-4">
                        <span class="caption">Import date:</span>
                        <span class="number">${car.importDate}</span>
                      </div>
                    </div>
                    <div>
                      <p>${car.description}</p>
                    </div>
                  </div>
                </div>
                </div>
              </c:forEach>
          </div>
        </div>
      </div>

      <!-- Add Brand Modal -->
      <div class="modal fade" id="addBrandModal" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
          <div class="modal-content">
            <div class="modal-header bg3">
              <h5 class="modal-title text-black">Add New Manufacture</h5>
              <button type="button" class="close text-black" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <form action="/management/manufacture/add" method="post" enctype="multipart/form-data">
              <div class="modal-body">
                <div class="form-group">
                  <label>Manufacture Name</label>
                  <input type="text" name="name" class="form-control" required>
                </div>
                <div class="form-group">
                  <label>Country</label>
                  <input type="text" name="country" class="form-control" required>
                </div>
              </div>
              <div class="modal-footer">
                <button type="submit" class="btn btn-primary bg3">Add Manufacture</button>
              </div>
            </form>
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


      <!-- Add Product Modal -->
      <div class="modal fade" id="addProductModal" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
          <div class="modal-content">
            <div class="modal-header bg3">
              <h5 class="modal-title text-black">Add New Car</h5>
              <button type="button" class="close text-black" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <form action="/management/car/add" method="post" enctype="multipart/form-data">
              <div class="modal-body">
                <div class="row">
                  <div class="col-md-6 form-group">
                    <label>Name</label>
                    <input type="text" name="name" class="form-control" required>
                  </div>
                  <div class="col-md-6 form-group">
                    <label>Year</label>
                    <input type="text" name="year" class="form-control" required>
                  </div>
                </div>

                <div class="row">
                  <div class="col-md-6 form-group">
                    <label>Color</label>
                    <input type="text" name="color" class="form-control" required>
                  </div>
                  <div class="col-md-6 form-group">
                    <label>Capacity</label>
                    <input type="text" name="capacity" class="form-control" required>
                  </div>
                </div>

                <div class="row">
                  <div class="col-md-6 form-group">
                    <label>Price</label>
                    <input type="text" name="price" class="form-control" required>
                  </div>
                  <div class="col-md-6 form-group">
                    <label>Manufacture</label>
                    <select name="producerId" class="form-control" required>
                      <option value="">Select Manufacture</option>
                      <c:forEach items="${carProducerList}" var="carProducer">
                        <option value="${carProducer.id}">${carProducer.producerName}</option>
                      </c:forEach>

                    </select>
                  </div>
                </div>
                <div class="form-group">
                  <label>Description</label>
                  <textarea name="description" class="form-control" rows="4" required></textarea>
                </div>

                <div class="form-group">
                  <label>Product Image</label>
                  <div class="file-upload-section">
                    <div class="custom-file mb-3">
                      <input type="file" class="custom-file-input" id="addProductImage" name="image" accept="image/*" onchange="previewImage(this, 'addImagePreview')" required>
                      <label class="custom-file-label" for="addProductImage">
                        Choose file...
                      </label>
                    </div>
                    <div class="mt-3 text-center">
                      <img id="addImagePreview" src="#" alt="Image Preview" style="max-width: 200px; max-height: 200px; display: none;" class="img-thumbnail">
                    </div>
                  </div>
                </div>
              </div>

              <div class="modal-footer">
                <button type="submit" class="btn btn-primary bg3">Add Car</button>
              </div>
            </form>
          </div>
        </div>
      </div>
      <!-- Dynamic Edit Product Modals -->
      <c:forEach items="${carList}" var="car">
        <div class="modal fade" id="editProductModal_${car.id}" tabindex="-1" role="dialog" aria-hidden="true">
          <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
              <div class="modal-header bg3">
                <h5 class="modal-title text-black">Edit Product</h5>
                <button type="button" class="close text-black" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <form action="/management/car/update" method="post" enctype="multipart/form-data">
                <div class="modal-body">
                  <input type="hidden" name="id" value="${car.id}">
                  <div class="row">
                    <div class="col-md-6 form-group">
                      <label>Name</label>
                      <input type="text" name="name" class="form-control" value="${car.carName}" required>
                    </div>
                    <div class="col-md-6 form-group">
                      <label>Year</label>
                      <input type="text" name="year" class="form-control" value="${car.carModelYear}" required>
                    </div>
                  </div>

                  <div class="row">
                    <div class="col-md-6 form-group">
                      <label>Color</label>
                      <input type="text" name="color" class="form-control" value="${car.color}" required>
                    </div>
                    <div class="col-md-6 form-group">
                      <label>Capacity</label>
                      <input type="text" name="capacity" class="form-control" value="${car.capacity}" required>
                    </div>
                  </div>

                  <div class="row">
                    <div class="col-md-6 form-group">
                      <label>Price</label>
                      <input type="text" name="price" value="${car.rentPrice}" class="form-control" required>
                    </div>
                    <div class="col-md-6 form-group">
                      <label>Manufacture</label>
                      <select name="producerId" class="form-control" required>
                        <option value="">Select Manufacture</option>
                        <c:forEach items="${carProducerList}" var="carProducer">
                          <option value="${carProducer.id}" ${car.producer.id == carProducer.id ? 'selected' : ''}>${carProducer.producerName}</option>
                        </c:forEach>
                      </select>
                    </div>
                  </div>
                  <div class="form-group">
                    <label>Description</label>
                    <textarea name="description" class="form-control" rows="4" required>${car.description}</textarea>
                  </div>
                  <div class="form-group">
                    <label>Current Image</label>
                    <div class="text-center mb-3">
                      <img id="currentImage_${car.id}" src="${car.url}" alt="Current" style="max-width: 200px; max-height: 200px; object-fit: cover;" class="img-thumbnail">
                    </div>
                  </div>
                  <div class="form-group">
                    <label>Change Image (optional)</label>
                    <div class="file-upload-section">
                      <div class="custom-file">
                        <input type="file" class="custom-file-input" id="editProductImage_${car.id}" name="image" accept="image/*" onchange="previewImage(this, 'editImagePreview_${car.id}')">
                        <label class="custom-file-label" for="editProductImage_${car.id}">
                          <i class="zmdi zmdi-collection-image file-upload-icon"></i>Choose file...
                        </label>
                      </div>
                      <div class="mt-3 text-center">
                        <img id="editImagePreview_${car.id}" src="#" alt="New Image Preview" style="max-width: 200px; max-height: 200px; display: none;" class="img-thumbnail">
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-md-12 form-group">
                      <label>Status</label>
                      <select name="status" class="form-control">
                        <option value="True">Rented</option>
                        <option value="False">Available</option>
                      </select>
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

        <!-- Dynamic Delete Modal -->
        <div class="modal fade" id="deleteProductModal_${car.id}" tabindex="-1" role="dialog" aria-hidden="true">
          <div class="modal-dialog" role="document">
            <div class="modal-content">
              <div class="modal-header bg-danger text-black">
                <h5 class="modal-title">Confirm Delete</h5>
                <button type="button" class="close text-black" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <div class="modal-body">
                <p>Are you sure you want to delete this car?</p>
                <p><strong>${car.carName}</strong></p>
                <p>This action cannot be undone.</p>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                <form action="/management/car/delete" method="post">
                  <input type="hidden" name="id" value="${car.id}">
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