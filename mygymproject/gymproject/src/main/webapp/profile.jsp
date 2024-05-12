
<%@page import="register.connection.DbCon"%>
<%@page import="register.dao.ProductDao"%>
<%@page import="register.model.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%
ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
if (cart_list != null) {
	request.setAttribute("cart_list", cart_list);
}
%>

<!DOCTYPE html>
<html>
<head>
<title>User Profile</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<style>
body {
	margin: 0;
	font-family: Arial, sans-serif;
	background-color: #131b2b;
	color: #fff;
}

.navbar {
	overflow: hidden;
	background-color: #1e2735;
	padding: 10px;
	margin-bottom: 20px;
}

.navbar a {
	float: right;
	display: block;
	color: #fff;
	text-align: center;
	padding: 14px 20px;
	text-decoration: none;
	font-size: 17px;
}

.navbar a:hover {
	background-color: #40f564;
	color: #000;
}

.container {
	max-width: 500px;
	margin: 50px auto;
	padding: 20px;
	background-color: #1e2735;
	border-radius: 10px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.profile {
	display: flex;
	align-items: center;
	margin-bottom: 20px;
}

.profile-image {
	width: 100px;
	height: 100px;
	border-radius: 50%;
	background-color: #40f564;
	display: flex;
	justify-content: center;
	align-items: center;
	font-size: 24px;
	font-weight: bold;
	margin-right: 20px;
}

.profile-details h2 {
	margin-top: 0;
	margin-bottom: 10px;
}

.profile-details p {
	margin: 5px 0;
	color: #a9abb3;
}

.social-icons {
	margin-top: 10px;
}

.social-icons a {
	color: #a9abb3;
	margin-right: 10px;
	text-decoration: none;
}

.card {
	padding: 20px;
	background-color: #1e2735;
	border-radius: 10px;
	margin-bottom: 20px;
}

.logout-btn {
	background-color: #f01e2c;
	color: #fff;
	border: none;
	padding: 10px 20px;
	border-radius: 5px;
	cursor: pointer;
	float: right;
}

.logout-btn:hover {
	background-color: #d1001f;
}
.cart-badge {
    background-color: red;
    color: white;
    border-radius: 60%;
    padding: 4px 8px;
    font-size: 10px;
    position: relative;
    top: -6px;
}
.navbar .navbar-brand{
float: left;
font-size: 20px;'
}
</style>
</head>
<body>
	<div class="navbar">
	<a class="navbar-brand" href="#">Profile</a>
	<a class="nav-link" href="cart.jsp">Cart<span class="cart-badge">${ cart_list.size() }</span></a> <!-- Cart link -->
		<a href="home.jsp">Home</a> 
		<a href="product.jsp">Products</a>
		
		<!-- Add more links here if needed -->
	</div>
	<div class="container">
		<div class="profile">
			<div class="profile-image"><%= session.getAttribute("initials") %></div>
			<div class="profile-details">
				<h2><%=session.getAttribute("name")%></h2>
				<p>Welcome to our website!</p>
				<div class="social-icons">
					<a href="#"><i class="fab fa-facebook"></i></a> <a href="#"><i
						class="fab fa-twitter"></i></a> <a href="#"><i
						class="fab fa-instagram"></i></a>
				</div>
			</div>
		</div>
		<div class="card">
			<div class="info">
				<p>
					ID:
					<%=session.getAttribute("id")%></p>
				<p>
					Name:
					<%=session.getAttribute("name")%></p>
				<p>
					Email:
					<%=session.getAttribute("email")%></p>
				<p>
					City:
					<%=session.getAttribute("country")%></p>
			</div>
			<form id="logoutForm" action="logoutProfile" method="post">
				<button type="submit" class="logout-btn">Logout</button>
			</form>
		</div>
	</div>

	<script>
		document.querySelector('.profile-image').addEventListener('click', function() {
			window.location.href = 'profile.jsp';
		});
		// Add event listener to the logout button
        document.querySelector('.logout-btn').addEventListener('click', function() {
            // Submit the form when the button is clicked
            document.getElementById('logoutForm').submit();
        });
	</script>

</body>
</html>
