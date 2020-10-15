import java.util.Properties;

// A function to send mail
void sendMail() {
  // Create a session
  println("send mail");

  Properties props=new Properties();

  // SMTP Session
  props.put("mail.transport.protocol", "smtp");
  props.put("mail.smtp.host", hostIP);
  props.put("mail.smtp.port", "25");
  props.put("mail.smtp.auth", "true");
  props.put("mail.smtp.starttls.enable","true");

  // Create a session
  Session session = Session.getDefaultInstance(props, new Auth());

  try
  {
    // Make a new message
    MimeMessage message = new MimeMessage(session);

    // Who is this message from
    message.setFrom(new InternetAddress(mailSource, sender));

    // Who is this message to (CC's)
    message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(mailAddress, false));

    // Subject and body
    message.setSubject(mailSubject);
    message.setText(mailMessage);

    // We can do more here, set the date, the headers, etc.
    Transport.send(message);
    println("Mail sent!");
    flagSend = 1;
  }
  catch(Exception e)
  {
    e.printStackTrace();
  }

}


