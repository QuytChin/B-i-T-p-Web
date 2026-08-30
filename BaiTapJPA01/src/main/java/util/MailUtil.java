package util;

import java.io.InputStream;
import java.util.Properties;

import jakarta.mail.Authenticator;
import jakarta.mail.Message;
import jakarta.mail.PasswordAuthentication;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;

public final class MailUtil {

    private MailUtil() {
    }

    public static void sendOtp(String toEmail, String subject, String otp) throws Exception {
        MailSettings settings = loadSettings();

        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", settings.host);
        props.put("mail.smtp.port", settings.port);

        Session session = Session.getInstance(props, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(settings.username, settings.appPassword);
            }
        });

        MimeMessage message = new MimeMessage(session);
        message.setFrom(new InternetAddress(settings.username, "BaiTap02 JPA"));
        message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail));
        message.setSubject(subject, "UTF-8");
        message.setContent(
                "<div style='font-family:Arial,sans-serif'>"
                + "<h2>Mã OTP của bạn</h2>"
                + "<p>Mã OTP có hiệu lực trong 5 phút:</p>"
                + "<div style='font-size:32px;font-weight:bold;letter-spacing:6px'>" + otp + "</div>"
                + "<p>Nếu bạn không thực hiện yêu cầu này, hãy bỏ qua email.</p>"
                + "</div>",
                "text/html; charset=UTF-8");

        Transport.send(message);
    }

    private static MailSettings loadSettings() throws Exception {
        Properties local = new Properties();
        try (InputStream input = MailUtil.class.getClassLoader().getResourceAsStream("mail.properties")) {
            if (input != null) {
                local.load(input);
            }
        }

        String username = firstNonBlank(
                System.getenv("MAIL_USERNAME"),
                System.getProperty("MAIL_USERNAME"),
                local.getProperty("mail.username"));
        String appPassword = firstNonBlank(
                System.getenv("MAIL_APP_PASSWORD"),
                System.getProperty("MAIL_APP_PASSWORD"),
                local.getProperty("mail.appPassword"));
        String host = firstNonBlank(local.getProperty("mail.host"), "smtp.gmail.com");
        String port = firstNonBlank(local.getProperty("mail.port"), "587");

        if (username == null || appPassword == null
                || username.startsWith("YOUR_") || appPassword.startsWith("YOUR_")) {
            throw new IllegalStateException(
                    "Chưa cấu hình Gmail gửi OTP. Tạo src/main/resources/mail.properties theo mail.properties.example");
        }

        return new MailSettings(username, appPassword, host, port);
    }

    private static String firstNonBlank(String... values) {
        for (String value : values) {
            if (value != null && !value.isBlank()) return value.trim();
        }
        return null;
    }

    private record MailSettings(String username, String appPassword, String host, String port) {
    }
}
