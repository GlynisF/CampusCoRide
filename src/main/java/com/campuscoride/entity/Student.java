package com.campuscoride.entity;


import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.fasterxml.jackson.annotation.JsonProperty;
import jakarta.persistence.*;
import org.hibernate.annotations.GenericGenerator;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Objects;
import java.util.Set;

@Entity (name = "CampusCoRide")
@Table (name = "student")
public class Student implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO, generator = "native")
    @GenericGenerator(name = "native", strategy = "native")
    @JsonProperty("id")
    private int id;

    @Column (name = "first_name")
    private String firstName;

    @Column (name = "last_name")
    private String lastName;

    @Column (name = "student_id")
    private int studentId;

    @Column (name = "email")
    private String email;

    @Column (name = "password")
    private String password;

    @OneToMany(mappedBy = "student", cascade = CascadeType.ALL, orphanRemoval = true, fetch = FetchType.EAGER)
    @JsonManagedReference
    private Set<RideForm> rideForms = new HashSet<>();

    public Student() {}

    public Student(String firstName, String lastName, String email, String password, int studentId) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.studentId = studentId;
        this.password = password;
        this.email = email;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public int getStudentId() {
        return studentId;
    }

    public void setStudentId(int studentId) {
        this.studentId = studentId;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Set<RideForm> getRideForms() {
        return rideForms;
    }

    public void setRideForms(Set<RideForm> rideForms) {
        this.rideForms = rideForms;
    }

    /**
     * Add ride form.
     *
     * @param rideForm the ride form
     */
    public void addRideForm(RideForm rideForm) {
        this.rideForms.add(rideForm);
        rideForm.setStudent(this);
    }

    /**
     * Remove ride form.
     *
     * @param rideForm the ride form
     */
    public void removeRideForm(RideForm rideForm) {
        this.rideForms.remove(rideForm);
        rideForm.setStudent(null);
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Student student = (Student) o;
        return id == student.id && studentId == student.studentId && Objects.equals(firstName, student.firstName) && Objects.equals(lastName, student.lastName) && Objects.equals(email, student.email) && Objects.equals(password, student.password);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, firstName, lastName, studentId, email, password);
    }

    @Override
    public String toString() {
        return "Student{" +
                "id=" + id +
                ", firstName='" + firstName + '\'' +
                ", lastName='" + lastName + '\'' +
                ", studentId=" + studentId +
                ", email='" + email + '\'' +
                ", password='" + password + '\'' +
                '}';
    }
}
