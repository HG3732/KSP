package education.book.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import education.book.model.dto.EduBookListDto;
import education.book.model.service.EduBookService;
import education.model.dto.EduRecentDto;
import education.model.service.EduService;

/**
 * Servlet implementation class EduDetailController
 */
@WebServlet("/edu/book/list")
public class EduBookListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private EduService es = new EduService();
	private EduBookService ebs = new EduBookService();

    /**
     * @see HttpServlet#HttpServlet()
     */
    public EduBookListController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		EduRecentDto dto = es.selectRecent();
		Object recentEdu = (dto != null) ? dto.getEduSubject() : "등록된 교육이 없습니다";
		request.setAttribute("recentEdu", recentEdu);
		
		List<EduBookListDto> eduBookList = ebs.selectList();
		request.setAttribute("eduBook", eduBookList);
		request.getRequestDispatcher("/WEB-INF/views/edu/book/edubooklist.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
