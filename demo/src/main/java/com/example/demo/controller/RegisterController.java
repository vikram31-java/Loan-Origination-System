package com.example.demo.controller;

import com.example.demo.entity.User;
import com.example.demo.service.RegisterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/api")
public class RegisterController {
@Autowired
    RegisterService registerService;
@GetMapping("/User_register_form")
    public ModelAndView showUserRegisterForm(){
    return new ModelAndView("RegistrationForm");
}
@PostMapping("/register_user")
    public ModelAndView doRegister(@RequestParam Long UserId, @RequestParam String UserName, @RequestParam String email, @RequestParam String password){
    if(UserName.isEmpty()||email.isEmpty()||password.isEmpty()){
        return new ModelAndView("RegisterFailure");
    }
    User u=new User(UserId,UserName,email,password);
    boolean b = registerService.insertDB(u);
    return b? new ModelAndView("RegisterSuccess"): new ModelAndView("RegisterFailure");
}
}
