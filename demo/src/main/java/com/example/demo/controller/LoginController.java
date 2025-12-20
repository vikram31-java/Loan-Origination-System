package com.example.demo.controller;

import com.example.demo.entity.User;
import com.example.demo.service.LoginService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/api")
public class LoginController {
    @Autowired
    private LoginService loginService;

//    @GetMapping("/home")
//    public ModelAndView loginpageview() {
//        return new ModelAndView("LoginPage");
//    }
    @GetMapping("/home")
    public ModelAndView loginpageview() {
        ModelAndView mv = new ModelAndView("LoginPage");

        // THIS LINE IS THE FIX:
        // It tells the JSP: "Here is the 'user' object you are looking for."
        mv.addObject("user", new User());

        return mv;
    }


    @PostMapping("/login")
    public ModelAndView login(@Valid @ModelAttribute("user") User user,
                                   BindingResult result,
                                   HttpSession session) {
        ModelAndView mv = new ModelAndView();

        // 1. Validation Check
        if(result.hasErrors()){
            mv.setViewName("LoginPage");
            mv.addObject("message", "Invalid Details, Please check your input!");
            mv.setStatus(HttpStatus.BAD_REQUEST);
            return mv;
        }

        try {
            // 2. Call Service ONCE
            boolean isCorrect = loginService.authenticateUser(user);

            if(isCorrect){
                // 3. SAVE TO SESSION
                session.setAttribute("loggedInUser", user);

                // 4. Setup Success View
                mv.setViewName("LoginSuccess"); // Fixed spelling from "Sucess"
                mv.addObject("Name", user.getUserName());
                mv.addObject("Role", user.getRole());
                mv.setStatus(HttpStatus.OK);
            }
        } catch (RuntimeException e) {
            // 5. Handle Authentication Failure (e.g., Wrong Password/Role)
            mv.setViewName("LoginFailure");
            mv.addObject("message", e.getMessage());
            mv.setStatus(HttpStatus.UNAUTHORIZED);
        }

        return mv;
    }
    @GetMapping("/logout")
    public ModelAndView logout(HttpServletRequest request) {
        // 1. Invalidate the session to clear all user data
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }

        // 2. Redirect to a logout success page
        ModelAndView mv = new ModelAndView("Logout");
        mv.addObject("message", "You have been logged out successfully.");
        return mv;
    }
    @GetMapping("/profile")
    public ModelAndView getUserProfile(HttpSession session) {
        User user = (User) session.getAttribute("loggedInUser");

        if (user == null) {
            // If no one is logged in, send them back to login page
            return new ModelAndView("redirect:/api/home");
        }

        ModelAndView mv = new ModelAndView("UserProfile"); // Points to UserProfile.jsp
        mv.addObject("user", user);
        return mv;
    }

    }