<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="<c:url value='/assets/css/style.css'/>">
    <title>Search Results</title>
</head>
<body>
<nav>
    <!-- Navigation setup -->
</nav>
<div class="search-results-container">
    <h1>Search Results</h1>
    <div class="results">
        <c:if test="${not empty drugs}">
            <c:forEach items="${drugs}" var="drug">
                <div class="result-item">
                    <a href="<c:url value='/drugs/druginfo?id=${drug.id}'/>">${drug.name}</a>
                </div>
            </c:forEach>
        </c:if>
        <c:if test="${empty drugs}">
            <p>No results found.</p>
        </c:if>
    </div>
</div>
</body>
</html>
