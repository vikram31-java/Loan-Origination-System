package com.example.demo.controller;

import com.example.demo.service.RepaymentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class RepaymentController {

    @Autowired
    private RepaymentService repaymentService;

    @GetMapping("/repaymentHistory")
    public String viewHistory(@RequestParam("loanId") Integer loanId, Model model) {
        // We use the attribute name "historyList" to match your JSP ${historyList}
        model.addAttribute("historyList", repaymentService.getSuccessfulRepayments(loanId));
        return "repaymenthistory";
    }
    @GetMapping("/dashboard")
    public String showDashboard() {
        return "loandashboard"; // This looks for loandashboard.jsp
    }
//    @GetMapping("/emiSchedule")
//    public String viewSchedule(@RequestParam("loanId") Integer loanId, Model model) {
//        model.addAttribute("scheduleList", repaymentService.getUpcomingSchedule(loanId));
//        return "emischedule"; // Matches emischedule.jsp
//    }
    @GetMapping("/emiSchedule")
    public String viewSchedule(@RequestParam("loanId") Integer loanId, Model model) {
        // Ensure the list is being added to the model
        List<com.example.demo.model.Repayment> schedule = repaymentService.getUpcomingSchedule(loanId);
        model.addAttribute("scheduleList", schedule); // This name must match the JSP
        return "emischedule";
    }
}