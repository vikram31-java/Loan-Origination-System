package com.example.demo.service;

import com.example.demo.entity.User;

public interface LoginService {
    // Basic credential check
    boolean authenticateUser(User user);

    // Fetch full data for session management
    User findByUserName(String userName);
}