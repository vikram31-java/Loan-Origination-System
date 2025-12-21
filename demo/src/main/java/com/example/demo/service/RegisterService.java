package com.example.demo.service;

import com.example.demo.entity.User;
import java.util.List;

public interface RegisterService {
    boolean insertDB(User user);
    boolean insertMultipleDB(List<User> user);
    boolean validateUserUniqueness(String userName, String email);
    boolean isUsernameTaken(String userName);

    // Ensure this line exists!
    void saveUser(User user);
}