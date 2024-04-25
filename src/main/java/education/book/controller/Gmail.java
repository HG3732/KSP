package education.book.controller;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class Gmail extends Authenticator {
	@Override
	protected PasswordAuthentication getPasswordAuthentication() {
		InputStream input = getClass().getClassLoader().getResourceAsStream("driver.properties");
		Properties prop = new Properties();
		PasswordAuthentication result = null;
		try {
			prop.load(input);
			result = new PasswordAuthentication(prop.getProperty("gmail.email"), prop.getProperty("gmail.password"));
			input.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return result;
//		return new PasswordAuthentication("구글 이메일", "앱 비밀번호");
	}
}
