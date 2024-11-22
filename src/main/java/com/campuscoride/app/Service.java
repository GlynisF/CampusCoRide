package com.campuscoride.app;


import com.campuscoride.controller.PlacesAutocompleteDao;
import com.campuscoride.entity.Location;
import com.campuscoride.entity.RideForm;
import com.campuscoride.entity.Student;
import com.campuscoride.persistence.GenericDao;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;
import com.googleapis.maps.places.PredictionsItem;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import java.util.List;

@Path("/api")
public class Service {
    private final Logger logger = LogManager.getLogger(this.getClass());
    // TODO move mapper into app startup class, register JT mod & use same mapper throughout project
    private ObjectMapper mapper;

    public Service() {
        mapper = new ObjectMapper();
        mapper.registerModule(new JavaTimeModule());
        mapper.disable(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES);
    }

    @GET
    @Produces({MediaType.APPLICATION_JSON})
    @Path("/get")
    public Response getAll() {
        GenericDao<Student> studentDao = new GenericDao<>(Student.class);
        List<Student> students = studentDao.getAll();
        ObjectMapper mapper = new ObjectMapper();
        try {
            String json = mapper.writeValueAsString(students);
            return Response.ok(200).entity(json).build();
        } catch (JsonProcessingException e) {
            throw new RuntimeException(e);
        }
        //return ok().entity(students).build();
    }

    @GET
    @Produces(MediaType.APPLICATION_JSON)
    @Path("/forms")
    public Response getForms() {
        GenericDao<RideForm> rideFormDao = new GenericDao<>(RideForm.class);
        List<RideForm> rideForms = rideFormDao.getAll();
        try {
            String json = mapper.writeValueAsString(rideForms);
            logger.info(json);
            return Response.ok(200).entity(json).header("Cache-Control", "max-age=3600").build();
        } catch (JsonProcessingException e) {
            throw new RuntimeException(e);
        }

    }

    @GET
    @Produces({MediaType.APPLICATION_JSON, MediaType.TEXT_PLAIN})
    @Path("/autocomplete/{input}")
    public Response autocomplete(@PathParam("input") String input) throws JsonProcessingException, JsonMappingException {
        PlacesAutocompleteDao autocompleteDao = new PlacesAutocompleteDao();
        List<PredictionsItem> predictions = autocompleteDao.autocompleteResponse(input).getPredictions();
        ObjectMapper mapper = new ObjectMapper();
        List<PredictionsItem> predictionsItems = mapper.convertValue(predictions, List.class);
        return Response.ok(200).entity(predictionsItems).header("Cache-Control", "max-age=3600").build();
    }

    @GET
    @Produces(MediaType.APPLICATION_JSON)
    @Path("/details/{placeId}")
    public Response getDetails(@PathParam("placeId") String placeId) throws JsonProcessingException, JsonMappingException {
        PlacesAutocompleteDao autocompleteDao = new PlacesAutocompleteDao();
        Object results =  autocompleteDao.placeDetailsResponse(placeId).getResult();
        logger.info(results);
        ObjectMapper mapper = new ObjectMapper();
        String json = mapper.writeValueAsString(results);
        return Response.ok(200).entity(json).header("Cache-Control", "max-age=3600").build();
    }

    @POST
    @Produces(MediaType.APPLICATION_JSON)
    @Consumes(MediaType.APPLICATION_JSON)
    @Path("/submit-location")
    public Location submitLocation(String locationData) {
    logger.info(locationData);
        GenericDao<Location> locationDao = new GenericDao<>(Location.class);
        try {
            Location loc = mapper.readValue(locationData, Location.class);
            Location location = locationDao.insert(new Location(loc.getLocationName(), loc.getLat(), loc.getLng()));
            logger.info(location);
            return location;
        } catch (JsonProcessingException e) {
            throw new RuntimeException(e);
        }
    }

    @POST
    @Produces(MediaType.APPLICATION_JSON)
    @Consumes(MediaType.APPLICATION_JSON)
    @Path("/submit-requestForm/{locationId}")
    public RideForm submitRequestForm(String rideFormData, @PathParam("locationId") int id) {
        GenericDao<RideForm> rideFormDao = new GenericDao<>(RideForm.class);
        GenericDao<Student> studentDao = new GenericDao<>(Student.class);
        GenericDao<Location> locationDao = new GenericDao<>(Location.class);
        // TODO rework so studentId isn't hardcoded.
        Student student = studentDao.getById(4);
        Location location = locationDao.getById(id);
        try {
            RideForm form = mapper.readValue(rideFormData, RideForm.class);
            logger.info(form);
            RideForm rideForm = rideFormDao.insert(new RideForm(form.getRoleType(), form.getRequestType(),
                    form.getDate(), form.getTime(), form.getNotes(), student, location));
            logger.info(rideForm);
            return rideForm;
        } catch (JsonProcessingException e) {
            throw new RuntimeException(e);
        }
    }

}
