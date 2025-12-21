package com.example.demo.dao;

import com.example.demo.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface RegisterDAO extends JpaRepository<User, Long> {

    /**
     * Used for AJAX real-time validation to check if a username is taken.
     */
    boolean existsByUserName(String userName);

    /**
     * Used to prevent duplicate registrations by checking both unique fields.
     */
    boolean existsByUserNameAndEmail(String userName, String email);

    /**
     * Helper method to fetch user by name if needed during registration logic.
     */
    User findByUserName(String userName);
}