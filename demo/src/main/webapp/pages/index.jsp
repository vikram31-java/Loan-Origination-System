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
        .hero-section { background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%); padding: 80px 0; }
        .feature-icon { font-size: 2rem; color: #0d6efd; margin-bottom: 1rem; }
        .card { border: none; transition: transform 0.3s; border-radius: 15px; }
        .card:hover { transform: translateY(-10px); box-shadow: 0 10px 30px rgba(0,0,0,0.1) !important; }
        .section-title { position: relative; padding-bottom: 15px; margin-bottom: 30px; }
        .section-title::after { content: ''; position: absolute; left: 50%; bottom: 0; transform: translateX(-50%); width: 50px; height: 3px; background: #0d6efd; }
    </style>
</head>
<body class="bg-light">

    <%-- 1. Navigation Bar Layout --%>
    <nav class="navbar navbar-expand-lg navbar-light bg-white shadow-sm sticky-top">
        <div class="container">
            <a class="navbar-brand fw-bold text-primary" href="#"><i class="bi bi-bank2"></i> LoanOS</a>
            <div class="d-flex">
                <a href="${pageContext.request.contextPath}/api/home" class="btn btn-outline-primary me-2">Login</a>
                <a href="${pageContext.request.contextPath}/api/User_register_form" class="btn btn-primary">Register</a>
            </div>
        </div>
    </nav>

    <%-- 2. Hero Section Layout --%>
    <header class="hero-section text-center">
        <div class="container">
            <h1 class="display-3 fw-bold text-dark mb-3">Modern Loan Processing</h1>
            <p class="lead text-muted mb-5">Your end-to-end solution for Home, Personal, and Vehicle loans.</p>
        </div>
    </header>

    <%-- LOAN PRODUCTS (Layouts 3-5) --%>
    <section class="container py-5">
        <h2 class="text-center fw-bold section-title">Our Loan Products</h2>
        <div class="row g-4">
            <div class="col-md-4">
                <div class="card p-4 h-100 shadow-sm text-center">
                    <i class="bi bi-house-door feature-icon"></i>
                    <h4>Home Loans</h4>
                    <p class="small text-muted">Low interest rates for your dream home.</p>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card p-4 h-100 shadow-sm text-center">
                    <i class="bi bi-person-badge feature-icon"></i>
                    <h4>Personal Loans</h4>
                    <p class="small text-muted">Instant funds for medical or personal needs.</p>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card p-4 h-100 shadow-sm text-center">
                    <i class="bi bi-car-front feature-icon"></i>
                    <h4>Vehicle Loans</h4>
                    <p class="small text-muted">Drive away with quick auto financing.</p>
                </div>
            </div>
        </div>
    </section>

    <%-- CORE FEATURES (Layouts 6-11) --%>
    <section id="features" class="bg-white py-5">
        <div class="container">
            <h2 class="text-center fw-bold section-title">System Features</h2>
            <div class="row g-4">
                <div class="col-md-4 text-center">
                    <div class="p-3">
                        <i class="bi bi-lightning-charge feature-icon text-warning"></i>
                        <h5>Fast Approval</h5>
                        <p class="text-muted small">Automated credit scoring for rapid decisions.</p>
                    </div>
                </div>
                <div class="col-md-4 text-center">
                    <div class="p-3">
                        <i class="bi bi-shield-check feature-icon text-success"></i>
                        <h5>Secure Data</h5>
                        <p class="text-muted small">SSL/TLS encryption for all transactions.</p>
                    </div>
                </div>
                <div class="col-md-4 text-center">
                    <div class="p-3">
                        <i class="bi bi-people feature-icon"></i>
                        <h5>Role Access</h5>
                        <p class="text-muted small">Portals for Admin, Officer, and Customer.</p>
                    </div>
                </div>
                <div class="col-md-4 text-center">
                    <div class="p-3">
                        <i class="bi bi-calculator feature-icon"></i>
                        <h5>EMI Tools</h5>
                        <p class="text-muted small">Built-in repayment scheduling logic.</p>
                    </div>
                </div>
                <div class="col-md-4 text-center">
                    <div class="p-3">
                        <i class="bi bi-file-earmark-text feature-icon"></i>
                        <h5>Doc Management</h5>
                        <p class="text-muted small">Digital upload and verification system.</p>
                    </div>
                </div>
                <div class="col-md-4 text-center">
                    <div class="p-3">
                        <i class="bi bi-bell feature-icon"></i>
                        <h5>Notifications</h5>
                        <p class="text-muted small">Real-time alerts on application status.</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <%-- PROCESS STEPS (Layouts 12-15) --%>
    <section class="container py-5">
        <h2 class="text-center fw-bold section-title">How it Works</h2>
        <div class="row text-center">
            <div class="col-md-3">
                <div class="fw-bold fs-1 text-primary">01</div>
                <h6>Register</h6>
            </div>
            <div class="col-md-3">
                <div class="fw-bold fs-1 text-primary">02</div>
                <h6>Apply</h6>
            </div>
            <div class="col-md-3">
                <div class="fw-bold fs-1 text-primary">03</div>
                <h6>Approval</h6>
            </div>
            <div class="col-md-3">
                <div class="fw-bold fs-1 text-primary">04</div>
                <h6>Disburse</h6>
            </div>
        </div>
    </section>

    <%-- TRUST STATS (Layouts 16-19) --%>
    <section class="bg-primary text-white py-5">
        <div class="container">
            <div class="row text-center">
                <div class="col-md-3">
                    <h2 class="fw-bold">10k+</h2>
                    <p>Happy Clients</p>
                </div>
                <div class="col-md-3">
                    <h2 class="fw-bold">$50M</h2>
                    <p>Disbursed</p>
                </div>
                <div class="col-md-3">
                    <h2 class="fw-bold">99%</h2>
                    <p>Secure Score</p>
                </div>
                <div class="col-md-3">
                    <h2 class="fw-bold">24/7</h2>
                    <p>Support</p>
                </div>
            </div>
        </div>
    </section>

    <%-- 20. Footer Layout --%>
    <footer class="py-4 bg-dark text-white text-center">
        <div class="container">
            <p class="mb-0 small">&copy; 2025 LoanOS Origination System. End-to-End MVC Solution.</p>
        </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>