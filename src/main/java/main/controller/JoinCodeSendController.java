package main.controller;

import java.io.FileReader;
import java.io.IOException;
import java.util.Properties;
import java.util.Random;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.SemiTemplate;

@WebServlet("/member/join/code/send.ajax")
public class JoinCodeSendController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	Properties prop = new Properties();
	
    public JoinCodeSendController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 랜덤 문자열
		int leftLimit = 97; // 'a'
		int rightLimit = 122; // 'z'
		int codeLength = 10;
		Random rand = new Random();
		StringBuilder sb = new StringBuilder(codeLength);
		for(int i = 0; i < codeLength; i++) {
			int randLimitInt = leftLimit + (int)(rand.nextFloat() * (rightLimit - leftLimit + 1));
			sb.append((char)randLimitInt);
			}
		String code = sb.toString();
		
		String currentPath = SemiTemplate.class.getResource("").getPath();
		prop.load(new FileReader(currentPath + "driver.properties"));
		
		//회원 인증 이메일 발송 내용
		//발송인
		String from = prop.getProperty("google.mail");
		//수신인
		String to = request.getParameter("mail");
		//메일 제목
		String subject = "김서박 회원가입 이메일 인증번호";
		//메일 내용
		String content = "김서박의 회원가입을 환영합니다.\n 가입 진행을 위해 다음의 코드를 입력해주세요. \n 인증 코드 : " + code;
		
		//고정 부분
		Properties p = new Properties();
		p.put("mail.smtp.user", from);
		p.put("mail.smtp.host", "smtp.googlemail.com"); // google SMTP 주소
		p.put("mail.smtp.port", "465");
		p.put("mail.smtp.starttls.enable", "true");
		p.put("mail.smtp.auth", "true");
		p.put("mail.smtp.debug", "true");
		p.put("mail.smtp.socketFactory.port", "465");
		p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		p.put("mail.smtp.socketFactory.fallback", "false");
		p.put("mail.smtp.ssl.protocols", "TLSv1.2"); // 추가된 코드
		p.put("mail.smtp.ssl.enable", "true");  // 추가된 코드
		
		try{
			Authenticator auth = new JoinGmail();
		    Session ses = Session.getInstance(p, auth);
		    ses.setDebug(true);
		    MimeMessage msg = new MimeMessage(ses); 
		    msg.setSubject(subject);		// 메일 제목 등록
		    Address fromAddr = new InternetAddress(from); 	// 보내는 사람 정보 등록
		    msg.setFrom(fromAddr);
		    Address toAddr = new InternetAddress(to);		// 받는 사람 정보 등록
		    msg.addRecipient(Message.RecipientType.TO, toAddr);
		    msg.setContent(content, "text/html;charset=UTF-8");
		    Transport.send(msg); // 메세지 전송
		    response.getWriter().append(code);
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
}
