package com.example.demo.service;

import com.example.demo.dao.RegisterDAO;
import com.example.demo.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class RegisterServiceImpl implements RegisterService {

    @Autowired
    private RegisterDAO registerDAO;

    /**
     * Saves a single user. Returns true if successful, false otherwise.
     */
    @Override
    @Transactional
    public boolean insertDB(User user) {
        try {
            registerDAO.save(user);
            return true;
        } catch (Exception e) {
            // Log the error in a real application
            return false;
        }
    }

    /**
     * Batch insertion. Uses @Transactional to ensure "all or nothing" logic.
     */
    @Override
    @Transactional
    public boolean insertMultipleDB(List<User> users) {
        try {
            registerDAO.saveAll(users);
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    /**
     * Checks if a user with THIS specific username AND email already exists.
     */
    @Override
    public boolean validateUserUniqueness(String userName, String email) {
        return registerDAO.existsByUserNameAndEmail(userName, email);
    }

    /**
     * Direct save method (Standard implementation).
     */
    @Override
    @Transactional
    public void saveUser(User user) {
        registerDAO.save(user);
    }

    /**
     * Logic for real-time AJAX validation.
     */
    @Override
    public boolean isUsernameTaken(String userName) {
        return registerDAO.existsByUserName(userName);
    }
}