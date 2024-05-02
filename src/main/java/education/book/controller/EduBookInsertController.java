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
import education.model.dto.EduListDto;
import education.model.dto.EduOneDto;
import education.model.dto.EduRecentDto;
import education.model.service.EduService;
import member.model.dto.MemberInfoDto;

/**
 * Servlet implementation class EduBookFormController
 */
@WebServlet("/edu/form")
public class EduBookInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private EduService es = new EduService();
	private EduBookService ebs = new EduBookService();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EduBookInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			AlertController.loginPermission(request, response, "교육 신청하시려면 로그인 해주세요.");
			EduRecentDto dto = es.selectRecent();
			String recentEdu = dto.getEduSubject();
			request.setAttribute("recentEdu", recentEdu);
			String eduIdStr = request.getParameter("id");
			Integer eduId = Integer.parseInt(eduIdStr);
			request.setAttribute("detail", es.selectOne(eduId));
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.getRequestDispatcher("/WEB-INF/views/edu/book/edubookinsert.jsp").forward(request, response);
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
		String eduPartNumStr = request.getParameter("book-num");
		Integer eduPartNum = Integer.parseInt(eduPartNumStr);
		
		int result = 0;
		result = ebs.insert(new EduBookDto(eduBookId, eduId, eduBookPhone, eduPartLevel, eduPartName, eduPartSchool, eduPartNum));
		
		if(result > 0) {
			result = 1;
			response.getWriter().append(String.valueOf(result));
		}else {
			response.getWriter().append(String.valueOf(result));
		}
	}

}
