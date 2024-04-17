package main.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import education.model.service.EduService;
import member.model.dto.MemberInfoDto;
import member.model.dto.MemberLoginDto;
import member.service.MemberService;

@WebServlet("/star/mypage")
public class MyPageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	MemberService service = new MemberService();
       
    public MyPageController() {
        super(); 
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getSession().setAttribute("recentEdu", new EduService().selectRecent().getEduSubject());
		request.getRequestDispatcher("/WEB-INF/views/common/mypage.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String pwd = request.getParameter("pw");
		//새 로그인 객체 생성 후 전달받은 비밀번호 입력
		MemberLoginDto dto = new MemberLoginDto();
		dto.setMem_pwd(pwd);
		//기존에 로그인 돼있던 유저 정보에서 id만 추출
		MemberInfoDto currentDto =	(MemberInfoDto)request.getSession().getAttribute("ssslogin"); 
		dto.setMem_id(currentDto.getMem_id());
		
		int checkResult = 0;
		MemberInfoDto result = null;
		result = service.loginGetInfo(dto);
		if(result != null) {
			request.getSession().setAttribute("ssslogin", result);
			checkResult = 1;
		}
		response.getWriter().append(String.valueOf(checkResult));
	}

}
