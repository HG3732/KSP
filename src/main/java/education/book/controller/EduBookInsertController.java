package education.book.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AlertController;
import education.book.model.dto.EduBookDto;
import education.book.model.service.EduBookService;
import education.model.dto.EduRecentDto;
import education.model.service.EduService;

/**
 * Servlet implementation class EduBookFormController
 */
@WebServlet("/edu/book/insert")
public class EduBookInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private EduService es = new EduService();
	private EduBookService ebs = new EduBookService();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EduBookInsertController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AlertController.loginPermission(request, response, "교육 신청하시려면 로그인 해주세요.");
		EduRecentDto dto = es.selectRecent();
		String recentEdu = dto.getEduSubject();
		request.setAttribute("recentEdu", recentEdu);
		
		String eduIdStr = request.getParameter("id");
		int eduId = Integer.parseInt(eduIdStr);
		request.setAttribute("detail", es.selectOne(eduId));

		
		
		request.getRequestDispatcher("/WEB-INF/views/edu/book/edubookinsert.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
