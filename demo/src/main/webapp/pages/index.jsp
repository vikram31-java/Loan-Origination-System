<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Global Bank | Loan Origination System</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body class="home-layout">

    <div class="hero-section text-center text-white d-flex align-items-center">
        <div class="container">
            <h1 class="display-3 fw-bold">Empowering Your Dreams</h1>
            <p class="lead mb-4">Fast, Transparent, and Secure Loan Processing for Modern Banking.</p>
            <div class="d-grid gap-3 d-sm-flex justify-content-sm-center">
                <a href="${pageContext.request.contextPath}/api/login" class="btn btn-primary btn-lg px-4 gap-3">Access Portal</a>
                <a href="${pageContext.request.contextPath}/api/register" class="btn btn-outline-light btn-lg px-4">Apply Now</a>
            </div>
        </div>
    </div>

    <div class="container my-5 py-5">
        <div class="row text-center">
            <div class="col-md-4">
                <div class="feature-box p-4 shadow-sm rounded">
                    <div class="feature-icon mb-3">🏠</div>
                    <h4>Home Loans</h4>
                    <p class="text-muted">Competitive rates for your dream home with minimal documentation.</p>
                </div>
            </div>
            <div class="col-md-4">
                <div class="feature-box p-4 shadow-sm rounded">
                    <div class="feature-icon mb-3">🚗</div>
                    <h4>Auto Loans</h4>
                    <p class="text-muted">Get on the road faster with our quick approval process.</p>
                </div>
            </div>
            <div class="col-md-4">
                <div class="feature-box p-4 shadow-sm rounded">
                    <div class="feature-icon mb-3">💼</div>
                    <h4>Business Loans</h4>
                    <p class="text-muted">Scale your enterprise with our flexible business credit lines.</p>
                </div>
            </div>
        </div>
    </div>
</body>
</html>