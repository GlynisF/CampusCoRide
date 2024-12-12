<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Campus Co-Ride Homepage</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body class="container-fluid">
<h1 class="mt-3">Campus Co-Ride</h1>
<p>Transportation accessibility is a key factor in student success. For prospective and current students, reliable<br>
    transportation can be a deciding factor in pursuing educational goals. The Campus Co-Ride API helps ensure lack of<br>
    transportation is not a barrier to achieving these aspirations. Using this API, any university or technical school in<br>
    Wisconsin can implement this service to connect students in their area. This service provides a way to store rider, driver,<br>
    and location data in a single place.</p><br>

<h3>This service provides the following:</h3>
<span><em>*All responses are returned in JSON*</em></span><br>
<span class="mb-2"><strong>Base URL:</strong> <em>'http://localhost:8080/CampusCoRide_war/services or 'http://ccrwi.us-east-2.ealsticbeanstalk.com/services</em></span><br>
<span><strong>Student endpoint:</strong> <em>'/students'</em></span><br>
<span><strong>Ride Form endpoint:</strong> <em>'/rides'</em></span><br><br>
<div class="list-group w-50">
    <div class="list-group-item">
        <h5 class="mb-3">1. Get all students</h5>
        <p class="mb-3">Takes no parameters</p>
    </div>
    <div class="list-group-item">
        <h5 class="mb-3">2. Get a student by first and last name</h5>
        <p class="mb-3">Path: <em>'/name'</em></p>
        <p class="mb-3">Query Parameters: <em>firstName, lastName</em></p>
    </div>
    <div class="list-group-item">
        <h5 class="mb-3">3. Update a student given a student ID</h5>
        <p class="mb-3">Path: <em>'/update'</em></p>
        <p class="mb-3">Query Parameter: <em>id</em></p>
    </div>
    <div class="list-group-item">
        <h5 class="mb-3">4. Get a student given an ID</h5>
        <p class="mb-3">Path: <em>'/id={id}'</em></p>
        <p class="mb-3">Path Parameter: <em>id</em></p>
    </div>
    <div class="list-group-item">
        <h5 class="mb-3">5. Post a new student</h5>
        <p class="mb-3">Takes no parameters</p>
    </div>
</div>
    <div class="list-group w-50">
    <div class="list-group-item">
        <h5 class="mb-3">6. Get all ride forms</h5>
        <p class="mb-3">Takes no parameters</p>
    </div>
    <div class="list-group-item">
        <h5 class="mb-3">7. Get all ride forms by a given date</h5>
        <p class="mb-3">Query Parameter: <em>date (YYYY-mm-dd)</em></p>
    </div>
    <div class="list-group-item">
        <h5 class="mb-3">8. Get all ride forms</h5>
        <p class="mb-3">Query Parameter: <em>type (to campus or from campus)</em></p>
    </div>
    <div class="list-group-item">
        <h5 class="mb-3">9. Delete a ride form given an ID</h5>
        <p class="mb-3">Path: <em>'/delete/{rideFormId}'</em></p>
        <p class="mb-3">Query Parameter: <em>rideFormId</em></p>
    </div>
</div>







<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous">
</script>
</body>
</html>
