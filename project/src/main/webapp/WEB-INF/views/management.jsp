<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

  <head>
    <title>CarRental &mdash; Management Dashboard</title>
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
      <div class="site-mobile-menu site-navbar-target">
        <div class="site-mobile-menu-header">
          <div class="site-mobile-menu-close mt-3">
            <span class="icon-close2 js-menu-toggle"></span>
          </div>
        </div>
        <div class="site-mobile-menu-body"></div>
      </div>

      <header class="site-navbar site-navbar-target" role="banner">

        <div class="container">
          <div class="row align-items-center position-relative">

            <div class="col-3">
              <div class="site-logo">
                <a href="${pageContext.request.contextPath}/home.jsp"><strong>CarRental</strong></a>
              </div>
            </div>

            <div class="col-9  text-right">

              <span class="d-inline-block d-lg-none"><a href="#" class=" site-menu-toggle js-menu-toggle py-5 "><span class="icon-menu h3 text-black"></span></a></span>

              <nav class="site-navigation text-right ml-auto d-none d-lg-block" role="navigation">
                <ul class="site-menu main-menu js-clone-nav ml-auto ">
                  <li class="active"><a href="${pageContext.request.contextPath}/home.jsp" class="nav-link">Home</a></li>
                  <li><a href="${pageContext.request.contextPath}/listing.jsp" class="nav-link">Listing</a></li>
                  <li><a href="${pageContext.request.contextPath}/testimonials.jsp" class="nav-link">Testimonials</a></li>
                  <li><a href="${pageContext.request.contextPath}/contact.jsp" class="nav-link">Contact</a></li>
                  <li><a href="${pageContext.request.contextPath}/management.jsp" class="nav-link">Management</a></li>
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
                <div class="custom-breadcrumbs"><a href="${pageContext.request.contextPath}/home.jsp">Home</a> <span class="mx-2">/</span> <strong>Management</strong></div>
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
                  <h5 class="card-title">Total Car Manufacture</h5>
                  <h2 class="card-text">0</h2>
                </div>
              </div>
            </div>
            <div class="col-md-3">
              <div class="card bg-light text-white">
                <div class="card-body">
                  <h5 class="card-title">Total Car</h5>
                  <h2 class="card-text">1</h2>
                </div>
              </div>
            </div>
            <div class="col-md-3">
              <div class="card bg-light text-white">
                <div class="card-body">
                  <h5 class="card-title">Total Rent</h5>
                  <h2 class="card-text">0</h2>
                </div>
              </div>
            </div>
            <div class="col-md-3">
              <div class="card bg-light text-white">
                <div class="card-body">
                  <h5 class="card-title">Car Available</h5>
                  <h2 class="card-text">0</h2>
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
                        <th>ID</th>
                        <th>Logo</th>
                        <th>Name</th>
                        <th>Description</th>
                        <th>Status</th>
                        <th>Actions</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td>1</td>
                        <td><img src="images/logo.jpg" alt="Brand Logo" style="width: 50px; height: 50px;"></td>
                        <td>Ferrari</td>
                        <td>Ferrari</td>
                        <td><span class="badge badge-success">Active</span></td>
                        <td>
                          <div class="d-flex">
                            <button type="button" class="btn btn-sm btn-info mr-2" data-toggle="modal" data-target="#editBrandModal_${brand.id}">
                              UPDATE
                            </button>
                            <button type="button" class="btn btn-sm btn-danger" data-toggle="modal" data-target="#deleteBrandModal_${brand.id}">
                              DELETE
                            </button>
                          </div>
                        </td>
                      </tr>
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
          </div>

          <!-- Products List Section -->
          <div class="row">
            <div class="col-12">
              <div class="card">
                <div class="card-header d-flex justify-content-between align-items-center">
                  <h3 class="mb-0">ALL CARS</h3>
                  <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#addProductModal">
                    ADD NEW CAR
                  </button>
                </div>
                <div class="card-body">
                  <table class="table">
                    <thead>
                      <tr>
                        <th>ID</th>
                        <th>Image</th>
                        <th>Name</th>
                        <th>Price</th>
                        <th>Brand</th>
                        <th>Stock</th>
                        <th>Status</th>
                        <th>Actions</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td>1</td>
                        <td><img src="images/product.jpg" alt="Product" style="width: 50px; height: 50px;"></td>
                        <td>488GTB</td>
                        <td>500000</td>
                        <td>Ferrari</td>
                        <td>1</td>
                        <td><span class="badge badge-success">Active</span></td>
                        <td>
                          <button class="btn btn-info btn-sm">Edit</button>
                          <button class="btn btn-danger btn-sm">Delete</button>
                        </td>
                      </tr>
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>

      <!-- Add Brand Modal -->
      <div class="modal fade" id="addBrandModal" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
          <div class="modal-content">
            <div class="modal-header bg3">
              <h5 class="modal-title text-white">Add New Brand</h5>
              <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <form action="/hsf/management/brand/create" method="post" enctype="multipart/form-data">
              <div class="modal-body">
                <div class="form-group">
                  <label>Brand Name</label>
                  <input type="text" name="name" class="form-control" required>
                </div>
                <div class="form-group">
                  <label>Description</label>
                  <textarea name="description" class="form-control" rows="4" required></textarea>
                </div>
                <div class="form-group">
                  <label>Brand Image</label>
                  <div class="file-upload-section">
                    <div class="custom-file mb-3">
                      <input type="file" class="custom-file-input" id="addBrandImage" name="image" accept="image/*" onchange="previewImage(this, 'addBrandImagePreview')" required>
                      <label class="custom-file-label" for="addBrandImage">
                        <i class="zmdi zmdi-collection-image file-upload-icon"></i>Choose file...
                      </label>
                    </div>
                    <div class="mt-3 text-center">
                      <img id="addBrandImagePreview" src="#" alt="Logo Preview" style="max-width: 200px; max-height: 200px; display: none;" class="img-thumbnail">
                    </div>
                  </div>
                </div>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                <button type="submit" class="btn btn-primary bg3">Add Brand</button>
              </div>
            </form>
          </div>
        </div>
      </div>


      <!-- Dynamic Brand Modals -->
