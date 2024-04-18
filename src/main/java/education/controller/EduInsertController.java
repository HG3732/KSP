package education.controller;

import static common.controller.AlertController.adminPermission;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import education.model.dto.EduOneDto;
import education.model.dto.EduRecentDto;
import education.model.service.EduService;

/**
 * Servlet implementation class EduDetailEditController
 */
@WebServlet("/edu/insert")
public class EduInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private EduService service = new EduService();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EduInsertController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		adminPermission(request, response, "관리자만 접근 가능합니다. 메인 페이지로 이동합니다.", "/home");
		EduRecentDto dto = service.selectRecent();
		Object recentEdu = (dto == null) ? "등록된 교육이 없습니다" : dto.getEduSubject();
		request.setAttribute("recentEdu", recentEdu);
		
		
		request.getRequestDispatcher("/WEB-INF/views/edu/eduinsert.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String eduSubject = request.getParameter("eduSubject");
		String eduContent = request.getParameter("eduContent");
		String eduAddress = request.getParameter("eduAddress");
		String eduParticipant = request.getParameter("eduParticipant");
		String eduDay = request.getParameter("eduDay");
		String eduBookStart = request.getParameter("eduBookStart");
		String eduBookEnd = request.getParameter("eduBookEnd");
		String eduStart = request.getParameter("eduStart");
		String eduEnd = request.getParameter("eduEnd");
		try {
			EduOneDto detail = new EduOneDto(null, eduSubject, eduContent, eduAddress, eduParticipant, eduDay, eduBookStart, eduBookEnd, eduStart, eduEnd, null);
			service.insert(detail);
			response.sendRedirect(request.getContextPath() + "/edu/list");
			
		} catch (NumberFormatException e) {
			e.printStackTrace();
			response.sendRedirect(request.getContextPath() + "home");
		}
	}

}
