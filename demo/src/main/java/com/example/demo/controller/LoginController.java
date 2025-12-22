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
            // 1. authenticatedUser is the FULL object from the DB (with email!)
            User authenticatedUser = loginService.authenticateUser(user);

            if (authenticatedUser != null) {
                // 2. Save the DB-fetched object to the session
                session.setAttribute("loggedInUser", authenticatedUser);

                // 3. Setup Success View using the DB object
                mv.setViewName("LoginSuccess");
                mv.addObject("Name", authenticatedUser.getUserName());
                mv.addObject("Role", authenticatedUser.getRole());
                mv.setStatus(HttpStatus.OK);
            }
        } catch (RuntimeException e) {
            // 4. Handle Authentication Failure
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
    @GetMapping("/dashboard")
    public ModelAndView showDashboard(HttpSession session) {
        User user = (User) session.getAttribute("loggedInUser");

        if (user == null) {
            return new ModelAndView("redirect:/api/home");
        }

        ModelAndView mv = new ModelAndView("Dashboard"); // Points to Dashboard.jsp
        mv.addObject("user", user); // Pass the full object
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
        mv.addObject("loggedInUser", user);
        return mv;
    }



}
