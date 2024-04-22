package education.controller;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import education.model.dto.EduRecentDto;
import education.model.service.EduService;

/**
 * Servlet implementation class EduListController
 */
@WebServlet("/edu")
public class EduListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private EduService service = new EduService();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EduListController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getSession().setAttribute("recentEdu", new EduService().selectRecent().getEduSubject());
		
		String searchSubject = request.getParameter("edu-name");
		request.getSession().setAttribute("ssSearch", searchSubject);
		request.getSession().getAttribute("ssslogin");
//		request.setAttribute("eduList", service.selectList());
//		request.setAttribute("eduSubject", searchSubject);
		
		int pageSize = 9; // 한 페이지 당 9개씩
		int pageBlockSize = 5; // 화면 하단 페이지 수 5씩
		int currentPageNum = 1; // 기본 페이지 1페이지
		String pageNum = request.getParameter("page");
		if(pageNum != null && !pageNum.equals("")) {
			try {
				currentPageNum = Integer.parseInt(pageNum);
			} catch (NumberFormatException e) {
				 e.printStackTrace();
			}
		}
		request.setAttribute("map", service.selectPageList(searchSubject, pageSize, pageBlockSize, currentPageNum));
		
		request.getRequestDispatcher("/WEB-INF/views/edu/edulist.jsp").forward(request, response);
	}

}
