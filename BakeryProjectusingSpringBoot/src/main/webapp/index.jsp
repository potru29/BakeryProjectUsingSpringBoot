<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bakery - Welcome</title>

<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

<style>
    .navbar-custom {
        background-color: black;
    }
    .navbar-custom .nav-link {
   color: white;
   font-weight: bold;
   margin-right: 15px;
}
    .card-custom {
        background-color: #f8f9fa;
        border-radius: 20px;
        padding: 30px;
        box-shadow: 0 4px 8px rgba(0,0,0,0.2);
        text-align: center;
    }
    .btn-custom {
        background-color: orange;
        color: black;
        font-weight: bold;
        margin: 10px;
    }
    .btn-custom:hover {
        background-color: darkorange;
    }
    .heading {
        color: orange;
        font-weight: bold;
        margin-bottom: 20px;
    }
   nav-link:hover {
   color: white !important;
   text-decoration: underline;
}
.navbar-toggler-icon {
    background-image: url("data:image/svg+xml;charset=utf8,%3Csvg viewBox='0 0 30 30' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath stroke='yellow' stroke-width='2' stroke-linecap='round' stroke-miterlimit='10' d='M4 7h22M4 15h22M4 23h22'/%3E%3C/svg%3E");
}

</style>

</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg" style="background-color: black;">
  <a class="navbar-brand text-warning" href="#">Bakery</a>

  <button class="navbar-toggler" type="button" data-toggle="collapse"
    data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
    aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item">
        <a class="nav-link text-warning" href="home">Home</a>
      </li>
      <li class="nav-item">
        <a class="nav-link text-warning" href="adminlogin">Admin</a>
      </li>
    </ul>
  </div>
</nav>


<!-- Content -->
<div class="container d-flex justify-content-center align-items-center" style="min-height:80vh;">
    <div class="card card-custom col-md-6">
        <h2 class="heading">Welcome to Online Bakery Store</h2>
        <p>To order your favourite bakery items, please login or register below.</p>
        <div>
            <a href="login" class="btn btn-custom">Login</a>
            <a href="register" class="btn btn-custom">Register</a>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
