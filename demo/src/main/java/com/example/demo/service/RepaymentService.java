package com.example.demo.service;
import com.example.demo.model.Repayment;
import java.util.List;

public interface RepaymentService {
    List<Repayment> getSuccessfulRepayments(Integer loanId);
    List<Repayment> getUpcomingSchedule(Integer loanId);
}