package com.example.demo.service;

import com.example.demo.dao.RegisterDAO;
import com.example.demo.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RegisterServiceImpl implements RegisterService{
    @Autowired
    RegisterDAO registerDAO;
    @Override
    public boolean insertDB (User user){
        registerDAO.save(user);
        return true;
    }

    @Override
    public User validateUser(int UserId, String UserName) {
        return registerDAO.findByUserIdAndUserName(UserId,UserName);
    }

    @Override
    public boolean validateUserExists(int UserId, String UserName) {
        return registerDAO.existsByUserIdAndUserName(UserId,UserName);
    }

    @Override
    public User getUser(int UserId, String UserName) {
        return registerDAO.findByUserIdAndUserName(UserId,UserName);
    }


}
