<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Registration Successful</title>
    <style>
        body { font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; background-color: #f4f7f9; display: flex; justify-content: center; align-items: center; height: 100vh; margin: 0; }
        .success-card { background: white; padding: 40px; border-radius: 12px; box-shadow: 0 10px 25px rgba(0,0,0,0.1); text-align: center; max-width: 450px; border-top: 5px solid #28a745; }
        .icon-circle { width: 80px; height: 80px; background-color: #d4edda; color: #28a745; border-radius: 50%; display: flex; align-items: center; justify-content: center; font-size: 40px; margin: 0 auto 20px; }
        h1 { color: #28a745; margin-bottom: 10px; }
        p { color: #555; font-size: 1.1em; line-height: 1.6; }
        .user-name { color: #007bff; font-weight: bold; }
        .btn-login { background-color: #007bff; color: white; padding: 12px 30px; text-decoration: none; border-radius: 6px; font-weight: bold; display: inline-block; margin-top: 25px; transition: background 0.3s; }
        .btn-login:hover { background-color: #0056b3; }
    </style>
</head>
<body>

    <div class="success-card">
        <div class="icon-circle">✔</div>
        <h1>Account Created!</h1>

        <p>
            Congratulations <span class="user-name">${name}</span>!<br>
            Your account has been successfully registered in the <strong>Loan Management System</strong>.
        </p>

        <p style="font-size: 0.9em; color: #888;">
            You can now use your credentials to log in and manage your loans.
        </p>

        <a href="/api/home" class="btn-login">Proceed to Login</a>
    </div>

</body>
</html>