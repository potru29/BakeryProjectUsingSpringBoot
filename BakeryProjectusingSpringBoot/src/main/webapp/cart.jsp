<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    if(session.getAttribute("userObj") == null) {
        response.sendRedirect("login");
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Cart</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<div class="container mt-5">
    <h2>Your Cart</h2>

    <c:if test="${empty cart}">
        <p>Your cart is empty!</p>
    </c:if>
    <form action="clearCart" method="post">
		<button type="submit" class="btn btn-warning mt-3">Clear Cart</button>
	</form>
    <br>
    <c:if test="${not empty cart}">
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>Item Name</th>
                    <th>Cost</th>
                    <th>Quantity</th>
                    <th>Total Price</th>
                    <th>remove items</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="item" items="${cart}">
                    <tr>
                        <td>${item.item.name}</td>
                        <td>${item.item.cost}</td>
                        <td>${item.quantity}</td>
                        <td>${item.totalPrice}</td>
                        <td>
						    <form action="removeFromCart/${item.item.id}" method="post">
						        <button type="submit" class="btn btn-danger btn-sm">Remove</button>
						    </form>
						</td>
                    </tr>
                    
                </c:forEach>
            </tbody>
        </table>
        <br>
	   <br>
        <h4>Total Amount: Rs ${total}</h4>
        <br>
	<br>
		<form action="placeOrder" method="post">
		    <button type="submit" class="btn btn-info">Buy Now</button>
		</form>
    </c:if>
    <c:if test="${not empty message}">
	    <h3 style="color: green;">${message}</h3>
	</c:if>
	<br>
	<br>
    <a href="home"><button class="btn btn-primary">Back to Home</button></a>
</div>

</body>
</html>
