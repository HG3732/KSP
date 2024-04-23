package main.controller;

import java.security.MessageDigest;
import java.security.SecureRandom;

import education.book.controller.SHA256;

public class PasswordEncryption {

	public String getEncrypt(String pwd) {
		String result = "";
		try {
			//SHA256 알고리즘 객체 생성
			MessageDigest md = MessageDigest.getInstance("SHA-256");
			
			//pwd와 salt합친 문자열에 SHA 256 적용
//			System.out.println("pwd 적용 전 : " + pwd);
			md.reset();
			md.update((pwd).getBytes());
			byte[] pwdsalt = md.digest();
			
			//byte to String
			StringBuffer sb = new StringBuffer();
			for(byte b : pwdsalt) {
				sb.append(String.format("%02x", b));
			}
			result = sb.toString();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
}
