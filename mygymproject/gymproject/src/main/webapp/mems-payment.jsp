<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="register.connection.DbCon"%>
<%@page import="register.dao.MembershipDao"%>
<%@page import="register.model.Membership"%>
<%@page import="java.util.*"%>

<%
    int membershipId = Integer.parseInt(request.getParameter("membershipId"));
    MembershipDao membershipDao = new MembershipDao(DbCon.getConnection());
    Membership membership = membershipDao.getMembershipById(membershipId);
    String cardHolderName = ""; // Assuming you have cardHolderName variable defined somewhere
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Membership Payment</title>
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
                    <h5 class="card-title">Membership Details</h5>
                    <div class="card-body">
                        <!-- Membership details -->
                         <div class="form-group">
                        <label for="membershipType">Membership Type:</label>
                        <input type="text" id="membershipType" class="form-control" value="<%= membership.getMembershipType() %>" readonly>
                    </div>
                    <div class="form-group">
                        <label for="price">Price:</label>
                        <input type="text" id="price" class="form-control" value="₹<%= membership.getPrice() %>" readonly>
                    </div>
                    <div class="form-group">
                        <label for="details">Details:</label>
                        <textarea id="details" class="form-control" rows="3" readonly><%= membership.getDetails() %></textarea>
                    </div>
                    <div class="form-group">
                        <label for="duration">Duration:</label>
                        <input type="text" id="duration" class="form-control" value="<%= membership.getDuration() %> month(s)" readonly>
                    </div>
              
                    </div>
                </div>
                <div class="card">
                    <h5 class="card-title">Payment Details</h5>
                    <div class="card-body">
                        <form id="paymentForm" action="mems-payment-email" method="post">
                            <div class="form-group">
                                <label for="cardNumber">Card Number:</label>
                                <input type="text" id="cardNumber" name="cardNumber" class="form-control" placeholder="Enter card number" required maxlength="19">
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="expiryDate">Expiry Date:</label>
                                    <input type="text" id="expiryDate" name="expiryDate" class="form-control" placeholder="MM/YY" required pattern="[0-9]{4}" maxlength="4">
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="cvv">CVV:</label>
                                    <input type="text" id="cvv" name="cvv" class="form-control" placeholder="CVV" required pattern="[0-9]{3}" maxlength="3">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="cardHolderName">Cardholder Name:</label>
                                <input type="text" id="cardHolderName" name="cardHolderName" class="form-control" placeholder="Enter cardholder name" required>
                            </div>
                            <!-- Hidden input fields for membership details -->
                            <input type="hidden" name="membershipType" value="<%= membership.getMembershipType() %>">
                            <input type="hidden" name="price" value="<%= membership.getPrice() %>">
                            <input type="hidden" name="duration" value="<%= membership.getDuration() %>">
                            <input type="hidden" name="cardHolderName" value="<%= cardHolderName %>">
                            <button type="submit" class="btn btn-primary">Pay Now</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

   <script>
        // Client-side form validation
        document.getElementById("paymentForm").addEventListener("submit", function(event) {
            // Validate cardNumber
            var cardNumber = document.getElementById("cardNumber").value;
            if (!/^\d{19}$/.test(cardNumber)) {
                alert("Invalid card number. Please enter a 16-digit card number.");
                event.preventDefault();
                return;
            }

            // Validate expiryDate
            var expiryDate = document.getElementById("expiryDate").value;
            var currentDate = new Date();
            var currentYear = currentDate.getFullYear() % 100; // Get last two digits of current year
            var currentMonth = currentDate.getMonth() + 1; // January is 0, so add 1
            var [expiryMonth, expiryYear] = expiryDate.split('/');
            expiryMonth = parseInt(expiryMonth);
            expiryYear = parseInt(expiryYear);
            if (expiryYear < currentYear || (expiryYear === currentYear && expiryMonth < currentMonth)) {
                alert("Expiry date must be in the future.");
                event.preventDefault();
                return;
            }

            // Validate cvv
            var cvv = document.getElementById("cvv").value;
            if (!/^\d{3,4}$/.test(cvv)) {
                alert("Invalid CVV. Please enter a 3 or 4-digit CVV.");
                event.preventDefault();
                return;
            }

            // Validate cardHolderName
            var cardHolderName = document.getElementById("cardHolderName").value;
            if (!/^[a-zA-Z ]+$/.test(cardHolderName)) {
                alert("Invalid cardholder name. Please enter only alphabetic characters.");
                event.preventDefault();
                return;
            }
        });
    </script>
</body>
</html>
