package register.signup;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class MemsPaymentEmail extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve payment details from request parameters
        String membershipType = request.getParameter("membershipType");
        double price = Double.parseDouble(request.getParameter("price"));
        int duration = Integer.parseInt(request.getParameter("duration"));
        String cardHolderName = request.getParameter("cardHolderName"); // Assuming payment details are collected

        // Retrieve user's email from session
        HttpSession session = request.getSession();
        String userEmail = (String) session.getAttribute("email");
     // Check if userEmail is null or empty, redirect to login page if true
        if (userEmail == null || userEmail.isEmpty()) {
            response.sendRedirect("loginpage.jsp");
            return;
        }

        // Send payment confirmation email with payment details
        sendPaymentConfirmationEmail(userEmail, membershipType, price, duration, cardHolderName);

        // Redirect to success page or display success message
        response.sendRedirect("display_memberships.jsp");
    }

    private void sendPaymentConfirmationEmail(String userEmail, String membershipType, double price, int duration,
            String cardHolderName) {
        // Email content
        String subject = "Membership Payment Confirmation";
        String body = "Dear User,\n\n" + "Your membership payment was successful. Here are the details:\n\n"
                + "Membership Type: " + membershipType + "\n" + "Price: ₹" + price + "\n" + "Duration: " + duration
                + " month(s)\n" + "Cardholder Name: " + cardHolderName + "\n\n"
                + "Thank you for your membership purchase.\n\n" + "Regards,\n" + "Fitness & Health Team";

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
}
