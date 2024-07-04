<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="<c:url value='/assets/css/style.css'/>">
    <title>Drug Information</title>
</head>
<body>
<nav>
    <!-- Navigation setup -->
</nav>
<div class="drug-info-container">
    <h1>${drug.name}</h1>
    <p>Description: ${drug.description}</p>
    <p>Usage: ${drug.usage}</p>
    <p>Side Effects: ${drug.sideEffects}</p>
</div>
</body>
</html>
