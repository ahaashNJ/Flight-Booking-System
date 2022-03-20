<%--
  Created by IntelliJ IDEA.
  User: AHAASH
  Date: 3/19/2022
  Time: 12:35 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link href="webjars/bootstrap/4.5.0/css/bootstrap.min.css" rel="stylesheet"/>
    <script src="webjars/bootstrap/4.5.0/js/bootstrap.min.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Font Icon -->
    <link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">

    <!-- Main css -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/Login.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/Register.css">
    <%--    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/Login.css">--%>
    <title>Sign Up</title>
</head>
<body>
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
        <a class="outline" type="button" style="align-items: flex-end"  href="${pageContext.request.contextPath}/createUser">Register</a>
    </div>
</nav>
<!-- Navbar -->
<div class="container">
    <div class="row">
        <div class="col-md-10 offset=md-1 register-left">
            <div class="row">
                <div class="col-md-5">

                    <h3 class="heading">Join Us</h3>
                    <p>Fly With Us Today!</p>
                </div>
                <div class="col-md-7 register-right">
                    <h2>Register Here</h2>
                    <div class="requestForm">
                        <form:form action="/RegisterUser" method="POST" modelAttribute="AddUser">
                            <div class="form-group">
                                <form:input path="firstName" type="text" required="true" maxlength="20"
                                            placeholder="First Name" cssClass="form-control"/>
                            </div>
                            <div class="form-group">
                                <form:input path="lastName" type="text" required="true" maxlength="20"
                                            placeholder="Last Name" cssClass="form-control"/>
                            </div>
                            <div class="form-group">
                                <form:input path="email" type="email" required="true" maxlength="50"
                                            pattern=".+@gmail.com"
                                            title="The email should contain '@gmail.com' werbserver"
                                            placeholder="Email Address" cssClass="form-control"/>
                            </div>
                            <div class="form-group">
                                <form:input path="contactNumber" type="text" required="true" minlength="10"
                                            maxlength="10" pattern="[0-9]+"
                                            title="Please be advised to only include numbers"
                                            placeholder="Contact Number" cssClass="form-control"/>
                            </div>
                            <div class="form-group">
                                <form:input path="password" type="password" required="true" minlength="6"
                                            placeholder="Password" id="pass1" cssClass="form-control"/>
                            </div>
                            <div class="form-group">
                                <input type="password" minlength="6" class="form-control" placeholder="Confirm Password" id="pass2" required="true">
                            </div>
<%--                            <button type="submit" class="btn btn-primary">Register</button>--%>
                            <input class="btn-primary" type="submit" value="Register" id="submit-btn">
                            <div class="Message">
                                <div>${success}${error}</div>
                            </div>
                        </form:form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    var password = document.getElementById("pass1")
        , confirm_password = document.getElementById("pass2");

    function validatePassword() {
        if (password.value != confirm_password.value) {
            confirm_password.setCustomValidity("Passwords Do Not Match");
        } else {
            confirm_password.setCustomValidity('');
        }
    }

    password.onchange = validatePassword;
    confirm_password.onkeyup = validatePassword;
</script>
<%--<div class="requestForm">--%>
<%--    <h3>Add User</h3>--%>
<%--    <form:form action="/RegisterUser" method="POST" modelAttribute="AddUser">--%>
<%--        <div class="formBox">--%>
<%--            <div class="inputBox w50">--%>
<%--                    &lt;%&ndash;                <form:input path="firstName" type = "text" required="true" maxlength="20"/>&ndash;%&gt;--%>
<%--                <span>First Name</span>--%>
<%--            </div>--%>
<%--            <div class="inputBox w50">--%>
<%--                <form:input path="lastName" type="text" required="true" maxlength="20"/>--%>
<%--                <span>Last Name</span>--%>
<%--            </div>--%>
<%--            <div class="inputBox w50">--%>
<%--                <form:input path="email" type="email" required="true" maxlength="50" pattern=".+@gmail.com"--%>
<%--                            title="The email should contain '@gmail.com' werbserver"/>--%>
<%--                <span>Email</span>--%>
<%--            </div>--%>
<%--            <div class="inputBox w50">--%>
<%--                <form:input path="contactNumber" type="text" required="true" minlength="10" maxlength="10"--%>
<%--                            pattern="[0-9]+" title="Please be advised to only include numbers"/>--%>
<%--                <span>Contact number</span>--%>
<%--            </div>--%>

<%--            <div class="inputBox w100">--%>
<%--                <input type="submit" value="Create">--%>
<%--            </div>--%>

<%--            <div class="Message">--%>
<%--                <div>${success}${error}</div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </form:form>--%>
<%--</div>--%>
</body>
</html>
