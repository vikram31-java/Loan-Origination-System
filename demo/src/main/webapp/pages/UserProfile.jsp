<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- Header include for navigation and global styles --%>
<%@ include file="header.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <title>My Profile | LoanOS</title>
    <style>
        .profile-card { border: none; border-radius: 15px; }
        .profile-avatar {
            width: 80px;
            height: 80px;
            background-color: #e9ecef;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 50%;
            margin: 0 auto 20px;
            color: #0d6efd;
            font-size: 2.5rem;
        }
        .form-label { font-weight: 600; color: #495057; }
        .readonly-field { background-color: #f8f9fa !important; border-color: #dee2e6; }
    </style>
</head>
<body class="bg-light">

<div class="container py-5">
    <div class="row justify-content-center">
        <div class="col-md-8 col-lg-6">

            <div class="card profile-card shadow-lg p-4">
                <div class="card-body">

                    <div class="text-center">
                        <div class="profile-avatar shadow-sm">
                            <i class="bi bi-person-badge"></i>
                        </div>
                        <h3 class="fw-bold text-dark">${Name}</h3>
                        <p class="text-muted small mb-4">Manage your personal account information</p>
                    </div>

                    <hr class="mb-4">

                    <form action="${pageContext.request.contextPath}/api/profile/update" method="post">

                        <div class="mb-3">
                            <label class="form-label"><i class="bi bi-person me-2"></i>Username</label>
                            <input type="text" class="form-control form-control-lg readonly-field"
                                   value="${Name}" readonly>
                            <div class="form-text">Usernames cannot be changed.</div>
                        </div>

                        <div class="mb-3">
                            <label class="form-label"><i class="bi bi-envelope me-2"></i>Email Address</label>
                            <input type="email" name="email" class="form-control form-control-lg readonly-field"
                                   value="${loggedInUser.email}" readonly>
                        </div>

                        <div class="mb-4">
                            <label class="form-label"><i class="bi bi-shield-lock me-2"></i>Assigned Role</label>
                            <div class="input-group">
                                <input type="text" class="form-control form-control-lg readonly-field"
                                       value="${Role}" readonly>
                                <span class="input-group-text bg-white">
                                    <i class="bi bi-patch-check-fill text-primary"></i>
                                </span>
                            </div>
                            <div class="form-text">Permissions are restricted to this role.</div>
                        </div>

                        <div class="d-grid gap-2">
                            <button type="button" class="btn btn-primary btn-lg shadow-sm">
                                <i class="bi bi-pencil-square me-2"></i>Edit Account Settings
                            </button>
                            <a href="${pageContext.request.contextPath}/api/dashboard" class="btn btn-link text-decoration-none">
                                Back to Dashboard
                            </a>
                        </div>

                    </form>
                </div>
            </div>

            <div class="text-center mt-4">
                <p class="text-muted small">
                    <i class="bi bi-info-circle me-1"></i>
                    Need to change your role or email? Please contact <a href="mailto:admin@loanos.com">Support</a>.
                </p>
            </div>

        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>