<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>

<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f2f2f2;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }

    .login-container {
        background-color: white;
        padding: 30px;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0,0,0,0.2);
        width: 300px;
        text-align: center;
    }

    input[type="text"], input[type="password"] {
        width: 90%;
        padding: 10px;
        margin: 8px 0;
        border: 1px solid #ccc;
        border-radius: 5px;
    }

    button {
        background-color: #4CAF50;
        color: white;
        padding: 10px 20px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        margin-top: 10px;
    }

    button:hover {
        background-color: #45a049;
    }

    a {
        display: block;
        margin-top: 15px;
        color: #333;
        text-decoration: none;
    }

    a:hover {
        text-decoration: underline;
    }

    .error {
        color: red;
        margin-bottom: 10px;
    }
</style>

</head>
<body>

<div class="login-container">
<h2>Login</h2>

<c:if test="${not empty msg}">
	<p class="error">${msg}</p>
</c:if>

<form action="loginUser" method="post">
    <input type="text" name="username" placeholder="Username" required><br>
    <input type="password" name="password" placeholder="Password" required><br>
    <button type="submit">Login</button>
</form>

<a href="register">Don't have account? Register here</a>
</div>

</body>
</html>
