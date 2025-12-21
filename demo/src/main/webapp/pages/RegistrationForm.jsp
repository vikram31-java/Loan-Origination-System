<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Join LoanOS | Registration</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
    <style>
        body { background: #f0f2f5; font-family: 'Segoe UI', sans-serif; height: 100vh; display: flex; align-items: center; }
        .reg-card { border-radius: 15px; border: none; box-shadow: 0 10px 30px rgba(0,0,0,0.1); }
        .availability-text { font-size: 0.85rem; margin-top: 5px; min-height: 20px; }
    </style>
</head>
<body>
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-6 col-lg-5">
            <div class="card reg-card p-4 p-md-5">
                <div class="text-center mb-4">
                    <i class="bi bi-person-plus-fill text-primary" style="font-size: 2.5rem;"></i>
                    <h2 class="fw-bold text-primary mt-2">Create Account</h2>
                    <p class="text-muted">Join the Loan Origination System</p>
                </div>

                <c:if test="${not empty serverError}">
                    <div class="alert alert-danger py-2 small d-flex align-items-center">
                        <i class="bi bi-exclamation-triangle-fill me-2"></i> ${serverError}
                    </div>
                </c:if>

                <form action="${pageContext.request.contextPath}/api/register_user" method="post" id="regForm">
                    <%-- Manual CSRF hidden field if not using spring:form tags --%>
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

                    <div class="mb-3">
                        <label class="form-label fw-semibold">Username</label>
                        <div class="input-group">
                            <span class="input-group-text bg-white"><i class="bi bi-person"></i></span>
                            <input type="text" name="userName" id="userName" class="form-control" placeholder="Choose unique username" required>
                        </div>
                        <div id="usernameFeedback" class="availability-text"></div>
                    </div>

                    <div class="mb-3">
                        <label class="form-label fw-semibold">Email Address</label>
                        <div class="input-group">
                            <span class="input-group-text bg-white"><i class="bi bi-envelope"></i></span>
                            <input type="email" name="email" class="form-control" placeholder="name@example.com" required>
                        </div>
                    </div>

                    <div class="mb-3">
                        <label class="form-label fw-semibold">Password</label>
                        <div class="input-group">
                            <span class="input-group-text bg-white"><i class="bi bi-lock"></i></span>
                            <input type="password" name="password" class="form-control" placeholder="Min. 8 characters" required minlength="8">
                        </div>
                    </div>

                    <div class="mb-4">
                        <label class="form-label fw-semibold">User Role</label>
                        <select name="role" class="form-select border-primary-subtle" required>
                            <option value="" selected disabled>Select your role...</option>
                            <option value="CUSTOMER">Customer (Borrower)</option>
                            <option value="LOAN_OFFICER">Loan Officer (Approver)</option>
                            <option value="ADMIN">System Administrator</option>
                        </select>
                        <div class="form-text small"><i class="bi bi-info-circle"></i> Permissions are based on the selected role.</div>
                    </div>

                    <div class="d-grid">
                        <button type="submit" class="btn btn-primary btn-lg fw-bold shadow-sm" id="submitBtn">
                            <i class="bi bi-check-circle me-2"></i>Register Now
                        </button>
                    </div>
                </form>

                <div class="text-center mt-4">
                    <span class="text-muted">Already have an account? <a href="${pageContext.request.contextPath}/api/home" class="text-decoration-none fw-bold">Login</a></span>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    const usernameInput = document.getElementById('userName');
    const feedback = document.getElementById('usernameFeedback');
    const submitBtn = document.getElementById('submitBtn');
    const contextPath = '${pageContext.request.contextPath}';

    usernameInput.addEventListener('input', function() {
        const username = this.value;
        if (username.length < 3) {
            feedback.innerHTML = '';
            return;
        }

        feedback.innerHTML = '<span class="text-muted"><i class="bi bi-hourglass-split"></i> Checking...</span>';

        fetch(contextPath + '/api/check-username?username=' + encodeURIComponent(username))
            .then(response => response.json())
            .then(isTaken => {
                if (isTaken) {
                    feedback.innerHTML = '<i class="bi bi-x-circle-fill"></i> Username already taken';
                    feedback.className = 'availability-text text-danger animate__animated animate__shakeX';
                    submitBtn.disabled = true;
                } else {
                    feedback.innerHTML = '<i class="bi bi-check-circle-fill"></i> Username available';
                    feedback.className = 'availability-text text-success';
                    submitBtn.disabled = false;
                }
            })
            .catch(err => {
                console.error('Error checking username:', err);
                feedback.innerHTML = '';
            });
    });
</script>
</body>
</html>