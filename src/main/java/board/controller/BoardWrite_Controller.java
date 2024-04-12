package board.controller;

import java.io.IOException;
import java.lang.module.ResolutionException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.dto.BoardInsertDto;
import board.model.service.BoardService;

/**
 * Servlet implementation class BoardWrite_Controller
 */
@WebServlet("/board/write")
public class BoardWrite_Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	BoardService service = new BoardService();
       
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
		System.out.println("/star/board/write doPost() tq 왜 안나와");
//		String writer = request.getParameter("writer");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		System.out.println(title);
		System.out.println(content);
		BoardInsertDto dto = new BoardInsertDto("test1", title, content);
		int sequenceNum = service.insert(dto);
		response.sendRedirect(request.getContextPath() + "/board/community?num=" + sequenceNum);
		System.out.println("되냐고");
	}

}
