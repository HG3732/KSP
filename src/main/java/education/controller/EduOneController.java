package education.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import static common.controller.AlertController.*;
import education.model.dto.EduRecentDto;
import education.model.service.EduService;

/**
 * Servlet implementation class EduDetailController
 */
@WebServlet("/edu/one")
public class EduOneController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private EduService service = new EduService();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EduOneController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			loginPermission(request, response, "교육 정보를 보시려면 로그인 해주세요.");
			EduRecentDto dtoRecent = service.selectRecent();
			Object recentEdu = (dtoRecent != null) ? dtoRecent.getEduSubject() : "등록된 교육이 없습니다";
			request.setAttribute("recentEdu", recentEdu);
			
			String eduIdStr = request.getParameter("id");
			try {
				Integer eduId = Integer.parseInt(eduIdStr);
				request.setAttribute("detail", service.selectOne(eduId));
			} catch (NumberFormatException e) {
				e.printStackTrace();
				response.sendRedirect(request.getContextPath() + "/home");
			}
			request.getRequestDispatcher("/WEB-INF/views/edu/eduone.jsp").forward(request, response);
		
	}
}
