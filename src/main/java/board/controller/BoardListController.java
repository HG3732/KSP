package board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.service.BoardService;

/**
 * Servlet implementation class BoardListController
 */
@WebServlet("/board/community")
public class BoardListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BoardService service = new BoardService();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("연결 확인 두 겟");
//		한페이지당 글 수 10개
		int pageSize = 10;
//		하단에 나타탤 페이지 버튼 수
		int pageBlockSize = 5;
//		현재 페이지
		int currentPageNum = 1;
//		페이지 지정하고 들어왔다면..currentPageNum 현재 페이지를 그 값으로 설정
		String pageNum = request.getParameter("page");
		if(pageNum != null && !pageNum.equals("")) {
			try {
				currentPageNum = Integer.parseInt(pageNum);
			} catch (NumberFormatException e) {
				e.printStackTrace();
			}
		}
		request.setAttribute("map",service.selectPageList(pageSize, pageBlockSize, currentPageNum));
		System.out.println("셀렉트페이지리스트 : " + service.selectPageList(pageSize, pageBlockSize, currentPageNum));
//		request.setAttribute("dtolist", service.selectAllList());
//		System.out.println("컨트롤러 selectAllList" + service.selectAllList());
		request.getRequestDispatcher("/WEB-INF/views/board/board_community.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
