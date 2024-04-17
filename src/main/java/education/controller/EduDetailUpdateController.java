package education.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import education.model.dto.EduDetailDto;
import education.model.dto.EduRecentDto;
import education.model.service.EduService;

/**
 * Servlet implementation class EduDetailEditController
 */
@WebServlet("/edu/detail/update")
public class EduDetailUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private EduService service = new EduService();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EduDetailUpdateController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		EduRecentDto dtoRecent = service.selectRecent();
		Object recentEdu = (dtoRecent != null) ? dtoRecent.getEduSubject() : "등록된 교육이 없습니다";
		request.setAttribute("recentEdu", recentEdu);

		try {
			String eduIdStr = request.getParameter("id");
			Integer eduId = Integer.parseInt(eduIdStr);
			request.setAttribute("detail", service.selectDetail(eduId));
		} catch (NumberFormatException e) {
			e.printStackTrace();
			response.sendRedirect(request.getContextPath() + "home");
		}
		
		request.getRequestDispatcher("/WEB-INF/views/edu/edudetailupdate.jsp").forward(request, response);
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
			EduDetailDto detail = new EduDetailDto(eduId, eduSubject, eduContent, eduAddress, eduParticipant, eduDay, eduBookStart, eduBookEnd, eduStart, eduEnd, service.selectDetail(eduId).getEduWriteTime());
			service.updateDetail(detail);
			response.sendRedirect(request.getContextPath() + "/edu/detail?id=" + eduId);
			
		} catch (NumberFormatException e) {
			e.printStackTrace();
			response.sendRedirect(request.getContextPath() + "home");
		}

	}

}
