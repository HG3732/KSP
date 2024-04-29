package education.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import static common.controller.AlertController.*;

import education.book.model.service.EduBookService;
import education.model.dto.EduOneDto;
import education.model.dto.EduRecentDto;
import education.model.service.EduService;
import member.model.dto.MemberInfoDto;

/**
 * Servlet implementation class EduDetailController
 */
@WebServlet("/edu/one")
public class EduOneController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private EduService es = new EduService();
	private EduBookService ebs = new EduBookService();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EduOneController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("/edu/one doGet()");
		try {
			loginPermission(request, response, "교육 정보를 보시려면 로그인 해주세요.");
			// 최근 교육 제목 출력
			EduRecentDto dtoRecent = es.selectRecent();
			if(dtoRecent != null) {
				request.setAttribute("recentEdu", dtoRecent.getEduSubject());
			}else {
				request.setAttribute("recentEdu", "등록된 교육이 없습니다.");
			}
			
			// 교육 번호에 해당하는 정보
			String eduIdStr = request.getParameter("id");
			Integer eduId = Integer.parseInt(eduIdStr);
			request.setAttribute("eduOne", es.selectOne(eduId));
			EduOneDto eduOneDto = (EduOneDto) request.getAttribute("eduOne");
			System.out.println(eduOneDto.getEduContent());
			
			// 로그인 세션 정보
			MemberInfoDto dto = (MemberInfoDto)request.getSession().getAttribute("ssslogin");
			
			// 해당 교육 신청했는지 여부
			request.setAttribute("cnt", ebs.selectBookCnt(dto.getMem_id(),eduId));
			
		} catch (NumberFormatException | NullPointerException e) {
			e.printStackTrace();
		}
		request.getRequestDispatcher("/WEB-INF/views/edu/eduone.jsp").forward(request, response);
	}
}
