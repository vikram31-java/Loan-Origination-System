package com.example.demo.service;

import com.example.demo.dao.LoginDao;
import com.example.demo.entity.User;
import com.example.demo.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class LoginServiceImpl implements LoginService{

@Autowired
LoginDao loginDao;
    @Override
    public boolean authenticateUser(User user) {
        // Corrected the method call syntax below
        Optional<User> foundUser = loginDao.findByUserNameAndPasswordAndRole(
                user.getUserName(),
                user.getPassword(),
                user.getRole()
        );

        if (foundUser.isPresent()) {
            System.out.println("Login Successful for: " + user.getUserName());
            return true;
        } else {
            System.out.println("Invalid credentials for: " + user.getPassword());
            throw new RuntimeException("Authentication Failed: User details not found in database.");
        }
    }
}
