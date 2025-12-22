

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- This includes your global navbar, CSS, and session checks --%>
<%@ include file="header.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <title>Dashboard | LoanOS Portal</title>
    <style>
        .dashboard-card { transition: transform 0.2s, box-shadow 0.2s; border: none; border-radius: 12px; }
        .dashboard-card:hover { transform: translateY(-5px); box-shadow: 0 10px 20px rgba(0,0,0,0.1) !important; }
        .welcome-section { background: #ffffff; border-left: 5px solid #0d6efd; padding: 2rem; }
        .icon-box { width: 50px; height: 50px; display: flex; align-items: center; justify-content: center; border-radius: 10px; margin-bottom: 1rem; }
    </style>
</head>
<body class="bg-light">

<div class="container py-4">
    <div class="welcome-section shadow-sm rounded-3 mb-5">
        <div class="row align-items-center">
            <div class="col-md-8">
                <h2 class="fw-bold text-dark mb-1">Hello, ${sessionScope.loggedInUser.userName}!</h2>
                <p class="text-muted mb-0">Manage your loans and account settings in real-time.</p>
            </div>
            <div class="col-md-4 text-md-end mt-3 mt-md-0">
                <span class="badge bg-primary px-3 py-2 fs-6 shadow-sm">
                    <i class="bi bi-person-badge me-2"></i>Portal: ${sessionScope.loggedInUser.role}
                </span>
            </div>
        </div>
    </div>

    <h4 class="mb-4 fw-bold text-secondary text-uppercase small" style="letter-spacing: 1px;">Workspace Modules</h4>

    <div class="row g-4">
        <c:choose>
            <%-- CUSTOMER VIEW --%>
            <c:when test="${sessionScope.loggedInUser.role == 'CUSTOMER'}">
                <div class="col-md-4">
                    <div class="card h-100 dashboard-card shadow-sm border-top border-success border-4">
                        <div class="card-body">
                            <div class="icon-box bg-success-subtle text-success"><i class="bi bi-file-earmark-plus fs-4"></i></div>
                            <h5 class="fw-bold">Apply for Loan</h5>
                            <p class="text-muted small">Submit a new request for Home, Vehicle, or Personal loans.</p>
                            <a href="${pageContext.request.contextPath}/api/loan/apply" class="btn btn-success w-100 mt-2">New Application</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card h-100 dashboard-card shadow-sm">
                        <div class="card-body">
                            <div class="icon-box bg-primary-subtle text-primary"><i class="bi bi-clock-history fs-4"></i></div>
                            <h5 class="fw-bold">My Status</h5>
                            <p class="text-muted small">Check the real-time progress of your pending applications.</p>
                            <a href="${pageContext.request.contextPath}/api/customer/status" class="btn btn-outline-primary w-100 mt-2">View History</a>
                        </div>
                    </div>
                </div>
            </c:when>

            <%-- LOAN OFFICER VIEW --%>
            <c:when test="${Role == 'LOAN_OFFICER'}">
                <div class="col-md-4">
                    <div class="card h-100 dashboard-card shadow-sm border-top border-warning border-4">
                        <div class="card-body">
                            <div class="icon-box bg-warning-subtle text-warning"><i class="bi bi-clipboard-check fs-4"></i></div>
                            <h5 class="fw-bold">Credit Queue</h5>
                            <p class="text-muted small">Perform risk scoring and credit evaluations for new applicants.</p>
                            <a href="${pageContext.request.contextPath}/api/officer/queue" class="btn btn-warning w-100 mt-2">Open Queue</a>
                        </div>
                    </div>
                </div>
            </c:when>

            <%-- ADMIN VIEW --%>
            <c:when test="${Role == 'ADMIN'}">
                <div class="col-md-4">
                    <div class="card h-100 dashboard-card shadow-sm border-top border-info border-4">
                        <div class="card-body">
                            <div class="icon-box bg-info-subtle text-info"><i class="bi bi-people-fill fs-4"></i></div>
                            <h5 class="fw-bold">User Control</h5>
                            <p class="text-muted small">Manage system access, reset passwords, and audit roles.</p>
                            <a href="${pageContext.request.contextPath}/api/admin/users" class="btn btn-info text-white w-100 mt-2">Manage Users</a>
                        </div>
                    </div>
                </div>
            </c:when>

            <%-- DEFAULT / NO ROLE --%>
            <c:otherwise>
                <div class="col-12">
                    <div class="alert alert-danger">
                        <i class="bi bi-exclamation-triangle-fill me-2"></i> Error: No assigned role detected. Please contact support.
                    </div>
                </div>
            </c:otherwise>
        </c:choose>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>