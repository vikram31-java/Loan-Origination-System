package com.example.demo.model;

import jakarta.persistence.*;
import java.math.BigDecimal;
import java.time.LocalDate;

@Entity
@Table(name = "Repayment")
public class Repayment {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer repaymentId;
    @Column(name = "LoanId")
    private Integer loanId;
    private BigDecimal emiAmount;
    private LocalDate dueDate;
    private String paymentStatus;

    // Fields added to match your JSP requirements
    private LocalDate actualPaymentDate;
    private String transactionId;
    private String paymentMode;

    public Repayment() {}

    // Getters and Setters
    public Integer getRepaymentId() { return repaymentId; }
    public void setRepaymentId(Integer repaymentId) { this.repaymentId = repaymentId; }

    public Integer getLoanId() { return loanId; }
    public void setLoanId(Integer loanId) { this.loanId = loanId; }

    public BigDecimal getEmiAmount() { return emiAmount; }
    public void setEmiAmount(BigDecimal emiAmount) { this.emiAmount = emiAmount; }

    public LocalDate getDueDate() { return dueDate; }
    public void setDueDate(LocalDate dueDate) { this.dueDate = dueDate; }

    public String getPaymentStatus() { return paymentStatus; }
    public void setPaymentStatus(String paymentStatus) { this.paymentStatus = paymentStatus; }

    public LocalDate getActualPaymentDate() { return actualPaymentDate; }
    public void setActualPaymentDate(LocalDate actualPaymentDate) { this.actualPaymentDate = actualPaymentDate; }

    public String getTransactionId() { return transactionId; }
    public void setTransactionId(String transactionId) { this.transactionId = transactionId; }

    public String getPaymentMode() { return paymentMode; }
    public void setPaymentMode(String paymentMode) { this.paymentMode = paymentMode; }
}