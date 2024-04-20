package education.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AlertController;
import education.model.dto.EduOneDto;
import education.model.dto.EduRecentDto;
import education.model.service.EduService;

/**
 * Servlet implementation class EduDetailEditController
 */
@WebServlet("/edu/update")
public class EduUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private EduService service = new EduService();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EduUpdateController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AlertController.loginPermission(request, response, "로그인이 필요한 페이지입니다.");
		AlertController.adminPermission(request, response, "관리자만 접근 가능합니다. 교육 목록 페이지로 돌아갑니다.", "/edu");
		EduRecentDto dtoRecent = service.selectRecent();
		Object recentEdu = (dtoRecent != null) ? dtoRecent.getEduSubject() : "등록된 교육이 없습니다";
		request.setAttribute("recentEdu", recentEdu);

		try {
			String eduIdStr = request.getParameter("id");
			Integer eduId = Integer.parseInt(eduIdStr);
			request.setAttribute("detail", service.selectOne(eduId));
		} catch (NumberFormatException e) {
			e.printStackTrace();
			response.sendRedirect(request.getContextPath() + "home");
		}
		
		request.getRequestDispatcher("/WEB-INF/views/edu/eduupdate.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String eduIdStr = request.getParameter("eduId");
		String eduSubject = request.getParameter("eduSubject");
		String eduContent = request.getParameter("eduContent");
		String eduAddress = request.getParameter("eduAddress");
		String eduParticipant = request.getParameter("eduParticipant");
		String eduDay = request.getParameter("eduDay");
		String eduBookStart = request.getParameter("eduBookStart");
		String eduBookEnd = request.getParameter("eduBookEnd");
		String eduStart = request.getParameter("eduStart");
		String eduEnd = request.getParameter("eduEnd");
		Integer eduId = Integer.parseInt(eduIdStr);
		try {
			EduOneDto detail = new EduOneDto(eduId, eduSubject, eduContent, eduAddress, eduParticipant, eduDay, eduBookStart, eduBookEnd, eduStart, eduEnd, service.selectOne(eduId).getEduWriteTime());
			service.update(detail);
			response.sendRedirect(request.getContextPath() + "/edu/one?id=" + eduId);
			
		} catch (NumberFormatException e) {
			e.printStackTrace();
			response.sendRedirect(request.getContextPath() + "home");
		}

	}

}
