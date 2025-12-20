<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Login Failed</title>
    <style>
        body { font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; background-color: #fff5f5; display: flex; justify-content: center; align-items: center; height: 100vh; margin: 0; }
        .failure-card { background: white; padding: 40px; border-radius: 12px; box-shadow: 0 10px 25px rgba(0,0,0,0.1); text-align: center; max-width: 450px; border-top: 5px solid #dc3545; }
        h2 { color: #dc3545; margin-bottom: 15px; }
        .error-msg { color: #555; font-size: 1.1em; margin-bottom: 30px; line-height: 1.6; }
        .btn-register { background-color: #28a745; color: white; padding: 12px 25px; text-decoration: none; border-radius: 6px; font-weight: bold; display: inline-block; transition: background 0.3s; }
        .btn-register:hover { background-color: #218838; }
        .back-link { display: block; margin-top: 20px; color: #666; font-size: 0.9em; }
    </style>
</head>
<body>

    <div class="failure-card">
        <div style="font-size: 50px; margin-bottom: 10px;">⚠️</div>
        <h2>Invalid Details, Please Register!</h2>

        <p class="error-msg">
            The account details you entered were not found in our system.
            If you are a new user, please create an account to access the Loan Management System.
        </p>

        <a href="/api/User_register_form" class="btn-register">Create New Account</a>

        <a href="/api/home" class="back-link">Try Logging In Again</a>
    </div>

</body>
</html>