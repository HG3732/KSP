package main.controller;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class JoinGmail extends Authenticator {
	@Override
	protected PasswordAuthentication getPasswordAuthentication() {
		InputStream input = getClass().getClassLoader().getResourceAsStream("driver.properties");
		Properties prop = new Properties();
		try {
			prop.load(input);
			System.out.println("mailId : " + prop.getProperty("google.mail"));
			System.out.println("apppwd : " + prop.getProperty("google.apppwd"));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		//구글 메일, 앱 비밀번호 입력
		return new PasswordAuthentication(prop.getProperty("google.mail"), prop.getProperty("google.apppwd"));
	}
}
