package main.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/member/profile.ajax")
@MultipartConfig
public class ProfileUploadController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
//	private static final String CHARSET = "UTF-8";
//	private static final String ATTACHES_DIR = "C:\\example";
//	private static final int LIMIT_SIZE_BYTES = 10 * 1024 * 1024;
	
       
    public ProfileUploadController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// properties 파일 불러오기
		Properties prop = new Properties();
		InputStream input = getClass().getClassLoader().getResourceAsStream("driver.properties");
		prop.load(input);
		// 내 클라우드 정보로 cloudinary 객체 생성 
		Cloudinary cloudinary = new Cloudinary(ObjectUtils.asMap(
				"cloud_name", prop.getProperty("cloudinary.name"),
				"api_key", prop.getProperty("cloudinary.api.key"),
				"api_secret", prop.getProperty("cloudinary.api.secret"),
				"secure", true)
				);
		// InputStream 닫기
		input.close();
		
		String uploadPath = request.getServletContext().getRealPath("/resources/uploadfile");
		File uploadPathFile = new File(uploadPath);
		if(!uploadPathFile.exists()) {
			uploadPathFile.mkdirs();
		}
		
		int uploadFileLimit = 10 * 1024 * 1024;
		MultipartRequest multiReq = new MultipartRequest(request, uploadPath, uploadFileLimit, "UTF-8", new DefaultFileRenamePolicy());
		
		Map<String, Object> uploadResult = null;
		Enumeration<?> faces = multiReq.getFileNames();
		while(faces.hasMoreElements()) {
			String name = (String) faces.nextElement();
			String fileName = multiReq.getFilesystemName(name);
			File file = multiReq.getFile(name);
			if(file == null) {
				System.out.println("실패");
			}else {
				System.out.println(file.length());
			}
			Map<String, Object> map = new HashMap<String, Object>();
			uploadResult = cloudinary.uploader().upload(new File(uploadPath+"/"+fileName), ObjectUtils.emptyMap());
			map.put("url", uploadResult.get("secure_url"));
		}
		response.getWriter().append((String)uploadResult.get("url"));
		
		
//		common.jar 방법 2		
//		response.setContentType("text/html; charset=UTF-8");
//		request.setCharacterEncoding(CHARSET);
//		PrintWriter out = response.getWriter();
//		
//		File attachesDir = new File(ATTACHES_DIR);
//		
//		DiskFileItemFactory fileItemFactory = new DiskFileItemFactory();
//		fileItemFactory.setRepository(attachesDir);
//		fileItemFactory.setSizeThreshold(LIMIT_SIZE_BYTES);
//		ServletFileUpload fileUpload = new ServletFileUpload(fileItemFactory);
//
//		
//		
//		try {
//			List<FileItem> items = fileUpload.parseRequest(request);
//			for(FileItem item : items) {
//				if(item.isFormField()) {
//					System.out.printf("파라미터 명 : %s, 파라미터 값 : %s \n", item.getFieldName(), item.getString(CHARSET));
//				} else {
//					System.out.printf("파라미터 명 : %s, 파일 명 : %s, 파일 크기 : %s bytes \n", item.getFieldName(), item.getName(), item.getSize());
//					if(item.getSize() > 0) {
//						String separator = File.separator;
//						int index = item.getName().lastIndexOf(separator);
//						String fileName = item.getName().substring(index + 1);
//						File uploadFile = new File(ATTACHES_DIR + separator + fileName);
//						item.write(uploadFile);
//						Map<String, Object> result = cloudinary.uploader().unsignedUpload(uploadFile, "thumbnail", ObjectUtils.emptyMap());
//						System.out.println("===================controller의 result================");
//						System.out.println(result);
//					}
//				
//				}
//			}
//			
//			System.out.println("파일 업로드 완료");
//		} catch (Exception e) {
//			e.printStackTrace();
//			System.out.println("업로드 중 오류 발생");
//		}
		
		
		
		//Multipart방법 1
//		String uploadPath = request.getServletContext().getRealPath("files");
//		//C:\workspace\Java\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\KSP\files
//		
//		File uploadPathFile = new File(uploadPath);
//		if(!uploadPathFile.exists()) {
//			uploadPathFile.mkdirs();
//		}
//		
//		int uploadFileLimit = 10 * 1024 * 1024;
//		
//		MultipartRequest multiReq = new MultipartRequest(request, uploadPath, uploadFileLimit, "UTF-8", new DefaultFileRenamePolicy());
//		//Enumeration<?> fileNames = multiReq.getFileNames();
//		String filePath = multiReq.getFilesystemName("uploadFiles");
//		
//		if(filePath == null) {
//			System.out.println("첨부 파일이 없습니다.");
//		} else {
//			System.out.println("첨부 파일 정보");
//			System.out.println(filePath);
//			System.out.println(multiReq.getOriginalFileName("uploadfiles"));
//		}
		
	}
}
