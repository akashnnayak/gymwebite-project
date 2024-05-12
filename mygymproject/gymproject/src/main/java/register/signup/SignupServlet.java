package register.signup;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class SignupServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name1");
        String email = request.getParameter("email1");
        String password = request.getParameter("pass1");
        String country = request.getParameter("country");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gymwebsite", "root", "mysql@akash##513");
            PreparedStatement ps = con.prepareStatement("INSERT INTO users (name, email, password, country) VALUES (?, ?, ?, ?)");
            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, password);
            ps.setString(4, country);

            int rowsInserted = ps.executeUpdate();
            if (rowsInserted > 0) {
                // Registration successful
                HttpSession session = request.getSession();
                session.setAttribute("username", name);
                session.setAttribute("email", email);
                session.setAttribute("country", country);
                response.sendRedirect("successful.html");
            } else {
                // Registration failed
                response.sendRedirect("signupfailed.html");
            }

            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}