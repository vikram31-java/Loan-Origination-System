package com.example.demo.service;

import com.example.demo.entity.User;
import com.example.demo.dao.LoginDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LoginServiceImpl implements LoginService {
    @Autowired
    LoginDao restaurantDao;
    @Override
    public void CreateRestaurant(User restaurant) {

        restaurantDao.save(restaurant);
    }
//    public User fetchRestaurant(String mobileNumber){
//        return restaurantDao.getRestaurantbyMobileNumber(mobileNumber);
//    }

}
