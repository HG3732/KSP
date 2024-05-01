package education.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import static common.controller.AlertController.*;
import education.model.dto.EduOneDto;
import education.model.dto.EduRecentDto;
import education.model.service.EduService;

/**
 * Servlet implementation class EduDetailEditController
 */
@WebServlet("/edu/list/update")
public class EduUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private EduService es = new EduService();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EduUpdateController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			adminPermission(request, response, "관리자만 접근 가능합니다. 교육 목록 페이지로 돌아갑니다.", "/edu");
			EduRecentDto dtoRecent = es.selectRecent();
			Object recentEdu = (dtoRecent != null) ? dtoRecent.getEduSubject() : "등록된 교육이 없습니다";
			request.setAttribute("recentEdu", recentEdu);

			String eduIdStr = request.getParameter("id");
			Integer eduId = Integer.parseInt(eduIdStr);
			EduOneDto dto = es.selectOne(eduId);
			String reContent = dto.getEduContent();
			reContent = reContent.replaceAll("<br>", "");
			EduOneDto reDto = new EduOneDto(eduId, dto.getEduSubject(), reContent, dto.getEduAddress(), dto.getEduParticipant(), dto.getEduDay(), dto.getEduBookStart(), dto.getEduBookEnd(), dto.getEduStart(), dto.getEduEnd(), dto.getEduWriteTime(), dto.getEduMaxNum(), dto.getEduBookNum());
			request.setAttribute("eduOne", reDto);
		} catch (NumberFormatException e) {
			e.printStackTrace();
			response.sendRedirect(request.getContextPath() + "home");
		}
		
		request.getRequestDispatcher("/WEB-INF/views/edu/eduupdate.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String eduIdStr = request.getParameter("eduId");
			String eduSubject = request.getParameter("eduSubject");
			String eduContent = request.getParameter("eduContent");
			String eduAddress = request.getParameter("eduAddress");
			String eduParticipant = request.getParameter("eduParticipant");
			String eduDay = request.getParameter("eduDay");
			String eduBookStart = request.getParameter("eduBookStart");
			String eduBookEnd = request.getParameter("eduBookEnd");
			String eduStart = request.getParameter("eduStart");
			String eduEnd = request.getParameter("eduEnd");
			Integer eduId = Integer.parseInt(eduIdStr);
			String eduMaxNumStr = request.getParameter("eduMaxNum");
			Integer eduMaxNum = Integer.parseInt(eduMaxNumStr);
			String eduBookNumStr = request.getParameter("eduBookNum");
			Integer eduBookNum = Integer.parseInt(eduBookNumStr);
			EduOneDto eduOne = new EduOneDto(eduId, eduSubject, eduContent, eduAddress, eduParticipant, eduDay, eduBookStart, eduBookEnd, eduStart, eduEnd, es.selectOne(eduId).getEduWriteTime(), eduMaxNum, eduBookNum);
			int result = es.update(eduOne);
			if(result > 0) {
				result = 1;
				response.getWriter().append(String.valueOf(result));
			}
		} catch (NumberFormatException e) {
			e.printStackTrace();
		}

	}

}
