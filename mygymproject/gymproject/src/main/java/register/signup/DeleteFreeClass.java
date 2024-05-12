package register.signup;

import jakarta.servlet.ServletException;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class DeleteFreeClass extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gymwebsite", "root", "mysql@akash##513");

            // Retrieve all free classes from the database
            PreparedStatement ps = con.prepareStatement("SELECT username, phoneNumber, classType, timing FROM free_classes");
            ResultSet rs = ps.executeQuery();

            // Start building the HTML table
            response.setContentType("text/html");
            java.io.PrintWriter out = response.getWriter();
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Free Class List</title>");
            out.println("<style>");
            out.println("body {");
            out.println("    font-family: Arial, sans-serif;");
            out.println("    margin: 0;");
            out.println("    padding: 0;");
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
            out.println("table {");
            out.println("    width: 70%;");
            out.println("    margin: 0 auto;");
            out.println("    border-collapse: collapse;");
            out.println("}");
            out.println("th, td {");
            out.println("    padding: 12px;");
            out.println("    text-align: left;");
            out.println("    border-bottom: 1px solid #ddd;");
            out.println("}");
            out.println("th {");
            out.println("    background-color: #1f2125;");
            out.println("    color: white;");
            out.println("}");
            out.println("td a {");
            out.println("    color: red;");
            out.println("    text-decoration: none;");
            out.println("}");
            out.println("td a:hover {");
            out.println("    color: darkred;");
            out.println("}");
            out.println("</style>");
            out.println("</head>");
            out.println("<body>");

            out.println("<nav>");
           
            out.println("    <a href=\"admin.jsp\">Dashboard</a>");
            out.println("    <a href=\"mems-form.jsp\">Update Membership</a>");
            out.println("    <a href=\"deleteUser\">Users</a>");
            out.println("    <a href=\"deleteTrainer\">Trainer</a>"); 
            out.println("    <a href=\"productsList\">Inventory</a>");
            out.println("    <a href=\"#\">Classes</a>");
            out.println("</nav>");

            out.println("<h2 style='color: #1f2125; text-align: center;'>Free Class List</h2>");
            out.println("<table border='1'>");
            out.println("<tr>");
            out.println("<th>Username</th>");
            out.println("<th>Phone Number</th>");
            out.println("<th>Class Type</th>");
            out.println("<th>Timing</th>");
            out.println("<th>Action</th>");
            out.println("</tr>");

            while (rs.next()) {
                String username = rs.getString("username");
                String phoneNumber = rs.getString("phoneNumber");
                String classType = rs.getString("classType");
                String timing = rs.getString("timing");

                out.println("<tr>");
                out.println("<td>" + username + "</td>");
                out.println("<td>" + phoneNumber + "</td>");
                out.println("<td>" + classType + "</td>");
                out.println("<td>" + timing + "</td>");
                out.println("<td>");
                out.println("<form method='post' action='deleteFreeClass'>");
                out.println("<input type='hidden' name='username' value='" + username + "'>");
                out.println("<input type='submit' value='Delete' style='background-color:red;color:white;padding:5px 10px;border:none;border-radius:3px;'>");
                out.println("</form>");
                out.println("</td>");
                out.println("</tr>");
            }

            out.println("</table>");
            out.println("</body>");
            out.println("</html>");

            out.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gymwebsite", "root", "mysql@akash##513");
            PreparedStatement ps = con.prepareStatement("DELETE FROM free_classes WHERE username = ?");
            ps.setString(1, username);

            int rowsDeleted = ps.executeUpdate();
            if (rowsDeleted > 0) {
                // Free class data deleted successfully
                response.sendRedirect("deleteFreeClass");
            } else {
                // Failed to delete free class data
            }

            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}