<%@ page import="com.uniq.smartpharma.model.Drugs" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Edit Drug</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-4">
    <h1>Edit Drug Details</h1>
    <form:form modelAttribute="drug" action="${pageContext.request.contextPath}/admin/drugs/update" method="post"
               class="mt-3">
        <form:hidden path="id"/>

        <div class="mb-3">
            <label for="name" class="form-label">Name:</label>
            <form:input path="name" type="text" class="form-control" id="name" required="true"/>
        </div>
        <div class="mb-3">
            <label for="description" class="form-label">Description:</label>
            <form:textarea path="description" rows="3" class="form-control" id="description" required="true"/>
        </div>
        <div class="mb-3">
            <label for="usage" class="form-label">Usage:</label>
            <form:input path="usage" type="text" class="form-control" id="usage" required="true"/>
        </div>
        <div class="mb-3">
            <label for="sideEffects" class="form-label">Side Effects:</label>
            <form:input path="sideEffects" type="text" class="form-control" id="sideEffects" required="true"/>
        </div>
        <div class="mb-3">
            <label for="isOTC" class="form-label">Available Over-the-Counter:</label>
            <select class="form-select" id="isOTC" name="isOTC">
                <option value="true" ${drug.isOTC ? 'selected' : ''}>Yes</option>
                <option value="false" ${!drug.isOTC ? 'selected' : ''}>No</option>
            </select>
        </div>
        <div class="mb-3">
            <label for="price" class="form-label">Price ($):</label>
            <form:input path="price" type="number" class="form-control" id="price" step="0.01" required="true"/>
        </div>
        <button type="submit" class="btn btn-primary">Update Drug</button>
    </form:form>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
