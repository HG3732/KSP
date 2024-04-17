package main.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import member.model.dto.MemberDto;
import member.vo.service.MemberService;


@WebServlet("/star/join")
public class JoinController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public JoinController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/views/member/join.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memName = request.getParameter("name");
		String memId = request.getParameter("id");
		String memPwd = request.getParameter("pw");
		String memEmail = request.getParameter("mail");
		String memAddress = request.getParameter("address");
		MemberDto dto = new MemberDto(memId, 0, memName, memPwd, memEmail, memAddress);
		int result = new MemberService().insert(dto);
		if(result < 0) {	//회원가입 실패 시
			response.sendRedirect(request.getContextPath()+"/home");
			return;
		} 	//회원가입 성공 시
		else	response.sendRedirect(request.getContextPath()+"/login");
	}
}
