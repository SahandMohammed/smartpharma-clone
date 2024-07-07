<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>Cart</title>
</head>
<body>
<div class="container mt-4">
    <h2>Your Shopping Cart</h2>
    <table class="table">
        <thead>
        <tr>
            <th scope="col">Item</th>
            <th scope="col">Price</th>
            <th scope="col">Quantity</th>
            <th scope="col">Total</th>
            <th scope="col">Action</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${cart.items}" var="item">
            <tr>
                <td>${item.drug.name}</td>
                <td>$${item.drug.price}</td>
                <td>
                    <form action="<c:url value='/update-cart'/>" method="post">
                        <input type="hidden" name="id" value="${item.drug.id}"/>
                        <input type="number" name="quantity" value="${item.quantity}" class="form-control" min="1"
                               style="width: 80px; display: inline-block;"/>
                        <button type="submit" class="btn btn-info btn-sm">Update</button>
                    </form>
                </td>
                <td>$${item.totalPrice}</td>
                <td>
                    <a href="<c:url value='/remove-from-cart?id=${item.drug.id}'/>"
                       class="btn btn-danger btn-sm">Remove</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
        <tfoot>
        <tr>
            <th colspan="3">Total</th>
            <th>$${cart.totalCost}</th>
            <th></th>
        </tr>
        </tfoot>
    </table>
    <a href="<c:url value='/checkout'/>" class="btn btn-success">Proceed to Checkout</a>
</div>
<script src="https://kit.fontawesome.com/7bba4c01e2.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
