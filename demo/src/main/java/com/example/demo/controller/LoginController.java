package com.example.demo.controller;

import com.example.demo.entity.User;
import com.example.demo.service.LoginService;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/api")
public class LoginController {

    @Autowired
    private LoginService loginService;

    /**
     * Renders the initial Login Page.
     */
    @GetMapping("/home")
    public ModelAndView loginpageview() {
        ModelAndView mv = new ModelAndView("LoginPage");
        mv.addObject("user", new User());
        return mv;
    }

    /**
     * Handles the authentication logic.
     */
    @PostMapping("/login")
    public ModelAndView login(@Valid @ModelAttribute("user") User user,
                              BindingResult result,
                              HttpSession session) {
        ModelAndView mv = new ModelAndView();

        if (result.hasErrors()) {
            mv.setViewName("LoginPage");
            mv.addObject("message", "Invalid Input Format!");
            return mv;
        }

        try {
            // 1. Fetch the user first
            User dbUser = loginService.findByUserName(user.getUserName());

            // 2. Check if user exists AND password/role matches
            if (dbUser != null && dbUser.getPassword().equals(user.getPassword())
                    && dbUser.getRole().equals(user.getRole())) {

                session.setAttribute("loggedInUser", dbUser);
                session.setAttribute("Name", dbUser.getUserName());
                session.setAttribute("Role", dbUser.getRole().toString());

                mv.setViewName("LoginSuccess");
            } else {
                mv.setViewName("LoginFailure");
                mv.addObject("message", "Incorrect credentials or role selection.");
            }
        } catch (Exception e) {
            mv.setViewName("LoginFailure");
        }

        return mv;
    }

    /**
     * Protected Dashboard route.
     */
    @GetMapping("/dashboard")
    public String dashboard(HttpSession session) {
        // Basic Security Check: If no session, go back to login
        if (session.getAttribute("Name") == null) {
            return "redirect:/api/home";
        }
        return "Dashboard"; // Matches Dashboard.jsp
    }

    /**
     * Profile route.
     */
    @GetMapping("/profile")
    public String profile(HttpSession session) {
        if (session.getAttribute("Name") == null) {
            return "redirect:/api/home";
        }
        return "UserProfile"; // Matches UserProfile.jsp
    }

    /**
     * Destroys session and shows Logout page.
     */
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "Logout"; // Matches Logout.jsp
    }
}