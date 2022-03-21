<%--
  Created by IntelliJ IDEA.
  User: AHAASH
  Date: 3/19/2022
  Time: 12:32 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link href="webjars/bootstrap/4.5.0/css/bootstrap.min.css" rel="stylesheet"/>
    <script src="webjars/bootstrap/4.5.0/js/bootstrap.min.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
            integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
            crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
            integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
            crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
            integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
            crossorigin="anonymous"></script>
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/AdminHome.css">
    <title>Admin Home</title>
</head>
<body>
<nav class="navbar navbar navbar-expand-lg navbar-dark" style="background-color: black">
    <div class="container">

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mx-auto">

                <li class="nav-item">
                    <a class="nav-link item"href="/Admin/AdminHome">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link item"href="#">Today Flights</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link item"href="#">My Account</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link item" href="/logout">Logout</a>
                </li>
            </ul>
        </div>
    </div>
</nav>
<section class="wrapper">
    <div class="container-fostrap">
        <div>
            <h1 class="heading">
                ADMIN DASHBOARD
            </h1>
        </div>
        <div class="content">
            <div class="row">
                <div class="col-xs-12 col-md-3" style="align-items: center; justify-content: center; display: flex">
                    <div class="card" style="">
                        <a class="img-card">
                            <img src="https://media.istockphoto.com/photos/woman-traveling-by-plane-wearing-a-facemask-picture-id1264114001?k=20&m=1264114001&s=612x612&w=0&h=z-mT3UA-odR5sm-wCD_c0tXR06kNT-Q6xKu7dhAZ_hI=" />
                        </a>
                        <div class="card-content" style="align-items: center; justify-content: center">
                            <h4 class="card-title" style="text-align: center">User Handler</h4>
                        </div>
                        <div class="card-read-more">
                            <a href="#" class="btn btn-link btn-block">Add Users</a>
                        </div>
                        <div class="card-read-more">
                            <a href="#" class="btn btn-link btn-block">View All Users</a>
                        </div>
                    </div>
                </div>
                <div class="col-xs-12 col-md-3" style="align-items: center; justify-content: center; display: flex">
                    <div class="card" style="">
                        <a class="img-card">
                            <img src="https://ychef.files.bbci.co.uk/976x549/p018hpg1.jpg" />
                        </a>
                        <div class="card-content" style="align-items: center; justify-content: center">
                            <h4 class="card-title" style="text-align: center">Aeroplane Handler</h4>
                        </div>
                        <div class="card-read-more">
                            <a href="#" class="btn btn-link btn-block">Add Plane</a>
                        </div>
                        <div class="card-read-more">
                            <a href="#" class="btn btn-link btn-block">View All Planes</a>
                        </div>
                    </div>
                </div>
                <div class="col-xs-12 col-md-3" style="align-items: center; justify-content: center; display: flex">
                    <div class="card" style="">
                        <a class="img-card">
                            <img src="https://static.toiimg.com/thumb/msid-89044864,width-748,height-499,resizemode=4,imgsize-135808/.jpg"/>
                        </a>
                        <div class="card-content" style="align-items: center; justify-content: center">
                            <h4 class="card-title" style="text-align: center">Flight Handler</h4>
                        </div>
                        <div class="card-read-more">
                            <a href="${pageContext.request.contextPath}/Admin/scheduleFlight" class="btn btn-link btn-block">Schedule Flight</a>
                        </div>
                        <div class="card-read-more">
                            <a href="${pageContext.request.contextPath}/Admin/ViewFlights" class="btn btn-link btn-block">View All Flights</a>
                        </div>
                    </div>
                </div>
                <div class="col-xs-12 col-md-3" style="align-items: center; justify-content: center; display: flex">
                    <div class="card card" style="">
                        <a class="img-card">
                            <img src="https://img.freepik.com/free-photo/top-view-passport-with-flight-tickets_23-2148315677.jpg?size=626&ext=jpg"/>
                        </a>
                        <div class="card-content" style="align-items: center; justify-content: center">
                            <h4 class="card-title" style="text-align: center">Booking Handler</h4>
                        </div>
                        <div class="card-read-more" style="margin-bottom: 45px">
                        <a href="/Admin/ViewBookings" class="btn btn-link btn-block" style="font-size: 20px">View Bookings</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
</body>
</html>
