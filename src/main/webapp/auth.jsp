<%--
  Created by IntelliJ IDEA.
  User: GCADAGFISHER
  Date: 11/16/2024
  Time: 10:19 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<%@include file="includes/head.html"%>
<body class="container">
    <h1 class="row">Welcome to Campus Co-Ride</h1>

    <div class="row">
        <form action="signup" method="post">
            <div class="mb-3 w-50">
                <label for="firstName" class="form-label">First Name</label>
                <input type="text" class="form-control" name="firstName" id="firstName" placeholder="Enter first name">
            </div>
            <div class="mb-3 w-50">
                <label for="lastName" class="form-label">Last Name</label>
                <input type="text" class="form-control" name="lastName" id="lastName" placeholder="Enter last name">
            </div>
            <div class="mb-3 w-25">
                <label for="studentId" class="form-label">Student ID</label>
                <input type="text" class="form-control" name="studentId" id="studentId">
            </div>
            <div class="mb-3 w-50">
                <label for="email" class="form-label">Email</label>
                <input type="email" class="form-control" id="email"  name="email" placeholder="Enter your school email">
            </div>
            <div class="mb-3 w-50">
                <label for="password" class="form-label">Password</label>
                <input type="password" class="form-control" id="password" name="password" placeholder="Enter password">
            </div>
            <button type="submit" id="signUp" class="btn btn-primary">Submit</button>
        </form>
    </div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</body>
</html>
