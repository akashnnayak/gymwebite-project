package register.signup;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class ProductListServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Update product details based on form submission
    	try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gymwebsite", "root", "mysql@akash##513");

            int id = Integer.parseInt(request.getParameter("id"));
            String name = request.getParameter("name");
            String category = request.getParameter("category");
            double price = Double.parseDouble(request.getParameter("price"));

            // Update product details in the database
            PreparedStatement ps = con.prepareStatement("UPDATE products SET name=?, category=?, price=? WHERE id=?");
            ps.setString(1, name);
            ps.setString(2, category);
            ps.setDouble(3, price);
            ps.setInt(4, id);
            int rowsUpdated = ps.executeUpdate();

            if (rowsUpdated > 0) {
                // Product details updated successfully
                response.sendRedirect("productsList"); // Redirect back to the product list page
            } else {
                // Failed to update product details
                // You can handle this case accordingly, such as displaying an error message
            }

            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gymwebsite", "root", "mysql@akash##513");

            // Retrieve all products from the database
            PreparedStatement ps = con.prepareStatement("SELECT id, name, category, price FROM products");
            ResultSet rs = ps.executeQuery();

            // Start building the HTML page
            response.setContentType("text/html");
            java.io.PrintWriter out = response.getWriter();
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Product List</title>");
            out.println("<style>");
            out.println("body {");
            out.println("    font-family: Arial, sans-serif;");
            out.println("    margin: 0;");
            out.println("    padding: 0;");
            out.println("    background-color: #f2f2f2;");
            out.println("}");
            out.println("nav {");
            out.println("    background-color: #1f2125;");
            out.println("    overflow: hidden;");
            out.println("}");
            out.println("nav a {");
            out.println("    float: right;");
            out.println("    display: block;");
            out.println("    color: white;");
            out.println("    text-align: center;");
            out.println("    padding: 14px 20px;");
            out.println("    text-decoration: none;");
            out.println("}");
            out.println("nav a:hover {");
            out.println("    background-color: #00ff34;");
            out.println("    color: black;");
            out.println("}");
            out.println(".container {");
            out.println("    display: flex;");
            out.println("    flex-direction: column;");
            out.println("    align-items: center;");
            out.println("    justify-content: flex-start;");
            out.println("    height: 100vh;");
            out.println("}");
            out.println("table {");
            out.println("    width: 70%;");
            out.println("    border-collapse: collapse;");
            out.println("    margin-top: 20px;");
            out.println("}");
            out.println("th, td {");
            out.println("    padding: 12px;");
            out.println("    text-align: left;");
            out.println("    border-bottom: 1px solid #ddd;");
            out.println("}");
            out.println("th {");
            out.println("    background-color: #333;");
            out.println("    color: white;");
            out.println("}");
            out.println("td a {");
            out.println("    color: red;");
            out.println("    text-decoration: none;");
            out.println("}");
            out.println("td a.update-btn {");
            out.println("    background-color: yellow;");
            out.println("    color: black;");
            out.println("    padding: 8px 12px;");
            out.println("    border: none;");
            out.println("    border-radius: 4px;");
            out.println("    cursor: pointer;");
            out.println("}");
            out.println("td a.update-btn:hover {");
            out.println("    background-color: #ffd700;");
            out.println("}");
            out.println("</style>");
            out.println("</head>");
            out.println("<body>");

            // Navbar
            out.println("<nav>");
            out.println("    <a href=\"admin.jsp\">Dashboard</a>");
            out.println("    <a href=\"mems-form.jsp\">Update Membership</a>");
            
            out.println("    <a href=\"deleteTrainer\">Trainer</a>");
            out.println("    <a href=\"#\">Inventory</a>");
            out.println("    <a href=\"deleteFreeClass\">Classes</a>");
            out.println("</nav>");

            // Table
            out.println("<div class='container'>");
            out.println("<h3>All Product List</h3>");
            out.println("<table border='1'>");
            out.println("<tr>");
            out.println("<th>ID</th>");
            out.println("<th>Name</th>");
            out.println("<th>Category</th>");
            out.println("<th>Price</th>");
            out.println("<th>Action</th>");
            out.println("</tr>");

            // Iterate through products and display in table rows
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String category = rs.getString("category");
                double price = rs.getDouble("price");

                out.println("<tr>");
                out.println("<td>" + id + "</td>");
                out.println("<td>" + name + "</td>");
                out.println("<td>" + category + "</td>");
                out.println("<td><span style='color: lime;'>" + price + "</span></td>");
                out.println("<td>");
                // Form for modifying product details
                out.println("<form action='productsList' method='post'>");
                out.println("<input type='hidden' name='id' value='" + id + "'>");
                out.println("<input type='text' name='name' placeholder='Product Name' value='" + name + "'>");
                out.println("<input type='text' name='category' placeholder='Category' value='" + category + "'>");
                out.println("<input type='text' name='price' placeholder='Price' value='" + price + "'>");
                out.println("<input type='submit' class='update-btn' value='Update' style='background-color: yellow; color: black;'>");
                out.println("</form>");
                out.println("</td>");
                out.println("</tr>");
            }

            out.println("</table>");
            out.println("</div>"); // end container

            out.println("</body>");
            out.println("</html>");

            out.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
