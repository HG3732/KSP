package board.controller;

import java.io.File;
import java.io.IOException;
import java.lang.module.ResolutionException;
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

import board.model.dto.BoardInsertDto;
import board.model.dto.FileWriteDto;
import board.model.service.BoardService;

/**
 * Servlet implementation class BoardWrite_Controller
 */
@WebServlet("/board/write")
public class BoardWrite_Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BoardService service = new BoardService();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardWrite_Controller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("글작성 컨트롤러 doGet");
		request.getRequestDispatcher("/WEB-INF/views/board/board_write.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("/star/board/write doPost() 왜 안나와");
//		String writer = request.getParameter("writer");
		String uploadPath = request.getServletContext().getRealPath("files");
		System.out.println("uploadPath : " + uploadPath);
		File uploadPathFile = new File(uploadPath);
		if(!uploadPathFile.exists()) {
			uploadPathFile.mkdirs();
		}
		int uploadFileLimit = 10 * 1024 * 1024; // 10M제한
		
		// form enctype = "multipart/form-data" 형태로 전달된 경우
		MultipartRequest multireq = new MultipartRequest(
				request // jsp -> controller로 전달된 객체
				, uploadPath // 서버에 저장할 디렉토리
				, uploadFileLimit // 업로드 파일 크기 제한
				, "UTF-8" // 인코딩 방법
				, new DefaultFileRenamePolicy() // was 서버에 저장할 디렉토리에 동일한 이름이 존재할때 새로운 이름 부여
				);
		// 중요! 이 시점에 new MultipartRequest() 하면 file은 uploadPath위치에 저장완료!
		List<FileWriteDto> fileList = new ArrayList<FileWriteDto>();
		// jsp -> controller file 0개 이상일 경우
		Enumeration<?> fileNames = multireq.getFileNames();
		while(fileNames.hasMoreElements()) {
			String name = (String)fileNames.nextElement(); // input type="file" name="xxx" ,xxx_0, xxx_!
			String fileName = multireq.getOriginalFileName(name); // 서버에 저장된 파일 이름
			String originFileName = multireq.getOriginalFileName(name);
			String type = multireq.getContentType(name); // 전송된 파일의 타입
			System.out.println("파일 타입 : " + type);
			
			File f1 = multireq.getFile(name); // name을 이용해서 파일 객체 생성 여부 확인 작업
			if(f1==null) { 
				System.out.println("파일 업로드 실패");
			}else {
				FileWriteDto filedto = new FileWriteDto(fileName, originFileName);
				fileList.add(filedto);
			}
		}
		
		
		String title = multireq.getParameter("title");
		String content = multireq.getParameter("content");
		
//		String filePath = multireq.getFilesystemName("uploadFiles");
		System.out.println("컨트롤러 title : " + title);
		System.out.println("컨트롤러 content : " + content);
		
		BoardInsertDto dto = new BoardInsertDto("test1", title, content, fileList);
		int result = service.insert(dto);
//		int sequenceNum = service.insert(dto);
		response.sendRedirect(request.getContextPath() + "/board/community");
		System.out.println("되냐고");
	}

}
