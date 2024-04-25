package main.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/member/join/code/check.ajax")
public class JoinCodeCheckController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public JoinCodeCheckController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String code = request.getParameter("sendCode");
		String inputCode = request.getParameter("inputCode");
		if(inputCode.equals(code)) {
			response.getWriter().append("1");
		} else {
			response.getWriter().append("0");
		}
	}

}
