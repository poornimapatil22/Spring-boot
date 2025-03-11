package com.xworkz.gym.service;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;

@Service
public class EmailService {

    @Value("${mail.username}")  // Sender email (not user email)
    private String senderEmail;

    @Value("${mail.password}")  // App password for sender email
    private String senderPassword;

    public boolean sendPasswordToEmail(String userEmail, String generatedPassword) {
        if (userEmail == null || userEmail.isEmpty()) {
            System.err.println("Error: User email is null or empty!");
            return false;
        }

        Properties prop = new Properties();
        prop.put("mail.smtp.host", "smtp.gmail.com");
        prop.put("mail.smtp.port", "587");
        prop.put("mail.smtp.auth", "true");
        prop.put("mail.smtp.starttls.enable", "true");

        Session session = Session.getInstance(prop, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(senderEmail, senderPassword); // Use stored credentials
            }
        });

        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(senderEmail));  // Use the single sender email
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(userEmail));  // Send to user
            message.setSubject("Your Registration Password");
            message.setText("Dear user, your generated password is: " + generatedPassword);

            Transport.send(message);
            System.out.println("Email sent successfully to: " + userEmail);
            return true;
        } catch (MessagingException e) {
            System.err.println("Error sending email: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }
}
