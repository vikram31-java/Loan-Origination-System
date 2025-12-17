package com.example.demo.service;

import com.example.demo.entity.User;
import org.springframework.stereotype.Service;

@Service
public interface RegisterService {
    public boolean insertDB (User user);
    public User validateUser(int UserId,String UserName);
    public boolean validateUserExists(int userId,String UserName);
    public User getUser(int UserId, String UserName);

}
