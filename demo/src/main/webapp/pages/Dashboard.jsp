<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="header.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <title>Dashboard | LoanOS Portal</title>
    <style>
        .dashboard-card { transition: transform 0.2s, box-shadow 0.2s; border: none; border-radius: 12px; height: 100%; }
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
            <%-- CUSTOMER VIEW (7 Layouts) --%>
            <c:when test="${sessionScope.loggedInUser.role == 'CUSTOMER'}">
                <div class="col-md-4"><div class="card dashboard-card shadow-sm border-top border-success border-4"><div class="card-body">
                    <div class="icon-box bg-success-subtle text-success"><i class="bi bi-file-earmark-plus fs-4"></i></div>
                    <h5 class="fw-bold">Apply for Loan</h5><p class="text-muted small">New Home, Vehicle, or Personal loans.</p>
                    <a href="${pageContext.request.contextPath}/api/loan/apply" class="btn btn-success w-100 mt-2">Apply Now</a>
                </div></div></div>
                <div class="col-md-4"><div class="card dashboard-card shadow-sm"><div class="card-body">
                    <div class="icon-box bg-primary-subtle text-primary"><i class="bi bi-clock-history fs-4"></i></div>
                    <h5 class="fw-bold">My Applications</h5><p class="text-muted small">Check real-time status of pending loans.</p>
                    <a href="${pageContext.request.contextPath}/api/customer/status" class="btn btn-primary w-100 mt-2">View Status</a>
                </div></div></div>
                <div class="col-md-4"><div class="card dashboard-card shadow-sm"><div class="card-body">
                    <div class="icon-box bg-info-subtle text-info"><i class="bi bi-calendar-check fs-4"></i></div>
                    <h5 class="fw-bold">EMI Schedule</h5><p class="text-muted small">View upcoming repayment dates.</p>
                    <a href="#" class="btn btn-outline-info w-100 mt-2">Schedule</a>
                </div></div></div>
                <div class="col-md-4"><div class="card dashboard-card shadow-sm"><div class="card-body">
                    <div class="icon-box bg-danger-subtle text-danger"><i class="bi bi-credit-card fs-4"></i></div>
                    <h5 class="fw-bold">Quick Pay</h5><p class="text-muted small">Make an immediate loan repayment.</p>
                    <a href="#" class="btn btn-danger w-100 mt-2">Pay Now</a>
                </div></div></div>
                <div class="col-md-4"><div class="card dashboard-card shadow-sm"><div class="card-body">
                    <div class="icon-box bg-warning-subtle text-warning"><i class="bi bi-file-text fs-4"></i></div>
                    <h5 class="fw-bold">Documents</h5><p class="text-muted small">Upload KYC and Income statements.</p>
                    <a href="#" class="btn btn-warning w-100 mt-2">Upload</a>
                </div></div></div>
                <div class="col-md-4"><div class="card dashboard-card shadow-sm"><div class="card-body">
                    <div class="icon-box bg-dark-subtle text-dark"><i class="bi bi-shield-lock fs-4"></i></div>
                    <h5 class="fw-bold">Credit Score</h5><p class="text-muted small">View your latest system risk rating.</p>
                    <a href="#" class="btn btn-dark w-100 mt-2">Check Score</a>
                </div></div></div>
                <div class="col-md-4"><div class="card dashboard-card shadow-sm"><div class="card-body">
                    <div class="icon-box bg-secondary-subtle text-secondary"><i class="bi bi-question-circle fs-4"></i></div>
                    <h5 class="fw-bold">Help Desk</h5><p class="text-muted small">Raise support tickets for queries.</p>
                    <a href="#" class="btn btn-secondary w-100 mt-2">Get Help</a>
                </div></div></div>
            </c:when>

            <%-- LOAN OFFICER VIEW (7 Layouts) --%>
            <c:when test="${sessionScope.loggedInUser.role == 'LOAN_OFFICER'}">
                <div class="col-md-4"><div class="card dashboard-card shadow-sm border-top border-warning border-4"><div class="card-body">
                    <div class="icon-box bg-warning-subtle text-warning"><i class="bi bi-clipboard-check fs-4"></i></div>
                    <h5 class="fw-bold">Credit Queue</h5><p class="text-muted small">Risk scoring for new applicants.</p>
                    <a href="${pageContext.request.contextPath}/api/officer/queue" class="btn btn-warning w-100 mt-2">Open Queue</a>
                </div></div></div>
                <div class="col-md-4"><div class="card dashboard-card shadow-sm"><div class="card-body">
                    <div class="icon-box bg-info-subtle text-info"><i class="bi bi-search fs-4"></i></div>
                    <h5 class="fw-bold">Verify Docs</h5><p class="text-muted small">Audit customer uploaded files.</p>
                    <a href="#" class="btn btn-info text-white w-100 mt-2">Check Docs</a>
                </div></div></div>
                <div class="col-md-4"><div class="card dashboard-card shadow-sm"><div class="card-body">
                    <div class="icon-box bg-primary-subtle text-primary"><i class="bi bi-person-vcard fs-4"></i></div>
                    <h5 class="fw-bold">Customer Profiles</h5><p class="text-muted small">View detailed applicant history.</p>
                    <a href="#" class="btn btn-primary w-100 mt-2">Profiles</a>
                </div></div></div>
                <div class="col-md-4"><div class="card dashboard-card shadow-sm"><div class="card-body">
                    <div class="icon-box bg-success-subtle text-success"><i class="bi bi-check-circle fs-4"></i></div>
                    <h5 class="fw-bold">Approvals</h5><p class="text-muted small">Finalize pending applications.</p>
                    <a href="#" class="btn btn-success w-100 mt-2">Approve</a>
                </div></div></div>
                <div class="col-md-4"><div class="card dashboard-card shadow-sm"><div class="card-body">
                    <div class="icon-box bg-danger-subtle text-danger"><i class="bi bi-x-circle fs-4"></i></div>
                    <h5 class="fw-bold">Rejections</h5><p class="text-muted small">Manage denied loan requests.</p>
                    <a href="#" class="btn btn-danger w-100 mt-2">Review</a>
                </div></div></div>
                <div class="col-md-4"><div class="card dashboard-card shadow-sm"><div class="card-body">
                    <div class="icon-box bg-dark-subtle text-dark"><i class="bi bi-graph-down fs-4"></i></div>
                    <h5 class="fw-bold">Risk Analytics</h5><p class="text-muted small">Analyze portfolio risk levels.</p>
                    <a href="#" class="btn btn-dark w-100 mt-2">Reports</a>
                </div></div></div>
                <div class="col-md-4"><div class="card dashboard-card shadow-sm"><div class="card-body">
                    <div class="icon-box bg-secondary-subtle text-secondary"><i class="bi bi-envelope fs-4"></i></div>
                    <h5 class="fw-bold">Communications</h5><p class="text-muted small">Email or notify applicants.</p>
                    <a href="#" class="btn btn-secondary w-100 mt-2">Send Alerts</a>
                </div></div></div>
            </c:when>

            <%-- ADMIN VIEW (6 Layouts) --%>
            <c:when test="${sessionScope.loggedInUser.role == 'ADMIN'}">
                <div class="col-md-4"><div class="card dashboard-card shadow-sm border-top border-info border-4"><div class="card-body">
                    <div class="icon-box bg-info-subtle text-info"><i class="bi bi-people-fill fs-4"></i></div>
                    <h5 class="fw-bold">User Control</h5><p class="text-muted small">Manage system access and roles.</p>
                    <a href="${pageContext.request.contextPath}/api/admin/users" class="btn btn-info text-white w-100 mt-2">Manage Users</a>
                </div></div></div>
                <div class="col-md-4"><div class="card dashboard-card shadow-sm"><div class="card-body">
                    <div class="icon-box bg-danger-subtle text-danger"><i class="bi bi-bank fs-4"></i></div>
                    <h5 class="fw-bold">Disbursements</h5><p class="text-muted small">Authorize fund releases.</p>
                    <a href="#" class="btn btn-danger w-100 mt-2">Release Funds</a>
                </div></div></div>
                <div class="col-md-4"><div class="card dashboard-card shadow-sm"><div class="card-body">
                    <div class="icon-box bg-success-subtle text-success"><i class="bi bi-gear fs-4"></i></div>
                    <h5 class="fw-bold">System Config</h5><p class="text-muted small">Interest rates and products.</p>
                    <a href="#" class="btn btn-success w-100 mt-2">Settings</a>
                </div></div></div>
                <div class="col-md-4"><div class="card dashboard-card shadow-sm"><div class="card-body">
                    <div class="icon-box bg-warning-subtle text-warning"><i class="bi bi-shield-shaded fs-4"></i></div>
                    <h5 class="fw-bold">Security Audit</h5><p class="text-muted small">View system login logs.</p>
                    <a href="#" class="btn btn-warning w-100 mt-2">View Logs</a>
                </div></div></div>
                <div class="col-md-4"><div class="card dashboard-card shadow-sm"><div class="card-body">
                    <div class="icon-box bg-primary-subtle text-primary"><i class="bi bi-database fs-4"></i></div>
                    <h5 class="fw-bold">Backup</h5><p class="text-muted small">MySQL Database maintenance.</p>
                    <a href="#" class="btn btn-primary w-100 mt-2">Database</a>
                </div></div></div>
                <div class="col-md-4"><div class="card dashboard-card shadow-sm"><div class="card-body">
                    <div class="icon-box bg-dark-subtle text-dark"><i class="bi bi-bar-chart-line fs-4"></i></div>
                    <h5 class="fw-bold">Master Analytics</h5><p class="text-muted small">Total system performance.</p>
                    <a href="#" class="btn btn-dark w-100 mt-2">Dashboard</a>
                </div></div></div>
            </c:when>

            <c:otherwise>
                <div class="col-12"><div class="alert alert-danger">Error: Role Mismatch. Role found: [${sessionScope.loggedInUser.role}]</div></div>
            </c:otherwise>
        </c:choose>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>