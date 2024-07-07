<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>Admin Dashboard</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
        }

        .sidebar {
            padding: 3rem 3rem;
            min-height: 100vh;
            background-color: #f8f9fa;
            border-right: 1px solid #dee2e6;
        }

        .nav-link {
            color: #333;
        }

        .nav-link:hover {
            color: #0056b3;
        }

        .active {
            color: #007bff;
        }

        .container-fluid {
            padding-left: 0;
            padding-right: 0;
        }
    </style>
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <!-- Sidebar -->
        <div class="col-md-2 sidebar">
            <h4 class="text-center py-3">Admin Panel</h4>
            <ul class="nav flex-column">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="<c:url value='/admin/admin-dashboard'/>">Dashboard</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<c:url value='/admin/drugs'/>">Manage Drugs</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<c:url value='/admin/orders'/>">Manage Orders</a>
                </li><li class="nav-item">
                    <a class="nav-link" href="<c:url value='/'/>">Home Page</a>
                </li>
            </ul>
        </div>
        <!-- Main Content -->
        <div class="col-md-10" style="padding: 2rem;">
            <h1 class="mt-4 ms-4">Welcome to the Admin Dashboard</h1>
            <p class="ms-4">Select an option from the sidebar to manage the system.</p>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
