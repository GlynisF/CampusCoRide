package com.campuscoride.entity;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonProperty;
import jakarta.persistence.*;
import org.hibernate.annotations.GenericGenerator;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Objects;

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

    public Location() {
    }

    public Location(String locationName, BigDecimal lat, BigDecimal lng) {
        this.locationName = locationName;
        this.lat = lat;
        this.lng = lng;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getLocationName() {
        return locationName;
    }

    public void setLocationName(String locationName) {
        this.locationName = locationName;
    }

    public BigDecimal getLat() {
        return lat;
    }

    public void setLat(BigDecimal lat) {
        this.lat = lat;
    }

    public BigDecimal getLng() {
        return lng;
    }

    public void setLng(BigDecimal lng) {
        this.lng = lng;
    }


    public RideForm getRideForm() {
        return rideForm;
    }

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
