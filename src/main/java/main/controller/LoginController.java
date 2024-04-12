package main.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.dto.MemberInfoDto;
import member.model.dto.MemberLoginDto;
import member.vo.service.MemberService;

@WebServlet("/login")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private MemberService service = new MemberService();
	
    public LoginController() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/views/loginpage.jsp").forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		MemberLoginDto dto = new MemberLoginDto(id, pw);
		
		// ajax
		// 성공 : 1
		// 실패 : 0
		int result = 0;
		MemberInfoDto resultInfo = service.loginGetInfo(dto);
		if(resultInfo != null) {
			//성공
			request.getSession().setAttribute("ssslogin", resultInfo);
			result = 1;
		}
		response.getWriter().append(String.valueOf(result));
	
	}
}
