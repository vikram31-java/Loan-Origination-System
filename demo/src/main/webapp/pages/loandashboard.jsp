<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Loan Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { background-color: #f8f9fa; }
        .dashboard-card { transition: transform 0.2s; cursor: pointer; text-decoration: none; color: inherit; }
        .dashboard-card:hover { transform: scale(1.05); color: inherit; }
    </style>
</head>
<body>

<nav class="navbar navbar-dark bg-primary mb-5 shadow">
    <div class="container">
        <span class="navbar-brand mb-0 h1">Loan Services</span>
        <a href="logout" class="btn btn-outline-light btn-sm">Logout</a>
    </div>
</nav>

<div class="container text-center">
    <h2 class="mb-2">Welcome, Customer</h2>
    <p class="text-muted mb-5">Select an option to manage your loan repayments</p>

    <div class="row justify-content-center">
        <div class="col-md-4 mb-4">
            <a href="viewEMISchedule" class="card shadow dashboard-card border-primary h-100">
                <div class="card-body py-5">
                    <div class="display-6 text-primary mb-3"><i class="bi bi-calendar3"></i></div>
                    <h5 class="card-title text-primary">EMI Schedule</h5>
                    <p class="card-text text-secondary">View your upcoming installments and due dates.</p>
                    <span class="btn btn-primary mt-3">View Schedule</span>
                </div>
            </a>
        </div>

        <div class="col-md-4 mb-4">
            <a href="viewRepaymentHistory?loanId=1" class="card shadow dashboard-card border-success h-100">
                <div class="card-body py-5">
                    <div class="display-6 text-success mb-3"><i class="bi bi-clock-history"></i></div>
                    <h5 class="card-title text-success">Repayment History</h5>
                    <p class="card-text text-secondary">Check your past payments and transaction status.</p>
                    <span class="btn btn-success mt-3">View History</span>
                </div>
            </a>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>