<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Registration - Loan Management System</title>
    <style>
        body { font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; background-color: #f4f7f9; display: flex; justify-content: center; align-items: center; min-height: 100vh; margin: 0; }
        .reg-container { background: white; padding: 35px; border-radius: 12px; box-shadow: 0 8px 24px rgba(0,0,0,0.1); width: 400px; }
        h1 { color: #333; text-align: center; margin-bottom: 25px; font-size: 24px; }

        .form-group { margin-bottom: 15px; position: relative; }
        label { display: block; margin-bottom: 8px; font-weight: 600; color: #555; }
        input[type="text"], input[type="email"], input[type="password"], select {
            width: 100%; padding: 12px; border: 1px solid #ddd; border-radius: 6px; box-sizing: border-box; font-size: 14px;
        }
        input:focus { border-color: #007bff; outline: none; box-shadow: 0 0 5px rgba(0,123,255,0.2); }

        /* Status Indicator Styles */
        #userStatus { font-size: 0.85em; display: block; margin-top: 5px; font-weight: bold; }

        /* Checklist Styles */
        #checklist { font-size: 0.85em; list-style-type: none; padding: 10px; background: #f9f9f9; border-radius: 6px; margin-top: 10px; }
        .invalid { color: #dc3545; transition: 0.3s; }
        .valid { color: #28a745; transition: 0.3s; font-weight: bold; }

        input[type="submit"] {
            width: 100%; padding: 12px; background-color: #007bff; color: white; border: none; border-radius: 6px;
            font-size: 16px; font-weight: bold; cursor: pointer; margin-top: 20px; transition: 0.3s;
        }
        input[type="submit"]:hover { background-color: #0056b3; }

        .footer-links { text-align: center; margin-top: 20px; font-size: 0.9em; }
        .footer-links a { color: #007bff; text-decoration: none; }
    </style>
</head>
<body>

<div class="reg-container">
    <h1>Create Account</h1>

    <form name="RegistrationForm" action="/api/register_user" method="post">

        <div class="form-group">
            <label>User Name</label>
            <input type="text" id="userName" name="userName" placeholder="Enter your username" required onkeyup="checkAvailability()"/>
            <span id="userStatus"></span>
        </div>

        <div class="form-group">
            <label>Email Address</label>
            <input type="email" name="email" placeholder="example@mail.com" required/>
        </div>

        <div class="form-group">
            <label>Password</label>
            <input type="password" id="password" name="password" required
                   placeholder="Create a strong password"
                   pattern="^(?=.*[A-Z])(?=.*[0-9])(?=.*[@#$%^&+=!]).{8,}$" />

            <ul id="checklist">
                <li id="len" class="invalid">✖ Minimum 8 characters</li>
                <li id="upper" class="invalid">✖ At least one uppercase letter</li>
                <li id="num" class="invalid">✖ At least one number</li>
                <li id="spec" class="invalid">✖ At least one special character</li>
            </ul>
        </div>

        <div class="form-group">
            <label>Select Role</label>
            <select name="role">
                <option value="CUSTOMER">Customer</option>
                <option value="LOAN_OFFICER">Loan Officer</option>
                <option value="ADMIN">Admin</option>
            </select>
        </div>

        <input type="submit" value="Register Now"/>
    </form>

    <div class="footer-links">
        Already have an account? <a href="/api/home">Login here</a>
    </div>
</div>

<script>
    // --- USERNAME AVAILABILITY CHECK ---
    function checkAvailability() {
        const username = document.getElementById("userName").value;
        const status = document.getElementById("userStatus");

        if (username.length < 3) {
            status.innerHTML = "";
            return;
        }

        // Fetches the boolean from your new controller endpoint
        fetch('/api/check-username?username=' + encodeURIComponent(username))
            .then(response => response.json())
            .then(isTaken => {
                if (isTaken) {
                    status.style.color = "#dc3545";
                    status.innerHTML = "✖ Username already taken";
                } else {
                    status.style.color = "#28a745";
                    status.innerHTML = "✔ Ready to go!";
                }
            })
            .catch(err => console.error("Error checking username:", err));
    }

    // --- PASSWORD CHECKLIST LOGIC ---
    const pwdInput = document.getElementById("password");
    const lenReq = document.getElementById("len");
    const upperReq = document.getElementById("upper");
    const numReq = document.getElementById("num");
    const specReq = document.getElementById("spec");

    pwdInput.addEventListener("input", function() {
        const value = pwdInput.value;
        updateStatus(lenReq, value.length >= 8, "Minimum 8 characters");
        updateStatus(upperReq, /[A-Z]/.test(value), "At least one uppercase letter");
        updateStatus(numReq, /[0-9]/.test(value), "At least one number");
        updateStatus(specReq, /[@#$%^&+=!]/.test(value), "At least one special character (@#$%^&+=!)");
    });

    function updateStatus(element, condition, text) {
        if (condition) {
            element.classList.remove("invalid");
            element.classList.add("valid");
            element.innerText = "✔ " + text;
        } else {
            element.classList.remove("valid");
            element.classList.add("invalid");
            element.innerText = "✖ " + text;
        }
    }
</script>

</body>
</html>