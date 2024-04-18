package main.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.service.MemberService;

@WebServlet("/quit/member")
public class QuitMemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	MemberService service = new MemberService();

	public QuitMemberController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int quitResult = 0;
		String member_id = request.getParameter("member_id");
		System.out.println(member_id);
		
		quitResult = service.delete(member_id);
		request.getSession().removeAttribute("ssslogin");
		response.getWriter().append(String.valueOf(quitResult));
	}

}
