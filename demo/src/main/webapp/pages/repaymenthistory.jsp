<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Repayment History</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container mt-5">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <div>
            <h2 class="mb-0">Repayment History</h2>
            <small class="text-muted">Showing all successfully processed payments</small>
        </div>
        <a href="dashboard" class="btn btn-outline-secondary">Back to Dashboard</a>
    </div>

    <div class="card shadow">
        <div class="card-body p-0">
            <table class="table table-striped table-hover mb-0">
                <thead class="table-dark">
                    <tr>
                        <th>Payment Date</th>
                        <th>Transaction ID</th>
                        <th>Amount (Rs.)</th>
                        <th>Mode</th>
                        <th>Status</th>
                    </tr>
                </thead>
                <tbody>
                    <c:choose>
                        <c:when test="${not empty historyList}">
                            <c:forEach items="${historyList}" var="item">
                                <tr>
                                    <td>${item.actualPaymentDate}</td>
                                    <td><code class="fw-bold">${item.transactionId}</code></td>
                                    <td>Rs. ${item.emiAmount}</td>
                                    <td>${item.paymentMode}</td>
                                    <td><span class="badge bg-success">SUCCESS</span></td>
                                </tr>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <tr>
                                <td colspan="5" class="text-center py-4 text-muted">No repayment history found.</td>
                            </tr>
                        </c:otherwise>
                    </c:choose>
                </tbody>
            </table>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>