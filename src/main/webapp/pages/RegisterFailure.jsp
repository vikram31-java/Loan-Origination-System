<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Registration Issue | LoanOS</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
    <style>
        body { background-color: #fff5f5; height: 100vh; display: flex; align-items: center; }
        .error-card { border-top: 5px solid #dc3545; border-radius: 15px; border-left: none; border-right: none; border-bottom: none; }
        .reason-box { background-color: #fdf2f2; border: 1px solid #fbd5d5; color: #9b1c1c; }
    </style>
</head>
<body>
<div class="container text-center">
    <div class="row justify-content-center">
        <div class="col-md-6 col-lg-5">
            <div class="card error-card shadow-lg p-4 p-md-5">
                <div class="mb-4">
                    <i class="bi bi-person-x-fill text-danger" style="font-size: 4rem;"></i>
                </div>
                <h2 class="fw-bold text-dark mb-3">Registration Failed</h2>

                <c:if test="${not empty message}">
                    <div class="reason-box p-3 rounded mb-4 small text-start">
                        <strong>Detail:</strong> ${message}
                    </div>
                </c:if>

                <p class="text-muted mb-4">
                    We couldn't create your account at this time. This is usually caused by a duplicate username or a temporary system interruption.
                </p>

                <div class="d-grid gap-2">
                    <a href="${pageContext.request.contextPath}/api/User_register_form" class="btn btn-danger btn-lg shadow-sm">
                        <i class="bi bi-arrow-clockwise me-2"></i>Modify and Try Again
                    </a>
                    <a href="${pageContext.request.contextPath}/api/home" class="btn btn-outline-secondary">
                        Return to Login
                    </a>
                </div>

                <div class="mt-4 pt-3 border-top">
                    <p class="small text-muted mb-0">
                        Need help? <a href="mailto:support@loanos.com" class="text-decoration-none">Contact Support Team</a>
                    </p>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>