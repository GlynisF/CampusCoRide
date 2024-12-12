package com.campuscoride.entity;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonProperty;
import jakarta.persistence.*;
import org.hibernate.annotations.GenericGenerator;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Objects;

/**
 * The type Location.
 */
@Entity (name = "Location")
@Table (name = "location")
public class Location implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO, generator = "native")
    @GenericGenerator(name = "native", strategy = "native")
    @JsonProperty("id")
    private Integer id;

    @JsonProperty ("locationName")
    @Column (name = "location_name")
    private String locationName;

    @JsonProperty("lat")
    @Column (name = "lat")
    private BigDecimal lat;

    @JsonProperty("lng")
    @Column (name = "lng")
    private BigDecimal lng;

    @OneToOne(fetch = FetchType.LAZY, mappedBy = "location")
    @JsonBackReference
    private RideForm rideForm;

    /**
     * Instantiates a new Location.
     */
    public Location() {
    }

    /**
     * Instantiates a new Location.
     *
     * @param locationName the location name
     * @param lat          the lat
     * @param lng          the lng
     */
    public Location(String locationName, BigDecimal lat, BigDecimal lng) {
        this.locationName = locationName;
        this.lat = lat;
        this.lng = lng;
    }

    /**
     * Gets id.
     *
     * @return the id
     */
    public Integer getId() {
        return id;
    }

    /**
     * Sets id.
     *
     * @param id the id
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * Gets location name.
     *
     * @return the location name
     */
    public String getLocationName() {
        return locationName;
    }

    /**
     * Sets location name.
     *
     * @param locationName the location name
     */
    public void setLocationName(String locationName) {
        this.locationName = locationName;
    }

    /**
     * Gets lat.
     *
     * @return the lat
     */
    public BigDecimal getLat() {
        return lat;
    }

    /**
     * Sets lat.
     *
     * @param lat the lat
     */
    public void setLat(BigDecimal lat) {
        this.lat = lat;
    }

    /**
     * Gets lng.
     *
     * @return the lng
     */
    public BigDecimal getLng() {
        return lng;
    }

    /**
     * Sets lng.
     *
     * @param lng the lng
     */
    public void setLng(BigDecimal lng) {
        this.lng = lng;
    }


    /**
     * Gets ride form.
     *
     * @return the ride form
     */
    public RideForm getRideForm() {
        return rideForm;
    }

    /**
     * Sets ride form.
     *
     * @param rideForm the ride form
     */
    public void setRideForm(RideForm rideForm) {
        this.rideForm = rideForm;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Location location = (Location) o;
        return Objects.equals(id, location.id) && Objects.equals(locationName, location.locationName) && Objects.equals(lat, location.lat) && Objects.equals(lng, location.lng) && Objects.equals(rideForm, location.rideForm);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, locationName, lat, lng, rideForm);
    }

    @Override
    public String toString() {
        return "Location{" +
                "id=" + id +
                ", locationName='" + locationName + '\'' +
                ", lat=" + lat +
                ", lng=" + lng +
                '}';
    }
}
