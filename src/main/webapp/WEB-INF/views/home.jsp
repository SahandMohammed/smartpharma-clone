<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@100;300;400;500;700;800&family=Poppins:wght@400;500;600;700&family=Sacramento&display=swap"
          rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="stylesheet" href="<c:url value='/assets/css/style.css'/>">
    <title>Smart Pharma</title>
</head>

<body>
<!-- Navigation -->
<nav>
    <!-- Left Side -->
    <div class="container">
        <div class="brand-logo">
            <a href="#">Smart<span>Pharma</span></a>
        </div>
        <!-- Middle -->
        <div class="nav-list">
            <ul>
                <li class="nav-links"><a href="index.jsp">Home</a></li>
                <li class="nav-links"><a href="about.jsp">About Us</a></li>
                <li class="nav-links"><a href="#">Contribute</a></li>
                <li class="nav-links"><a href="contact.jsp">Contact Us</a></li>
            </ul>
        </div>
        <!-- Right Side -->
        <div class="user-actions">
            <ul>
                <c:choose>
                    <c:when test="${not empty sessionScope.user}">
                        <li class="nav-links login"><a href="<c:url value='/logout'/>"><i
                                class="fa-solid fa-right-to-bracket"></i>Logout</a></li>
                        <li>
                            <p>Hey! ${sessionScope.user.username}</p>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li class="nav-links login"><a href="login"><i class="fa-solid fa-right-to-bracket"></i>Login</a>
                        </li>
                    </c:otherwise>
                </c:choose>
                <a href="#" class="sun-icon"><i class="sun-ic fa-regular fa-sun fa-xl"></i></a>
            </ul>
        </div>
    </div>
</nav>
<!-- Hero Section -->
<div class="hero">
    <div class="container">
        <!-- Heading and Subheading -->
        <div class="hero-text">
            <h1 class="hero-h1">Smart<span class="hero-span">Pharma</span></h1>
            <p class="hero-subheading">Smart Pharma is a web application that helps you to find the best medicine for
                your disease.</p>
            <!-- Search Bar -->
            <div class="search-container">
                <form:form action="" method="GET">
                    <input class="search-bar" type="text" name="search" placeholder="Search for medicine..." value="">
                    <a href="#"><i class="fa-solid fa-magnifying-glass icon-search"></i></a>
                </form:form>
                <div id="recent-searches"></div>
            </div>
        </div>
    </div>
</div>

<!-- Featured Section -->
<div class="featured">
    <div class="container">
        <h1>Our services is 24/7</h1>
        <p>Aliquam neque nisi molestiae blanditiis odio, quis molestias sunt earum facilis doloribus quidem beatae.
            Quisquam!</p>
        <ul>
            <li>
                <h1>content</h1>
                <p>content</p>
            </li>
            <li>
                <h1>content</h1>
                <p>content</p>
            </li>
            <p>content</p>
            </li>
        </ul>
    </div>
</div>

<script src="https://kit.fontawesome.com/7bba4c01e2.js" crossorigin="anonymous"></script>
<script src="src/js/index.js"></script>
</body>

</html>

