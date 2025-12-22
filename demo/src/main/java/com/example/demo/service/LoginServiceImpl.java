package com.example.demo.service;

import com.example.demo.dao.LoginDao;
import com.example.demo.entity.User;
import com.example.demo.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class LoginServiceImpl implements LoginService {

    @Autowired
    LoginDao loginDao;

    @Override
    public User authenticateUser(User user) {
        // 1. Query the DB for the user with all three credentials
        Optional<User> foundUser = loginDao.findByUserNameAndPasswordAndRole(
                user.getUserName(),
                user.getPassword(),
                user.getRole()
        );

        // 2. If found, return the full object (which includes the email)
        if (foundUser.isPresent()) {
            return foundUser.get();
        } else {
            // 3. If not found, throw an error for the Controller to catch
            throw new RuntimeException("Authentication Failed: Invalid credentials.");
        }
    }

}
