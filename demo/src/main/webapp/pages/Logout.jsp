<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Logged Out</title>
    <style>
        body { font-family: Arial, sans-serif; text-align: center; margin-top: 100px; }
        .logout-box { border: 1px solid #ddd; display: inline-block; padding: 30px; border-radius: 8px; box-shadow: 0 4px 8px rgba(0,0,0,0.1); }
        .btn { background-color: #007bff; color: white; padding: 10px 20px; text-decoration: none; border-radius: 5px; }
    </style>
</head>
<body>

<div class="logout-box">
    <h2 style="color: #666;">Successfully Logged Out</h2>
    <p>${message}</p>
    <br>
    <p>Thank you for using our system.</p>
    <br><br>
    <a href="/api/home" class="btn">Login Again</a>
</div>

</body>
</html>