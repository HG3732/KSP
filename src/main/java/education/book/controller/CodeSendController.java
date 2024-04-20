package education.book.controller;

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

import member.model.dto.MemberInfoDto;

/**
 * Servlet implementation class EmailController
 */
@WebServlet("/code/send.ajax")
public class CodeSendController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CodeSendController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
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
		
		
		// 사용자 인증 이메일 발송 내용
//		String host = "http://192.168.10.11:8080";
		String from = "seojw0730@gmail.com";
		MemberInfoDto dto = (MemberInfoDto)request.getSession().getAttribute("ssslogin");
		String to = dto.getMem_email();
		System.out.println(to);
		String subject = "KSP 교육 신청 인증번호";
		String content = "인증번호 : " + code;
//		String subject = "KSP 교육 신청 양식 메일";
//		String content = "링크에 접속해 양식을 작성해주세요.\n"
//		  +	"<a href='" + host + "/star/email/check?code=" + SHA256.getSHA256(to) + "'>교육 신청 양식</a>";
		
		// 이메일 전송 : SMTP 이용을 위함
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
			Authenticator auth = new Gmail();
		    Session ses = Session.getInstance(p, auth);
		    ses.setDebug(true);
		    MimeMessage msg = new MimeMessage(ses); 
		    msg.setSubject(subject);		// 메일 제목
		    Address fromAddr = new InternetAddress(from); 	// 보내는 사람 정보
		    msg.setFrom(fromAddr);
		    Address toAddr = new InternetAddress(to);		// 받는 사람 정보
		    msg.addRecipient(Message.RecipientType.TO, toAddr);
		    msg.setContent(content, "text/html;charset=UTF-8");
		    Transport.send(msg); // 메세지 전송
		    response.getWriter().append(code);
		}catch(Exception e){
			e.printStackTrace();
			response.getWriter().append(code);
		}
	}
}
