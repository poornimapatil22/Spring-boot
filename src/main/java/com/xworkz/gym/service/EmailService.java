package com.xworkz.gym.service;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;

@Slf4j
@Service
public class EmailService {

    public boolean saveRegEmail(String email, String generatedPassword) {
        final String username = "ppoornimapatil@gmail.com";
        final String userPassword = "gcor mytc xfrj tjql";

        // Set up properties for the Gmail SMTP server
        Properties prop = new Properties();
        prop.put("mail.smtp.host", "smtp.gmail.com");
        prop.put("mail.smtp.port", "587");
        prop.put("mail.smtp.auth", "true");
        prop.put("mail.smtp.starttls.enable", "true");

        // Set up the session with the sender's credentials
        Session session = Session.getInstance(prop, new javax.mail.Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, userPassword); // Gmail credentials
            }
        });

        try {
            // Create a new message
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(username));  // Sender email
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email)); // Recipient email
            message.setSubject("Registration Success");

            // Build the email content
            String emailContent = "<html><body>"
                    + "<h2>Dear User,</h2>"  // You can change 'User' to a real name if you want
                    + "<p>Thank you for your registration.</p>"
                    + "<p>Your generated password is: " + generatedPassword + "</p>"
                    + "</body></html>";

            // Set the email content type to HTML
            message.setContent(emailContent, "text/html");

            // Send the message
            Transport.send(message);
            log.info("Email sent successfully to: " + email);
            return true;

        } catch (MessagingException e) {
            // Log the error properly
            log.error("Error sending email: " + e.getMessage(), e);
            return false;
        }
    }
}
