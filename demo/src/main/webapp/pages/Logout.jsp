<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="refresh" content="5;url=${pageContext.request.contextPath}/api/home">
    <title>Logged Out | LoanOS</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
    <style>
        body {
            background: #f8f9fa;
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .logout-card {
            max-width: 400px;
            border-radius: 15px;
            border: none;
        }
        .timer-bar {
            height: 4px;
            background: #0d6efd;
            width: 100%;
            animation: shrink 5s linear forwards;
        }
        @keyframes shrink {
            from { width: 100%; }
            to { width: 0%; }
        }
    </style>
</head>
<body>

<div class="container">
    <div class="card logout-card shadow-lg text-center overflow-hidden">
        <div class="timer-bar"></div>

        <div class="card-body p-5">
            <div class="mb-4">
                <i class="bi bi-shield-check text-success" style="font-size: 3.5rem;"></i>
            </div>

            <h3 class="fw-bold">Signed Out</h3>
            <p class="text-muted">You have been safely logged out of the Loan Origination System.</p>

            <div class="alert alert-info py-2 small mt-3">
                Redirecting to Login in <span id="countdown">5</span> seconds...
            </div>

            <div class="d-grid mt-4">
                <a href="${pageContext.request.contextPath}/api/home" class="btn btn-primary">
                    Login Now
                </a>
            </div>
        </div>
    </div>
</div>

<script>
    // Simple script to update the countdown number
    let timeLeft = 5;
    const downloadTimer = setInterval(function(){
        if(timeLeft <= 0){
            clearInterval(downloadTimer);
        } else {
            document.getElementById("countdown").innerHTML = timeLeft;
        }
        timeLeft -= 1;
    }, 1000);
</script>

</body>
</html>