package member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import education.model.service.EduService;
import member.service.MemberService;

@WebServlet("/member/info")
public class ChangeMemberInfoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	MemberService service = new MemberService();
	
    public ChangeMemberInfoController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getSession().setAttribute("recentEdu", new EduService().selectRecent().getEduSubject());
		request.getRequestDispatcher("/WEB-INF/views/member/memberinfo.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mem_id = request.getParameter("memberid");
		String adminStr = request.getParameter("grade");
		int admin = Integer.parseInt(adminStr);
		System.out.println("controller : mem_id = " + mem_id);
		System.out.println("controller : admin = " + admin);
		
		
	}

}
