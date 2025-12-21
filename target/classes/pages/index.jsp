<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome to LoanOS | Fast & Secure Loans</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
    <style>
        .hero-section {
            background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%);
            padding: 100px 0;
        }
        .feature-icon {
            font-size: 2.5rem;
            color: #0d6efd;
            margin-bottom: 1rem;
        }
        .card { border: none; transition: transform 0.3s; }
        .card:hover { transform: translateY(-10px); }
    </style>
</head>
<body>

    <nav class="navbar navbar-light bg-white shadow-sm py-3">
        <div class="container">
            <a class="navbar-brand fw-bold text-primary" href="#">
                <i class="bi bi-bank2"></i> LoanOS
            </a>
            <div>
                <a href="${pageContext.request.contextPath}/api/home" class="btn btn-outline-primary me-2">Login</a>
                <a href="${pageContext.request.contextPath}/api/User_register_form" class="btn btn-primary">Register</a>
            </div>
        </div>
    </nav>

    <header class="hero-section text-center">
        <div class="container">
            <h1 class="display-3 fw-bold text-dark mb-3">Modern Loan Processing</h1>
            <p class="lead text-muted mb-5">A secure, end-to-end solution for Home, Personal, and Vehicle loans.</p>
            <div class="d-grid gap-3 d-sm-flex justify-content-sm-center">
                <a href="${pageContext.request.contextPath}/api/User_register_form" class="btn btn-primary btn-lg px-5 shadow">Get Started Now</a>
                <a href="#features" class="btn btn-outline-secondary btn-lg px-5">Learn More</a>
            </div>
        </div>
    </header>

    <section id="features" class="py-5 bg-white">
        <div class="container py-5">
            <div class="row g-4 text-center">
                <div class="col-md-4">
                    <div class="card p-4 h-100 shadow-sm">
                        <i class="bi bi-lightning-charge-fill feature-icon"></i>
                        <h4 class="fw-bold">Fast Approval</h4>
                        <p class="text-muted">Our automated credit evaluation system ensures quick decisions on your application.</p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card p-4 h-100 shadow-sm">
                        <i class="bi bi-shield-lock-fill feature-icon"></i>
                        <h4 class="fw-bold">Secure Data</h4>
                        <p class="text-muted">Bank-grade encryption for your personal and financial information.</p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card p-4 h-100 shadow-sm">
                        <i class="bi bi-graph-up feature-icon"></i>
                        <h4 class="fw-bold">Flexible Roles</h4>
                        <p class="text-muted">Dedicated portals for Customers, Loan Officers, and Administrators.</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <footer class="py-4 bg-dark text-white text-center">
        <div class="container">
            <p class="mb-0 small">&copy; 2025 LoanOS Origination System. All rights reserved.</p>
        </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>