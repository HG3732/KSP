package board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.dto.BoardReplyDto;
import board.model.service.BoardService;
import member.model.dto.MemberInfoDto;

/**
 * Servlet implementation class BoardReplyUpdateController
 */
@WebServlet("/board/reply/update.ajax")
public class BoardReplyUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	BoardService service = new BoardService();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardReplyUpdateController() {
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
		System.out.println("/board/reply/update.ajax doPost()");
		MemberInfoDto memberInfoDto = (MemberInfoDto) request.getSession().getAttribute("ssslogin");
		BoardReplyDto dto = new BoardReplyDto();
		
		String boardNoStr = request.getParameter("boardNo");
		Integer boardNo = Integer.parseInt(boardNoStr);
		String boardReplyIdStr = request.getParameter("boardReplyId");
		Integer boardReplyId = Integer.parseInt(boardReplyIdStr);
		String replyContent = request.getParameter("bReplyContent");
		
		try {
			BoardReplyDto replydto = new BoardReplyDto(boardReplyId, boardNo, memberInfoDto.getMem_id(), replyContent, dto.getBReplyWriteTime(), dto.getBReplyLevel(), dto.getBReplyRef(), dto.getBReplyStep(), dto.getMemberAdmin());
			int result = service.replyUpdate(replydto);
			if (result > 0) {
				response.getWriter().append(String.valueOf(result));
			}
		} catch (NumberFormatException e) {
			e.printStackTrace();
		}
		
	}

}
