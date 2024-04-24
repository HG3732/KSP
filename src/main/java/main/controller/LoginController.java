package main.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
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
		
		pw = pe.getEncrypt(pw);

		MemberLoginDto dto = new MemberLoginDto(id, pw);

		
		// 성공 : 1
		// 실패 : 0
		// 정지 : -1
		int result = 0;
		MemberInfoDto resultInfo = service.loginGetInfo(dto);
		if(resultInfo != null) {
			//성공은 했으나 정지회원일 때
			if(resultInfo.getMem_admin() == -1) {
				result = -1;
			} else {
			//성공, 정지 회원 아님
			service.cntResetUpdate(id);
			request.getSession().setAttribute("ssslogin", resultInfo);
			result = 1;
			}
		} else {
			result = 0;
			service.failCntUpdate(id);
		}
		
		response.getWriter().append(String.valueOf(result));
	
	}
}
