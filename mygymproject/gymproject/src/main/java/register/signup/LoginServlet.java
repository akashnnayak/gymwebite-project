package register.signup;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import jakarta.servlet.RequestDispatcher;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gymwebsite", "root", "mysql@akash##513");

            PreparedStatement ps = con.prepareStatement("SELECT * FROM users WHERE name = ? AND password = ?");
            ps.setString(1, username);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                // Login successful
                // Retrieve user's details from database
                int id = rs.getInt("id");
                String fullName = rs.getString("name");
                String email = rs.getString("email");
                String country = rs.getString("country");

                // Generate user's initials
                String initials = fullName.substring(0, Math.min(fullName.length(), 2));

                // Set user's details and initials as attributes in the session
                HttpSession session = request.getSession();
                session.setAttribute("id", id);
                session.setAttribute("name", fullName);
                session.setAttribute("email", email);
                session.setAttribute("country", country);
                session.setAttribute("initials", initials);

                // Open profile.jsp in a new tab
                String profileURL = "profile.jsp";
                String target = "_blank"; // Open in a new tab
                String script = "<script>window.open('" + profileURL + "', '" + target + "');</script>";
                response.getWriter().println(script);
            } else {
                // Login failed
                // Display an error message
                String errorMessage = "Invalid username or password";
                request.setAttribute("errorMessage", errorMessage);
                RequestDispatcher dispatcher = request.getRequestDispatcher("loginpage.jsp");
                dispatcher.forward(request, response);
            }

            con.close();
        } catch (Exception e) {
            out.print(e);
        }

        out.close();
    }
}
