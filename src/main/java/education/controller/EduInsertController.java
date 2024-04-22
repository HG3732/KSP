package education.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import static common.controller.AlertController.*;
import education.model.dto.EduFileWriteDto;
import education.model.dto.EduOneDto;
import education.model.dto.EduRecentDto;
import education.model.service.EduService;

/**
 * Servlet implementation class EduDetailEditController
 */
@WebServlet("/edu/list/insert")
public class EduInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private EduService es = new EduService();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EduInsertController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		loginPermission(request, response, "로그인이 필요한 페이지입니다.");
		adminPermission(request, response, "관리자만 접근 가능합니다. 교육 목록 페이지로 이동합니다.", "/edu");
		EduRecentDto dto = es.selectRecent();
		Object recentEdu = (dto == null) ? "등록된 교육이 없습니다" : dto.getEduSubject();
		request.setAttribute("recentEdu", recentEdu);
		
		
		request.getRequestDispatcher("/WEB-INF/views/edu/eduinsert.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			// 파일 저장 기능
			System.out.println(request.getContentType());
			String uploadPath = request.getServletContext().getRealPath("/resources/uploadfile");
			System.out.println("uploadPath : " + uploadPath);
			File uploadPathFile = new File(uploadPath);
			if(!uploadPathFile.exists()) {
				uploadPathFile.mkdirs();
			}
			System.out.println("contentType : " + request.getContentType());
			int uploadFileLimit = 10 * 1024 * 1024; // 10MB
			MultipartRequest multiReq = new MultipartRequest(request, uploadPath, uploadFileLimit, "UTF-8", new DefaultFileRenamePolicy());
			// 이 시점에 uploadPathFile 은 uploadPath 에 저장 완료
			List<EduFileWriteDto> filelist = new ArrayList<EduFileWriteDto>();
			// enumeration 은 list 와 같은 개념
			Enumeration<?> fileNames = multiReq.getFileNames();
			while(fileNames.hasMoreElements()) {
				String name = (String) fileNames.nextElement();
				String fileName = multiReq.getFilesystemName(name);
				String originalName = multiReq.getOriginalFileName(name);
				File file = multiReq.getFile(name);
				if(file == null) {
					System.out.println("업로드 실패");
				}else {
					System.out.println(file.length());
				}
				EduFileWriteDto filedto = new EduFileWriteDto(fileName, originalName);
				filelist.add(filedto);
			}
			String eduSubject = multiReq.getParameter("eduSubject");
			String eduContent = multiReq.getParameter("eduContent");
			String eduAddress = multiReq.getParameter("eduAddress");
			String eduParticipant = multiReq.getParameter("eduParticipant");
			String eduDay = multiReq.getParameter("eduDay");
			String eduBookStart = multiReq.getParameter("eduBookStart");
			String eduBookEnd = multiReq.getParameter("eduBookEnd");
			String eduStart = multiReq.getParameter("eduStart");
			String eduEnd = multiReq.getParameter("eduEnd");
			EduOneDto dto = new EduOneDto(null, eduSubject, eduContent, eduAddress, eduParticipant, eduDay, eduBookStart, eduBookEnd, eduStart, eduEnd, null);
			
			int result = es.insert(dto, filelist);
			
			if(result > 0) {
				result = 1;
				response.getWriter().append(String.valueOf(result));
			}
		} catch (NumberFormatException e) {
			e.printStackTrace();
			response.sendRedirect(request.getContextPath() + "home");
		}
	}

}
