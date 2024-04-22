package education.book.controller;

import java.io.FileReader;
import java.io.IOException;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class Gmail extends Authenticator {
	@Override
	protected PasswordAuthentication getPasswordAuthentication() {
		Properties prop = new Properties();
		try {
			prop.load(new FileReader("/KSP/resources/driver.properties"));
		} catch (IOException e) {
			e.printStackTrace();
		}
		return new PasswordAuthentication(prop.getProperty("gmail.email"), prop.getProperty("gmail.password"));
//		return new PasswordAuthentication("구글 이메일", "앱 비밀번호");
	}
}
