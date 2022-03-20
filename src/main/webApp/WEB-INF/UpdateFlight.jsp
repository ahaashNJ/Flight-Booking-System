<%--
  Created by IntelliJ IDEA.
  User: AHAASH
  Date: 3/20/2022
  Time: 1:52 PM
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
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <title>Update Flight</title>
</head>
<body>
<nav class="navbar navbar navbar-expand-lg navbar-dark" style="background-color: black">
    <div class="container-fluid">

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mx-auto">

                <li class="nav-item">
                    <a class="nav-link item" href="/Admin/AdminHome">Home</a>
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
<section>
    <div class="container">
        <%--        <div class = "formInfo">--%>
        <%--            <div>--%>
        <%--                <div class="smallBox">${FlightDetails.flightId}</div>--%>
        <%--                <div class="smallerBox"></div>--%>
        <%--                <ul class = "lines">--%>
        <%--                    <li>Batch name cannot be changed</li>--%>
        <%--                    <li>Add extra 4 months for delaying purposes</li>--%>
        <%--                </ul>--%>
        <%--            </div>--%>
        <%--        </div>--%>

        <div class="requestForm">
            <form:form action="/Admin/AdminUpdateFlight" method="POST" modelAttribute="UpdateFlight">

                <h3>Reschedule Flight</h3>

                <div class="formBox">
                    <form:input path="flightId" value="${FlightDetails.flightId}" type="hidden"/>
                    <div class="inputBox w50">
                        <input path="airplane" value="${FlightDetails.airplane.airplaneName}${UpdateFlight.airplane}"
                               type="text" readonly="true"/>
                        <span>Plane Name</span>
                    </div>
                    <div class="inputBox w50">
                        <input path="remainingSeats" value="${FlightDetails.remainingSeats}" type="text"
                               readonly="true"/>
                        <span>Remaining Seats</span>
                    </div>
                    <div class="inputBox w50">
                        <form:input path="flightDate" value="${FlightDetails.flightDate}" type="date"/>
                        <span>Flight Date</span>
                    </div>
                    <div class="inputBox w50">
                        <form:input path="flightTime" value="${FlightDetails.flightTime}" type="time"/>
                        <span>Flight Time</span>
                    </div>
                    <div class="inputBox w50">
                        <input path="fromLocation" value="${FlightDetails.fromLocation}" type="text" readonly="true"/>
                        <span>Start Location</span>
                    </div>
                    <div class="inputBox w50">
                        <input path="toLocation" value="${FlightDetails.toLocation}" type="text" readonly="true"/>
                        <span>End Location</span>
                    </div>


                    <div class="inputBox w100">
                        <input type="submit" value="Update">
                    </div>
                    <div class="Message">
                        <div>${success}${error}</div>
                    </div>
                </div>
            </form:form>
        </div>
    </div>
</section>
</body>
</html>
<script>

    window.onload = function () {
        const errorMessage = document.getElementById("errorMessage").innerHTML;
        const successMessage = document.getElementById("successMessage").innerHTML;
        if (errorMessage !== "") {
            Swal.fire({
                title: "Error occurred while updating the schedule!!!",
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
