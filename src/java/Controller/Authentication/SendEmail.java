package Controller.Authentication;

import Model.Account;
import jakarta.mail.Authenticator;
import jakarta.mail.Message;
import jakarta.mail.Session;
import java.util.Properties;
import java.util.Random;
import jakarta.mail.PasswordAuthentication;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
/**
 *
 * @author thain
 */
public class SendEmail {

    public String getRandom() {
        Random rnd = new Random();
        int number = rnd.nextInt(999999);

        return String.format("%06d", number);
    }

    public boolean sendEmail(Account account) {
        boolean test = false;

        String toEmail = account.getUsername();
        final String fromEmail = "lethingocanh160503@gmail.com";
        final String password = "dxkorvvqjxwkqqre";

        try {
            Properties pr = new Properties();
            pr.setProperty("mail.smtp.host", "smtp.gmail.com");
            pr.setProperty("mail.smtp.port", "587");
            pr.setProperty("mail.smtp.auth", "true");
            pr.setProperty("mail.smtp.starttls.enable", "true");
            pr.put("mail.smtp.socketFactory.port", "587");

            Session session = Session.getInstance(pr, new Authenticator() {
                @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(fromEmail, password);
                }
            });

            Message mess = new MimeMessage(session);
            mess.setFrom(new InternetAddress(fromEmail));
            mess.setRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));
            mess.setSubject("User Email Verification");
            mess.setText("Registered successfully.Please verify your account using this code: " + account.getCode());
            Transport.send(mess);
            test = true;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return test;
    }

    void sendEmail(String email, String fullName) {

        String toEmail = email;
        final String fromEmail = "lethingocanh160503@gmail.com";
        final String password = "dxkorvvqjxwkqqre";

        try {
            Properties pr = new Properties();
            pr.setProperty("mail.smtp.host", "smtp.gmail.com");
            pr.setProperty("mail.smtp.port", "587");
            pr.setProperty("mail.smtp.auth", "true");
            pr.setProperty("mail.smtp.starttls.enable", "true");
            pr.put("mail.smtp.socketFactory.port", "587");

            Session session = Session.getInstance(pr, new Authenticator() {
                @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(fromEmail, password);
                }
            });

            Message mess = new MimeMessage(session);
            mess.setFrom(new InternetAddress(fromEmail));
            mess.setRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));
            mess.setSubject(" Welcome to ITJob WebPages!");
            String text = "Dear [" + fullName + "]\n"
                    + "Congratulations! You have successfully registered an account on ITJob WebPages. Welcome to our community!"
                    + "\n" + "We are excited to have you on board and provide you with opportunities to explore and apply for various job positions. With our user-friendly platform and extensive job listings, we aim to make your job search journey efficient and rewarding.\n"
                    + "Here are some key features you can access with your new account:\n"
                    + "- Explore a wide range of job listings tailored to your preferences.\n"
                    + "- Save and track your favorite job postings.\n"
                    + "- Receive personalized job recommendations based on your profile.\n"
                    + "- Connect with recruiters and potential employers.\n" + "If you have any questions or need assistance, feel free to reach out to our support team at [support email].\n"
                    + "Once again, welcome to JobSearching WebPages! We wish you success in your job search journey.\n"
                    + "Best regards,\n" + "ITJob.";

            mess.setText(text);
            Transport.send(mess);
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}
