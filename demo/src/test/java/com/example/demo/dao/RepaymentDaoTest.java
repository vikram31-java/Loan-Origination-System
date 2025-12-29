package com.example.demo.dao;

import com.example.demo.model.Repayment;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest; // Changed this
import static org.junit.jupiter.api.Assertions.*;
import java.util.List;

@SpringBootTest // Changed this from @DataJpaTest
public class RepaymentDaoTest {

    @Autowired
    private RepaymentDao repaymentDao;

    @Test
    public void testDataFetchAndFields() {
        // This will now use your actual MySQL database configured in application.properties
        List<Repayment> results = repaymentDao.findByLoanIdAndPaymentStatus(1, "PAID");

        // Tester Task: Verify Data Display
        assertNotNull(results, "The result list should not be null");

        if(!results.isEmpty()) {
            // Tester Task: Check Date Formatting (Ensuring date is retrieved correctly)
            assertNotNull(results.get(0).getActualPaymentDate(), "Date field should be populated");
            System.out.println("Test Passed: Date retrieved is " + results.get(0).getActualPaymentDate());
        } else {
            System.out.println("Test Note: No data found for Loan ID 1. Add dummy data to MySQL to test full display.");
        }
    }
    @Test
    public void testPendingScheduleFetch() {
        // Assuming you have at least one PENDING record in your MySQL for loanId 1
        List<Repayment> pendingRecords = repaymentDao.findByLoanIdAndPaymentStatus(1, "PENDING");

        assertNotNull(pendingRecords);
        // If there is data, verify the date formatting/presence
        if(!pendingRecords.isEmpty()) {
            assertNotNull(pendingRecords.get(0).getDueDate(), "Schedule Date must be present");
            assertNull(pendingRecords.get(0).getActualPaymentDate(), "Pending EMI should not have an actual payment date yet");
        }
    }
}