## Campus Co-Ride: Share the Road, Share the Journey

#### Enrique Ferreira • Molly McCarthy • Michael Meade • Glynis Fisher

Java Enterprise Team Project | Madison College • Fall Semester 2024

## Problem Statement

Transportation accessibility is a key factor in student success. For prospective and current students, reliable<br>
transportation can be a deciding factor in pursuing educational goals. The Campus Co-Ride API helps ensure lack of<br>
transportation is not a barrier to achieving these aspirations. Using this API, any university or technical school in<br>
Wisconsin can implement this service to connect students in their area. This service provides a way to store rider, driver,<br>
and location data in a single place.<br><br>

This service provides the following:

* Get all students in JSON.
* Get a student by first and last name.
* Update a student, given a student ID in JSON.
* Get a student given an ID in JSON.
* Post a new student in JSON.
* Get all ride forms in plain text and JSON.
* Get all ride forms by a given date.
* Get all ride forms by request type (To campus or From campus) in JSON.
* Delete a ride form given an ID with a JSON response.


## Resources

#### Location

| Property  | Description | Type/Format | 
| ---------------| ----------- | ----------- |   
| id| unique identifier| number|
| location_name| Location name, for example "UW-Madison" | string |
| lat| Latitude of user | number |
| lng| Longitude of user | number |

#### Student
| Property  | Description | Type/Format | 
| ---------------| ----------- | ----------- |   
| id| Unique identifier for the student| number|
| first_name| 	First name of the student | string |
| last_name| Last name of the student | string |
| email| Email address of the student| string |
| password| Password of the student's account | string |
| student_id| Unique identifier associated with the student | number |  


#### Ride Form
| Property  | Description | Type/Format | 
| ---------------| ----------- | ----------- |   
| id| unique identifier| number|
| role_type| 	Role of the person (e.g., "Rider" or "Driver") | string |
| request_type| Request type (e.g., "Rider" or "Driver") | string |
| date| Date of the ride request, formatted as a string (e.g., "YYYY-MM-DD")| string |
| time| Time of the ride request, formatted as a string (e.g., "HH:MM") | string |
| notes| Additional notes or information related to the ride | string |  
| student_id | ID of the student associated with the ride | number |
| location_id | ID of the location associated with the ride | number | 


## Team Rules

Check slack as frequently as you can

Try to help as much as you can

Positive attitude!

## Team Resume

#### Molly McCarthy

Molly is familiar with Javascript, JSON and deploying webservers. She helped setup the Github pages.

#### Glynis Fisher

Glynis is a full-stack developer capable of building fully functional web applications from backend to frontend.
Her skills span both server-side and client-side development, including creating servlets and business logic classes, 
managing data storage and retrieval through databases, and presenting data to users through web design. She helped with 
several aspects of the project-- creating the repo, beans, test-classes, and helped implement the REST porition of the project.

#### Michael Meade

#### Enrique Ferreira
