package com.campuscoride.persistence;

import com.campuscoride.entity.RideForm;
import com.campuscoride.entity.Student;
import com.campuscoride.test.util.Database;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.time.LocalDate;
import java.util.List;
import java.util.Set;

import static org.junit.jupiter.api.Assertions.*;

/**
 * The type Student dao test.
 */
class StudentDaoTest {
    private final Logger logger = LogManager.getLogger(this.getClass());
    /**
     * The Student dao.
     */
    GenericDao<Student> studentDao;

    /**
     * Sets up.
     */
    @BeforeEach
    void setUp() {
        studentDao = new GenericDao<>(Student.class);
        Database db = Database.getInstance();
        db.runSQL("cleanDB.sql");
        logger.info(db);
    }

    /**
     * Gets all students.
     */
    @Test
    void getAllStudents() {
        List<Student> students = studentDao.getAll();
        logger.info(students);
    }

    /**
     * Gets student by id success.
     */
    @Test
    void getStudentByIdSuccess() {
        Student student = studentDao.getById(5);
        assertNotNull(student);
        assertTrue(student.getFirstName().equals("Heather"));
        logger.info(student);
    }

    /**
     * Insert student success.
     */
    @Test
    void insertStudentSuccess() {
        Student studentToInsert = new Student("Mary", "Mack", "mmack@school.edu", "newpassword", 2798784);
        Student insertedStudent = (Student) studentDao.insert(studentToInsert);
        assertNotNull(insertedStudent);

        int id = insertedStudent.getId();
        Student retrievedStudent = studentDao.getById(id);
        assertNotNull(retrievedStudent);

        assertTrue(retrievedStudent.getFirstName().equals("Mary"));
    }

    /**
     * Update student success.
     */
    @Test
    void updateStudentSuccess() {
        Student student = studentDao.getById(3);
        assertNotNull(student);
        assertTrue(student.getFirstName().equals("Sally"));
        student.setFirstName("Cathy");
        studentDao.update(student);
        Student retrievedStudent = studentDao.getById(3);
        assertTrue(retrievedStudent.getFirstName().equals("Cathy"));

    }

    /**
     * Delete student success.
     */
    @Test
    void deleteStudentSuccess() {
        Student student = studentDao.getById(4);
        assertNotNull(student);
        assertTrue(student.getFirstName().equals("Norm"));
        studentDao.delete(student);
        Student retrievedStudent = studentDao.getById(4);
        assertNull(retrievedStudent);
    }

    /**
     * Add ride form to student success.
     */
    @Test
    void addRideFormToStudentSuccess() {
        Student student = (Student) studentDao.getById(1);
        assertNotNull(student);
        assertTrue(student.getFirstName().equals("Jane"));

        RideForm rideForm = new RideForm("Rider", "From Campus", LocalDate.parse("2024-12-11"),
                null, "leaving campus once my class lets out at 4:15pm", student);

        student.addRideForm(rideForm);
        //rideForm.setStudent(student);
        studentDao.update(student);

        GenericDao<RideForm> rideFormDao = new GenericDao<>(RideForm.class);
      //  RideForm insertedRideForm = rideFormDao.insert(rideForm);
        Set<RideForm> rideForms = student.getRideForms();
        assertTrue(rideForms.contains(rideForm));

    }

    /**
     * Remove ride form from student success.
     */
    @Test
    void removeRideFormFromStudentSuccess() {
        Student student = studentDao.getById(2);
        assertNotNull(student);
        assertTrue(student.getFirstName().equals("John"));

        GenericDao<RideForm> rideFormDao = new GenericDao<>(RideForm.class);
        RideForm rideForm = rideFormDao.getById(2);
        assertNotNull(rideForm);

        student.removeRideForm(rideForm);
        studentDao.update(student);

        Set<RideForm> rideForms = student.getRideForms();
        assertNotNull(rideForms);

        assertTrue(!rideForms.contains(rideForm));


    }

}