<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>EMI Schedule</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container mt-5">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <div>
            <h2 class="mb-0">Upcoming EMI Schedule</h2>
            <p class="text-muted">Plan your future payments and avoid late fees.</p>
        </div>
        <div>
            <a href="dashboard" class="btn btn-outline-secondary me-2">Back to Dashboard</a>
            <a href="paymentForm?loanId=${param.loanId}" class="btn btn-primary">Make a Payment</a>
        </div>
    </div>

    <div class="card shadow border-0">
        <div class="card-body p-0">
            <table class="table table-hover mb-0">
                <thead class="table-primary">
                    <tr>
                        <th>Installment Date</th>
                        <th>Amount Due (Rs.)</th>
                        <th>Status</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:choose>
                        <c:when test="${not empty scheduleList}">
                            <c:forEach items="${scheduleList}" var="item">
                                <tr>
                                    <td class="fw-bold">
                                        ${item.dueDate}
                                    </td>
                                    <td>
                                        Rs. <fmt:formatNumber value="${item.emiAmount}" minFractionDigits="2" />
                                    </td>
                                    <td>
                                        <span class="badge bg-warning text-dark">
                                            ${item.paymentStatus}
                                        </span>
                                    </td>
                                    <td>
                                        <a href="paymentForm?loanId=${item.loanId}&amount=${item.emiAmount}"
                                           class="btn btn-sm btn-success">Pay Now</a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <tr>
                                <td colspan="4" class="text-center py-5 text-muted">
                                    <i class="bi bi-info-circle"></i> No upcoming EMIs scheduled for this loan.
                                </td>
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