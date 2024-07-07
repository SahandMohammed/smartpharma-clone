<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="<c:url value='/assets/css/cart.css'/>">
    <title>Cart</title>
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
<div class="container mt-4">
    <h2>Your Shopping Cart</h2>
    <table class="table">
        <thead>
        <tr>
            <th scope="col">Item</th>
            <th scope="col">Price</th>
            <th scope="col">Quantity</th>
            <th scope="col">Total</th>
            <th scope="col">Action</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${cart.items}" var="item">
            <tr>
                <td>${item.drug.name}</td>
                <td>$${item.drug.price}</td>
                <td>
                    <form action="<c:url value='/update-cart'/>" method="post">
                        <input type="hidden" name="id" value="${item.drug.id}"/>
                        <input type="number" name="quantity" value="${item.quantity}" class="form-control" min="1"
                               style="width: 80px; display: inline-block;"/>
                        <button type="submit" class="btn btn-info btn-sm">Update</button>
                    </form>
                </td>
                <td>$${item.totalPrice}</td>
                <td>
                    <a href="<c:url value='/remove-from-cart?id=${item.drug.id}'/>"
                       class="btn btn-danger btn-sm">Remove</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
        <tfoot>
        <tr>
            <th colspan="3">Total</th>
            <th>$${cart.totalCost}</th>
            <th></th>
        </tr>
        </tfoot>
    </table>
    <a href="<c:url value='/orders/checkout'/>" class="btn btn-success">Proceed to Checkout</a>
</div>
<script src="https://kit.fontawesome.com/7bba4c01e2.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
