package com.campuscoride.entity;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fasterxml.jackson.datatype.jsr310.deser.LocalDateDeserializer;
import com.fasterxml.jackson.datatype.jsr310.ser.LocalDateSerializer;
import jakarta.persistence.*;
import org.hibernate.annotations.GenericGenerator;

import java.io.Serializable;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.Objects;

@Entity (name = "RideForm")
@Table (name = "ride_form")
public class RideForm implements Serializable {


    @Id
    @GeneratedValue(strategy = GenerationType.AUTO, generator = "native")
    @GenericGenerator(name = "native", strategy = "native")
    @JsonProperty("id")
    private int id;

    @JsonProperty("requestType")
    @Column(name = "request_type")
    private String requestType;

    @JsonProperty("roleType")
    @Column(name = "role_type")
    private String roleType;

    @JsonProperty("date")
    @JsonFormat(pattern = "MM-dd-yyyy")
    @JsonDeserialize(using = LocalDateDeserializer.class)
    @JsonSerialize(using = LocalDateSerializer.class)
    @Temporal(TemporalType.DATE)
    private LocalDate date;

    @JsonProperty("notes")
    @Column (name = "notes")
    private String notes;

    @JsonProperty("time")
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "HH:mm a")
    @Column (name = "time")
    private LocalTime time;

    @ManyToOne
    @JoinColumn(name = "student_id",
            foreignKey = @ForeignKey(name = "ride_form_student_id_fk")
    )
    @JsonBackReference
    private Student student;

    @OneToOne(fetch = FetchType.EAGER, cascade = CascadeType.MERGE)
    @JoinColumn(name = "location_id", referencedColumnName = "id")
    @JsonManagedReference
    private Location location;

    public RideForm() {
    }

    public RideForm(String requestType, String roleType, LocalDate date, LocalTime time, String notes, Student student) {
        this.requestType = requestType;
        this.roleType = roleType;
        this.date = date;
        this.notes = notes;
        this.time = time;
        this.student = student;
    }

    public RideForm(String roleType, String requestType, LocalDate date, LocalTime time, String notes, Student student, Location location) {
        this.requestType = requestType;
        this.roleType = roleType;
        this.date = date;
        this.time = time;
        this.notes = notes;
        this.student = student;
        this.location = location;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getRequestType() {
        return requestType;
    }

    public void setRequestType(String requestType) {
        this.requestType = requestType;
    }

    public String getRoleType() {
        return roleType;
    }

    public void setRoleType(String roleType) {
        this.roleType = roleType;
    }

    public LocalDate getDate() {
        return date;
    }

    public void setDate(LocalDate date) {
        this.date = date;
    }

    public String getNotes() {
        return notes;
    }

    public void setNotes(String notes) {
        this.notes = notes;
    }

    public LocalTime getTime() {
        return time;
    }

    public void setTime(LocalTime time) {
        this.time = time;
    }

    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }

    public Location getLocation() {
        return location;
    }

    public void setLocation(Location location) {
        this.location = location;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        RideForm rideForm = (RideForm) o;
        return id == rideForm.id && Objects.equals(requestType, rideForm.requestType) && Objects.equals(roleType, rideForm.roleType) && Objects.equals(date, rideForm.date) && Objects.equals(notes, rideForm.notes) && Objects.equals(time, rideForm.time);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, requestType, roleType, date, notes, time);
    }

    @Override
    public String toString() {
        return "RideForm{" +
                "id=" + id +
                ", requestType='" + requestType + '\'' +
                ", roleType='" + roleType + '\'' +
                ", date=" + date +
                ", notes='" + notes + '\'' +
                ", time=" + time +
                '}';
    }
}
