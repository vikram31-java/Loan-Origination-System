package com.example.demo.service;

import com.example.demo.dao.RepaymentDao;
import com.example.demo.model.Repayment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class RepaymentServiceImpl implements RepaymentService {

    @Autowired
    private RepaymentDao repaymentDao;

    @Override
    public List<Repayment> getSuccessfulRepayments(Integer loanId) {
        // Fetch only the records marked as PAID or SUCCESS
        return repaymentDao.findByLoanIdAndPaymentStatus(loanId, "PAID");
    }
//    @Override
//    public List<Repayment> getUpcomingSchedule(Integer loanId) {
//        return repaymentDao.findByLoanIdAndPaymentStatus(loanId, "PENDING");
//    }
    @Override
    public List<Repayment> getUpcomingSchedule(Integer loanId) {
        List<Repayment> list = repaymentDao.findByLoanIdAndPaymentStatus(loanId, "PENDING");
        System.out.println("DEBUG: Found " + list.size() + " pending records for loan " + loanId);
        return list;
    }
}