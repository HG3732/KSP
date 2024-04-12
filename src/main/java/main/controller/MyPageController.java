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

@WebServlet("/mypage")
public class MyPageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	MemberService service = new MemberService();
       
    public MyPageController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/views/common/mypage.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String pwd = request.getParameter("pwd");
		MemberLoginDto dto = new MemberLoginDto();
		MemberInfoDto currentDto =	(MemberInfoDto)request.getSession().getAttribute("ssslogin"); 
		dto.setMem_pwd(pwd);
		dto.setMem_id(currentDto.getMem_id());
		MemberInfoDto result = null;
		result = service.loginGetInfo(dto);
		if(result != null) {
			request.getSession().setAttribute("ssslogin", result);
		}
		response.getWriter().append(String.valueOf(result));
	}

}
