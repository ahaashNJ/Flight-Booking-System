<%--
  Created by IntelliJ IDEA.
  User: AHAASH
  Date: 3/21/2022
  Time: 2:59 AM
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
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/Form.css">
    <title>Booking</title>
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
<section>
    <div class="container">
        <div class="requestForm">
            <h3>Place Booking : ${FlightDetails.airplane.airplaneName}</h3>
            <h5 class="details" style="color: #0d60ac">From ${FlightDetails.fromLocation} to ${FlightDetails.toLocation} on ${FlightDetails.flightDate} at ${FlightDetails.flightTime}</h5>
            <form:form action="/Admin/placeBooking" method="POST" modelAttribute="placeBooking">
                <form:input path="flight" value="${FlightDetails.flightId}" type="hidden" readonly="true"/>
                <form:input path="user" value="${loggedUser.email}" type="hidden" readonly="true"/>
                <div class="formBox">
                    <div class="inputBox w50">
                        <input value="${FlightDetails.flightDate}" type="date" readonly="true"/>
                        <span>Flight Date</span>
                    </div>
                    <div class="inputBox w50">
                        <input value="${FlightDetails.flightTime}" type="time" readonly="true"/>
                        <span>Flight Time</span>
                    </div>
                    <div class="inputBox w50">
                        <input value="${FlightDetails.fromLocation}" type="text" readonly="true"/>
                        <span>Start Location</span>
                    </div>
                    <div class="inputBox w50">
                        <input value="${FlightDetails.toLocation}" type="text" readonly="true"/>
                        <span>End Location</span>
                    </div>
                    <div class="inputBox w50">
                        <input value="${FlightDetails.airplane.airplaneName}" type="text" readonly="true"/>
                        <span>Airplane Name</span>
                    </div>
                    <div class="inputBox w50">
                        <form:input path="requiredSeats" type="number" required="true"/>
                        <span>Number of tickets</span>
                    </div>
                    <div class="inputBox w-100" >
                        <input type="submit" value="Book">
                    </div>
                    <div class="Message" style="margin-top: -15px; margin-left: 300px">
                        <div>${success}${error}</div>
                    </div>
                </div>
            </form:form>
        </div>
    </div>
</section>
</body>
</html>
