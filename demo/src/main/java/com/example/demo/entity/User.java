package com.example.demo.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import lombok.*;
@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
public class User {
    @Id
    private Long UserId;
    private String UserName;
    private String email;
    private String password;


//    public enum role{
//        ADMIN,
//        LOAN_OFFICER,
//        CUSTOMER
//    }


//    CREATE TABLE User (
//            userId INT AUTO_INCREMENT PRIMARY KEY,
//            username VARCHAR(50) UNIQUE,
//    password VARCHAR(255),
//    email VARCHAR(100),
//    role ENUM('ADMIN','LOAN_OFFICER','CUSTOMER')



}
