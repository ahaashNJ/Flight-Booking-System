<%--
  Created by IntelliJ IDEA.
  User: AHAASH
  Date: 3/21/2022
  Time: 5:02 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
        integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
          integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
          crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
          integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
          crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
          integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV"
          crossorigin="anonymous"></script>
  <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <title>View Bookings</title>
</head>
<body>
<nav class="navbar navbar navbar-expand-lg navbar-dark" style="background-color: black">
  <div class="container-fluid">

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav mx-auto">

        <li class="nav-item">
          <a class="nav-link item"href="/Admin/AdminHome">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link item" href="/Admin/scheduleFlight">Schedule Flights</a>
        </li>
        <li class="nav-item">
          <a class="nav-link item" href="/Admin/ViewFlights">View Flights</a>
        </li>
        <li class="nav-item">
          <a class="nav-link item" href="/logout">Logout</a>
        </li>
      </ul>
    </div>
  </div>
</nav>
<div class="container">
  <div style="margin-top: 80px;">
    <form:form id="formSubmit" modelAttribute="bookings" method="get">
      <div class="col-lg-12 col-md-12 col-sm-12 container justify-content-center">
        <h2 style="color: #414141; margin-top: 25px; align-items: center; text-align: center; font-weight: 600; font-size: 40px;">All Bookings</h2>
        <table class="table" style="width: 100%; margin-top: 25px;">
          <thead>
          <tr>
            <th style="width: 15%; color: #414141; text-align: center">Booking ID</th>
            <th style="width: 20%; color: #414141; text-align: center">Start Location</th>
            <th style="width: 20%; color: #414141; text-align: center">End Location</th>
            <th style="width: 30%; color: #414141; text-align: center">Date</th>
            <th style="width: 30%; color: #414141; text-align: center">Time</th>
            <th style="width: 5%; color: #414141; text-align: center">Seats</th>
            <th style="width: 5%; color: #414141; text-align: center">Name</th>
          </tr>
          </thead>
          <tbody>
          <c:forEach items="${bookings}" var="bookings">
            <tr>
              <td style="text-align: center">${bookings.bookingId}</td>
              <td style="text-align: center">${bookings.flight.fromLocation}</td>
              <td style="text-align: center">${bookings.flight.toLocation}</td>
              <td style="text-align: center">${bookings.flight.date}</td>
              <td style="text-align: center">${bookings.flight.time}</td>
              <td style="text-align: center">${bookings.requiredSeats}</td>
              <td style="text-align: center">${bookings.user.firstName} ${bookings.user.lastName}</td>
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
    </form:form>
  </div>
</div>
</body>
</html>
