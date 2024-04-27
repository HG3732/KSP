package education.book.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import static common.controller.AlertController.*;
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
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		loginPermission(request, response, "신청 교육 목록을 보시려면 로그인 해주세요.");
		try {
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
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
