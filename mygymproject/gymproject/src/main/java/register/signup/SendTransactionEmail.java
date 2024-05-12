package register.signup;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

@WebServlet("/sendTransactionEmail")
public class SendTransactionEmail extends HttpServlet {
    
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve email and product details from session
        String email = (String) request.getSession().getAttribute("email");
        String productName = (String) request.getSession().getAttribute("productName");
        String productPrice = (String) request.getSession().getAttribute("productPrice");
        
        // Check if email and product details are available
        if (email != null && productName != null && productPrice != null) {
            // Sending email with transaction details
            sendEmail(email, productName, productPrice);

            // Redirect or forward to a success page
            response.sendRedirect("transactionSuccess.jsp");
        } else {
            // Handle case where session attributes are missing
            // Redirect or forward to an error page
            response.sendRedirect("error.jsp");
        }
    }

    // Method to send email
    private void sendEmail(String email, String productName, String productPrice) {
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

        try {
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress("legendnayak17@gmail.com"));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(email));
            message.setSubject("Transaction Successful");
            message.setText("Your transaction for " + productName + " of price " + productPrice + " was successful.");
            Transport.send(message);
            System.out.println("Message sent successfully.");
        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }
}
