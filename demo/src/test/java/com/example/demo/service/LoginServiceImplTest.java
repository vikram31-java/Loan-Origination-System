package com.example.demo.service;

import com.example.demo.dao.LoginDao;
import com.example.demo.entity.User;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

import java.util.Optional;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.*;

class LoginServiceImplTest {

    @Mock
    private LoginDao loginDao;

    @InjectMocks
    private LoginServiceImpl loginService;

    private User inputUser;
    private User dbUser;

    @BeforeEach
    void setUp() {
        // Initializes the mocks manually to avoid the "package not found" Spring errors
        MockitoAnnotations.openMocks(this);

        // This represents the data coming from the Login Form
        inputUser = new User();
        inputUser.setUserName("john_doe");
        inputUser.setPassword("secure123");
        inputUser.setRole(User.Role.ADMIN);

        // This represents the full data stored in the Database
        dbUser = new User();
        dbUser.setUserName("john_doe");
        dbUser.setPassword("secure123");
        dbUser.setRole(User.Role.ADMIN);
        dbUser.setEmail("john@example.com"); // Database record has the email
    }

    @Test
    void testAuthenticateUser_Success() {
        // Arrange: When the DAO is called with form data, return the DB record
        when(loginDao.findByUserNameAndPasswordAndRole(
                inputUser.getUserName(),
                inputUser.getPassword(),
                inputUser.getRole()))
                .thenReturn(Optional.of(dbUser));

        // Act
        User result = loginService.authenticateUser(inputUser);

        // Assert
        assertNotNull(result);
        assertEquals("john@example.com", result.getEmail()); // Verify we got the full object back
        verify(loginDao, times(1)).findByUserNameAndPasswordAndRole(anyString(), anyString(), any());
    }

    @Test
    void testAuthenticateUser_Failure_ThrowsException() {
        // Arrange: Simulate the database not finding a match
        when(loginDao.findByUserNameAndPasswordAndRole(anyString(), anyString(), any()))
                .thenReturn(Optional.empty());

        // Act & Assert: Verify that the RuntimeException is thrown with your specific message
        RuntimeException exception = assertThrows(RuntimeException.class, () -> {
            loginService.authenticateUser(inputUser);
        });

        assertEquals("Authentication Failed: Invalid credentials.", exception.getMessage());
    }
}