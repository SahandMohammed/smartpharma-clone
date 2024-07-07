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
                                class="fa-solid fa-right-to-bracket"></i> Logout</a></li>
                        <li>
                            <p>Hey! ${sessionScope.user.username}</p>
                        </li>
                        <!-- Check if user is admin -->
                        <c:if test="${sessionScope.user.isAdmin()}">
                            <li class="nav-links"><a href="<c:url value='/admin/admin-dashboard'/>">Admin Panel</a></li>
                        </c:if>
                    </c:when>
                    <c:otherwise>
                        <li class="nav-links login"><a href="login"><i
                                class="fa-solid fa-right-to-bracket"></i> Login</a></li>
                    </c:otherwise>
                </c:choose>
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
                <form id="searchForm" method="GET" action="<c:url value='/drugs/search'/>">
                    <input class="search-bar form-control" type="text" id="searchQuery" name="query"
                           placeholder="Search for medicine..." autocomplete="off">
                    <a href="#" id="submitSearch"><i class="fa-solid fa-magnifying-glass icon-search"></i></a>
                </form>
                <div id="autocomplete-results" class="list-group"></div>
            </div>


        </div>
    </div>
</div>

<!-- Featured Section -->
<div class="featured">
    <div class="container">
        <div class="feature-hero">
            <h1>a pharmacy in you hands</h1>
            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. In maxime debitis accusamus quidem cumque ipsam
                dicta vero minus tempore nesciunt, temporibus animi illo libero qui rerum accusantium ut mollitia
                atque!</p>
        </div>
        <div class="feature-cards">
            <div class="card">
                <div class="card-icon">
                    <i class="fa-solid fa-prescription-bottle-alt"></i>
                </div>
                <div class="card-text">
                    <h2>Search</h2>
                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Quisquam, voluptatum.</p>
                </div>
            </div>
            <div class="card">
                <div class="card-icon">
                    <i class="fa-solid fa-prescription-bottle"></i>
                </div>
                <div class="card-text">
                    <h2>Find</h2>
                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Quisquam, voluptatum.</p>
                </div>
            </div>
            <div class="card">
                <div class="card-icon">
                    <i class="fa-solid fa-prescription"></i>
                </div>
                <div class="card-text">
                    <h2>Buy</h2>
                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Quisquam, voluptatum.</p>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Footer Section -->
<footer>
    <div class="container">
        <p>Made by <b>Sahand N. Mohammed</b> & <b>Papula Fouad</b></p>
    </div>
</footer>


<script src="https://kit.fontawesome.com/7bba4c01e2.js" crossorigin="anonymous"></script>
<script src="src/js/index.js"></script>
</body>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://kit.fontawesome.com/7bba4c01e2.js" crossorigin="anonymous"></script>
<script>
    document.addEventListener('DOMContentLoaded', function () {
        let submitBtn = document.getElementById('submitSearch');
        if (submitBtn) {
            submitBtn.addEventListener('click', function (event) {
                event.preventDefault(); // Prevent the default anchor behavior
                document.getElementById('searchForm').submit(); // Submit the form
                console.log('Form submitted');
            });
        } else {
            console.log('Submit button not found');
        }
    });
</script>
</body>

</html>

