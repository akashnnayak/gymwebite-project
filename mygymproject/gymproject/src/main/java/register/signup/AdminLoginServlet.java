package register.signup;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

@WebServlet("/admin-login")
public class AdminLoginServlet extends HttpServlet {

    static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        String url = "jdbc:mysql://localhost:3306/gymwebsite";
        String dbUsername = "root";
        String dbPassword = "mysql@akash##513";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(url, dbUsername, dbPassword);
            Statement statement = connection.createStatement();
            String query = "SELECT * FROM adminlogin WHERE username='" + username + "' AND email='" + email + "' AND password='" + password + "'";
            ResultSet resultSet = statement.executeQuery(query);
            if (resultSet.next()) {
                // Successful login, create session and redirect
                HttpSession session = request.getSession();
                session.setAttribute("username", username);
                response.sendRedirect("admin.jsp");
            } else {
                // Failed login, show error message
                request.setAttribute("errorMessage", "Invalid username, email, or password.");
                RequestDispatcher dispatcher = request.getRequestDispatcher("adminlogin.jsp");
                dispatcher.forward(request, response);
            }
            resultSet.close();
            statement.close();
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
