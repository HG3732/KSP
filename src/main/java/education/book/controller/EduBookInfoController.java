package education.book.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import education.book.model.dto.EduBookInfoDto;
import education.book.model.service.EduBookService;

/**
 * Servlet implementation class EduBookInfoController
 */
@WebServlet("/edu/book/info.ajax")
public class EduBookInfoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private EduBookService ebs = new EduBookService();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EduBookInfoController() {
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
		String eduPartSchool = request.getParameter("eduPartSchool");
		String eduStart = request.getParameter("eduStart");
		EduBookInfoDto dto = ebs.selectBookInfo(eduPartSchool, eduStart);
		request.setAttribute("eduBookInfoDto", dto);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("eduSubject", dto.getEduSubject());
		map.put("eduAddress", dto.getEduAddress());
		map.put("eduPartName", dto.getEduPartName());
		map.put("eduPartNum", dto.getEduPartNum());
		response.getWriter().append(new Gson().toJson(map));
	}

}
