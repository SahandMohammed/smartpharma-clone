<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Order Details</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container">
        <a class="navbar-brand" href="#">Smart Pharma</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav
            ms-auto">
                <li class="nav-item">
                    <a class="nav-link" href="<c:url value='/admin/admin-dashboard'/>">Admin Panel</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<c:url value='/admin/orders'/>">Manage Orders</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<c:url value='/admin/drugs'/>">Manage Drugs</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<c:url value='/logout'/>">Logout</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<div class="container">
    <h1>Order Details for Order ID: ${order.id}</h1>
    <p><strong>Name:</strong> ${order.name}</p>
    <p><strong>Phone:</strong> ${order.phone}</p>
    <p><strong>Address:</strong> ${order.address}</p>
    <h3>Items Ordered:</h3>
    <table class="table">
        <thead>
        <tr>
            <th>Drug Name</th>
            <th>Quantity</th>
            <th>Price Per Unit</th>
            <th>Total Price</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="item" items="${order.items}">
            <tr>
                <td>${item.drug.name}</td>
                <td>${item.quantity}</td>
                <td>${item.drug.price}</td>
                <td>${item.quantity * item.drug.price}</td>
            </tr>
        </c:forEach>
        </tbody>
        <tfoot>
        <tr>
            <th colspan="3">Total Order Cost:</th>
            <th>
                <c:set var="totalCost" value="0"/>
                <c:forEach var="item" items="${order.items}">
                    <c:set var="totalCost" value="${totalCost + (item.quantity * item.drug.price)}"/>
                </c:forEach>
                $${totalCost}
            </th>
        </tr>
        </tfoot>
    </table>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
