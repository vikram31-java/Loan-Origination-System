package com.example.demo.service;

import com.example.demo.entity.User;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface RegisterService {
    public boolean insertDB (User user);
    public boolean insertMultipleDB(List<User> user);
    boolean validateUserUniqueness(String userName, String email);
    void saveUser(User user);
    boolean isUsernameTaken(String userName);
}
