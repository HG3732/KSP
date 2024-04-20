package education.book.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AlertController;
import education.book.model.service.EduBookService;
import member.model.dto.MemberInfoDto;

/**
 * Servlet implementation class EduBookDeleteController
 */
@WebServlet("/edu/book/delete.ajax")
public class EduBookDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private EduBookService ebs = new EduBookService();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EduBookDeleteController() {
        super();
        // TODO Auto-generated constructor stub
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
		try {
			MemberInfoDto dto = (MemberInfoDto) request.getSession().getAttribute("ssslogin");
			String mem_id = dto.getMem_id();
			String eduIdStr = request.getParameter("eduId");
			Integer eduId = Integer.parseInt(eduIdStr);
			int result = ebs.delete(mem_id, eduId);
			response.getWriter().append(String.valueOf(result));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
