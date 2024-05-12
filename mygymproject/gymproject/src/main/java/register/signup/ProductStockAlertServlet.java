package register.signup;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class ProductStockAlertServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // JDBC URL, username, and password of MySQL server
        String url = "jdbc:mysql://localhost:3306/gymwebsite";
        String user = "root";
        String password = "mysql@akash##513";

        // SQL query to count the number of products
        String query = "SELECT COUNT(*) FROM products";

        try {
            // Creating a connection to the database
            Connection conn = DriverManager.getConnection(url, user, password);

            // Creating a statement to execute the query
            Statement stmt = conn.createStatement();

            // Executing the query and retrieving the result
            ResultSet rs = stmt.executeQuery(query);
            rs.next();
            int productCount = rs.getInt(1);

            // Close the connection
            conn.close();

            // Check if the product count is less than 4
            if (productCount < 4) {
                // Send alert message to admin email
                sendAlertToAdmin("akashnayakz153@gmail.com", "Admin!, your stock is less than expected numbers, please add new products");
                response.getWriter().println("Alert sent to admin!");
            } else {
                response.getWriter().println("Product stock is sufficient.");
            }
        } catch (SQLException ex) {
            response.getWriter().println("SQLException: " + ex.getMessage());
            ex.printStackTrace();
        }
    }

    private void sendAlertToAdmin(String adminEmail, String message) {
        // Email configuration
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.socketFactory.port", "465");
        props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.port", "465");
        Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication("legendnayak17@gmail.com", "azjr gzej ouwd xfjb");
            }
        });

        // Email content
        String subject = "Stock Alert";
        String body = message;

        // Send email
        try {
            MimeMessage mimeMessage = new MimeMessage(session);
            mimeMessage.setFrom(new InternetAddress("legendnayak17@gmail.com"));
            mimeMessage.addRecipient(Message.RecipientType.TO, new InternetAddress(adminEmail));
            mimeMessage.setSubject(subject);
            mimeMessage.setText(body);
            Transport.send(mimeMessage);
            System.out.println("Alert email sent successfully to admin: " + adminEmail);
        } catch (MessagingException e) {
            e.printStackTrace();
            System.out.println("Failed to send alert email to admin: " + e.getMessage());
        }
    }
}

