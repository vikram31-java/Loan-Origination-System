<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Dashboard - Success</title>
    <style>
        body { font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; background-color: #f0f2f5; margin: 0; }
        .navbar { background-color: #007bff; color: white; padding: 15px 30px; display: flex; justify-content: space-between; align-items: center; box-shadow: 0 2px 5px rgba(0,0,0,0.1); }
        .logout-btn { background-color: #dc3545; color: white; padding: 8px 15px; text-decoration: none; border-radius: 4px; font-weight: bold; transition: 0.3s; }
        .logout-btn:hover { background-color: #c82333; }
        .container { max-width: 800px; margin: 50px auto; background: white; padding: 40px; border-radius: 10px; box-shadow: 0 4px 12px rgba(0,0,0,0.1); text-align: center; }
        .role-badge { background-color: #e9ecef; color: #495057; padding: 5px 12px; border-radius: 20px; font-size: 0.9em; font-weight: bold; border: 1px solid #ced4da; text-transform: uppercase; }
        h1 { color: #28a745; margin-bottom: 10px; }

        /* Quick Actions Styling */
        .actions-box { margin-top: 30px; text-align: left; background: #f8f9fa; padding: 25px; border-left: 5px solid #007bff; border-radius: 0 8px 8px 0; }
        .actions-list { list-style: none; padding: 0; margin-top: 15px; }
        .actions-list li { margin-bottom: 12px; padding-left: 25px; position: relative; }
        .actions-list li::before { content: "→"; position: absolute; left: 0; color: #007bff; font-weight: bold; }
        .action-link { color: #007bff; text-decoration: none; font-weight: 500; font-size: 1.1em; }
        .action-link:hover { text-decoration: underline; color: #0056b3; }
        .disabled-action { color: #888; cursor: not-allowed; }
    </style>
</head>
<body>

    <div class="navbar">
        <div><strong>Loan Management System</strong></div>
        <div>
            <span>Welcome, <strong>${Name}</strong></span>
            <span class="role-badge">${Role}</span>
            <a href="/api/logout" class="logout-btn" style="margin-left: 15px;">Logout</a>
        </div>
    </div>

    <div class="container">
        <h1>Login Successful!</h1>
        <hr>
        <p style="font-size: 1.2em; color: #444;">
            Hello <strong>${Name}</strong>, you have successfully accessed the system as a <strong>${Role}</strong>.
        </p>

        <div class="actions-box">
            <h3>Quick Actions:</h3>
            <ul class="actions-list">
                <li>
                    <a href="/api/profile" class="action-link">View Profile Details</a>
                </li>
                <li>
                    <span class="disabled-action">Check Loan Status (Maintenance)</span>
                </li>
                <li>
                    <span class="disabled-action">Submit Feedback</span>
                </li>
            </ul>
        </div>
    </div>

</body>
</html>