package com.phanduc.QLHocLieu.controllers;

import com.phanduc.QLHocLieu.dto.ContactFormDto;
import com.phanduc.QLHocLieu.services.EmailService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
@RestController
@RequestMapping("/api/contact")
public class ContactController {

    private static final Logger logger = LoggerFactory.getLogger(ContactController.class);

    @Autowired
    private EmailService emailService;

    @PostMapping("/submit")
    public String submitContactForm(@RequestBody ContactFormDto contactFormDTO) {
        try {
            logger.info("Received contact form submission: {}", contactFormDTO);
            String predefinedMessage = "Thank you for contacting us. We will get back to you soon.";
            emailService.sendEmail(contactFormDTO, predefinedMessage);
            emailService.sendThankYouEmail(contactFormDTO);
            return "Email sent successfully!";
        } catch (Exception e) {
            logger.error("Error while sending email", e);
            return "Error while sending email: " + e.getMessage();
        }
    }
}