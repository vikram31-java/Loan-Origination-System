package com.example.demo.dao;

import com.example.demo.entity.User;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.transaction.annotation.Transactional;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
@Transactional
public class RegisterDaoTest { // Ensure this matches the filename exactly

    @Autowired
    private RegisterDAO registerDAO;

    private User existingUser;

    @BeforeEach
    void setUp() {
        existingUser = new User();
        existingUser.setUserName("alice_green");
        existingUser.setEmail("alice@example.com");
        existingUser.setPassword("password123");

        // FIX: Changed User.Role.USER to User.Role.CUSTOMER (matching your User.java)
        existingUser.setRole(User.Role.CUSTOMER);

        registerDAO.save(existingUser);
    }

    @Test
    void testExistsByUserNameAndEmail_True() {
        boolean exists = registerDAO.existsByUserNameAndEmail("alice_green", "alice@example.com");
        assertTrue(exists);
    }

    @Test
    void testExistsByUserNameAndEmail_False() {
        boolean exists = registerDAO.existsByUserNameAndEmail("alice_green", "wrong@example.com");
        assertFalse(exists);
    }

    @Test
    void testExistsByUserName_True() {
        boolean exists = registerDAO.existsByUserName("alice_green");
        assertTrue(exists);
    }

    @Test
    void testExistsByUserName_False() {
        boolean exists = registerDAO.existsByUserName("unknown_user");
        assertFalse(exists);
    }
}