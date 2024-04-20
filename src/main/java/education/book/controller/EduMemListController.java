package education.book.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AlertController;
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
		if(request.getSession().getAttribute("ssslogin") == null) {
			request.setAttribute("alertMsg", "로그인");
			return;
		}
		AlertController.loginPermission(request, response, "로그인이 필요한 페이지입니다.");
		AlertController.adminPermission(request, response, "관리자만 접근 가능합니다. 메인 페이지로 이동합니다.", "/home");
		
		request.getSession().setAttribute("recentEdu", new EduService().selectRecent().getEduSubject());
		
		MemberInfoDto dto = (MemberInfoDto) request.getSession().getAttribute("ssslogin");
		String mem_id = null;
		if(dto.getMem_admin() == 2) {
			mem_id = (String) request.getSession().getAttribute("selectMemList");
			System.out.println(mem_id);
		}else {
			mem_id = dto.getMem_id(); 
			System.out.println(mem_id+"---------");
		}
		request.setAttribute("edulist", ebs.selectMemList(mem_id));
		request.getRequestDispatcher("/WEB-INF/views/edu/book/edumemlist.jsp").forward(request, response);
		request.removeAttribute("selectMemList");
		System.out.println(request.getSession().getAttribute("selectMemList"));
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
