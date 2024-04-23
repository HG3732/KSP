package board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.service.BoardService;
import common.controller.AlertController;

/**
 * Servlet implementation class BoardDeleteController
 */
@WebServlet("/board/delete")
public class BoardDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	BoardService service = new BoardService();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/views/star/board/board_community.jsp").forward(request, response);
		System.out.println("연결 확인 두 겟");
		AlertController.loginPermission(request, response, "로그인 후 글 작성이 가능합니다.");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("보드 delete 컨트롤러");
		String boardNoStr = request.getParameter("boardNo");
		int boardNo = Integer.parseInt(boardNoStr);
		int result = service.delete(boardNo);
		System.out.println("result : " + result + " boardNo : " + boardNo);
		
		
		if (result > 0) {
			response.sendRedirect(request.getContextPath() + "/board/community");
		}else {
			System.out.println("삭제안됨 " + result);
		}
		
		
	}

}
