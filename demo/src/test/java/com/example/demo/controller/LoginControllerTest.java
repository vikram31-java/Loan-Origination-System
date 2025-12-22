package com.example.demo.controller;

import com.example.demo.entity.User;
import com.example.demo.service.LoginService;
import jakarta.servlet.http.HttpSession;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.springframework.validation.BindingResult;
import org.springframework.web.servlet.ModelAndView;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.*;

class LoginControllerTest {

    @Mock
    private LoginService loginService;

    @Mock
    private HttpSession session;

    @Mock
    private BindingResult bindingResult;

    @InjectMocks
    private LoginController loginController;

    private User mockUser;

    @BeforeEach
    void setUp() {
        // Initializes @Mock and @InjectMocks without needing Spring's library
        MockitoAnnotations.openMocks(this);

        mockUser = new User();
        mockUser.setUserName("JohnDoe");
        // Fixed: Assuming User.Role is an Enum. If it's a String, change to "ADMIN"
        // mockUser.setRole(User.Role.ADMIN);
    }

    @Test
    void testLoginPageView() {
        ModelAndView mv = loginController.loginpageview();
        assertEquals("LoginPage", mv.getViewName());
        assertNotNull(mv.getModel().get("user"));
    }

    @Test
    void testLoginSuccess() {
        // Arrange
        User inputUser = new User();
        when(bindingResult.hasErrors()).thenReturn(false);
        when(loginService.authenticateUser(any(User.class))).thenReturn(mockUser);

        // Act
        ModelAndView mv = loginController.login(inputUser, bindingResult, session);

        // Assert
        assertEquals("LoginSuccess", mv.getViewName());
        verify(session).setAttribute(eq("loggedInUser"), any(User.class));
    }

    @Test
    void testLoginValidationErrors() {
        // Arrange
        when(bindingResult.hasErrors()).thenReturn(true);

        // Act
        ModelAndView mv = loginController.login(new User(), bindingResult, session);

        // Assert
        assertEquals("LoginPage", mv.getViewName());
        assertEquals("Invalid Details, Please check your input!", mv.getModel().get("message"));
    }

    @Test
    void testDashboardRedirectWhenNoSession() {
        // Arrange
        when(session.getAttribute("loggedInUser")).thenReturn(null);

        // Act
        ModelAndView mv = loginController.showDashboard(session);

        // Assert
        assertEquals("redirect:/api/home", mv.getViewName());
    }

    @Test
    void testDashboardSuccess() {
        // Arrange
        when(session.getAttribute("loggedInUser")).thenReturn(mockUser);

        // Act
        ModelAndView mv = loginController.showDashboard(session);

        // Assert
        assertEquals("Dashboard", mv.getViewName());
        assertEquals(mockUser, mv.getModel().get("user"));
    }
}