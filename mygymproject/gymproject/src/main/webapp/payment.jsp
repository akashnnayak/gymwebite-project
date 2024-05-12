<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="register.connection.DbCon"%>
<%@page import="register.dao.ProductDao"%>
<%@page import="register.model.*"%>
<%@page import="java.util.*"%>

<%
// Retrieve product details using ProductDao
int productId = Integer.parseInt(request.getParameter("productId"));
ProductDao productDao = new ProductDao(DbCon.getConnection());
Product selectedProduct = productDao.getSingleProduct(productId);
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Payment Form</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
.card {
    margin-top: 20px;
    padding: 10px;
    border-radius: 10px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}
body {
background-color: #77c3ec;
}
</style>
</head>
<body>
<div class="container">
    <div class="row justify-content-center">
    <div class="col-md-8">
        <div class="card">
            <h5 class="card-title">Product Details</h5>
            <div class="card-body">
                <div class="form-group">
                    <label for="productName">Product Name:</label>
                    <input type="text" id="productName" class="form-control" value="<%= selectedProduct.getName() %>" readonly>
                </div>
                <div class="form-group">
                    <label for="category">Category:</label>
                    <input type="text" id="category" class="form-control" value="<%= selectedProduct.getCategory() %>" readonly>
                </div>
                <div class="form-group">
                    <label for="price">Price:</label>
                    <input type="text" id="price" class="form-control" value="₹<%= selectedProduct.getPrice() %>" readonly>
                </div>
            </div>
        </div>

             <div class="card">
                <h5 class="card-title">Payment Details</h5>
                <div class="card-body">
                    <form id="paymentForm" action="payment" method="post">
                        <div class="form-group">
                            <label for="cardNumber">Card Number:</label>
                            <input type="text" id="cardNumber" class="form-control" placeholder="Enter card number" required maxlength="19">
                        </div>
                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label for="expiryDate">Expiry Date:</label>
                                <input type="text" id="expiryDate" class="form-control" placeholder="MM/YY" required pattern="[0-9]{4}" maxlength="4">
                            </div>
                            <div class="form-group col-md-6">
                                <label for="cvv">CVV:</label>
                                <input type="text" id="cvv" class="form-control" placeholder="CVV" required pattern="[0-9]{3}" maxlength="3">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="cardHolderName">Cardholder Name:</label>
                            <input type="text" id="cardHolderName" class="form-control" placeholder="Enter cardholder name" required>
                        </div>
                        <!-- Hidden input fields to pass product details -->
                        <input type="hidden" name="productName" value="<%= selectedProduct.getName() %>">
                        <input type="hidden" name="category" value="<%= selectedProduct.getCategory() %>">
                        <input type="hidden" name="price" value="<%= selectedProduct.getPrice() %>">
                        <button type="submit" class="btn btn-primary">Pay Now</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
document.getElementById('cardNumber').addEventListener('keydown', function(event) {
    if (!/[0-9]/.test(event.key) && !event.ctrlKey && !event.metaKey && event.key !== 'Backspace' && event.key !== 'Tab') {
        event.preventDefault();
    }
});

document.getElementById('expiryDate').addEventListener('input', function(event) {
    const expiryDateInput = event.target;
    if (!/^[0-9]{4}$/.test(expiryDateInput.value)) {
        expiryDateInput.setCustomValidity('Please enter a valid expiry date in MM/YY format.');
    } else {
        expiryDateInput.setCustomValidity('');
    }
});

document.getElementById('cvv').addEventListener('input', function(event) {
    const cvvInput = event.target;
    if (!/^[0-9]{3}$/.test(cvvInput.value)) {
        cvvInput.setCustomValidity('Please enter a valid 3-digit CVV.');
    } else {
        cvvInput.setCustomValidity('');
    }
});
</script>
</body>
</html>
