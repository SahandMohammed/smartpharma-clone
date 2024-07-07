<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>Admin Dashboard</title>
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <!-- Sidebar -->
        <div class="col-md-2">
            <h4>Admin Panel</h4>
            <ul class="nav flex-column">
                <li class="nav-item">
                    <a class="nav-link active" href="/admin-dashboard">Dashboard</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<c:url value="/admin/drugs"/>">Manage Drugs</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/admin-orders">Manage Orders</a>
                </li>
            </ul>
        </div>
        <!-- Main Content -->
        <div class="col-md-10">
            <h1>Welcome to the Admin Dashboard</h1>
            <p>Select an option from the sidebar to manage the system.</p>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
