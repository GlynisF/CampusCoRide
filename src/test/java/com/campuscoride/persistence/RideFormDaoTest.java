package com.campuscoride.persistence;

import com.campuscoride.entity.RideForm;
import com.campuscoride.entity.Student;
import com.campuscoride.test.util.Database;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.List;

import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;
import static org.junit.jupiter.api.Assertions.assertNull;

class RideFormDaoTest {
    private final Logger logger = LogManager.getLogger(this.getClass());

    /**
     * The Student dao.
     */
    GenericDao<Student> studentDao;
    /**
     * The Ride form dao.
     */
    GenericDao<RideForm> rideFormDao;

    @BeforeEach
    void setUp() {
        studentDao = new GenericDao<>(Student.class);
        rideFormDao = new GenericDao<>(RideForm.class);
        Database db = Database.getInstance();
        db.runSQL("cleanDB.sql");
        logger.info(db.toString());
    }

    @Test
    void getAllRideFormsSuccess() {
        List<RideForm> rideForms = rideFormDao.getAll();
        logger.info(rideForms);
    }

    /**
     * Gets ride form by id success.
     */
    @Test
    void getRideFormByIdSuccess() {
        RideForm rideForm = rideFormDao.getById(5);
        assertNotNull(rideForm);
        assertTrue(rideForm.getStudent().getId() == 5);

    }

    /**
     * Insert ride form success.
     */
    @Test
    void insertRideFormSuccess() {
        Student student = studentDao.getById(4);

        RideForm rideForm = new RideForm("Rider", "To Campus", LocalDate.parse("2024-12-15"),
                LocalTime.parse("04:00:00"), "Pickup near the square downtown.", student);

        student.addRideForm(rideForm);
        studentDao.update(student);

        RideForm insertedForm = rideFormDao.insert(rideForm);
        assertNotNull(insertedForm);

        logger.info(insertedForm);

    }

    /**
     * Update ride form success.
     */
    @Test
    void updateRideFormSuccess() {
        RideForm rideFormToUpdate = rideFormDao.getById(7);
        rideFormToUpdate.setRequestType("Updated Request Type");

        rideFormDao.update(rideFormToUpdate);
        assertNotNull(rideFormToUpdate);

        RideForm updatedRideForm = rideFormDao.getById(7);
        assertTrue(updatedRideForm.getRequestType().equals("Updated Request Type"));
    }

    /**
     * Delete ride form success.
     */
    @Test
    void deleteRideFormSuccess() {
        RideForm rideFormToDelete = rideFormDao.getById(3);
        assertNotNull(rideFormToDelete);
        rideFormDao.delete(rideFormToDelete);
        RideForm deletedRideForm = rideFormDao.getById(3);
        assertNull(deletedRideForm);
    }

}