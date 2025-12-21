<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Account Created | LoanOS</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
    <style>
        body { background: #f0f2f5; height: 100vh; display: flex; align-items: center; }
        .success-card { max-width: 500px; margin: auto; border: none; border-radius: 20px; }
        .checkmark-circle {
            width: 100px; height: 100px;
            background-color: #d1e7dd;
            color: #0f5132;
            border-radius: 50%;
            display: flex; align-items: center; justify-content: center;
            margin: 0 auto 20px;
            font-size: 3.5rem;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="card success-card shadow-lg p-5 text-center">
        <div class="checkmark-circle shadow-sm">
            <i class="bi bi-check-lg"></i>
        </div>

        <h2 class="fw-bold text-dark">Account Created!</h2>
        <p class="text-muted">Welcome to the family, <strong>${name}</strong>.</p>

        <div class="alert alert-info py-2 small text-start mt-4">
            <i class="bi bi-info-circle-fill me-2"></i>
            <strong>What's next?</strong> You can now use your username and password to log in and start your loan application.
        </div>

        <div class="d-grid mt-4">
            <a href="${pageContext.request.contextPath}/api/home" class="btn btn-primary btn-lg fw-bold shadow-sm">
                <i class="bi bi-box-arrow-in-right me-2"></i>Sign In Now
            </a>
        </div>

        <div class="mt-4">
            <small class="text-muted">Having trouble? <a href="#" class="text-decoration-none">Contact Support</a></small>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>