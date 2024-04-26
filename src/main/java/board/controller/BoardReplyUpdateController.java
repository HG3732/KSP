package board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import board.model.dto.BoardReplyDto;
import board.model.dto.BoardReplyListDto;
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
		System.out.println("댓글 수정 boardNo : " + boardNo);
		
//		String bReplyWriter = request.getParameter("boardReplyWriter");
		String bReplyWriter = memberInfoDto.getMem_id();
		String boardReplyIdStr = request.getParameter("boardReplyId");
		Integer boardReplyId = Integer.parseInt(boardReplyIdStr);
		String replyContent = request.getParameter("reupdatecontent");
		System.out.println("댓글 수정 replyWriter : " + bReplyWriter);
		System.out.println("댓글 수정 replyContent : " + replyContent);
		System.out.println("댓글 수정 boardReplyId : " + boardReplyId);
		
		Gson gson = new Gson();
		
		try {
			BoardReplyListDto replydto = new BoardReplyListDto(boardReplyId, bReplyWriter, replyContent, dto.getBReplyWriteTime(), dto.getBReplyLevel(), dto.getBReplyRef(), dto.getBReplyStep());
			int result = service.replyUpdate(replydto);
			System.out.println("댓글 수정 result : " + result);
			if (result > 0) {
				// result = 1;
				System.out.println("댓글 수정 if 문 result : " + result);
				List<BoardReplyListDto> replydtolist = service.selectBoardReplyList(boardNo);
				response.getWriter().append(gson.toJson(replydtolist));
			}
		} catch (NumberFormatException e) {
			e.printStackTrace();
		}
		
	}

}
