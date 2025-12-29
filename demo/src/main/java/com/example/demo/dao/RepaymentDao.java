package com.example.demo.dao;

import com.example.demo.model.Repayment;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

public interface RepaymentDao extends JpaRepository<Repayment, Integer> {
    // Find history where status is PAID/SUCCESS for a specific loan
    List<Repayment> findByLoanIdAndPaymentStatus(Integer loanId, String status);
}