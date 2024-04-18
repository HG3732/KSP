package common.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.dto.MemberInfoDto;

public class AlertController {
	public static void loginPermission(HttpServletRequest request, HttpServletResponse response, String msg) throws ServletException, IOException {
		if(request.getSession().getAttribute("ssslogin") == null) {
			request.setAttribute("alertMsg", msg);
			return;
		}
	}
	public static void adminPermission(HttpServletRequest request, HttpServletResponse response, String msg, String jspPath, String servletMapping) throws ServletException, IOException {
		MemberInfoDto dto = (MemberInfoDto) request.getSession().getAttribute("ssslogin");
		if(dto.getMem_admin() < 1 || dto == null) {
			request.setAttribute("alertMsg", msg);
			request.setAttribute("servletMapping", servletMapping);
			request.getRequestDispatcher(jspPath).forward(request, response);
			return;
		}
	}
}
