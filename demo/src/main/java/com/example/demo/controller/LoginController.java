package com.example.demo.controller;

import com.example.demo.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

@RestController
@RequestMapping("/test")
public class LoginController {
    @Autowired
    private LoginService loginService;

    @GetMapping("/home")
    public ModelAndView loginpageview() {
        return new ModelAndView("LoginPage");
    }


    @PostMapping("/login")
    public ModelAndView loginCheck(@RequestParam String userId, @RequestParam String pass) {

        boolean valid = loginService.authenticateUser(userId, pass);
        if (valid) {
            ModelAndView mv = new ModelAndView("success");
            mv.addObject("username", userId);
            return mv;
        } else {
            ModelAndView mv = new ModelAndView("failure");
            mv.addObject("message", "Invalid Credentials");
            return mv;
        }

    }
}