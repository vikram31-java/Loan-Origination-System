package com.example.demo.dao;

import com.example.demo.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.Optional;

@Repository
public interface LoginDao extends JpaRepository<User, Long> {

    /**
     * Used for secure 3-way authentication (Username + Password + Role).
     * Returns an Optional to prevent NullPointerExceptions.
     */
    Optional<User> findByUserNameAndPasswordAndRole(String userName, String password, User.Role role);

    /**
     * Used to fetch user details for session management after successful login.
     */
    User findByUserName(String userName);

    /**
     * Useful for checking if a username already exists during Registration.
     */
    boolean existsByUserName(String userName);
}