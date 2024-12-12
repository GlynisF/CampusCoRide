## Project Plan

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


## <center> Database Tasks </center>

***CampusCoRide (Database)***<br>

Student Table
: id (pk, auto incr.)
: first_name
: last_name
: student_id<br><br>

Request_Form Table
: id (pk, auto incr.)
: request_type
: destination_type
: date
: time
: notes
: student_id (fk, references id in student table)<br><br>

Location Table
: id (pk, auto incr.)
: location_name
: lat
: lng
: postal_code

### Entity Relationships

Student ➔ Request_Form: one to many<br>
Request_Form ➔ Student: many to one

Request_Form ➔ Location: one to one (location FK goes on RF table)<br>

*** 

