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

    <div class="hero" style="background-image: url('${pageContext.request.contextPath}/images/hero_1_a.jpg');">

        <div class="container">
            <div class="row align-items-center justify-content-center">
                <div class="col-lg-10">

                    <div class="row mb-5">
                        <div class="col-lg-7 intro">
                            <h1><strong>Rent a car</strong> is within your finger tips.</h1>
                        </div>
                    </div>

                    <form class="trip-form" action="/rent/create" method="post">
                        <h3><strong>Fill out to start your journey now</strong></h3>
                        <br>
                        <div class="row align-items-center">
                            <div class="mb-6 mb-md-0 col-md-6">
                                Name
                                <div class="form-control-wrap">
                                    <input type="text" value="${customer.customerName}" class="form-control" readonly>
                                </div>
                            </div>
                            <div class="mb-3 mb-md-0 col-md-3">
                                Pickup Date
                                <div class="form-control-wrap">
                                    <input type="date" name="pickUpDate" placeholder="pickUpDate" class="form-control" required>
                                </div>
                            </div>
                            <div class="mb-3 mb-md-0 col-md-3">
                                Return Date
                                <div class="form-control-wrap">
                                    <input type="date" name="returnDate" placeholder="Date of birth" class="form-control" required>
                                </div>
                            </div>
                            <div class="mb-6 mb-md-0 col-md-6">
                                Total
                                <div class="form-control-wrap">
                                    <input type="number" id="totalPrice" name="totalPrice" class="form-control" readonly data-rent-price="${car.rentPrice}">
                                    <input type="hidden" id="hiddenTotalPrice" name="totalPrice">
                                </div>
                            </div>
                            <div class="mb-3 mb-md-0 col-md-3">
                                <input type="hidden" name="id" value="${car.id}">
                            </div>
                            <div class="mb-3 mb-md-0 col-md-3">
                                <p></p>
                                <input type="submit" value="Rent" class="btn btn-primary btn-block py-3">
                            </div>
                            <div class="mb-3 mb-md-0 col-md-12 mt-3">

                                <input type="checkbox" required> I have read and understood the policy.
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
<script>
    document.addEventListener("DOMContentLoaded", function () {
        const pickUpDate = document.querySelector("input[name='pickUpDate']");
        const returnDate = document.querySelector("input[name='returnDate']");
        const totalPrice = document.getElementById("totalPrice");
        const hiddenTotalPrice = document.getElementById("hiddenTotalPrice");

        // Lấy giá trị thuê xe từ data attribute (tránh lỗi JSTL)
        const rentPrice = parseInt(totalPrice.dataset.rentPrice);

        function calculateTotal() {
            const startDate = new Date(pickUpDate.value);
            const endDate = new Date(returnDate.value);

            if (!isNaN(startDate) && !isNaN(endDate) && endDate >= startDate) {
                const diffDays = (endDate - startDate) / (1000 * 60 * 60 * 24); // Tính số ngày thuê
                const total = rentPrice * diffDays; // Nhân với giá thuê mỗi ngày
                totalPrice.value = total;
                hiddenTotalPrice.value = total; // Đảm bảo gửi lên form
            } else {
                totalPrice.value = rentPrice;
                hiddenTotalPrice.value = rentPrice;
            }
        }

        pickUpDate.addEventListener("change", calculateTotal);
        returnDate.addEventListener("change", calculateTotal);
    });
</script>

</body>

</html>