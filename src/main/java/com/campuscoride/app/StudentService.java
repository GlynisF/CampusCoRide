package com.campuscoride.app;

import com.campuscoride.entity.Student;
import com.campuscoride.persistence.GenericDao;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * The type Student service.
 */
@Path("/students")
public class StudentService {
    private final Logger logger = LogManager.getLogger(this.getClass());
    private ObjectMapper mapper;

    /**
     * Instantiates a new Student service.
     */
    public StudentService() {
        mapper = new ObjectMapper();
        mapper.registerModule(new JavaTimeModule());
        mapper.disable(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES);
    }

    /**
     * Gets all students.
     *
     * @return the all students
     */
    @GET
    @Produces({MediaType.APPLICATION_JSON})
    public Response getAllStudents() {
        GenericDao<Student> studentDao = new GenericDao<>(Student.class);
        List<Student> students = studentDao.getAll();
        ObjectMapper mapper = new ObjectMapper();
        try {
            String json = mapper.writeValueAsString(students);
            return Response.ok(200).entity(json).build();
        } catch (JsonProcessingException e) {
            throw new RuntimeException(e);
        }
    }

    @POST
    @Produces(MediaType.APPLICATION_JSON)
    public Response addStudent(Student student) {
        GenericDao<Student> studentDao = new GenericDao<>(Student.class);
        if (student != null) {
            try {
                Student newStudent = studentDao.insert(student);
                String json = mapper.writeValueAsString(newStudent);
                return Response.ok(200).entity(json).build();
            } catch (JsonProcessingException e) {
                throw new RuntimeException(e);
            }
        } else {
            return Response.status(Response.Status.BAD_REQUEST).build();
        }
    }

    /**
     * Gets student by id.
     *
     * @param id the id
     * @return the student by id
     * @throws JsonProcessingException the json processing exception
     */
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    @Path("/id={id}")
    public Response getStudentById(@PathParam("id") int id) throws JsonProcessingException {
        GenericDao<Student> dao = new GenericDao<>(Student.class);
        Student student = dao.getById(id);
        if (student != null) {
            String json = mapper.writeValueAsString(student);
            return Response.ok(json).build();
        } else {
            return Response.status(Response.Status.NOT_FOUND).build();
        }
    }

    /**
     * Find student response.
     *
     * @param firstName the first name
     * @param lastName  the last name
     * @return the response
     */
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    @Path("/name")
    public Response findStudent(@QueryParam("firstName") String firstName, @QueryParam("lastName") String lastName) {
        GenericDao<Student> studentDao = new GenericDao<>(Student.class);
        Map<String, Object> map = new HashMap<>();
        map.put("firstName", firstName);
        map.put("lastName", lastName);
        List<Student> students = studentDao.findByPropertyMapEqual(map);

        try {
            if (!students.isEmpty()) {
                String json = mapper.writeValueAsString(students);
                return Response.ok(200).entity(json).build();
            } else {
                return Response.status(Response.Status.NOT_FOUND)
                        .entity("No students found for the provided criteria.")
                        .build();
            }
        } catch (Exception e) {
            logger.error("No students found with the provided criteria.", e.getMessage());
            return Response.status(Response.Status.INTERNAL_SERVER_ERROR)
                    .entity("An error occurred while processing the request.")
                    .build();
        }
    }

    @PUT
    @Produces(MediaType.APPLICATION_JSON)
    @Path("/update")
    public Response updateStudent(@QueryParam("id") int id, Student student) throws JsonProcessingException {
        GenericDao<Student> studentDao = new GenericDao<>(Student.class);
        Student studentById = studentDao.getById(id);
        if (studentById != null) {
            try {
                studentById.setFirstName(student.getFirstName());
                studentById.setLastName(student.getLastName());
                studentById.setEmail(student.getEmail());
                studentById.setStudentId(student.getStudentId());
                studentById.setPassword(student.getPassword());
                studentDao.update(studentById);
                String json = mapper.writeValueAsString(studentById);
                return Response.ok(200).entity(json).build();
            } catch (Exception e) {
                logger.error("An error occurred while processing the request.", e);
            }
        } else {
            return Response.status(Response.Status.NOT_FOUND).build();
        }
        return Response.status(Response.Status.NOT_MODIFIED).build();
    }
}
