package register.signup;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import register.connection.DbCon;

public class PaymentEmailServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve product details from request parameters
        String productName = request.getParameter("productName");
        String category = request.getParameter("category");
        double price = Double.parseDouble(request.getParameter("price"));

        // Retrieve user's email from session
        HttpSession session = request.getSession();
        String userEmail = (String) session.getAttribute("email");
     // Check if userEmail is null or empty, redirect to login page if true
        if (userEmail == null || userEmail.isEmpty()) {
            response.sendRedirect("loginpage.jsp");
            return;
        }

        // Send transaction successful email with product details
        sendTransactionSuccessfulEmail(userEmail, productName, category, price);

        // Delete the purchased product from the products table
        try {
			deleteProduct(productName);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

        // Redirect to success page or display success message
        response.sendRedirect("profile.jsp");
    }

    private void sendTransactionSuccessfulEmail(String userEmail, String productName, String category, double price) {
        // Email content
        String subject = "Transaction Successful";
        String body = "Dear User,\n\n" + "Your transaction was successful. Here are the details:\n\n"
                + "Product Name: " + productName + "\n" + "Category: " + category + "\n" + "Price: ₹" + price
                + "\n\n" + "Thank you for shopping with us.\n\n" + "Regards,\n" + "From Fitness & Health Team";

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

        // Send email
        try {
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress("legendnayak17@gmail.com"));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(userEmail));
            message.setSubject(subject);
            message.setText(body);
            Transport.send(message);
            System.out.println("Email sent successfully to " + userEmail);
        } catch (MessagingException e) {
            e.printStackTrace();
            System.out.println("Failed to send email: " + e.getMessage());
        }
    }

    private void deleteProduct(String productName) throws ClassNotFoundException {
        try (Connection conn = DbCon.getConnection();
             PreparedStatement pstmt = conn.prepareStatement("DELETE FROM products WHERE name = ?")) {
            pstmt.setString(1, productName);
            pstmt.executeUpdate();
            System.out.println("Product deleted successfully: " + productName);
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Failed to delete product: " + e.getMessage());
        }
    }
}
