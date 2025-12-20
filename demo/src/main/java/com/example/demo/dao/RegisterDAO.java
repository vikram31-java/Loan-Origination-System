package com.example.demo.dao;

import com.example.demo.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface RegisterDAO extends JpaRepository<User,Long> {
    boolean existsByUserNameAndEmail(String userName, String email);
    boolean existsByUserName(String userName);
}
