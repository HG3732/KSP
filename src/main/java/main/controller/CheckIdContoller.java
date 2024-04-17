package main.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import education.model.service.EduService;
import member.service.MemberService;

@WebServlet("/star/checkid")
public class CheckIdContoller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CheckIdContoller() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getSession().setAttribute("recentEdu", new EduService().selectRecent().getEduSubject());
		String id = request.getParameter("cid");
		int result = new MemberService().selectCheckId(id);
		response.getWriter().append(String.valueOf(result));
	}

}
