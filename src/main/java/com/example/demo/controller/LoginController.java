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
            // Validate credentials against the database
            boolean isCorrect = loginService.authenticateUser(user);

            if (isCorrect) {
                // IMPORTANT: Fetch the full user entity from the DB to get the correct Role
                User dbUser = loginService.findByUserName(user.getUserName());

                // Store vital info in session for JSP access (${Name} and ${Role})
                session.setAttribute("loggedInUser", dbUser);
                session.setAttribute("Name", dbUser.getUserName());
                session.setAttribute("Role", dbUser.getRole().toString());

                // Redirect to the success bridge page
                mv.setViewName("LoginSuccess");
                mv.addObject("Name", dbUser.getUserName());
            } else {
                mv.setViewName("LoginFailure");
                mv.addObject("message", "Incorrect Username or Password.");
            }
        } catch (Exception e) {
            mv.setViewName("LoginFailure");
            mv.addObject("message", "An error occurred during authentication.");
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