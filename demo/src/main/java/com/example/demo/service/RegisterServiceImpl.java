package com.example.demo.service;

import com.example.demo.dao.RegisterDAO;
import com.example.demo.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RegisterServiceImpl implements RegisterService{
    @Autowired
    RegisterDAO registerDAO;
    @Override
    public boolean insertDB(User user) {
        try {
            registerDAO.save(user);
            return true;
        } catch (Exception e) {
            return false;
        }
    }
    @Override
    public boolean insertMultipleDB(List<User> user){
        registerDAO.saveAll(user);
        return true;
    }
    @Override
    public boolean validateUserUniqueness(String userName, String email) {
        // Calls the specific AND method in DAO
        return registerDAO.existsByUserNameAndEmail(userName, email);
    }

    @Override
    public void saveUser(User user) {
        registerDAO.save(user);
    }
    @Override
    public boolean isUsernameTaken(String userName) {
        // Returns true if the username is already in the DB
        return registerDAO.existsByUserName(userName);
    }
}
