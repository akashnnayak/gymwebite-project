package register.signup;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/deleteUser")
public class DeleteUser extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gymwebsite", "root", "mysql@akash##513");

            // Retrieve all users from the database
            PreparedStatement ps = con.prepareStatement("SELECT name, email, country FROM users");
            ResultSet rs = ps.executeQuery();

            // Start building the HTML table
            response.setContentType("text/html");
            java.io.PrintWriter out = response.getWriter();
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>User List</title>");
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
            out.println("    <a href=\"#\">Users</a>");
            out.println("    <a href=\"deleteTrainer\">Trainer</a>");
            out.println("    <a href=\"deleteFreeClass\">Classes</a>");
            out.println("</nav>");

            out.println("<h2 style='color: #1f2125; text-align: center;'>User List</h2>");
            out.println("<table border='1'>");
            out.println("<tr>");
            out.println("<th>Username</th>");
            out.println("<th>Email</th>");
            out.println("<th>Country</th>");
            out.println("<th>Action</th>");
            out.println("</tr>");

            while (rs.next()) {
                String username = rs.getString("name");
                String email = rs.getString("email");
                String country = rs.getString("country");

                out.println("<tr>");
                out.println("<td>" + username + "</td>");
                out.println("<td>" + email + "</td>");
                out.println("<td>" + country + "</td>");
                out.println("<td>");
                out.println("<form method='post' action='deleteUser'>");
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
            PreparedStatement ps = con.prepareStatement("DELETE FROM users WHERE name = ?");
            ps.setString(1, username);

            int rowsDeleted = ps.executeUpdate();
            if (rowsDeleted > 0) {
                // User data deleted successfully
                response.sendRedirect("deleteUser");
            } else {
                // Failed to delete user data
            }

            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
