<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    if(session.getAttribute("userObj") == null) {
        response.sendRedirect("login");
    }
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Bakery - Home</title>
    
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    
    <style>
        .navbar-custom {
            background-color: black;
        }
        .navbar-custom .navbar-brand,
        .navbar-custom .nav-link {
            color: orange;
            font-weight: bold;
        }
        .card-custom {
            background-color: #212121;
            color: white;
            border-radius: 15px;
            transition: transform 0.3s;
        }
        .card-custom:hover {
            transform: scale(1.05);
        }
        .btn-buy {
            background-color: orange;
            color: black;
            font-weight: bold;
        }
        .heading {
            text-align: center;
            color: orange;
            margin-top: 20px;
            margin-bottom: 20px;
        }
    </style>

</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-custom">
    <a class="navbar-brand" href="#">Bakery App</a>
    <div class="ml-auto">
        <a href="cart" class="btn btn-primary mr-2">View Cart</a>
        <form action="logout" method="post" style="display:inline;">
            <button type="submit" class="btn btn-danger">Logout</button>
        </form>
    </div>
</nav>

<div class="container">
    <h2 class="heading">Our Delicious Bakery Items</h2>
    <form action="search" method="get" class="form-inline mb-3">
		   <input type="text" name="keyword" class="form-control mr-2" placeholder="Search by name/category/price">
		   <button type="submit" class="btn btn-primary">Search</button>
		</form>
		    
    <div class="row">
        <c:forEach var="item" items="${items}">
            <div class="col-md-4 mb-4">
                <div class="card card-custom h-100">
                    <div class="card-body d-flex flex-column justify-content-between">
                        <h5 class="card-title">${item.name}</h5>
                        <p class="card-text">${item.description}</p>
                        <p class="card-text"><strong>Price:</strong> ₹ ${item.cost}</p>

                        <form action="addToCart/${item.id}" method="post" class="form-inline">
                            <input type="number" name="quantity" value="1" min="1" required class="form-control mr-2 w-50" />
                            <button type="submit" class="btn btn-buy btn-block mt-2">Buy</button>
                        </form>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
