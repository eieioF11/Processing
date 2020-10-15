// Simple Authenticator  
import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class Auth extends Authenticator {

  public Auth() {
    super();
  }

  public PasswordAuthentication getPasswordAuthentication() {
    String username, password;
    username = "test001@acpTMCIT.com";
    password = "test001";
    println("authenticating. . ");
    return new PasswordAuthentication(username, password);
  }
}
