package member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.service.MemberService;

@WebServlet("/change/admin")
public class ChangeMemberAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	MemberService service = new MemberService();
       
    public ChangeMemberAdmin() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int result = 0;
		String mem_id = request.getParameter("mem_id");
		String mem_adminStr = request.getParameter("grade");
		int mem_admin = Integer.parseInt(mem_adminStr);
		System.out.println(mem_id);
		System.out.println(mem_admin);
		
		result = service.adminUpdate(mem_id, mem_admin);
		response.sendRedirect(request.getContextPath() + "/member/list");
	}

}
