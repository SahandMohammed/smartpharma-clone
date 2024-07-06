<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="<c:url value='/assets/css/search.css'/>">
    <title>Search Results</title>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid c-padding">
        <a class="navbar-brand" href="#"><span class="brand-color">Smart</span>Pharma</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav me-auto">
                <li class="nav-item">
                    <form class="d-flex navbar-search" method="get" action="<c:url value='/drugs/search'/>">
                        <input class="form-control me-2" name="query" id="query" type="search" placeholder="Search for medicine..."
                               aria-label="Search">
                        <a href="#" class="icon" id="submitSearch"><i
                                class="fa-solid fa-magnifying-glass icon-search"></i></a>
                    </form>
                </li>
            </ul>
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" href="<c:url value='/cart'/>">
                        <i class="fa-solid fa-cart-shopping"></i>
                        <span class="badge bg-secondary">${cart.size}</span>
                    </a>
                </li>
                <c:choose>
                    <c:when test="${not empty sessionScope.user}">
                        <li class="nav-item">
                            <a class="nav-link">Welcome, ${sessionScope.user.username}!</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="<c:url value='/logout'/>">Logout</a>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li class="nav-item">
                            <a class="nav-link" href="login">Login</a>
                        </li>
                    </c:otherwise>
                </c:choose>
            </ul>
        </div>
    </div>
</nav>

<div class="container mt-4">
    <h1 class="mb-3">Search Results</h1>
    <div class="list-group">
        <c:if test="${not empty drugs}">
            <c:forEach items="${drugs}" var="drugs">
                <a href="<c:url value='/drugs/druginfo?id=${drugs.id}'/>"
                   class="list-group-item list-group-item-action d-flex justify-content-between align-items-center">
                    <span class="text-primary font-weight-bold">${drugs.name}</span>
                    <small class="text-muted">${drugs.description}</small>
                </a>
            </c:forEach>
        </c:if>
        <c:if test="${empty drugs}">
            <p class="list-group-item">No results found.</p>
        </c:if>
    </div>
</div>

<script src="https://kit.fontawesome.com/7bba4c01e2.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
