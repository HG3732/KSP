package board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import board.model.service.BoardService;

/**
 * Servlet implementation class BoardReplyReadController
 */
@WebServlet("/board/reply/read.ajax")
public class BoardReplyReadController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BoardService service = new BoardService();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardReplyReadController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String boardNostr = request.getParameter("boardNo");
		System.out.println("보드 리드 에이작스 컨트롤러 boardNoStr : " + boardNostr);
		try {
			int boardNo = Integer.parseInt(boardNostr);
			response.getWriter().append(new Gson().toJson(service.selectBoardReplyList(boardNo)));
		} catch (Exception e) {
			System.out.println("댓글 리드 컨트롤러 넘버포멧익세셉세베");
			response.sendRedirect(request.getContextPath() + "/board/view");
		}
	}

}
