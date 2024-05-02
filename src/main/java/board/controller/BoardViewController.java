package board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.dao.BoardDao;
import board.model.dto.BoardInsertDto;
import board.model.dto.BoardViewDto;
import board.model.service.BoardService;
import common.controller.AlertController;
import member.model.dto.MemberInfoDto;

/**
 * Servlet implementation class BoardViewController
 */
@WebServlet("/board/view")
public class BoardViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	BoardService service = new BoardService();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public BoardViewController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String boardNoStr = request.getParameter("no");
		try {
			int boardNo = Integer.parseInt(boardNoStr);
			request.setAttribute("dto", service.selectOne(boardNo));
			request.getRequestDispatcher("/WEB-INF/views/board/board_view.jsp").forward(request, response);

//			System.out.println("뷰 컨트롤러" + service.selectOne(boardNo));
//			System.out.println("뷰 컨트롤러" + boardNo);
		} catch (NumberFormatException e) {
			System.out.println("===NumberFormatException");
			response.sendRedirect(request.getContextPath() + "/board/community");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

}
