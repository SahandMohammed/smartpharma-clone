<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>Thank You</title>
    <style>
        body {
            background-color: #f8f9fa; /* A light grey background */
            color: #333; /* Dark grey text for better readability */
        }

        .thank-you-container {
            min-height: 100vh; /* Full height */
            display: flex;
            align-items: center;
            justify-content: center;
            flex-direction: column;
            text-align: center;
        }

        h1 {
            font-weight: 700;
            margin-bottom: 0.5rem;
        }

        p {
            font-size: 1.25rem;
            margin-top: 0;
        }
    </style>
</head>
<body>
<div class="container thank-you-container">
    <h1>Thank You for Your Order!</h1>
    <p>Your order has been placed successfully. You will receive a confirmation email shortly.</p>
    <a href="<c:url value='/'/>">Back to Home</a>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
