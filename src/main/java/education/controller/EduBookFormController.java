package education.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import education.model.dto.EduRecentDto;
import education.model.service.EduService;

/**
 * Servlet implementation class EduBookFormController
 */
@WebServlet("/edu/book/form")
public class EduBookFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private EduService service = new EduService();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EduBookFormController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		EduRecentDto dto = service.selectRecent();
		Object recentEdu = (dto == null) ? "등록된 교육이 없습니다" : dto.getEduSubject();
		request.setAttribute("recentEdu", recentEdu);
		
		
		request.getRequestDispatcher("/WEB-INF/views/edu/edubookform.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
