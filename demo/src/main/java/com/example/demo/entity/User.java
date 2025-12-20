package com.example.demo.entity;

<<<<<<< HEAD
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import lombok.*;
@Data
@AllArgsConstructor
@NoArgsConstructor
=======
import jakarta.persistence.*;
import jakarta.validation.constraints.*;

>>>>>>> d3ba0c9b68b2ce886fdb3ef088aa66111499f13a
@Entity
@Table(name = "User") // Matches your CREATE TABLE name
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "UserId")
    private Long userId;

    @Column(name = "userName", unique = true, length = 50)
    @NotEmpty(message = "Username is required")
    private String userName;

    @Column(length = 255)
    @NotEmpty(message = "Password is required")
    private String password;

    @Column(length = 100)
    @Email(message = "Please provide a valid email")
    private String email;

    @Enumerated(EnumType.STRING) // Saves 'ADMIN', 'CUSTOMER' etc. as strings in DB
    @Column(columnDefinition = "ENUM('ADMIN', 'LOAN_OFFICER', 'CUSTOMER')")
    private Role role;

    // Enum definition
    public enum Role {
        ADMIN, LOAN_OFFICER, CUSTOMER
    }

    // Default Constructor (Required by JPA)
    public User() {}

    // Getters and Setters
    public Long getUserId() {
        return userId;
    }
    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }
    public void setUserName(String userName) {
        this.userName = userName;
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

    public Role getRole() {
        return role;
    }
    public void setRole(Role role) {
        this.role = role;
    }
}