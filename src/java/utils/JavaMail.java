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
import javax.activation.DataHandler;
import javax.activation.FileDataSource;
import javax.mail.Address;
import javax.mail.BodyPart;
import javax.mail.Session;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMultipart;

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
    String Cc = "";

    public String getCc() {
        return Cc;
    }

    public void setCc(String Cc) {
        this.Cc = Cc;
    }

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
            message.setRecipients(Message.RecipientType.CC,
                    InternetAddress.parse(Cc));
            message.setSubject(Asunto);
            message.setText(Mensage);

            Transport.send(message);

        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }

    }

    public void sendConfirmacion() {

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

            MimeMessage simpleMessage = new MimeMessage(session);
            simpleMessage.setFrom(new InternetAddress(Username));
            simpleMessage.setRecipients(Message.RecipientType.TO,
                    InternetAddress.parse(To));
            simpleMessage.setRecipients(Message.RecipientType.CC,
                    InternetAddress.parse(Cc));
            simpleMessage.setSubject(Asunto);
            simpleMessage.setText(Mensage, "utf-8", "html");

            Transport.send(simpleMessage);

        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }

    }

    public void sendRecordatorio() {

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
            // Se compone la parte del texto
            BodyPart texto = new MimeBodyPart();
            texto.setText("" + Mensage);

            // Se compone el adjunto con la imagen
            BodyPart adjunto = new MimeBodyPart();
            adjunto.setDataHandler(
                    new DataHandler(new FileDataSource("" + System.getProperty("user.dir") + "/recordatorio.pdf")));
            adjunto.setFileName("recordatorio.pdf");
            // Una MultiParte para agrupar texto e imagen.
            MimeMultipart multiParte = new MimeMultipart();
            multiParte.addBodyPart(texto);
            multiParte.addBodyPart(adjunto);
            MimeMessage simpleMessage = new MimeMessage(session);
            simpleMessage.setFrom(new InternetAddress(Username));
            simpleMessage.setRecipients(Message.RecipientType.TO,
                    InternetAddress.parse(To));
            simpleMessage.setRecipients(Message.RecipientType.CC,
                    InternetAddress.parse(Cc));
            simpleMessage.setSubject(Asunto);
            simpleMessage.setContent(multiParte);
            Transport.send(simpleMessage);

        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }

    }

    public void send1erRequerimiento() {

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
            // Se compone la parte del texto
            BodyPart texto = new MimeBodyPart();
            texto.setText("" + Mensage);

            // Se compone el adjunto con la imagen
            BodyPart adjunto = new MimeBodyPart();
            adjunto.setDataHandler(
                    new DataHandler(new FileDataSource("" + System.getProperty("user.dir") + "/requerimiento1.pdf")));
            adjunto.setFileName("requerimiento1.pdf");
            // Una MultiParte para agrupar texto e imagen.
            MimeMultipart multiParte = new MimeMultipart();
            multiParte.addBodyPart(texto);
            multiParte.addBodyPart(adjunto);
            MimeMessage simpleMessage = new MimeMessage(session);
            simpleMessage.setFrom(new InternetAddress(Username));
            simpleMessage.setRecipients(Message.RecipientType.TO,
                    InternetAddress.parse(To));
            simpleMessage.setRecipients(Message.RecipientType.CC,
                    InternetAddress.parse(Cc));
            simpleMessage.setSubject(Asunto);
            simpleMessage.setContent(multiParte);
            Transport.send(simpleMessage);

        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }

    }

    public void send2doRequerimiento() {

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
            // Se compone la parte del texto
            BodyPart texto = new MimeBodyPart();
            texto.setText("" + Mensage);

            // Se compone el adjunto con la imagen
            BodyPart adjunto = new MimeBodyPart();
            adjunto.setDataHandler(
                    new DataHandler(new FileDataSource("" + System.getProperty("user.dir") + "/requerimiento2.pdf")));
            adjunto.setFileName("requerimiento2.pdf");
            // Una MultiParte para agrupar texto e imagen.
            MimeMultipart multiParte = new MimeMultipart();
            multiParte.addBodyPart(texto);
            multiParte.addBodyPart(adjunto);
            MimeMessage simpleMessage = new MimeMessage(session);
            simpleMessage.setFrom(new InternetAddress(Username));
            simpleMessage.setRecipients(Message.RecipientType.TO,
                    InternetAddress.parse(To));
            simpleMessage.setRecipients(Message.RecipientType.CC,
                    InternetAddress.parse(Cc));
            simpleMessage.setSubject(Asunto);
            simpleMessage.setContent(multiParte);
            Transport.send(simpleMessage);

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
