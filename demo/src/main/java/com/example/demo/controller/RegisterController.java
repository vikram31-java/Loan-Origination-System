package com.example.demo.controller;

import com.example.demo.entity.User;
import com.example.demo.service.RegisterService;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.HttpStatusCode;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.validation.BindingResult;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
@Validated
@RequestMapping("/api")
public class RegisterController {
    @Autowired
    RegisterService registerService;

    @GetMapping("/")
    public String index(HttpSession session) {
        return "index";

    }


    @GetMapping("/User_register_form")
    public ModelAndView showUserRegisterForm() {

        return new ModelAndView("RegistrationForm");
    }
    @GetMapping("/check-username")
    @ResponseBody
    public boolean checkUsername(@RequestParam String username) {
        // Returns true if taken, false if available
        return registerService.isUsernameTaken(username);
    }

    @PostMapping("/register_user")
    public ModelAndView registerUser(@Valid @ModelAttribute("user") User user,
                                     BindingResult result,
                                     RedirectAttributes redirectAttributes) {
        ModelAndView mav = new ModelAndView();

        // 1. Check for Validation Errors
        if (result.hasErrors()) {
            mav.setViewName("RegistrationForm");
            mav.addObject("serverError", "Invalid details. Please check requirements.");
            return mav;
        }

        // --- NEW: Check specifically for Username ---
        if (registerService.isUsernameTaken(user.getUserName())) {
            mav.setViewName("RegistrationForm");
            mav.addObject("serverError", "Username already taken! Please choose another.");
            return mav;
        }

        // 2. Check for "User Already Exists" (AND Logic)
        if (registerService.validateUserUniqueness(user.getUserName(), user.getEmail())) {
            // Prepare message for Login Page
            redirectAttributes.addFlashAttribute("errorMessage", "User already exists! Please Login.");
            // Redirect to loginPage.jsp mapping
            mav.setViewName("redirect:/api/home");
            return mav;
        }

        // 3. Try to save the user
        boolean isSaved = registerService.insertDB(user);

        if (isSaved) {
            // SUCCESS Scenario: Go to registersuccess.jsp
            mav.setViewName("RegisterSuccess");
            mav.addObject("name", user.getUserName());
        } else {
            // FAILURE Scenario: Go to registerfailure.jsp
            mav.setViewName("RegisterFailure");
        }

        return mav;
    }
}
