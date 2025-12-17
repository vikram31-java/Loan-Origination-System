package com.example.demo.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Entity
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long userId;
    private String username;
    private String password;
    private String email;


    public enum role{
        ADMIN,
        LOAN_OFFICER,
        CUSTOMER
    }


//    CREATE TABLE User (
//            userId INT AUTO_INCREMENT PRIMARY KEY,
//            username VARCHAR(50) UNIQUE,
//    password VARCHAR(255),
//    email VARCHAR(100),
//    role ENUM('ADMIN','LOAN_OFFICER','CUSTOMER')



}