<%--      <c:forEach items="${brands}" var="brand">
        <!-- Dynamic Edit Brand Modal -->
        <div class="modal fade" id="editBrandModal_${brand.id}" tabindex="-1" role="dialog" aria-hidden="true">
          <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
              <div class="modal-header bg3">
                <h5 class="modal-title text-white">Edit Brand</h5>
                <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <form action="/hsf/management/brand/update" method="post" enctype="multipart/form-data">
                <div class="modal-body">
                  <input type="hidden" name="id" value="${brand.id}">
                  <div class="form-group">
                    <label>Brand Name</label>
                    <input type="text" name="name" class="form-control" value="${brand.name}" required>
                  </div>
                  <div class="form-group">
                    <label>Description</label>
                    <textarea name="description" class="form-control" rows="4" required>${brand.description}</textarea>
                  </div>
                  <div class="form-group">
                    <label>Current Image</label>
                    <div class="text-center mb-3">
                      <img id="currentBrandImage_${brand.id}" src="${brand.url}" alt="Current" style="max-width: 200px; max-height: 200px; object-fit: cover;" class="img-thumbnail">
                    </div>
                  </div>
                  <div class="form-group">
                    <label>Change Image (optional)</label>
                    <div class="file-upload-section">
                      <div class="custom-file">
                        <input type="file" class="custom-file-input" id="editBrandImage_${brand.id}" name="image" accept="image/*" onchange="previewImage(this, 'editBrandImagePreview_${brand.id}')">
                        <label class="custom-file-label" for="editBrandImage_${brand.id}">
                          <i class="zmdi zmdi-collection-image file-upload-icon"></i>Choose file...
                        </label>
                      </div>
                      <div class="mt-3 text-center">
                        <img id="editBrandImagePreview_${brand.id}" src="#" alt="New Logo Preview" style="max-width: 200px; max-height: 200px; display: none;" class="img-thumbnail">
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="form-group">
                      <label>Status</label>
                      <select name="status" class="form-control">
                        <option value="True">Active</option>
                        <option value="False">Disable</option>
                      </select>
                    </div>
                  </div>
                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                  <button type="submit" class="btn btn-primary bg3">Save Changes</button>
                </div>
              </form>
            </div>
          </div>
        </div>
        <!-- Dynamic Delete Brand Modal -->
        <div class="modal fade" id="deleteBrandModal_${brand.id}" tabindex="-1" role="dialog" aria-hidden="true">
          <div class="modal-dialog" role="document">
            <div class="modal-content">
              <div class="modal-header bg-danger text-white">
                <h5 class="modal-title">Confirm Delete</h5>
                <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <div class="modal-body">
                <p>Are you sure you want to delete this brand?</p>
                <p><strong>${brand.name}</strong></p>
                <p>This action cannot be undone. All products associated with this brand will also be deleted.</p>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                <form action="/hsf/management/brand/delete" method="post">
                  <input type="hidden" name="id" value="${brand.id}">
                  <button type="submit" class="btn btn-danger">Delete</button>
                </form>
              </div>
            </div>
          </div>
        </div>
      </c:forEach>--%>

      <!-- Add Product Modal -->
      <div class="modal fade" id="addProductModal" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
          <div class="modal-content">
            <div class="modal-header bg3">
              <h5 class="modal-title text-white">Add New Product</h5>
              <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <form action="/hsf/management/product/create" method="post" enctype="multipart/form-data">
              <div class="modal-body">
                <div class="row">
                  <div class="col-md-6 form-group">
                    <label>Product Name</label>
                    <input type="text" name="name" class="form-control" required>
                  </div>
                  <div class="col-md-6 form-group">
                    <label>Price</label>
                    <input type="number" name="price" class="form-control" step="1" required>
                  </div>
                </div>
                <div class="row">
                  <div class="col-md-6 form-group">
                    <label>Brand</label>
                    <%--<select name="brandId" class="form-control" required>
                      <option value="">Select Brand</option>
                      <c:forEach items="${brands}" var="brand">
                        <option value="${brand.id}">${brand.name}</option>
                      </c:forEach>

                    </select>--%>
                  </div>
                  <div class="col-md-6 form-group">
                    <label>Stock</label>
                    <input type="number" name="stock" class="form-control" required>
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
                        <i class="zmdi zmdi-collection-image file-upload-icon"></i>Choose file...
                      </label>
                    </div>
                    <div class="mt-3 text-center">
                      <img id="addImagePreview" src="#" alt="Image Preview" style="max-width: 200px; max-height: 200px; display: none;" class="img-thumbnail">
                    </div>
                  </div>
                </div>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                <button type="submit" class="btn btn-primary bg3">Add Product</button>
              </div>
            </form>
          </div>
        </div>
      </div>
      <!-- Dynamic Edit Product Modals -->
