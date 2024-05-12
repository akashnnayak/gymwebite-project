<%@page import="register.connection.DbCon"%>
<%@page import="register.dao.ProductDao"%>
<%@page import="register.model.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
ProductDao pd = new ProductDao(DbCon.getConnection());
List<Product> products = pd.getAllProducts();

ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
if (cart_list != null) {
	request.setAttribute("cart_list", cart_list);
}
%>
<!DOCTYPE html>
<html>
<head>
<title>Products</title>
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<style>
body {
	background-color: #131b2b;
	padding-top: 56px;
}

/* Custom CSS to adjust product image size */
.card-img-top {
	max-height: 200px; /* Set maximum height for the product image */
	width: auto; /* Allow width to adjust according to height */
}

.card-header.my-3 {
	background-color: #40f564;
	color: black; /* Set text color to white */
	padding: 5px 10ps;
	text-align: center;
}
 /* Custom CSS for navbar */
        .navbar-nav .nav-link {
            color: #fff; /* Set link text color to white */
        }

        .navbar-nav .nav-link:hover {
            color: #40f564; /* Change link text color on hover */
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
</style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark  fixed-top" style="background-color: #1e2735;">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">Our products</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                
                    <li class="nav-item">
                        <a class="nav-link" href="home.jsp">Home</a>
                    </li>
                    
                    <li class="nav-item">
                        <a class="nav-link" href="profile.jsp">Profile</a>
                    </li>
                   
                    <li class="nav-item">
                        <a class="nav-link" href="#">Products</a>
                    </li>
                    
                    <li class="nav-item">
                        <a class="nav-link" href="cart.jsp">Cart<span class="cart-badge">${ cart_list.size() }</span></a> <!-- Cart link -->
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <!-- End Navbar -->

	<div class="container">
		<div class="card-header my-3">All Products</div>
		<div class="row">
			<%
			if (!products.isEmpty()) {
				for (Product p : products) {
			%>
			<div class="col-md-3 my-3">
				<div class="card">
					<img class="card-img-top" src="<%=p.getImage()%>"
						alt="Card image cap">
					<div class="card-body">
						<h5 class="card-title"><%=p.getName()%></h5>
						<h6 class="price">
							Price: ₹<%=p.getPrice()%></h6>
						<h6 class="category">
							Category:
							<%=p.getCategory()%></h6>
						<div class="mt-3 d-flex justify-content-between">
							<a class="btn btn-dark" href="add-to-cart?id=<%=p.getId()%>">Add to Cart</a> 
							<a class="btn btn-primary" href="payment.jsp?productId=<%=p.getId()%>" >Buy Now</a>

						</div>
					</div>
				</div>
			</div>
			<%
			}
			} else {
			out.println("There are no products available");
			}
			%>

		</div>
	</div>
	

	<!-- Bootstrap JavaScript Bundle (Popper included) -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
