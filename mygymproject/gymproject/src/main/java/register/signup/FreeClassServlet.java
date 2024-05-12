package register.signup;

import jakarta.servlet.ServletException;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class FreeClassServlet extends HttpServlet {
    
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String phoneNumber = request.getParameter("phoneNumber");
        String classType = request.getParameter("classType");
        String timing = request.getParameter("timing");
        
        Connection conn = null;
        PreparedStatement pstmt = null;
        
        try {
            // Establishing connection to the database
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/gymwebsite", "root", "mysql@akash##513"); // Change URL, username, and password
            
            // Preparing SQL statement
            String sql = "INSERT INTO free_classes (username, phoneNumber, classType, timing) VALUES (?, ?, ?, ?)";
            pstmt = conn.prepareStatement(sql);
            
            // Setting parameters
            pstmt.setString(1, username);
            pstmt.setString(2, phoneNumber);
            pstmt.setString(3, classType);
            pstmt.setString(4, timing);
            
            // Executing SQL statement
            pstmt.executeUpdate();
            
            // Redirecting to a success page
            response.sendRedirect("registration_success.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            // Redirecting to an error page
            response.sendRedirect("error.jsp");
        } finally {
            // Closing resources
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
    }
}