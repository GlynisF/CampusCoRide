## Project Plan

<<<<<<< HEAD
1. *Git init*
-[ ] Create team repo (Github)<br><br>
2. *Maven init / config*
-[ ] Set up Maven project
-[ ] Update POM.xml with dependencies<br><br>
3. *Database init*
-[ ] Set up CCR database / visual representation
-[ ] Set up project with hibernate (production & test)
-[ ] Set up project with Database (production & test db + dump files)
-[ ] Set up SessionFactory class
-[ ] Set up PropertiesLoader<br><br>
4. *Java Bean, generic dao + Hibernate init / config*
-[ ] Create beans for entities
    -[ ] Student
    -[ ] RideForm
    -[ ] Location
-[ ] Annotate beans with Hibernate
-[ ] Map beans in Hibernate config file
-[ ] Set up GenericDao
-[ ] Create tests for beans<br><br>
7. *REST / Service init*
-[ ] Create REST entry point w/ application path "/services"
-[ ] Create RideFormService class
  - [ ] Create methods to get all ride forms, ride form by date & ride forms by request type (to campus or from capus)
- [ ] Create StudentService class
  - Create methods to get all students, student by first & last name, and student by id
- Place classes into app
- [ ] Test methods with SOAPUI
8. *AWS*
- [ ] Create environment & db for CCR
- [ ] Populate db with CCR data
- [ ] Ensure rest features work with environment
=======
 ### Git init
 
-[x] Create team repo (Github)

### Maven init / config

-[x] Set up Maven project

-[x] Update POM.xml with dependencies

### Database init

-[x] Set up CCR database / visual representation

-[x] Set up project with hibernate (production & test)

-[x] Set up project with Database (production & test db + dump files)

-[x] Set up SessionFactory class

-[x] Set up PropertiesLoader

### Java Bean, generic dao + Hibernate init / config

-[x] Create beans for entities

-[x] Student

-[x] RideForm

-[x] Location

-[x] Annotate beans with Hibernate

-[x] Map beans in Hibernate config file

-[x] Set up GenericDao

-[x] Create tests for beans

### Google API place autocomplete & place details search init ( VERISON 2**)

-[ ] Use Robopojo generator to create beans / map Google API response
    -[ ] AutocompleteDao
        -[ ] AutocompleteDao test
    -[ ] PlaceDetailsDao
        -[ ] PlaceDetailsDao test
-[ ] Create client resource for Google API
    -[ ] Create google.properties file for accessing API
    
### Search class init

-[ ] Create search/filter class to return results based off radius

### REST / Service init

-[ ] Create REST entry point w/ application path "/services"

-[ ] Place REST entry point into Application startup class

-[ ] Create methods for GET, POST, DELETE

-[ ] Test endpoints with CURL

### JSP + front end init
-[ ] Create JSP's and corresponding servlets

-[ ] Create necessary JS files / ajax calls

-[ ] Implement CSS / site theme

-[ ] Double check for consistency -- header, footer, nav, etc.

-[ ] Ensure all classes have Javadoc

-[ ] Deploy to AWS

-[ ] Create documentation for resources
>>>>>>> 05c2bf968256e2a963dc679b503f2093d5715440


## Database Tasks

CampusCoRide (Database)

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


### Entity Relationships

Student ➔ Request_Form: one to many<br>
Request_Form ➔ Student: many to one

Request_Form ➔ Location: one to one (location FK goes on RF table)<br>

*** 

<<<<<<< HEAD
=======
## Jsp Tasks

### User Sign Up Page (signup.jsp)

Registration page to use Campus Co-Ride's services

#### Registration Form
- FORM DETAILS
    - name = registrationForm
    - id = registrationForm
    - method = POST
    - enctype = application/x-www-form-urlencoded
    - action = "/addStudent" ➔ SignUp servlet
- FORM FIELDS
    - firstName = text, req.
    - lastName = text, req.
    - email = email, req.
    - student = id # number, req.
    - submit btn w an id = submitRegistration<br><br>

#### Sign Up Servlet
- SERVLET DETAILS
    - name = registrationServlet
    - urlPatterns = "/addStudent"
- doPost method
    - GET QUERY PARAMS / SET BEAN FIELDS
        - firstName, lastName, email, studentId
        - create new Student
            - insert student w/ GenericDao
            - set User obj. into req. session
        - request dispatcher ➔ forward response to "/homepage.jsp"


### Ride Request / Provider Form (ride-form.jsp)

Students can request or offer ride services by submitting a form. Requests can be made for a specific date/time or omitted.<br>
If omitted, students can leave a description of the type of arrangement they're seeking in the *'notes'* field.<br>
For safety purposes, students are encouraged to use nearby landmarks, street names, or zip codes for their location.

#### Ride Request Form

- FORM DETAILS
    - name = rideRequestForm
    - id = rideRequestForm
    - data-user-id = user_id from req. session
- FORM FIELDS
    - requestType = select, req
        - Options: Rider or Provider
    - destinationType = radio, req
        - Options: To Campus or From Campus
    - location = text *(should be \<ul\> element with each AutocompletePrediction appended as an \<li\> element )*
    - postal_code = number
    - lat = hidden (get from place details results)
    - lng = hidden (get from place details results)
    - date = date
    - time = time
    - notes = textarea
    - submit btn w an id = submitRequestForm<br><br>

### Ride Request Form JS (rideForm.js)
- event listener for location field to retrieve user input on 'keydown'.
    - input to be sent (via fetch) to REST endpoint to retrieve List<AutocompletePredictions
        - create a function that will append each item to the 'location' field \<ul\>
- event listener to retrieve 'place_id' when a user selects a place from the list of predictions
    - take place_id and make a fetch call to REST endpoint
    - fill in 'location', 'lat' & 'lng', and 'postal_code'
- use event listener to stop form propagation
- get form values by ID
    - send values to endpoint via POST fetch


>>>>>>> 05c2bf968256e2a963dc679b503f2093d5715440
