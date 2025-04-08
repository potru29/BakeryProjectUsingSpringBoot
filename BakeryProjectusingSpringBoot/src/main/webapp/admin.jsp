<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    if(session.getAttribute("adminObj") == null) {
        response.sendRedirect("adminlogin");
    }
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard</title>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

<style>
    body {
        background-color: #f1f3f5;
        font-family: 'Arial', sans-serif;
    }

    .navbar {
        background-color: #343a40;
    }

    .navbar-brand, .nav-link, .heading {
        color: orange !important;
        font-weight: bold;
    }

    .cardbackground {
        background-color: #212529;
        color: white;
        border-radius: 10px;
        box-shadow: 0 4px 8px rgba(0,0,0,0.2);
        transition: 0.3s;
    }

    .cardbackground:hover {
        transform: translateY(-5px);
    }

    .add-btn {
        display: block;
        margin: 30px auto;
        width: 200px;
        font-weight: bold;
    }

    .logout-btn {
        margin-left: auto;
    }
</style>

</head>
<body>

<nav class="navbar navbar-expand-lg">
    <a class="navbar-brand" href="#">Admin Panel</a>
    <form action="logout" method="post" class="form-inline ml-auto">
        <button type="submit" class="btn btn-danger logout-btn">Logout</button>
    </form>
</nav>

<div class="container mt-4">
    <h2 class="text-center heading mb-4">Bakery Items List</h2>

    <div class="row">
        <c:forEach var="item" items="${items}">
            <div class="col-md-4">
                <div class="card mb-4 cardbackground">
                    <div class="card-body">
                        <h5 class="card-title">Name: ${item.name}</h5>
                        <p class="card-text">Price: ${item.cost} Rs/-</p>
                        <p class="card-text">${item.description}</p>
                        <div class="d-flex justify-content-between">
                            <a href="edit/${item.id}" class="btn btn-success btn-sm">Update</a>
                            <a href="/delete/${item.id}" class="btn btn-danger btn-sm">Delete</a>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>

    <a href="add" class="btn btn-info add-btn">+ Add New Item</a>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
