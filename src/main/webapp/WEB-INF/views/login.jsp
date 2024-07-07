<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css?family=Poppins&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>Login - Smart Pharma</title>
</head>

<body class="bg-light">
<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card">
                <h5 class="card-header">Login to Smart Pharma</h5>
                <div class="card-body">
                    <c:if test="${not empty error}">
                        <div class="alert alert-danger">${error}</div>
                    </c:if>
                    <form:form modelAttribute="user" action="${pageContext.request.contextPath}/login" method="post"
                               class="form">
                        <div class="mb-3">
                            <form:label path="email" class="form-label">Email:</form:label>
                            <form:input path="email" type="email" class="form-control" id="email" required="required"/>
                        </div>
                        <div class="mb-3">
                            <form:label path="password" class="form-label">Password:</form:label>
                            <form:password path="password" class="form-control" id="password" required="required"/>
                        </div>
                        <button type="submit" class="btn btn-primary">Login</button>
                    </form:form>
                </div>
            </div>
            <p class="text-center mt-3">Don't have an account? <a href="<c:url value='/register'/>">Register here</a>
            </p>
        </div>
    </div>
</div>
<script src="https://kit.fontawesome.com/7bba4c01e2.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
</body>
</html>
