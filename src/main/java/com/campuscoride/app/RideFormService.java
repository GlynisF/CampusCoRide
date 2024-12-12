package com.campuscoride.app;


import com.campuscoride.entity.RideForm;
import com.campuscoride.persistence.GenericDao;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import java.time.LocalDate;
import java.util.List;

/**
 * The type Ride form service.
 */
@Path("/rides")
@Consumes({MediaType.APPLICATION_JSON})
@Produces(MediaType.APPLICATION_JSON)
public class RideFormService {
    private final Logger logger = LogManager.getLogger(this.getClass());

    private ObjectMapper mapper;

    /**
     * Instantiates a new Ride form service.
     */
    public RideFormService() {
        mapper = new ObjectMapper();
        mapper.registerModule(new JavaTimeModule());
        mapper.disable(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES);
    }

    /**
     * Gets rides.
     *
     * @return the rides
     */
    @GET
    @Produces(MediaType.TEXT_PLAIN)
    @Path("/getAllRides")
    public List<RideForm> getRides() {
        GenericDao<RideForm> rideDao = new GenericDao<>(RideForm.class);
        List<RideForm> rides = rideDao.getAll();
        if(rides != null) {
            return rides;
        } else {
            return null;
        }
    }

    /**
     * Gets forms.
     *
     * @param requestType the request type
     * @return the forms
     */
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    @Path("/getByRequestType")
    public Response getForms(@QueryParam("type") String requestType) {
        GenericDao<RideForm> rideFormDao = new GenericDao<>(RideForm.class);
        try {
            if(requestType.equals("To Campus")) {
                List<RideForm> toCampusList = rideFormDao.findByPropertyEqual("requestType", "To Campus");
                String json = mapper.writeValueAsString(toCampusList);
                return Response.ok(200).entity(json).build();
            } else if(requestType.equals("From Campus")) {
                List<RideForm> list = rideFormDao.findByPropertyEqual("requestType", "From Campus");
                String json = mapper.writeValueAsString(list);
                return Response.ok(200).entity(json).build();
            }
        } catch (JsonProcessingException e) {
            throw new RuntimeException(e);
        }
        return Response.status(Response.Status.NOT_FOUND).build();
    }

    /**
     * Gets date.
     *
     * @param date the date
     * @return the date
     */
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    @Path("/searchByDate")
    public Response getDate(@QueryParam("date") String date) {
        GenericDao<RideForm> rideFormDao = new GenericDao<>(RideForm.class);
        LocalDate dateObj = LocalDate.parse(date);
        List<RideForm> rideForms = rideFormDao.findByPropertyEqual("date", dateObj);
        if(rideForms.size() > 0) {
            try {
                String json = mapper.writeValueAsString(rideForms);
                return Response.status(200).entity(json).build();
            } catch (IllegalArgumentException e) {
                throw new RuntimeException(e);
            } catch (JsonMappingException e) {
                throw new RuntimeException(e);
            } catch (JsonProcessingException e) {
                throw new RuntimeException(e);
            }
        } else {
            return null;
        }

    }

    @DELETE
    @Produces(MediaType.APPLICATION_JSON)
    @Path("/delete/{rideFormId}")
    public Response deleteRideForm(@PathParam("rideFormId") int rideFormId) {
        try {
            GenericDao<RideForm> rideFormDao = new GenericDao<>(RideForm.class);
            RideForm rideForm = rideFormDao.getById(rideFormId);
            rideFormDao.delete(rideForm);
            return Response.ok("Ride form was successfully removed.").build();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

    }
    }
