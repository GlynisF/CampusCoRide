package com.campuscoride.controller;

import com.campuscoride.util.PropertiesLoader;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.googleapis.maps.places.AutocompletePredictions;
import com.googleapis.maps.places.PlaceDetailsResults;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import javax.ws.rs.client.Client;
import javax.ws.rs.client.ClientBuilder;
import javax.ws.rs.client.WebTarget;
import javax.ws.rs.core.MediaType;
import java.util.Properties;
import java.util.UUID;

/**
 * The type Places autocomplete dao.
 */
public class PlacesAutocompleteDao implements PropertiesLoader {

    private final Logger logger = LogManager.getLogger(this.getClass());
    private final ObjectMapper mapper;
    private final Properties properties;

    /**
     * Instantiates a new Places autocomplete dao.
     */
    public PlacesAutocompleteDao() {
        this.properties = new Properties(loadProperties("/googleapi.properties"));
        mapper = new ObjectMapper();
        mapper.disable(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES);

    }

    /**
     * Google API AutocompletePredictions response.
     *
     * @param input the input
     * @return the autocomplete predictions
     */
    public AutocompletePredictions autocompleteResponse(String input) {
        AutocompletePredictions predictions = null;

        String sessionToken = UUID.randomUUID().toString();

        String encodedInput = input.replace(" ", "%20");

        Client client = ClientBuilder.newClient();
            WebTarget target =
                    client.target(properties.getProperty("base.url") + "autocomplete/json")
                            .queryParam("input", encodedInput)
                            .queryParam("types", properties.getProperty("autocomplete.types"))
                            .queryParam("key", properties.getProperty("api.key"))
                            .queryParam("sessionToken", sessionToken);
            String response = target.request(MediaType.APPLICATION_JSON).get(String.class);
        try {
            predictions = mapper.readValue(response, AutocompletePredictions.class);
            logger.info(predictions.toString());
            return predictions;
        } catch (JsonMappingException e) {
            logger.error(e.getMessage());
        } catch (JsonProcessingException e) {
            logger.error(e.getMessage());
            throw new RuntimeException(e);
        }
       return predictions;
    }

    /**
     * Google API Place Details response.
     *
     * @param placeId the place id
     * @return the place details results
     */
    public PlaceDetailsResults placeDetailsResponse(String placeId) {
        PlaceDetailsResults results = null;
        Client client = ClientBuilder.newClient();
        WebTarget target =
                client.target(properties.getProperty("base.url") + "details/json")
                        .queryParam("place_id", placeId)
                        .queryParam("fields", properties.getProperty("details.fields"))
                        .queryParam("key", properties.getProperty("api.key"));
        String response = target.request(MediaType.APPLICATION_JSON).get(String.class);
        try {
            results = mapper.readValue(response, PlaceDetailsResults.class);
            logger.info(results.toString());
            return results;
        } catch (JsonMappingException e) {
            logger.error(e.getMessage());
        } catch (JsonProcessingException e) {
            logger.error(e.getMessage());
            throw new RuntimeException(e);
        }
        return results;
    }

    static double haversine(double lat1, double lon1,
                            double lat2, double lon2)
    {
        double dLat = Math.toRadians(lat2 - lat1);
        double dLon = Math.toRadians(lon2 - lon1);

        lat1 = Math.toRadians(lat1);
        lat2 = Math.toRadians(lat2);

        double a = Math.pow(Math.sin(dLat / 2), 2) +
                Math.pow(Math.sin(dLon / 2), 2) *
                        Math.cos(lat1) *
                        Math.cos(lat2);
        double rad = 3959;
        double c = 2 * Math.asin(Math.sqrt(a));
        return rad * c;
    }



}
