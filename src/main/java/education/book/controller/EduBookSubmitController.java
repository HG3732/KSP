package education.book.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import education.book.model.dto.EduBookDto;
import education.book.model.service.EduBookService;
import member.model.dto.MemberInfoDto;

/**
 * Servlet implementation class EduBookSubmitController
 */
@WebServlet("/edu/book/submit.ajax")
public class EduBookSubmitController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private EduBookService ebs = new EduBookService();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EduBookSubmitController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberInfoDto dto = (MemberInfoDto) request.getSession().getAttribute("ssslogin");
		String eduBookId = dto.getMem_id();
		String eduIdStr = request.getParameter("id");
		Integer eduId = Integer.parseInt(eduIdStr);
		String eduBookPhone = request.getParameter("book-phone");
		String eduPartLevel = request.getParameter("book-level");
		String eduPartName = request.getParameter("book-part-name");
		String eduPartSchool = request.getParameter("book-school");
		
		int result = ebs.insert(new EduBookDto(eduBookId, eduId, eduBookPhone, eduPartLevel, eduPartName, eduPartSchool));
		response.getWriter().append(String.valueOf(result));
	}

}
