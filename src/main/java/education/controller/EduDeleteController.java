package education.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import education.model.service.EduService;

/**
 * Servlet implementation class EduDeleteController
 */
@WebServlet("/edu/delete.ajax")
public class EduDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private EduService es = new EduService();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EduDeleteController() {
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
		String eduIdStr = request.getParameter("eduId");
		Integer eduId = Integer.parseInt(eduIdStr);
		int result = es.delete(eduId);
		if(result > 0) {
			result = 1;
			response.getWriter().append(String.valueOf(result));
		}
		response.sendRedirect(request.getContextPath() + "/edu");
	}

}
