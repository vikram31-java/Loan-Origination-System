<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>LoanOS | Secure Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
    <style>
        body {
            background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
        }
        .login-card {
            border: none;
            border-radius: 1.25rem;
            transition: transform 0.3s ease;
        }
        .login-card:hover {
            transform: translateY(-5px);
        }
        .form-control-lg, .form-select-lg {
            border-radius: 0.75rem;
            font-size: 1rem;
        }
        .btn-login {
            border-radius: 0.75rem;
            padding: 12px;
            font-weight: 600;
        }
    </style>
</head>
<body>

<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-5 col-lg-4">
            <div class="card login-card shadow-lg p-4">

                <div class="text-center mb-4">
                    <div class="bg-primary bg-opacity-10 d-inline-block p-3 rounded-circle mb-3">
                        <i class="bi bi-shield-lock-fill text-primary" style="font-size: 2.5rem;"></i>
                    </div>
                    <h3 class="fw-bold text-dark">Welcome Back</h3>
                    <p class="text-muted small">Enter your credentials to access LoanOS</p>
                </div>

                <c:if test="${not empty message}">
                    <div class="alert alert-danger border-0 shadow-sm py-2 text-center" role="alert">
                        <i class="bi bi-exclamation-triangle-fill me-2"></i>
                        <span style="font-size: 0.9rem;">${message}</span>
                    </div>
                </c:if>

                <form:form action="${pageContext.request.contextPath}/api/login" method="post" modelAttribute="user">

                    <div class="mb-3">
                        <label class="form-label fw-semibold small text-secondary">Username</label>
                        <div class="input-group">
                            <span class="input-group-text bg-light border-end-0"><i class="bi bi-person text-muted"></i></span>
                            <form:input path="userName" class="form-control form-control-lg bg-light border-start-0"
                                        placeholder="Enter username" required="true" />
                        </div>
                        <form:errors path="userName" cssClass="text-danger small mt-1 d-block" />
                    </div>

                    <div class="mb-3">
                        <label class="form-label fw-semibold small text-secondary">Password</label>
                        <div class="input-group">
                            <span class="input-group-text bg-light border-end-0"><i class="bi bi-key text-muted"></i></span>
                            <form:password path="password" class="form-control form-control-lg bg-light border-start-0"
                                           placeholder="••••••••" required="true" />
                        </div>
                        <form:errors path="password" cssClass="text-danger small mt-1 d-block" />
                    </div>

                    <div class="mb-4">
                        <label class="form-label fw-semibold small text-secondary">Account Type</label>
                        <div class="input-group">
                            <span class="input-group-text bg-light border-end-0"><i class="bi bi-briefcase text-muted"></i></span>
                            <form:select path="role" class="form-select form-select-lg bg-light border-start-0" required="true">
                                <option value="" disabled selected>Select your role</option>
                                <option value="CUSTOMER">Customer</option>
                                <option value="LOAN_OFFICER">Loan Officer</option>
                                <option value="ADMIN">Administrator</option>
                            </form:select>
                        </div>
                        <form:errors path="role" cssClass="text-danger small mt-1 d-block" />
                    </div>

                    <div class="d-grid">
                        <button type="submit" class="btn btn-primary btn-lg btn-login shadow">
                            Sign In <i class="bi bi-arrow-right ms-2"></i>
                        </button>
                    </div>
                </form:form>

                <div class="text-center mt-4 pt-2">
                    <p class="mb-0 text-muted small">New to our platform?</p>
                    <a href="${pageContext.request.contextPath}/api/User_register_form"
                       class="text-primary fw-bold text-decoration-none">Create a new account</a>
                </div>
            </div>

            <div class="text-center mt-4 text-muted">
                <p style="font-size: 0.75rem;">&copy; 2025 LoanOS Origination System. <br> All Secure Transactions Managed.</p>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>