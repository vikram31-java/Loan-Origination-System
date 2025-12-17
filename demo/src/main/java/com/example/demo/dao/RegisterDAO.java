package com.example.demo.dao;

import com.example.demo.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface RegisterDAO extends CrudRepository<User,Long> {
    boolean existsByUserIdAndUserName(int UserId, String UserName);
    User findByUserIdAndUserName(int UserId, String UserName);
}
