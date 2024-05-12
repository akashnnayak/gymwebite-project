<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="register.model.User" %>
<%@ page import="register.model.Product" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Invoice</title>
    <style>
        .invoice-container {
            margin: 50px auto;
            width: 80%;
            border: 1px solid #ccc;
            padding: 20px;
            font-family: Arial, sans-serif;
        }
        .invoice-header {
            font-size: 24px;
            text-align: center;
            margin-bottom: 20px;
        }
        .invoice-details {
            display: flex;
            justify-content: space-between;
        }
        .invoice-details-left {
            width: 50%;
        }
        .invoice-details-right {
            width: 50%;
            text-align: right;
        }
        .invoice-table {
            width: 100%;
            border-collapse: collapse;
        }
        .invoice-table th, .invoice-table td {
            border: 1px solid #ccc;
            padding: 8px;
        }
        .invoice-table th {
            background-color: #f2f2f2;
            text-align: left;
        }
    </style>
</head>
<body>
<%
    // Retrieve user and product details from session
    User user = (User) session.getAttribute("user");
    if (user != null) {
        String name = user.getName();
        String email = user.getEmail();

        // Retrieve purchase date and payment method
        Date purchaseDate = new Date();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String formattedDate = dateFormat.format(purchaseDate);
        String paymentMethod = "Credit Card"; // Change this to the actual payment method

        // Retrieve card holder name from request parameters
        String cardHolderName = request.getParameter("cardHolderName");
%>

<div class="invoice-container">
    <div class="invoice-header">Fitness & Health</div>
    <div class="invoice-details">
        <div class="invoice-details-left">
            <p><strong>Bill To:</strong></p>
            <p>Name: <%= name %></p>
            <p>Email: <%= email %></p>
            <!-- Remove the city information -->
        </div>
        <div class="invoice-details-right">
            <p><strong>Invoice Date:</strong> <%= formattedDate %></p>
            <p><strong>Payment Method:</strong> <%= paymentMethod %></p>
            <p><strong>Card Holder Name:</strong> <%= cardHolderName %></p>
        </div>
    </div>
    <table class="invoice-table">
        <thead>
            <tr>
                <th>Description</th>
                <th>Quantity</th>
                <th>Amount</th>
            </tr>
        </thead>
        <tbody>
            <% double totalAmount = 0;
               ArrayList<Product> productList = (ArrayList<Product>) session.getAttribute("productList");
               if (productList != null) {
                   for (Product product : productList) {
                       totalAmount += product.getPrice();
            %>
            <tr>
                <td><%= product.getName() %> (<%= product.getCategory() %>)</td>
                <td>1</td>
                <td>$<%= product.getPrice() %></td>
            </tr>
            <% } %>
            <tr>
                <td colspan="2" style="text-align: right;"><strong>Total Amount:</strong></td>
                <td><strong>$<%= totalAmount %></strong></td>
            </tr>
            <% } %>
        </tbody>
    </table>
</div>
<%
    }
%>
</body>
</html>
