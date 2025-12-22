package com.example.demo.dao;

import com.example.demo.entity.User;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.transaction.annotation.Transactional;

import java.util.Optional;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
@Transactional // This ensures tests roll back and don't mess up your database
public class LoginDaoTest {

    @Autowired
    private LoginDao loginDao;

    private User testUser;

    @BeforeEach
    void setUp() {
        testUser = new User();
        testUser.setUserName("testUser");
        testUser.setPassword("password123");
        testUser.setRole(User.Role.ADMIN); // Uses the Enum from your User entity
        testUser.setEmail("test@example.com");

        loginDao.save(testUser);
    }

    @Test
    void testFindByUserNameAndPasswordAndRole_Success() {
        Optional<User> foundUser = loginDao.findByUserNameAndPasswordAndRole(
                "testUser", "password123", User.Role.ADMIN);

        assertTrue(foundUser.isPresent());
        assertEquals("test@example.com", foundUser.get().getEmail());
    }

    @Test
    void testFindByUserNameAndPasswordAndRole_WrongPassword() {
        Optional<User> foundUser = loginDao.findByUserNameAndPasswordAndRole(
                "testUser", "wrong_pass", User.Role.ADMIN);

        assertFalse(foundUser.isPresent());
    }

    @Test
    void testFindByUserName_Success() {
        User foundUser = loginDao.findByUserName("testUser");

        assertNotNull(foundUser);
        assertEquals(User.Role.ADMIN, foundUser.getRole());
    }

    @Test
    void testFindByUserName_NotFound() {
        User foundUser = loginDao.findByUserName("nonExistentUser");

        assertNull(foundUser);
    }
}