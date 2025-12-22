package com.example.demo.service;

import com.example.demo.dao.RegisterDAO;
import com.example.demo.entity.User;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

import java.util.Arrays;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.*;

class RegisterServiceImplTest {

    @Mock
    private RegisterDAO registerDAO;

    @InjectMocks
    private RegisterServiceImpl registerService;

    private User testUser;

    @BeforeEach
    void setUp() {
        // Initializes mocks manually to avoid "package not found" errors
        MockitoAnnotations.openMocks(this);

        testUser = new User();
        testUser.setUserName("testUser");
        testUser.setEmail("test@example.com");
        testUser.setPassword("pass123");
        testUser.setRole(User.Role.CUSTOMER); // Using valid Enum from User.java
    }

    @Test
    void testInsertDB_Success() {
        // Arrange: Mock save to return the user
        when(registerDAO.save(any(User.class))).thenReturn(testUser);

        // Act
        boolean result = registerService.insertDB(testUser);

        // Assert
        assertTrue(result, "Service should return true on successful save.");
        verify(registerDAO, times(1)).save(testUser);
    }

    @Test
    void testInsertDB_Failure() {
        // Arrange: Mock save to throw an exception
        when(registerDAO.save(any(User.class))).thenThrow(new RuntimeException("DB Error"));

        // Act
        boolean result = registerService.insertDB(testUser);

        // Assert
        assertFalse(result, "Service should return false when an exception occurs during save.");
    }

    @Test
    void testInsertMultipleDB_Success() {
        // Arrange
        List<User> users = Arrays.asList(testUser, new User());
        when(registerDAO.saveAll(anyList())).thenReturn(users);

        // Act
        boolean result = registerService.insertMultipleDB(users);

        // Assert
        assertTrue(result);
        verify(registerDAO, times(1)).saveAll(users);
    }

    @Test
    void testValidateUserUniqueness() {
        // Arrange
        when(registerDAO.existsByUserNameAndEmail("testUser", "test@example.com")).thenReturn(true);

        // Act
        boolean exists = registerService.validateUserUniqueness("testUser", "test@example.com");

        // Assert
        assertTrue(exists);
        verify(registerDAO).existsByUserNameAndEmail("testUser", "test@example.com");
    }

    @Test
    void testIsUsernameTaken() {
        // Arrange
        when(registerDAO.existsByUserName("testUser")).thenReturn(true);

        // Act
        boolean taken = registerService.isUsernameTaken("testUser");

        // Assert
        assertTrue(taken);
        verify(registerDAO).existsByUserName("testUser");
    }

    @Test
    void testSaveUser() {
        // Act
        registerService.saveUser(testUser);

        // Assert: Ensure the DAO was called
        verify(registerDAO, times(1)).save(testUser);
    }
}