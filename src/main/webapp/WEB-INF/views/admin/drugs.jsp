<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Manage Drugs</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        table {
            border-radius: 30px;
        }

        th, td {
            text-align: left;
            vertical-align: middle;
        }

        .btn-actions {
            display: flex;
            gap: 10px;
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
<div class="container" style="margin-top: 30px;">
    <h1>Manage Drugs</h1>

    <!-- Display success message from flash attributes -->
    <c:if test="${not empty message}">
        <div class="alert alert-success" role="alert">
                ${message}
        </div>
    </c:if>

    <a href="<c:url value="/admin/drugs/add"/>" class="btn btn-primary mb-3">Add New Drug</a>
    <input type="text" id="searchInput" class="form-control mb-3" placeholder="Search by name or ID...">

    <table class="table table-striped">
        <thead class="table-dark">
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Price</th>
            <th>is OTC?</th>
            <th>Description</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${drugs}" var="drug">
            <tr>
                <td>${drug.id}</td>
                <td>${drug.name}</td>
                <td>${drug.price}</td>
                <td>${drug.isOTC()}</td>
                <td>${drug.description}</td>
                <td class="btn-actions">
                    <a href="<c:url value='/admin/drugs/edit/${drug.id}'/>" class="btn btn-info">Edit</a>
                    <a href="<c:url value='/admin/drugs/delete/${drug.id}'/>" class="btn btn-danger">Delete</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
    document.addEventListener('DOMContentLoaded', function () {
        const searchInput = document.getElementById('searchInput');
        searchInput.addEventListener('keyup', function (e) {
            const searchText = e.target.value.toLowerCase();
            const rows = document.querySelectorAll('tbody tr');
            rows.forEach(row => {
                // Assuming the ID is in the first cell (index 0) and the name is in the second cell (index 1)
                const id = row.cells[0].textContent.toLowerCase();
                const name = row.cells[1].textContent.toLowerCase();
                if (id.includes(searchText) || name.includes(searchText)) {
                    row.style.display = ''; // Show the row if the search matches
                } else {
                    row.style.display = 'none'; // Hide the row if the search does not match
                }
            });
        });
    });
</script>


</body>
</html>
