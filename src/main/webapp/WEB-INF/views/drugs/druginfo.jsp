<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="<c:url value='/assets/css/druginfo.css'/>">
    <title>Drug Information</title>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid c-padding">
        <a class="navbar-brand" href="<c:url value="/"/>"><span class="brand-color">Smart</span>Pharma</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav me-auto">
                <li class="nav-item">
                    <form class="d-flex navbar-search" method="get" action="<c:url value='/drugs/search'/>">
                        <input class="form-control me-2" name="query" value="${param.query}" id="query" type="search"
                               placeholder="Search for medicine..."
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
                            <a class="nav-link" href="<c:url value="/login"/>">Login</a>
                        </li>
                    </c:otherwise>
                </c:choose>
            </ul>
        </div>
    </div>
</nav>

<div class="container mt-5">
    <div class="card">
        <div class="card-body">
            <h1 class="card-title">${drug.name}</h1>
            <p class="card-text"><strong>Description:</strong> ${drug.description}</p>
            <p class="card-text"><strong>Usage:</strong> ${drug.usage}</p>
            <p class="card-text"><strong>Side Effects:</strong> ${drug.sideEffects}</p>
            <c:if test="${drug.isOTC()}">
                <h3>Price: $${drug.price}</h3>
                <div class="mb-3">
                    <label for="quantity" class="form-label">Quantity:</label>
                    <input type="number" class="form-control" id="quantity" name="quantity" min="1" value="1">
                </div>
                <button onclick="addToCart(${drug.id}, $('#quantity').val())" class="btn btn-success">Add to Cart
                </button>
            </c:if>
        </div>
    </div>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://kit.fontawesome.com/7bba4c01e2.js" crossorigin="anonymous"></script>
<script>
    function addToCart(drugId, quantity) {
        $.post("<c:url value='/add-to-cart'/>", {id: drugId, quantity: quantity}, function (response) {
            alert('Added to cart successfully!');
        }).fail(function () {
            alert('Failed to add to cart.');
        });
    }
</script>
</body>
</html>
