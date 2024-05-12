package register.signup;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

/**
 * Servlet implementation class TrainerSignupServlet
 */


public class TrainerSignupServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 response.setContentType("text/html");
		 PrintWriter out = response.getWriter();

	        // Retrieve form data
	        String fullName = request.getParameter("full_name");
	        String email = request.getParameter("email");
	        String phoneNumber = request.getParameter("phone_number");
	        String birthDate = request.getParameter("birth_date");
	        String gender = request.getParameter("gender");
	        String addressLine1 = request.getParameter("address_line1");
	        String addressLine2 = request.getParameter("address_line2");
	        String country = request.getParameter("country");
	        String city = request.getParameter("city");
	        String region = request.getParameter("region");
	        String postalCode = request.getParameter("postal_code");

	        try {
	            // Register JDBC driver
	            Class.forName("com.mysql.cj.jdbc.Driver");

	            // Open a connection
	            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/gymwebsite", "root", "mysql@akash##513");

	            // SQL query to insert data into the Trainer table
	            PreparedStatement ps = conn.prepareStatement("INSERT INTO trainer ( full_name, email, phone_number, birth_date, gender, address_line1, address_line2, country, city, region, postal_code) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
	            // Create a PreparedStatement object to execute the query
	          
	            ps.setString(1, fullName);
	            ps.setString(2, email);
	            ps.setString(3, phoneNumber);
	            ps.setString(4, birthDate);
	            ps.setString(5, gender);
	            ps.setString(6, addressLine1);
	            ps.setString(7, addressLine2);
	            ps.setString(8, country);
	            ps.setString(9, city);
	            ps.setString(10, region);
	            ps.setString(11, postalCode);

				// Execute the query
	            int i = ps.executeUpdate();
	            if (i > 0) {
	                // Redirect to successful.html on successful signup
	                response.sendRedirect("successful.html");
	            } else {
	                // Redirect to signupfailed.html on unsuccessful signup
	                response.sendRedirect("tr-error.jsp");
	            }

	            conn.close();
	        } catch (Exception e) {
	            out.print(e);
	        }

	        out.close();
	    }
	}
