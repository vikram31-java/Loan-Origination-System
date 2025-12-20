package com.example.demo.dao;

import com.example.demo.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;

import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface LoginDao extends JpaRepository<User, Long> {
    // This finds a user by both fields and returns an Optional to handle nulls safely
    Optional<User> findByUserNameAndPasswordAndRole(String userName, String password, User.Role role);
}
