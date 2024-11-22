<%--
  Created by IntelliJ IDEA.
  User: GCADAGFISHER
  Date: 11/18/2024
  Time: 3:11 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="includes/head.html"%>
    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/material-components-web/14.0.0/material-components-web.min.js"></script>
    <script src="https://cdn.datatables.net/2.1.8/js/dataTables.js"></script>
    <script src="https://cdn.datatables.net/2.1.8/js/dataTables.material.js"></script>
    <script src="javascript/search-rides.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/material-components-web/14.0.0/material-components-web.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/2.1.8/css/dataTables.material.css">
    <link rel="stylesheet" href="css/search-rides.css">
</head>
<body class="container">


<h1 class="row">Find a Co-Ride</h1>

<div class="row">
<table class="order-column hover" id="rideTable">
    <thead>
    <tr>
        <th>#</th>
        <th>Role</th>
        <th>Request Type</th>
        <th>Location</th>
        <th>Lat</th>
        <th>Lng</th>
        <th>Date</th>
        <th>Time</th>
        <th>Notes</th>

    </tr>
    <tbody></tbody>
    </thead>
</table>
</div>

</body>
</html>
