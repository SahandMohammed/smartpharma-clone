<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Manage Drugs</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .container {
            margin-top: 20px;
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
<div class="container">
    <h1>Manage Drugs</h1>

    <!-- Display success message from flash attributes -->
    <c:if test="${not empty message}">
        <div class="alert alert-success" role="alert">
                ${message}
        </div>
    </c:if>

    <a href="<c:url value="/admin/drugs/add"/>" class="btn btn-primary mb-3">Add New Drug</a>
    <table class="table table-striped">
        <thead class="table-dark">
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Price</th>
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
                <td>${drug.description}</td>
                <td class="btn-actions">
                    <a href="/edit-drug?id=${drug.id}" class="btn btn-info">Edit</a>
                    <a href="/delete-drug?id=${drug.id}" class="btn btn-danger">Delete</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
