<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">

<head>
    <title>FUCarRentingSystem - User Management</title>
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
                            <li><a href="${pageContext.request.contextPath}/management" class="nav-link">Management</a></li>
                            <li><a href="/management/rental" class="nav-link">Rental Management</a></li>
                            <li class="active"><a href="/management/user" class="nav-link">User Management</a></li>
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
                    <h2 class="section-heading"><strong>USER MANAGEMENT</strong></h2>
                </div>
            </div>
            <!-- Brand List Section -->
            <div class="row mb-5">
                <div class="col-12">
                    <div class="card">
                        <div class="card-header d-flex justify-content-between align-items-center">
                            <h3 class="mb-0">ALL USER</h3>
                        </div>
                        <div class="card-body">
                            <table class="table">
                                <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Name</th>
                                    <th>Mobile</th>
                                    <th>Birthday</th>
                                    <th>Identity Number</th>
                                    <th>Licence Number</th>
                                    <th>Licence Date</th>
                                    <th></th>
                                </tr>
                                </thead>
                                <c:forEach items="${customerList}" var="customer">
                                    <tbody>
                                    <tr>
                                        <td>${customer.id}</td>
                                        <td>${customer.customerName}</td>
                                        <td>${customer.mobile}</td>
                                        <td>${customer.birthday}</td>
                                        <td>${customer.identityCard}</td>
                                        <td>${customer.licenceNumber}</td>
                                        <td>${customer.licenceDate}</td>
                                        <td>
                                            <div class="d-flex col-md-4">
                                                <div class="listing-feature pr-4">
                                                    <button type="button" class="btn btn-outline-primary btn-block" data-toggle="modal" data-target="#editBrandModal_${customer.id}">
                                                        UPDATE
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
    <c:forEach items="${customerList}" var="customer">
        <!-- Dynamic Edit Brand Modal -->
        <div class="modal fade" id="editBrandModal_${customer.id}" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header bg3">
                        <h5 class="modal-title text-black">Edit Customer</h5>
                        <button type="button" class="close text-black" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form action="/management/user/update" method="post" enctype="multipart/form-data">
                        <div class="modal-body">
                            <input type="hidden" name="id" value="${customer.id}">
                            <div class="form-group">
                                <label>Name</label>
                                <input type="text" name="name" class="form-control" value="${customer.customerName}" required>
                            </div>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <label>Mobile</label>
                                <input type="text" name="mobile" class="form-control" value="${customer.mobile}" required>
                            </div>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <label>Identity Number</label>
                                <input type="text" name="identity" class="form-control" value="${customer.identityCard}" required>
                            </div>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <label>Licence Number</label>
                                <input type="text" name="licence" class="form-control" value="${customer.licenceNumber}" required>
                            </div>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <label>Licence Date</label>
                                <input type="date" name="licenceDate" class="form-control" value="${customer.licenceDate}" required>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="submit" class="btn btn-primary bg3">Save Changes</button>
                        </div>
                    </form>
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