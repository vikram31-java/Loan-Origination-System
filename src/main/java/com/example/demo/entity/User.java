package com.example.demo.entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.*;

@Entity
@Table(name = "user") // MySQL tables are often lowercase by default
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "userid")
    private Long userId;

    @Column(name = "username", unique = true, length = 50)
    @NotEmpty(message = "Username is required")
    private String userName;

    @Column(name = "password", length = 255)
    @NotEmpty(message = "Password is required")
    private String password;

    @Column(name = "email", length = 100)
    @Email(message = "Please provide a valid email")
    private String email;

    @Enumerated(EnumType.STRING)
    @Column(name = "role", columnDefinition = "ENUM('ADMIN', 'LOAN_OFFICER', 'CUSTOMER')")
    private Role role;

    public enum Role {
        ADMIN, LOAN_OFFICER, CUSTOMER
    }

    public User() {}

    // Getters and Setters (Keep these as you have them)
    public Long getUserId() { return userId; }
    public void setUserId(Long userId) { this.userId = userId; }
    public String getUserName() { return userName; }
    public void setUserName(String userName) { this.userName = userName; }
    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }
    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }
    public Role getRole() { return role; }
    public void setRole(Role role) { this.role = role; }
}