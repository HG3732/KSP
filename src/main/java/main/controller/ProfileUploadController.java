package main.controller;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/member/profile.ajax")
public class ProfileUploadController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ProfileUploadController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uploadPath = request.getServletContext().getRealPath("files");
		//C:\workspace\Java\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\KSP\files
		
		File uploadPathFile = new File(uploadPath);
		if(!uploadPathFile.exists()) {
			uploadPathFile.mkdirs();
		}
		
		int uploadFileLimit = 10 * 1024 * 1024;
		
		MultipartRequest multiReq = new MultipartRequest(request, uploadPath, uploadFileLimit, "UTF-8", new DefaultFileRenamePolicy());
		//Enumeration<?> fileNames = multiReq.getFileNames();
		String filePath = multiReq.getFilesystemName("uploadFiles");
		
		if(filePath == null) {
			System.out.println("첨부 파일이 없습니다.");
		} else {
			System.out.println("첨부 파일 정보");
			System.out.println(filePath);
			System.out.println(multiReq.getOriginalFileName("uploadfiles"));
		}
		
	}
}
