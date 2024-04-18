package education.book.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import education.book.model.service.EduBookService;
import education.model.service.EduService;
import member.model.dto.MemberInfoDto;

/**
 * Servlet implementation class EduMemListController
 */
@WebServlet("/edu/mem/list")
public class EduMemListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private EduBookService ebs = new EduBookService();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EduMemListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getSession().setAttribute("recentEdu", new EduService().selectRecent().getEduSubject());
		
		request.getSession().getAttribute("ssslogin");
		MemberInfoDto dto = (MemberInfoDto) request.getSession().getAttribute("ssslogin");
		String mem_id = dto.getMem_id();
		request.setAttribute("map", ebs.selectMemList(mem_id));
		request.getRequestDispatcher("/WEB-INF/views/edu/book/edumemlist.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
