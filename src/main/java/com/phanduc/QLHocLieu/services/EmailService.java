package com.phanduc.QLHocLieu.services;

import com.phanduc.QLHocLieu.dto.ContactFormDto;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class EmailService {

    private static final Logger logger = LoggerFactory.getLogger(EmailService.class);

    @Autowired
    private JavaMailSender mailSender;

    public void sendEmail(ContactFormDto contactFormDTO, String predefinedMessage) {
        try {
            SimpleMailMessage message = new SimpleMailMessage();
            message.setTo(contactFormDTO.getEmail());
            message.setSubject("Contact Form Submission");
            message.setText("Name: " + contactFormDTO.getName() + "\nMessage: " + predefinedMessage);
            mailSender.send(message);
            logger.info("Sent email to {}", contactFormDTO.getEmail());
        } catch (Exception e) {
            logger.error("Error while sending email to {}", contactFormDTO.getEmail(), e);
            throw e;
        }
    }

    public void sendThankYouEmail(ContactFormDto contactFormDTO) {
        try {
            SimpleMailMessage thankYouMessage = new SimpleMailMessage();
            thankYouMessage.setTo(contactFormDTO.getEmail());
            thankYouMessage.setSubject("Thank You for Contacting Us");
            thankYouMessage.setText("Dear " + contactFormDTO.getName() + ",\n\nThank you for reaching out to us. We have received your email and will get back to you soon.\n\nBest regards,\nYour Company Name");
            mailSender.send(thankYouMessage);
            logger.info("Sent thank you email to {}", contactFormDTO.getEmail());
        } catch (Exception e) {
            logger.error("Error while sending thank you email to {}", contactFormDTO.getEmail(), e);
            throw e;
        }
    }
}