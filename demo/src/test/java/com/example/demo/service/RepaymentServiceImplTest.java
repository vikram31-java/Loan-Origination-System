package com.example.demo.service;

import com.example.demo.dao.RepaymentDao;
import com.example.demo.model.Repayment;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import java.util.Collections;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.*;

@ExtendWith(MockitoExtension.class)
public class RepaymentServiceImplTest {

    @Mock
    private RepaymentDao repaymentDao;

    @InjectMocks
    private RepaymentServiceImpl repaymentService;

    @Test
    public void testGetSuccessfulRepaymentsLogic() {
        // Mocking the behavior of the DAO
        when(repaymentDao.findByLoanIdAndPaymentStatus(1, "PAID"))
                .thenReturn(Collections.emptyList());

        List<Repayment> result = repaymentService.getSuccessfulRepayments(1);

        // Verification
        assertNotNull(result);
        verify(repaymentDao, times(1)).findByLoanIdAndPaymentStatus(1, "PAID");
    }
}