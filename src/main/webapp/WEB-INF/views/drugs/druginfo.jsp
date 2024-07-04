<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="<c:url value='/assets/css/style.css'/>">
    <title>Drug Information</title>
    <style>
        body {
            padding-top: 20px;
            background-color: #f4f4f4;
        }

        .drug-info-container {
            background-color: #ffffff;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin: 20px auto;
            width: 80%;
            max-width: 800px;
        }

        .drug-info-container h1 {
            color: #0056b3;
        }
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">SmartPharma</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" href="index.jsp">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="about.jsp">About Us</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="contact.jsp">Contact Us</a>
                </li>
                <c:choose>
                    <c:when test="${not empty sessionScope.user}">
                        <li class="nav-item">
                            <a class="nav-link">Hello, ${sessionScope.user.username}!</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="<c:url value='/logout'/>">Logout</a>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li class="nav-item">
                            <a class="nav-link" href="login.jsp">Login</a>
                        </li>
                    </c:otherwise>
                </c:choose>
            </ul>
        </div>
    </div>
</nav>
<div class="container">
    <div class="drug-info-container">
        <h1>${drug.name}</h1>
        <p><strong>Description:</strong> ${drug.description}</p>
        <p><strong>Usage:</strong> ${drug.usage}</p>
        <p><strong>Side Effects:</strong> ${drug.sideEffects}</p>
    </div>
</div>
<script src="https://kit.fontawesome.com/7bba4c01e2.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
