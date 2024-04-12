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

@WebServlet("/changeinfo")
public class ChangeMyInfoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	MemberService service = new MemberService();
       
    public ChangeMyInfoController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/views/common/mypage.jsp").forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberInfoDto currentDto = (MemberInfoDto)request.getSession().getAttribute("ssslogin");
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String email = request.getParameter("email");
		String address = request.getParameter("address");
		
		// ajax
		// 성공 > 0
		// 실패 : 0
		int changeResult = 0;
		changeResult = service.mypageUpdate(id, pwd, email, address, currentDto.getMem_id());
		request.getSession().removeAttribute("ssslogin");
		response.getWriter().append(String.valueOf(changeResult));
	}
}
