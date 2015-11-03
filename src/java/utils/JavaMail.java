/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utils;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;
import javax.mail.Session;

/**
 *
 * @author Oscar
 */
public class JavaMail {

    public static String Username = "micuenta40@gmail.com";
    public static String PassWord = "qwe789..";
    String Mensage = "Una nueva PQRS ha sido registrada en el sistema";
    String To = "micuenta40@gmail.com";
    String Asunto = "PQRS nueva";

    public void sendMail() {

        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");

        Session session = Session.getInstance(props,
                new javax.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(Username, PassWord);
                    }
                });

        try {

            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(Username));
            message.setRecipients(Message.RecipientType.TO,
                    InternetAddress.parse(To));
            message.setSubject(Asunto);
            message.setText(Mensage);

            Transport.send(message);

        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }

    }

    public static String getUsername() {
        return Username;
    }

    public static void setUsername(String Username) {
        JavaMail.Username = Username;
    }

    public static String getPassWord() {
        return PassWord;
    }

    public static void setPassWord(String PassWord) {
        JavaMail.PassWord = PassWord;
    }

    public String getMensage() {
        return Mensage;
    }

    public void setMensage(String Mensage) {
        this.Mensage = Mensage;
    }

    public String getTo() {
        return To;
    }

    public void setTo(String To) {
        this.To = To;
    }

    public String getAsunto() {
        return Asunto;
    }

    public void setAsunto(String Asunto) {
        this.Asunto = Asunto;
    }
}
