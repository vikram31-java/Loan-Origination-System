<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login Page</title>
    <style>
        body { font-family: Arial, sans-serif; display: flex; justify-content: center; margin-top: 50px; }
        .login-container { border: 1px solid #ccc; padding: 20px; border-radius: 8px; width: 300px; }
        .error { color: red; font-size: 0.9em; }
        .input-group { margin-bottom: 15px; }
        label { display: block; margin-bottom: 5px; }
        input { width: 100%; padding: 8px; box-sizing: border-box; }
        button { width: 100%; padding: 10px; background-color: #28a745; color: white; border: none; cursor: pointer; }
    </style>
</head>
<body>

<div class="login-container">
    <h2>User Login</h2>

    <%-- This displays the "Server Error" message from your Controller --%>
    <p class="error">${message}</p>

    <%-- The 'modelAttribute="user"' must match the name in your @ModelAttribute --%>
    <form:form action="/api/login" method="post" modelAttribute="user">

        <div class="input-group">
            <label>Username:</label>
            <form:input path="userName" />
            <form:errors path="userName" cssClass="error" />
        </div>

        <div class="input-group">
            <label>Password:</label>
            <form:password path="password" />
            <form:errors path="password" cssClass="error" />
        </div>
        <div class="input-group">
            <label>Role:</label>
            <form:select path="role">
                <form:option value="" label="-- Select Role --"/>
                <form:option value="ADMIN" label="Admin"/>
                <form:option value="USER" label="User"/>
                <form:option value="LOAN_OFFICER" label="Loan Officer"/>
            </form:select>
            <form:errors path="role" cssClass="error" />
        </div>

        <button type="submit">Login</button>
    </form:form>

    <br>
    <a href="/api/User_register_form">New User? Register here</a>
</div>

</body>
</html>