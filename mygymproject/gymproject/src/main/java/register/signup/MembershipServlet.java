package register.signup;

import jakarta.servlet.ServletException;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class MembershipServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form data
        int id = Integer.parseInt(request.getParameter("id"));
        BigDecimal price = new BigDecimal(request.getParameter("price"));
        String details = request.getParameter("details");

        // Database connection parameters
        String url = "jdbc:mysql://localhost:3306/gymwebsite";
        String username = "root";
        String password = "mysql@akash##513";

        // SQL query to update data in membership table
        String sql = "UPDATE membership SET price = ?, details = ? WHERE id = ?";

        try {
            // Load MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Connect to the database
            try (Connection connection = DriverManager.getConnection(url, username, password);
                 PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

                // Set parameters for the SQL query
                preparedStatement.setBigDecimal(1, price);
                preparedStatement.setString(2, details);
                preparedStatement.setInt(3, id);

                // Execute the SQL query
                int rowsAffected = preparedStatement.executeUpdate();

                // Check if the data was updated successfully
                if (rowsAffected > 0) {
                    response.getWriter().println("<h1>Membership updated successfully!</h1>");
                } else {
                    response.getWriter().println("<h1>Failed to update membership. No matching ID found.</h1>");
                }
            }
         } catch (ClassNotFoundException e) {
            e.printStackTrace();
            response.getWriter().println("<h1>Error: Database driver not found</h1>");
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().println("<h1>Error: " + e.getMessage() + "</h1>");
        }
    }
}
