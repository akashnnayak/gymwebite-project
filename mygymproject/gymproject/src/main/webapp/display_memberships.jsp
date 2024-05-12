 <%@page import="register.connection.DbCon"%>
<%@page import="register.dao.MembershipDao"%>
<%@page import="register.model.Membership"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
MembershipDao membershipDao = new MembershipDao(DbCon.getConnection());
List<Membership> memberships = membershipDao.getAllMemberships();
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Membership Options</title>
    <style>
        /* Global Styles */
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: Arial, sans-serif;
            background-color: #131b2b;
            color: #fff;
            position: relative; /* Ensure relative positioning for absolute positioning of the image */
        }

        .background-image {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            object-fit: cover; /* Fit the image to cover the entire screen */
            filter: brightness(50%); /* Decrease brightness */
            z-index: -1; /* Push the image behind other content */
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 40px;
            text-align: center;
            position: relative; 
          /* Ensure z-index works properly */
        }

        h1 {
            font-size: 36px;
            margin-bottom: 20px;
        }

        p {
            font-size: 18px;
            margin-bottom: 40px;
        }

        /* Card Styles */
        .cards {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
        }

        .card {
            background-color: #e0ecf8;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.5);
            padding: 30px;
            width: 300px;
            margin: 20px;
            border: 2px solid #00ff34;
        }

        .card h2 {
            font-size: 24px;
            margin-bottom: 20px;
        }

        .card ul {
            list-style-type: none;
            text-align: left;
            margin-bottom: 30px;
        }

        .card li {
            margin-bottom: 10px;
        }

        .btn {
            display: block;
            background-color: #007bff;
            color: #fff;
            text-decoration: none;
            padding: 12px 24px;
            border-radius: 5px;
            transition: background-color 0.3s;
        }

        .btn:hover {
            background-color: #0056b3;
        }

        ul {
            color: black;
        }
         .navbar {
             /* Transparent white background */
            padding: 20px;
            position: fixed;
            width: 100%;
            top: 0;
            z-index: 1000;
            /* Ensure navbar stays on top */
        }

        .navbar a {
            color: #fff; /* White text color */
            text-decoration: none;
            margin-right: 20px;
            font-size: 18px;
        }

        .navbar a:hover {
            color: #007bff; 
        }
     
    </style>
</head>
<body>
<div class="navbar" id="navbar">
    <a href="home.jsp">&#8592; Home</a>
</div>
<img class="background-image" src="gym-background.jpg" alt="">
<div class="container">
    <h1>Membership Options</h1>
    <p>All Memberships include full access to our amenities, pools, fitness classes  much more id est laborum.</p>
    <div class="cards">
        <% for (Membership membership : memberships) { %>
        <div class="card">
            <ul>
                <li style="font-size: 25px; color: black;  font-weight: bold; text-align: center; margin-bottom: 31px; text-shadow: 2px 2px 4px #000000;"><%= membership.getMembershipType() %></li>
                <li style="font-weight: bold; margin-bottom: 15px;">Price: ₹<%= membership.getPrice() %></li>
                <li style="font-weight: bold; margin-bottom: 15px;">Details: <%= membership.getDetails() %></li>
                <li style="font-weight: bold;">Duration: <%= membership.getDuration() %> month</li>
            </ul>
            <a style="background-color: #39e75f; border-radius: 20px;" class="btn btn-primary btn-buy-now" href="mems-payment.jsp?membershipId=<%= membership.getId() %>">Buy Now</a>
        </div>
        <% } %>
    </div>
</div>

</body>
</html>
