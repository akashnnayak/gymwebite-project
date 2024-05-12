package register.signup;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class AddProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	
        String url = "jdbc:mysql://localhost:3306/gymwebsite";
        String user = "root";
        String password = "mysql@akash##513";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            throw new ServletException("JDBC Driver not found", e);
        }

        try (Connection conn = DriverManager.getConnection(url, user, password)) {
            String name = request.getParameter("name");
            String category = request.getParameter("category");
            double price = Double.parseDouble(request.getParameter("price"));
            String image = request.getParameter("image");

            String sql = "INSERT INTO products (name, category, price, image) VALUES (?, ?, ?, ?)";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, name);
            statement.setString(2, category);
            statement.setDouble(3, price);
            statement.setString(4, image);

            int rowsInserted = statement.executeUpdate();
            if (rowsInserted > 0) {
            	 // Print message in admin.jsp
                request.setAttribute("message", "New product added successfully");
                request.getRequestDispatcher("admin.jsp").forward(request, response);
            } else {
                response.sendRedirect("error.jsp");
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}
