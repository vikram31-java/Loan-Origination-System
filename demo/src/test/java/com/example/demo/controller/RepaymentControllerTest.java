package com.example.demo.controller;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.ui.ExtendedModelMap;
import org.springframework.ui.Model;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
public class RepaymentControllerTest {

    @Autowired
    private RepaymentController repaymentController;

    @Test
    public void testViewHistoryNavigation() {
        // We create a real Model object to pass to the controller
        Model model = new ExtendedModelMap();

        // Call the method directly
        String viewName = repaymentController.viewHistory(1, model);

        // Verify the results
        assertEquals("repaymenthistory", viewName, "The view name should match the JSP file name");
        assertTrue(model.containsAttribute("historyList"), "The model should contain the history list");
    }

    @Test
    public void testDashboardNavigation() {
        // Call the dashboard method
        String viewName = repaymentController.showDashboard();

        // Verify the results
        assertEquals("loandashboard", viewName, "Should return the dashboard JSP name");
    }
    @Test
    public void testEmiScheduleNavigation() {
        Model model = new ExtendedModelMap();
        String viewName = repaymentController.viewSchedule(1, model);

        assertEquals("emischedule", viewName);
        assertTrue(model.containsAttribute("scheduleList"));
    }
}