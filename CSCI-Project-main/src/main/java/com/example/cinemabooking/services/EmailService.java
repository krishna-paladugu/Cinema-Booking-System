package com.example.cinemabooking.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Service;
import org.thymeleaf.TemplateEngine;
import org.thymeleaf.context.Context;
import org.thymeleaf.templateresolver.ClassLoaderTemplateResolver;

import javax.mail.internet.InternetAddress;
import java.util.Date;

@Service
public class EmailService {

    private final TemplateEngine templateEngine;

    @Autowired
    private JavaMailSender mailSender;

    private void send(MimeMessagePreparator preparator) {
        mailSender.send(preparator);
    }

    @Autowired
    public EmailService(TemplateEngine templateEngine) {
        ClassLoaderTemplateResolver templateResolver = new ClassLoaderTemplateResolver();
        templateResolver.setPrefix("mail/");
        templateResolver.setSuffix(".html");
        templateResolver.setTemplateMode("HTML");
        templateResolver.setCacheable(false);
        templateEngine.setTemplateResolver(templateResolver);
        this.templateEngine = templateEngine;
    }

    public void sendVerificationEmail(String email, String firstname) {
        Context context = new Context();
        context.setVariable("name", firstname);
        String emailContents = templateEngine.process("verifyemail", context);
        MimeMessagePreparator preparator = mimeMessage -> {
            MimeMessageHelper message = new MimeMessageHelper(mimeMessage);
            message.setTo(email);
            message.setFrom(new InternetAddress("no-reply@cinemabooking.com"));
            message.setSubject("Verify Your Email Address");
            message.setSentDate(new Date());
            message.setText(emailContents, true);
        };
        send(preparator);
    }

    public void sendPromotionEmail(String email, String firstname, String promocode, String discount, String start, String end) {
        Context context = new Context();
        context.setVariable("name", firstname);
        context.setVariable("promocode", promocode);
        context.setVariable("discount", discount);
        context.setVariable("start", start);
        context.setVariable("end", end);
        String emailContents = templateEngine.process("promotionemail", context);
        MimeMessagePreparator preparator = mimeMessage -> {
            MimeMessageHelper message = new MimeMessageHelper(mimeMessage);
            message.setTo(email);
            message.setFrom(new InternetAddress("no-reply@cinemabooking.com"));
            message.setSubject("New Promotion");
            message.setSentDate(new Date());
            message.setText(emailContents, true);
        };
        send(preparator);
    }
}
