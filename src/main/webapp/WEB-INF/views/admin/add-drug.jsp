<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Add New Drug</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .section {
            margin-top: 20px;
        }
    </style>
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
                    <a class="nav-link" href="<c:url value='/'/>">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<c:url value='/logout'/>">Logout</a>
                </li>
            </ul>
        </div>
    </div>
</nav>
<div class="container section">
    <h1>Add New Drug</h1>
    <form action="<c:url value='/admin/drugs/add'/>" method="post">
        <div class="mb-3">
            <label for="name" class="form-label">Name:</label>
            <input type="text" class="form-control" id="name" name="name" required>
        </div>
        <div class="mb-3">
            <label for="description" class="form-label">Description:</label>
            <textarea class="form-control" id="description" name="description" required></textarea>
        </div>
        <div class="mb-3">
            <label for="usage" class="form-label">Usage:</label>
            <input type="text" class="form-control" id="usage" name="usage" required>
        </div>
        <div class="mb-3">
            <label for="sideEffects" class="form-label">Side Effects:</label>
            <input type="text" class="form-control" id="sideEffects" name="sideEffects" required>
        </div>
        <div class="mb-3">
            <label for="isOTC" class="form-label">Available Over-the-Counter:</label>
            <select class="form-select" id="isOTC" name="isOTC">
                <option value="true">Yes</option>
                <option value="false">No</option>
            </select>

        </div>
        <div class="mb-3">
            <label for="price" class="form-label">Price:</label>
            <input type="number" class="form-control" id="price" name="price" step="0.01" required>
        </div>
        <button type="submit" class="btn btn-primary">Add Drug</button>
    </form>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
    function togglePriceInput() {
        var isOTC = document.getElementById('isOTC').value;
        var priceInput = document.getElementById('price');
        priceInput.disabled = (isOTC === 'false'); // Disable if OTC is 'No'
        if (isOTC === 'false') {
            priceInput.value = ''; // Clear price if disabled
        }
    }

    // Call the function on load to set the initial state
    document.addEventListener('DOMContentLoaded', function () {
        togglePriceInput();
    });

    // Also attach the function to the change event of the select element
    document.getElementById('isOTC').addEventListener('change', togglePriceInput);
</script>
</body>
</html>
