<%--
  Created by IntelliJ IDEA.
  User: GCADAGFISHER
  Date: 11/16/2024
  Time: 10:19 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="en">
<head>
    <title>Request A Ride</title>
<%@include file="includes/head.html"%>
<script src="javascript/ride-form.js"></script>
</head>
<body class="container">
<h1 class="row">Welcome to Campus Co-Ride</h1>

<div class="row">
    <form id="requestForm">
            <div class="form-check">
                <input class="form-check-input" type="radio" name="roleType" id="Rider" value="Rider">
                <label class="form-check-label" for="Rider">
                    Rider
                </label>
            </div>
            <div class="form-check">
                <input class="form-check-input" type="radio" name="roleType" id="Driver" value="Driver">
                <label class="form-check-label" for="Driver">
                    Driver
                </label>
            </div>
        <label for="requestType">Destination Direction</label>
        <select class="form-select" name="requestType" id="requestType">
            <option selected>Select</option>
            <option value="To Campus">To Campus</option>
            <option value="From Campus">From Campus</option>
        </select>
        <div class="mb-3 w-50">
            <label for="date" class="form-label">Date</label>
            <input type="date" class="form-control" id="date"  name="date">
        </div>
        <div class="mb-3 w-50">
            <label for="time" class="form-label">Time</label>
            <input type="time" class="form-control" id="time" name="time">
        </div>
        <div class="mb-3 w-50">
            <label for="locationName" class="form-label">Location</label>
            <input type="text" class="form-control" id="locationName" name="locationName">
            <div id="autocompleteResults"></div>
        </div>
        <div class="mb-3" hidden>
            <label for="lat" class="form-label">Lat</label>
            <input type="number" step=".000001" class="form-control" id="lat" name="lat">
        </div>

        <div class="mb-3" hidden>
            <label for="lng" class="form-label">Lng</label>
            <input type="number" step=".000001" class="form-control" id="lng" name="lng">
        </div>

        <div class="mb-3 w-50">
            <label for="notes" class="form-label">Notes</label>
            <textarea class="form-control" id="notes" rows="5" placeholder="Additional request information"></textarea>
        </div>
        <button type="submit" id="submitRequest" class="btn btn-primary">Submit</button>
    </form>
</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</body>
</html>
