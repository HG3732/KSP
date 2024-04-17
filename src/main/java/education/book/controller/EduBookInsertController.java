package education.book.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
//		EDU_BOOK_ID     NOT NULL VARCHAR2(15) 
//		EDU_ID          NOT NULL NUMBER       
//		EDU_BOOK_PHONE  NOT NULL VARCHAR2(11) 
//		EDU_PART_LEVEL  NOT NULL VARCHAR2(10) 
//		EDU_PART_NAME   NOT NULL VARCHAR2(10) 
//		EDU_PART_SCHOOL NOT NULL VARCHAR2(30)
		String eduBookId = request.getParameter("book-id");
		String eduIdStr = request.getParameter("id");
		Integer eduId = Integer.parseInt(eduIdStr);
		String eduBookPhone = request.getParameter("book-phone");
		String eduPartLevel = request.getParameter("book-level");
		String eduPartName = request.getParameter("book-part-name");
		String eduPartSchool = request.getParameter("book-school");
		
		ebs.insert(new EduBookDto(eduBookId, eduId, eduBookPhone, eduPartLevel, eduPartName, eduPartSchool));
		
		response.sendRedirect(request.getContextPath() + "/edu/one?id=" + eduId);
	}

}
