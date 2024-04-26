package main.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import education.model.service.EduService;
import member.model.dto.MemberInfoDto;
import member.model.dto.MemberLoginDto;
import member.service.MemberService;

@WebServlet("/login")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private MemberService service = new MemberService();
	private PasswordEncryption pe = new PasswordEncryption();
	
    public LoginController() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/views/loginpage.jsp").forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String remember = request.getParameter("remember-id");
		Cookie cookie = null;
		
		pw = pe.getEncrypt(pw);

		MemberLoginDto dto = new MemberLoginDto(id, pw);
		
		// 성공 : 0
		// 정지 : -1
		// 실패 --> 실패 횟수( 1~5)
		int result = 0;
		MemberInfoDto resultInfo = service.loginGetInfo(dto);
		if(resultInfo != null) {	//아이디 비밀번호 전부 맞췄는데
			//성공은 했으나 정지회원일 때
			if(resultInfo.getMem_admin() == -1) {
				result = -1;
			} else {
			//성공, 정지 회원 아님
			service.cntResetUpdate(id);
			request.getSession().setAttribute("ssslogin", resultInfo);
			result = 0;
				//아이디 기억 체크되있을 경우 쿠키에 아이디 저장
				if(remember.equals("remember")) {
					cookie = new Cookie("rememberedId", resultInfo.getMem_id());
					cookie.setMaxAge(60*60*24*30);	//쿠키 유효기간 : 한달
					response.addCookie(cookie);
				}
				//로그인 성공했으나 기억 체크 안되있을 경우 이전 쿠키 삭제
				if(!remember.equals("remember") && cookie != null) {
					cookie.setMaxAge(0);
				}
			}
		} else {
			if(service.selectCheckId(id) > 0) {	//아이디는 맞추고 비밀번호는 틀렸을 때
				result = service.failCntUpdate(id);
				if(result == 5) {	//5회이상 로그인 실패 시 해당계정 정지
					service.adminUpdate(id, -1);
					result = -1;
				}
			} else {	//아이디도 틀렸을 때
				result = -2;
				}
		}
		response.getWriter().append(String.valueOf(result));
	}
}