<%--      <c:forEach items="${products}" var="product">
        <div class="modal fade" id="editProductModal_${product.id}" tabindex="-1" role="dialog" aria-hidden="true">
          <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
              <div class="modal-header bg3">
                <h5 class="modal-title text-white">Edit Product</h5>
                <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <form action="/hsf/management/product/update" method="post" enctype="multipart/form-data">
                <div class="modal-body">
                  <input type="hidden" name="id" value="${product.id}">
                  <div class="row">
                    <div class="col-md-6 form-group">
                      <label>Product Name</label>
                      <input type="text" name="name" class="form-control" value="${product.name}" required>
                    </div>
                    <div class="col-md-6 form-group">
                      <label>Price</label>
                      <input type="number" name="price" class="form-control" step="0.01" value="${product.price}" required>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-md-6 form-group">
                      <label>Brand</label>
                      <select name="brandId" class="form-control" required>
                        <option value="">Select Brand</option>
                        <c:forEach items="${brands}" var="brand">
                          <option value="${brand.id}" ${product.brand.id == brand.id ? 'selected' : ''}>${brand.name}</option>
                        </c:forEach>
                      </select>
                    </div>
                    <div class="col-md-6 form-group">
                      <label>Stock</label>
                      <input type="number" name="stock" class="form-control" value="${product.stock}" required>
                    </div>
                  </div>
                  <div class="form-group">
                    <label>Description</label>
                    <textarea name="description" class="form-control" rows="4" required></textarea>
                  </div>
                  <div class="form-group">
                    <label>Current Image</label>
                    <div class="text-center mb-3">
                      <img id="currentImage_${product.id}" src="${product.url}" alt="Current" style="max-width: 200px; max-height: 200px; object-fit: cover;" class="img-thumbnail">
                    </div>
                  </div>
                  <div class="form-group">
                    <label>Change Image (optional)</label>
                    <div class="file-upload-section">
                      <div class="custom-file">
                        <input type="file" class="custom-file-input" id="editProductImage_${product.id}" name="image" accept="image/*" onchange="previewImage(this, 'editImagePreview_${product.id}')">
                        <label class="custom-file-label" for="editProductImage_${product.id}">
                          <i class="zmdi zmdi-collection-image file-upload-icon"></i>Choose file...
                        </label>
                      </div>
                      <div class="mt-3 text-center">
                        <img id="editImagePreview_${product.id}" src="#" alt="New Image Preview" style="max-width: 200px; max-height: 200px; display: none;" class="img-thumbnail">
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="form-group">
                      <label>Status</label>
                      <select name="status" class="form-control">
                        <option value="True">Active</option>
                        <option value="False">Disable</option>
                      </select>
                    </div>
                  </div>
                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                  <button type="submit" class="btn btn-primary bg3">Save Changes</button>
                </div>
              </form>
            </div>
          </div>
        </div>

        <!-- Dynamic Delete Modal -->
        <div class="modal fade" id="deleteProductModal_${product.id}" tabindex="-1" role="dialog" aria-hidden="true">
          <div class="modal-dialog" role="document">
            <div class="modal-content">
              <div class="modal-header bg-danger text-white">
                <h5 class="modal-title">Confirm Delete</h5>
                <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <div class="modal-body">
                <p>Are you sure you want to delete this product?</p>
                <p><strong>${product.name}</strong></p>
                <p>This action cannot be undone.</p>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                <form action="/hsf/management/product/delete" method="post">
                  <input type="hidden" name="id" value="${product.id}">
                  <button type="submit" class="btn btn-danger">Delete</button>
                </form>
              </div>
            </div>
          </div>
        </div>
      </c:forEach>--%>

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