package education.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.cloudinary.*;
import com.cloudinary.utils.ObjectUtils;
import com.fasterxml.jackson.databind.ObjectMapper;

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
			
			// response.setContentType("text/html; charset=UTF-8");
			String charset = "UTF-8";
			request.setCharacterEncoding(charset);
			
			DiskFileItemFactory dfif = new DiskFileItemFactory();
			int fileUploadLimit = 50 * 1024 * 1024; // 50MB
			dfif.setSizeThreshold(fileUploadLimit);
			ServletFileUpload fileUpload = new ServletFileUpload(dfif);
			
			List<FileItem> items = fileUpload.parseRequest(request);
			List<EduFileWriteDto> filelist = new ArrayList<EduFileWriteDto>();
			for(FileItem item : items) {
				if(item.isFormField()) {
					System.out.printf("name : %s, value : %s, \n", item.getFieldName(), item.getString(charset));
				}else {
					System.out.printf("name : %s, value : %s, size : %s bytes \n", item.getFieldName(), item.getName(), item.getSize());
					if(item.getSize() > 0) {
						String fileName = item.getName();
						File uploadFile = new File(fileName);
						item.write(uploadFile);
						System.out.println("fileName : " + fileName);
						cloudinary.uploader().unsignedUpload(uploadFile, "do6kl7ck", ObjectUtils.asMap("resource_type", "auto"));
						StringBuilder urlBuilder = new StringBuilder("https://api.cloudinary.com/v1_1/"+prop.getProperty("cloudinary.cloud_name")+"/upload"); /*URL*/
						URL url = new URL(urlBuilder.toString());
						HttpURLConnection con = (HttpURLConnection) url.openConnection();
						con.setRequestMethod("POST");
						con.setRequestProperty("Content-type", "application/json");
						BufferedReader rd;
						if(con.getResponseCode() >= 200 && con.getResponseCode() <= 300) {
							rd = new BufferedReader(new InputStreamReader(con.getInputStream()));
						} else {
							rd = new BufferedReader(new InputStreamReader(con.getErrorStream()));
						}
						StringBuilder sb = new StringBuilder();
						String line;
						while ((line = rd.readLine()) != null) {
							sb.append(line);
						}
						rd.close();
						con.disconnect();
						String cloudResp = sb.toString();
						System.out.println("cloudResp : " + cloudResp);
						ObjectMapper om = new ObjectMapper();
						Map<String, Object> map = om.readValue(cloudResp, Map.class);
						String eduSavedFileName = (String) map.get("public_id");
						System.out.println("eduSavedFileName : " + eduSavedFileName);
						String eduOriginalFileName = (String) map.get("original_filename");
						String format = (String) map.get("format");
						String mapUrl = (String) map.get("url");
						String uploadPath = map.get("url").toString().substring(0, mapUrl.length() - eduSavedFileName.length() - format.length() - 2);
						EduFileWriteDto dto = new EduFileWriteDto(uploadPath, eduOriginalFileName+"."+format, eduSavedFileName+"."+format);
						System.out.println("uploadPath : " + uploadPath);
						filelist.add(dto);
					}
				}
			}
			
			
	        
			
			// InputStream 닫기
			input.close();
			
			
			System.out.println(request.getParameter("eduContent"));
			String eduSubject = request.getParameter("eduSubject");
			String eduContent = request.getParameter("eduContent");
			String eduAddress = request.getParameter("eduAddress");
			String eduParticipant = request.getParameter("eduParticipant");
			String eduDay = request.getParameter("eduDay");
			String eduBookStart =request.getParameter("eduBookStart");
			String eduBookEnd = request.getParameter("eduBookEnd");
			String eduStart = request.getParameter("eduStart");
			String eduEnd = request.getParameter("eduEnd");
			String eduMaxNumStr = request.getParameter("eduMaxNum");
			int eduMaxNum = Integer.parseInt(eduMaxNumStr);
			
			EduOneDto dto = new EduOneDto(null, eduSubject, eduContent, eduAddress, eduParticipant, eduDay, eduBookStart, eduBookEnd, eduStart, eduEnd, null, eduMaxNum, null);
			int result;
			
			if(eduMaxNum > 0) {
				result = 1;
				es.insert(dto, filelist);
			}else {
				result = 0;
			}
			
			if(result > 0) {
				result = 1;
			}
			response.getWriter().append(String.valueOf(result));
		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect(request.getContextPath() + "/home");
		}
	}

}
