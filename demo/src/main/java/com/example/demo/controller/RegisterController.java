package com.example.demo.controller;

import com.example.demo.entity.User;
import com.example.demo.service.RegisterService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/api")
public class RegisterController {

    @Autowired
    private RegisterService registerService;

    /**
     * Renders the Registration Form.
     */
    @GetMapping("/User_register_form")
    public ModelAndView showUserRegisterForm() {
        ModelAndView mav = new ModelAndView("RegistrationForm");
        // Adding an empty user object for form binding
        mav.addObject("user", new User());
        return mav;
    }

    /**
     * AJAX endpoint for real-time username availability check.
     */
    @GetMapping("/check-username")
    @ResponseBody
    public boolean checkUsername(@RequestParam String username) {
        // Returns true if username is already in DB
        return registerService.isUsernameTaken(username);
    }

    /**
     * Handles the form submission.
     */
    @PostMapping("/register_user")
    public ModelAndView registerUser(@Valid @ModelAttribute("user") User user,
                                     BindingResult result,
                                     RedirectAttributes redirectAttributes) {
        ModelAndView mav = new ModelAndView();

        // 1. Check for Validation Errors (e.g., password too short)
        if (result.hasErrors()) {
            mav.setViewName("RegistrationForm");
            mav.addObject("serverError", "Please correct the errors in the form.");
            return mav;
        }

        // 2. Extra safety check for Username (in case AJAX was bypassed)
        if (registerService.isUsernameTaken(user.getUserName())) {
            mav.setViewName("RegistrationForm");
            mav.addObject("serverError", "Username is already taken.");
            return mav;
        }

        // 3. Check for "User Already Exists" (Email/Username combo)
        if (registerService.validateUserUniqueness(user.getUserName(), user.getEmail())) {
            redirectAttributes.addFlashAttribute("errorMessage", "An account with this email/username already exists.");
            mav.setViewName("redirect:/api/home");
            return mav;
        }

        // 4. Insert into Database
        try {
            boolean isSaved = registerService.insertDB(user);
            if (isSaved) {
                mav.setViewName("RegisterSuccess");
                mav.addObject("name", user.getUserName());
            } else {
                mav.setViewName("RegisterFailure");
            }
        } catch (Exception e) {
            mav.setViewName("RegisterFailure");
        }

        return mav;
    }
}