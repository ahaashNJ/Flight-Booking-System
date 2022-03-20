<%--
  Created by IntelliJ IDEA.
  User: AHAASH
  Date: 3/20/2022
  Time: 12:18 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
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
    <title>View Flights</title>
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
        <form:form id="formSubmit" modelAttribute="flights" method="get">
            <div class="col-lg-12 col-md-12 col-sm-12 container justify-content-center">
                <h2 style="color: #414141; margin-top: 25px; align-items: center; text-align: center; font-weight: 600; font-size: 40px;">Future Flights</h2>
                <table class="table" style="width: 100%; margin-top: 25px;">
                    <thead>
                    <tr>
                        <th style="width: 15%; color: #414141; text-align: center">Flight ID</th>
                        <th style="width: 15%; color: #414141; text-align: center">Plane Name</th>
                        <th style="width: 20%; color: #414141; text-align: center">Start Location</th>
                        <th style="width: 20%; color: #414141; text-align: center">End Location</th>
                        <th style="width: 30%; color: #414141; text-align: center">Date</th>
                        <th style="width: 30%; color: #414141; text-align: center">Time</th>
                        <th style="width: 5%; color: #414141; text-align: center">Update</th>
                        <th style="width: 5%; color: #414141; text-align: center">Delete</th>
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
                                   href="${pageContext.request.contextPath}/Admin/updateFlight/${flights.flightId}">Update</a>
                            </td>
                            <td style="text-align: center"><a type="button" class="btn btn-outline-danger"
                                   onclick="confirmDelete('${flights.flightId}')">Delete</a>
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
        </form:form>
    </div>
</div>
</body>
</html>

<script>
    window.onload = function () {
        const errorMessage = document.getElementById("errorMessage").innerHTML;
        const successMessage = document.getElementById("successMessage").innerHTML;
        const successUpdate = document.getElementById("successUpdate").innerHTML;
        if (errorMessage !== "") {
            Swal.fire({
                title: "Error occurred while deleting!!!",
                text: errorMessage,
                icon: "error",
            });
        }
        if (successMessage !== "") {
            Swal.fire({
                position: 'top-end',
                icon: 'success',
                title: successMessage,
                showConfirmButton: false,
                timer: 3000
            });
        }
        if (successUpdate !== "") {
            Swal.fire({
                position: 'top-end',
                icon: 'success',
                title: successMessage,
                showConfirmButton: false,
                timer: 3000
            });
        }
    }
    function confirmDelete(name) {
        Swal.fire({
            icon: 'question',
            title: 'Sure you want to delete this Flight?',
            text: 'This action cannot be reversed!',
            showCancelButton: true,
            confirmButtonText: `Yes!`,
            cancelButtonText: 'Nope!',
        }).then((result) => {
            if (result.isConfirmed) {
                window.location.href = '/Admin/DeleteFlight/' + name;
                Swal.fire({
                    title: 'Deleting...',
                    html: 'Hold on a few seconds while we delete the Flight!',
                    timer: 10000,
                    timerProgressBar: false,
                });
            }
        })
    }
    function logout() {
        Swal.fire({
            icon: 'question',
            title: 'Sure you want to logout?',
            showCancelButton: true,
            confirmButtonText: `Yes!`,
            cancelButtonText: 'Nope!',
        }).then((result) => {
            if (result.isConfirmed) {
                document.getElementById('logout').click();
            }
        })
    }
</script>
</body>
</html>
