package common.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
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

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import education.model.dto.EduFileDto;

/**
 * Servlet implementation class FileUploadController
 */
@WebServlet("/fileupload.ajax")
public class FileUploadController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FileUploadController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("/fileupload.ajax get");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("/fileupload.ajax doPost()");
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
		// InputStream 닫기
		input.close();
		
		
		String result =null;
		String savedfolder = "/resources/uploadfile";
//		String uploadPath = request.getServletContext().getRealPath("/resources/uploadfile");
		String uploadPath = cloudinary.uploader().getUploadUrl(ObjectUtils.emptyMap());
		System.out.println("uploadPath : " + uploadPath);
		File uploadPathFile = new File(uploadPath);
		if(!uploadPathFile.exists()) {
			uploadPathFile.mkdirs();
		}
		System.out.println("contentType : " + request.getContentType());
		int uploadFileLimit = 50 * 1024 * 1024; // 50MB
		MultipartRequest multiReq = new MultipartRequest(request, uploadPath, uploadFileLimit, "UTF-8", new DefaultFileRenamePolicy());
		// 이 시점에 uploadPathFile 은 uploadPath 에 저장 완료
		
		//List<EduFileDto> filelist = new ArrayList<EduFileDto>();
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
//			EduFileDto filedto = new EduFileDto(uploadPath, originalName, fileName);
//			System.out.println(filedto);
			//filelist.add(filedto);
			Map<String, Object> map1 = new HashMap<String, Object>();
			map1.put("uploaded", 1);
			map1.put("fileName", originalName);
			Map<String, Object> uploadResult = cloudinary.uploader().upload(new File(uploadPath+"/"+fileName), ObjectUtils.emptyMap());  
			map1.put("url", uploadResult.get("url"));
			System.out.println(uploadResult.get("url"));
			Gson gson = new GsonBuilder().create();
			result = gson.toJson(map1);
		}

		PrintWriter out = response.getWriter();
		out.print(result);
		out.flush();
		out.close();
	}

}
