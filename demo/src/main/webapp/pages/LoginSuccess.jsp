<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Login Successful | LoanOS</title>
    <meta http-equiv="refresh" content="2;url=${pageContext.request.contextPath}/api/dashboard" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
    <style>
        body { background-color: #f8f9fa; height: 100vh; display: flex; align-items: center; justify-content: center; }
        .loader { border: 4px solid #f3f3f3; border-top: 4px solid #0d6efd; border-radius: 50%; width: 40px; height: 40px; animation: spin 1s linear infinite; margin: 20px auto; }
        @keyframes spin { 0% { transform: rotate(0deg); } 100% { transform: rotate(360deg); } }
    </style>
</head>
<body>
    <div class="text-center">
        <div class="text-success display-1 mb-3">
            <i class="bi bi-shield-check"></i>
        </div>
        <h2 class="fw-bold">Login Successful!</h2>
        <p class="text-muted">Welcome back, <strong>${Name}</strong>. Redirecting to your workspace...</p>
        <div class="loader"></div>
        <p class="small text-secondary">Click <a href="${pageContext.request.contextPath}/api/dashboard">here</a> if you are not redirected automatically.</p>
    </div>
</body>
</html>