<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Registration Failed</title>
    <style>
        body { font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; background-color: #fff5f5; display: flex; justify-content: center; align-items: center; height: 100vh; margin: 0; }
        .failure-card { background: white; padding: 40px; border-radius: 12px; box-shadow: 0 10px 25px rgba(0,0,0,0.1); text-align: center; max-width: 450px; border-top: 5px solid #dc3545; }
        .icon-circle { width: 80px; height: 80px; background-color: #f8d7da; color: #dc3545; border-radius: 50%; display: flex; align-items: center; justify-content: center; font-size: 40px; margin: 0 auto 20px; }
        h2 { color: #dc3545; margin-bottom: 15px; }
        p { color: #555; font-size: 1.1em; line-height: 1.6; }
        .btn-retry { background-color: #6c757d; color: white; padding: 12px 30px; text-decoration: none; border-radius: 6px; font-weight: bold; display: inline-block; margin-top: 25px; transition: 0.3s; }
        .btn-retry:hover { background-color: #5a6268; }
        .home-link { display: block; margin-top: 15px; color: #007bff; text-decoration: none; font-size: 0.9em; }
    </style>
</head>
<body>

    <div class="failure-card">
        <div class="icon-circle">✖</div>
        <h2>Registration Failed!</h2>

        <p>
            Please enter valid details. There was an error processing your request or the information provided was incorrect.
        </p>

        <a href="/api/User_register_form" class="btn-retry">Try Again</a>

        <a href="/api/home" class="home-link">Back to Login Page</a>
    </div>

</body>
</html>