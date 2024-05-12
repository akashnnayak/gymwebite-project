<%@page import="register.connection.DbCon"%>
<%@page import="register.dao.ProductDao"%>
<%@page import="register.model.*"%>
<%@page import="java.util.*"%>
<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
DecimalFormat dcf = new DecimalFormat("#.##");
request.setAttribute("dcf", dcf);

ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
List<Cart> cartProduct = null;
if (cart_list != null) {
	ProductDao pDao = new ProductDao(DbCon.getConnection());
	cartProduct = pDao.getCartProducts(cart_list);
	double total = pDao.getTotalCartPrice(cart_list);
	request.setAttribute("total", total);
	request.setAttribute("cart_list", cart_list);
}
%>
<!DOCTYPE html>
<html>
<head>

<title>Cart</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"  />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
<style type="text/css">
body {
	background-color: #131b2b;
      
      display: flex;
      align-items: center;
      justify-content: center;
      padding: 20px;}

.table tbody td{
vertical-align: middle;
color: white;
}
.btn-incre, .btn-decre{
box-shadow: none;
font-size: 15px;
color: white;
}
.navbar {
      position: fixed; /* Make navbar fixed */
      top: 0;
      left: 0;
      width: 100%;
      background-color: #1e2735; /* Customize navbar background color */
      color: #fff; /* Customize navbar text color */
      padding: 20px 30px;
      z-index: 1000; /* Ensure navbar stays on top */
    }

    .navbar a {
      color: #fff; /* Customize link color */
      text-decoration: none;
      margin-right: 20px;
    }
</style>
</head>
<body>
	<nav class="navbar">
		<a href="product.jsp" class="back-link">&#8592; Go Back</a>
	</nav>

	<div class="container my-5" style="background-color: #1e2735;">
		<div class="d-flex py-3"><h3 style="color: white;">Total Price: ₹ <span style="color:#40f564;">${(total>0)?dcf.format(total):0}</span> </h3> 
		</div>
		<table class="table table-#1e2735">
			<thead>
				<tr style=" color: white;">
					<th scope="col">Name</th>
					<th scope="col">Category</th>
					<th scope="col">Price</th>
					<th scope="col">Buy Now</th>
					<th scope="col">Cancel</th>
				</tr>
			</thead>
			<tbody>
				<%
				if (cart_list != null) {
					for (Cart c : cartProduct) {
				%>
				<tr>
					<td><%=c.getName()%></td>
					<td><%=c.getCategory()%></td>
					<td><%= dcf.format(c.getPrice())%></td>
					<td>
						<form action="order-now" method="post" class="form-inline">
						<input type="hidden" name="id" value="<%= c.getId()%>" class="form-input">
							<div class="  d-flex justify-content-space-around" style=" padding: 10px 5px; float: inherit;">
								<a class="btn bnt-sm btn-incre" href="quantity-inc-dec?action=inc&id=<%=c.getId()%>"><i class="fas fa-plus-circle"></i></a> 
								<input style="width: 300px; padding: 10px;  font-size: 16px; " type="text" name="quantity" class="form-control w-50"  value="<%=c.getQuantity()%>" readonly> 
								<a class="btn btn-sm btn-decre" href="quantity-inc-dec?action=dec&id=<%=c.getId()%>"><i class="fas fa-minus-circle"></i></a>
							<a style="margin-left: 60px;" class="btn btn-primary" href="payment.jsp?productId=<%=c.getId()%>" >Buy Now</a>
							</div>
							
						
						</form>
					</td>
					<td><a href="remove-from-cart?id=<%=c.getId() %>" class="btn btn-sm btn-danger">Remove</a></td>
				</tr>

				<%
				}}%>
			</tbody>
		</table>
	</div>

	    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>