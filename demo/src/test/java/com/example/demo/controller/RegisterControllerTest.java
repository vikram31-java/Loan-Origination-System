package com.example.demo.controller;

import com.example.demo.entity.User;
import com.example.demo.service.RegisterService;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.springframework.validation.BindingResult;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.*;

class RegisterControllerTest {

    @Mock
    private RegisterService registerService;

    @Mock
    private BindingResult bindingResult;

    @Mock
    private RedirectAttributes redirectAttributes;

    @InjectMocks
    private RegisterController registerController;

    private User testUser;

    @BeforeEach
    void setUp() {
        MockitoAnnotations.openMocks(this);

        testUser = new User();
        testUser.setUserName("NewUser");
        testUser.setEmail("new@example.com");
        testUser.setPassword("Pass123");
    }

    @Test
    void testShowUserRegisterForm() {
        ModelAndView mav = registerController.showUserRegisterForm();
        assertEquals("RegistrationForm", mav.getViewName());
    }

    @Test
    void testCheckUsername() {
        // Arrange
        when(registerService.isUsernameTaken("NewUser")).thenReturn(true);

        // Act
        boolean isTaken = registerController.checkUsername("NewUser");

        // Assert
        assertTrue(isTaken);
        verify(registerService).isUsernameTaken("NewUser");
    }

    @Test
    void testRegisterUser_ValidationErrors() {
        // Arrange
        when(bindingResult.hasErrors()).thenReturn(true);

        // Act
        ModelAndView mav = registerController.registerUser(testUser, bindingResult, redirectAttributes);

        // Assert
        assertEquals("RegistrationForm", mav.getViewName());
        assertEquals("Invalid details. Please check requirements.", mav.getModel().get("serverError"));
    }

    @Test
    void testRegisterUser_UsernameTaken() {
        // Arrange
        when(bindingResult.hasErrors()).thenReturn(false);
        when(registerService.isUsernameTaken("NewUser")).thenReturn(true);

        // Act
        ModelAndView mav = registerController.registerUser(testUser, bindingResult, redirectAttributes);

        // Assert
        assertEquals("RegistrationForm", mav.getViewName());
        assertEquals("Username already taken! Please choose another.", mav.getModel().get("serverError"));
    }

    @Test
    void testRegisterUser_AlreadyExists_RedirectsToLogin() {
        // Arrange
        when(bindingResult.hasErrors()).thenReturn(false);
        when(registerService.isUsernameTaken("NewUser")).thenReturn(false);
        // validateUserUniqueness returning true means user exists
        when(registerService.validateUserUniqueness("NewUser", "new@example.com")).thenReturn(true);

        // Act
        ModelAndView mav = registerController.registerUser(testUser, bindingResult, redirectAttributes);

        // Assert
        assertEquals("redirect:/api/home", mav.getViewName());
        verify(redirectAttributes).addFlashAttribute(eq("errorMessage"), anyString());
    }

    @Test
    void testRegisterUser_Success() {
        // Arrange
        when(bindingResult.hasErrors()).thenReturn(false);
        when(registerService.isUsernameTaken("NewUser")).thenReturn(false);
        when(registerService.validateUserUniqueness(anyString(), anyString())).thenReturn(false);
        when(registerService.insertDB(any(User.class))).thenReturn(true);

        // Act
        ModelAndView mav = registerController.registerUser(testUser, bindingResult, redirectAttributes);

        // Assert
        assertEquals("RegisterSuccess", mav.getViewName());
        assertEquals("NewUser", mav.getModel().get("name"));
    }

    @Test
    void testRegisterUser_Failure() {
        // Arrange
        when(bindingResult.hasErrors()).thenReturn(false);
        when(registerService.isUsernameTaken("NewUser")).thenReturn(false);
        when(registerService.validateUserUniqueness(anyString(), anyString())).thenReturn(false);
        when(registerService.insertDB(any(User.class))).thenReturn(false); // Database failure

        // Act
        ModelAndView mav = registerController.registerUser(testUser, bindingResult, redirectAttributes);

        // Assert
        assertEquals("RegisterFailure", mav.getViewName());
    }
}