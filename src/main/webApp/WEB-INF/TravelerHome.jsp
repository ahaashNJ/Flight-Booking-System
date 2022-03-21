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
    <title>Traveler Home</title>
</head>
<body>
<nav class="navbar navbar navbar-expand-lg navbar-dark" style="background-color: black">
    <div class="container-fluid">

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mx-auto">

                <li class="nav-item">
                    <a class="nav-link item" href="${pageContext.request.contextPath}/TravelerHome">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link item" href="#">My Account</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link item" href="#">My
                        Bookings</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link item" href="#">ContactUs</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link item" href="/logout">Sign Out</a>
                </li>
            </ul>
        </div>
    </div>
</nav>
<div class="container">
    <div style="margin-top: 80px;">

        <div class="col-lg-12 col-md-12 col-sm-12 container justify-content-center">
            <h2 style="color: #414141; margin-top: 25px; align-items: center; text-align: center; font-weight: 600; font-size: 40px;">
                Book Your Flight Now</h2>
            <form:form action="${pageContext.request.contextPath}/Traveler/SearchFlightName" id="formSubmit" modelAttribute="flights" method="get">
                <div class="input-group">
                    <input type="search" class="form-control rounded" placeholder="Search..." name="searchItem" aria-label="Search" aria-describedby="search-addon" />
                    <button type="submit" class="btn btn-outline-primary">search</button>
                </div>
            </form:form>
            <table class="table" style="width: 100%; margin-top: 25px;">
                <thead>
                <tr>
                    <th style="width: 15%; color: #414141; text-align: center">Flight ID</th>
                    <th style="width: 15%; color: #414141; text-align: center">Plane Name</th>
                    <th style="width: 20%; color: #414141; text-align: center">Start Location</th>
                    <th style="width: 20%; color: #414141; text-align: center">End Location</th>
                    <th style="width: 30%; color: #414141; text-align: center">Date</th>
                    <th style="width: 30%; color: #414141; text-align: center">Time</th>
                    <th style="width: 5%; color: #414141; text-align: center">Book</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${flights}" var="flights">
                    <tr>
                        <td style="text-align: center">${flights.flightId}</td>
                        <td style="text-align: center">${flights.airplane.airplaneName}</td>
                        <td style="text-align: center">${flights.fromLocation}</td>
                        <td style="text-align: center">${flights.toLocation}</td>
                        <td style="text-align: center">${flights.flightDate}</td>
                        <td style="text-align: center">${flights.flightTime}</td>
                        <td style="text-align: center"><a type="button" class="btn btn-outline-info"
                                                          href="${pageContext.request.contextPath}/Traveler/BookFlight/${flights.flightId}">Book</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
        <div>
            <p style="display: none" id="errorMessage">${error}</p>
        </div>
        <div>
            <p style="display: none" id="successMessage">${success}</p>
        </div>
        <div>
            <p style="display: none" id="successMessageUpdate">${successUpdate}</p>
        </div>
    </div>
</div>
</body>
</html>
