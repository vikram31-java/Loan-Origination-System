package com.example.demo.service;

import com.example.demo.dao.LoginDao;
import com.example.demo.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.Optional;

@Service
public class LoginServiceImpl implements LoginService {

    @Autowired
    private LoginDao loginDao;

    /**
     * Authenticates the user based on Username, Password, and Role.
     */
    @Override
    public boolean authenticateUser(User user) {
        // Query the database for a matching record
        Optional<User> foundUser = loginDao.findByUserNameAndPasswordAndRole(
                user.getUserName(),
                user.getPassword(),
                user.getRole()
        );

        if (foundUser.isPresent()) {
            System.out.println("Login Successful for: " + user.getUserName());
            return true;
        } else {
            System.out.println("Login Failed: Invalid credentials for: " + user.getUserName());
            // We throw an exception that the Controller's catch block will handle
            throw new RuntimeException("Authentication Failed: Invalid Username, Password, or Role.");
        }
    }

    /**
     * Fetches the full user details to populate the session.
     * This is used by the Controller after a successful authenticateUser call.
     */
    @Override
    public User findByUserName(String userName) {
        // Assuming your LoginDao has this method to retrieve the user entity
        return loginDao.findByUserName(userName);
    }
}