package education.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cloudinary.*;
import com.cloudinary.utils.ObjectUtils;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import static common.controller.AlertController.*;

import education.model.dto.EduFileDto;
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
		adminPermission(request, response, "관리자만 접근 가능합니다. 교육 목록 페이지로 이동합니다.", "/edu");
		try {
			EduRecentDto dto = es.selectRecent();
			Object recentEdu = (dto == null) ? "등록된 교육이 없습니다" : dto.getEduSubject();
			request.setAttribute("recentEdu", recentEdu);
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.getRequestDispatcher("/WEB-INF/views/edu/eduinsert.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			// properties 파일 불러오기
			Properties prop = new Properties();
			InputStream input = getClass().getClassLoader().getResourceAsStream("driver.properties");
			prop.load(input);
			// 내 클라우드 정보로 cloudinary 객체 생성 
			Cloudinary cloudinary = new Cloudinary(ObjectUtils.asMap(
					"cloud_name", prop.getProperty("cloudinary.cloud_name"),
					"api_key", prop.getProperty("cloudinary.api_key"),
					"api_secret", prop.getProperty("cloudinary.api_secret"),
					"secure", true)
			);
			
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
			
			List<EduFileDto> eduFileDtoList = new ArrayList<EduFileDto>();
			// enumeration 은 list 와 같은 개념
			Enumeration<?> fileNames = multiReq.getFileNames();
			while(fileNames.hasMoreElements()) {
				String name = (String) fileNames.nextElement();
				String fileName = multiReq.getFilesystemName(name);
				String originalName = multiReq.getOriginalFileName(name);
				long fileSize = multiReq.getFile(name).length();
				File file = multiReq.getFile(name);
				if(file == null) {
					System.out.println("업로드 실패");
				}else {
					System.out.println(file.length());
				}
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("uploaded", 1);
				map.put("fileName", originalName);
				Map<String, Object> uploadResult = cloudinary.uploader().upload(new File(uploadPath+"/"+fileName), ObjectUtils.asMap("resource_type", "raw"));  
				map.put("url", uploadResult.get("secure_url"));
				System.out.println(uploadResult.get("url"));
				EduFileDto dto = new EduFileDto(null, null, (String)map.get("url"), originalName, (int)fileSize);
				eduFileDtoList.add(dto);
			}

			
			// InputStream 닫기
			input.close();
			System.out.println(multiReq.getParameter("eduContent"));
			String eduSubject = multiReq.getParameter("eduSubject");
			String eduContent = multiReq.getParameter("eduContent");
			String eduAddress = multiReq.getParameter("eduAddress");
			String eduParticipant = multiReq.getParameter("eduParticipant");
			String eduDay = multiReq.getParameter("eduDay");
			String eduBookStart =multiReq.getParameter("eduBookStart");
			String eduBookEnd = multiReq.getParameter("eduBookEnd");
			String eduStart = multiReq.getParameter("eduStart");
			String eduEnd = multiReq.getParameter("eduEnd");
			String eduMaxNumStr = multiReq.getParameter("eduMaxNum");
			int eduMaxNum = Integer.parseInt(eduMaxNumStr);
			
			EduOneDto dto = new EduOneDto(null, eduSubject, eduContent, eduAddress, eduParticipant, eduDay, eduBookStart, eduBookEnd, eduStart, eduEnd, null, eduMaxNum, null);
			
			int result;
			if(eduMaxNum > 0) {
				result = 1;
				es.insert(dto, eduFileDtoList);
			}else {
				result = 0;
			}
			response.getWriter().append(String.valueOf(result));
		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect(request.getContextPath() + "/home");
		}
	}

}
