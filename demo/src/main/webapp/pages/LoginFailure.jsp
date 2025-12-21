<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Access Denied | LoanOS</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
    <style>
        body { background-color: #f8f9fa; height: 100vh; display: flex; align-items: center; }
        .failure-box { max-width: 450px; margin: auto; background: white; border-radius: 15px; overflow: hidden; }
        .icon-badge { font-size: 3rem; color: #dc3545; margin-bottom: 15px; }
    </style>
</head>
<body>
<div class="container">
    <div class="failure-box shadow-lg border-0">
        <div class="bg-danger p-4 text-center text-white">
            <h4 class="m-0 fw-bold"><i class="bi bi-shield-lock-fill me-2"></i>Access Denied</h4>
        </div>

        <div class="p-4 text-center">
            <div class="icon-badge">
                <i class="bi bi-exclamation-octagon"></i>
            </div>

            <h5 class="fw-bold text-dark">Invalid Credentials</h5>

            <p class="text-secondary mb-4">
                <c:choose>
                    <c:when test="${not empty message}">
                        ${message}
                    </c:when>
                    <c:otherwise>
                        We couldn't find an account matching those details. Please check your username and password.
                    </c:otherwise>
                </c:choose>
            </p>

            <div class="bg-light p-3 rounded mb-4 text-start">
                <small class="text-uppercase fw-bold text-muted d-block mb-1">Quick Fixes:</small>
                <ul class="mb-0 mt-1 small text-secondary">
                    <li><i class="bi bi-dot"></i> Ensure <strong>Caps Lock</strong> is turned off.</li>
                    <li><i class="bi bi-dot"></i> Check for accidental leading/trailing spaces.</li>
                    <li><i class="bi bi-dot"></i> New user? Ensure your registration was successful.</li>
                </ul>
            </div>

            <div class="d-grid gap-2">
                <a href="${pageContext.request.contextPath}/api/home" class="btn btn-dark btn-lg py-2 fs-6">
                    <i class="bi bi-arrow-left me-2"></i>Back to Login
                </a>
                <a href="${pageContext.request.contextPath}/api/User_register_form" class="btn btn-outline-primary py-2 fs-6">
                    Create New Account
                </a>
            </div>

            <hr class="my-4">
            <p class="small text-muted mb-0">Forgot your password? <a href="#" class="text-decoration-none">Contact Support</a></p>
        </div>
    </div>
</div>
</body>
</html>