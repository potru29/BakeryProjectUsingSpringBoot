<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Edit Item</title>
</head>
<body>

<h2>Edit Item</h2>

<form action="../updateItem" method="post">
    
   
    <input type="hidden" name="id" value="${item.id}" />

    <label>Name:</label>
    <input type="text" name="name" value="${item.name}" required /><br><br>

    <label>Price:</label>
    <input type="text" name="cost" value="${item.cost}" required /><br><br>

    <label>Description:</label>
    <input type="text" name="description" value="${item.description}" required /><br><br>

    <button type="submit">Update</button>
</form>

<br>
<a href="admin">Back to Admin Page</a>

</body>
</html>
