<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: AHAASH
  Date: 3/19/2022
  Time: 5:18 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="webjars/bootstrap/4.5.0/css/bootstrap.min.css" rel="stylesheet"/>
    <script src="webjars/bootstrap/4.5.0/js/bootstrap.min.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/Home.css">
    <title>Home</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
          integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
</head>
<body>
<header>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg fixed-top navbar-scroll">
        <div class="container-fluid">
            <a class="navbar-brand" href="#!">UTC</a>
            <button class="navbar-toggler" type="button" data-mdb-toggle="collapse"
                    data-mdb-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                    aria-expanded="false"
                    aria-label="Toggle navigation">
                <i class="fas fa-bars"></i>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="#!">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#!">Countries</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#!">About</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#!">Contact</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/Login">Sign In</a>
                    </li>
                </ul>

            </div>
            <a class="outline" type="button" style="align-items: flex-end" href="${pageContext.request.contextPath}/createUser">Register</a>
        </div>
    </nav>
    <!-- Navbar -->

    <!--Section: Design Block-->
    <section>
        <div id="intro" class="bg-image" style="
        background-image: url('https://wallpaperaccess.com/full/254361.jpg');
        height: 100vh;
        background-size: cover;
      ">
            <div class="mask" style="background-color: rgba(0, 0, 0, 0.2);">
                <div class="container d-flex justify-content-center align-items-center h-100">
                    <div class="row align-items-center">
                        <div class="col-12">
                            <h1 class="mb-2 text-white display-2 title">Universal Travel Company</h1>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--Section: Design Block-->
</header>
<div class="container-fluid">
    <div class="" style="background-color: #414141; margin-left: -1%; margin-right: -1%">
        <footer class="text-center text-lg-start" style="padding: 10px 0">
            <div class="text-center p-3" style="color: #998d88">
                © 2022 Copyright:
                <a style="color: #998d88;" class="text-center p-3" href="${pageContext.request.contextPath}/login">Universal Travel Company</a>
            </div>
        </footer>
    </div>
</div>
</body>
</html>
