package com.example.demo.service;

import com.example.demo.entity.User;
import org.springframework.stereotype.Service;

public interface LoginService {
    public boolean authenticateUser(User user);
}
