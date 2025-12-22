

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<meta name="viewport" content="width=device-width, initial-scale=1">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">

<style>
    .navbar-custom { background-color: #1a1d20; border-bottom: 3px solid #0d6efd; }
    .nav-link { transition: color 0.3s ease; }
    .nav-link:hover { color: #0d6efd !important; }
    .user-box { border-left: 1px solid #444; padding-left: 15px; }
</style>

<nav class="navbar navbar-expand-lg navbar-dark navbar-custom shadow-sm mb-4">
    <div class="container-fluid">
        <a class="navbar-brand fw-bold d-flex align-items-center" href="${pageContext.request.contextPath}/api/dashboard">
            <i class="bi bi-bank2 me-2 text-primary"></i> LoanOS
        </a>

        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#mainNavbar">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="mainNavbar">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" href="${pageContext.request.contextPath}/api/dashboard">
                        <i class="bi bi-speedometer2 me-1"></i> Dashboard
                    </a>
                </li>

                <c:choose>
                    <c:when test="${sessionScope.loggedInUser.role == 'ADMIN'}">
                        <li class="nav-item">
                            <a class="nav-link text-info" href="${pageContext.request.contextPath}/api/admin/users">
                                <i class="bi bi-people-fill me-1"></i> Manage Users
                            </a>
                        </li>
                    </c:when>

                    <c:when test="${sessionScope.loggedInUser.role == 'LOAN_OFFICER'}">
                        <li class="nav-item">
                            <a class="nav-link text-warning" href="${pageContext.request.contextPath}/api/officer/queue">
                                <i class="bi bi-clipboard-check-fill me-1"></i> Credit Evaluation
                            </a>
                        </li>
                    </c:when>

                    <c:when test="${sessionScope.loggedInUser.role == 'CUSTOMER'}">
                        <li class="nav-item">
                            <a class="nav-link text-success" href="${pageContext.request.contextPath}/api/loan/apply">
                                <i class="bi bi-file-earmark-plus-fill me-1"></i> Apply for Loan
                            </a>
                        </li>
                    </c:when>
                </c:choose>
            </ul>

            <div class="d-flex align-items-center user-box">
                <div class="dropdown me-3">
                    <a href="#" class="text-white text-decoration-none dropdown-toggle d-flex align-items-center"
                       id="userDropdown" data-bs-toggle="dropdown" aria-expanded="false">
                        <i class="bi bi-person-circle fs-5 me-2"></i>
                        <span class="d-none d-md-inline">${sessionScope.loggedInUser.userName}</span>
                    </a>
                    <ul class="dropdown-menu dropdown-menu-end shadow" aria-labelledby="userDropdown">
                        <li><a class="dropdown-item" href="${pageContext.request.contextPath}/api/profile">
                            <i class="bi bi-person-gear me-2"></i> My Profile</a>
                        </li>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item text-danger" href="${pageContext.request.contextPath}/api/logout"
                               onclick="return confirm('Are you sure you want to logout?')">
                            <i class="bi bi-box-arrow-right me-2"></i> Logout</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</nav>