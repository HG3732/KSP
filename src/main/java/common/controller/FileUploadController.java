package common.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import education.model.dto.EduFileWriteDto;

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
		System.out.println("/fileupload.ajax post");
		String result =null;
		String savedfollder = "/resources/uploadfile";
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
		
		//List<EduFileWriteDto> filelist = new ArrayList<EduFileWriteDto>();
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
//			EduFileWriteDto filedto = new EduFileWriteDto(uploadPath, originalName, fileName);
//			System.out.println(filedto);
			//filelist.add(filedto);
			Map<String, Object> map1 = new HashMap<String, Object>();
			map1.put("uploaded", 1);
			map1.put("fileName", originalName);
			map1.put("url", request.getContextPath()+savedfollder+"/"+fileName);
			
			Gson gson = new GsonBuilder().create();
			result = gson.toJson(map1);
		}

		PrintWriter out = response.getWriter();
		out.print(result);
		out.flush();
		out.close();
	}

}
