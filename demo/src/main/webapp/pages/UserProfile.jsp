<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>User Profile</title>
    <style>
        body { font-family: Arial, sans-serif; background-color: #f4f7f6; }
        .profile-card { background: white; width: 400px; margin: 50px auto; padding: 20px; border-radius: 10px; box-shadow: 0 4px 8px rgba(0,0,0,0.1); }
        .profile-header { text-align: center; border-bottom: 2px solid #007bff; padding-bottom: 10px; }
        .info-group { margin: 15px 0; font-size: 1.1em; }
        .label { font-weight: bold; color: #555; }
        .back-btn { display: inline-block; margin-top: 20px; text-decoration: none; color: #007bff; }
    </style>
</head>
<body>

<div class="profile-card">
    <div class="profile-header">
        <h2>My Profile</h2>
    </div>

    <div class="info-group">
        <span class="label">Username:</span> <span>${user.userName}</span>
    </div>

    <div class="info-group">
        <span class="label">Assigned Role:</span> <span>${user.role}</span>
    </div>

    <%-- Add other fields here if your User entity has them, like Email or Phone --%>

    <a href="/api/home" class="back-btn">← Back to Dashboard</a>
</div>

</body>
</html>