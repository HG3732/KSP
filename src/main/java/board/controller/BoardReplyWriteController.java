package board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.startup.ClassLoaderFactory.Repository;

import com.google.gson.Gson;

import board.model.dto.BoardReplyListDto;
import board.model.dto.BoardReplyWriteDto;
import board.model.service.BoardService;
import member.model.dto.MemberInfoDto;

/**
 * Servlet implementation class BoardReplyWriteController
 */
@WebServlet("/board/reply/write.ajax")
public class BoardReplyWriteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BoardService service = new BoardService();
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardReplyWriteController() {
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
		System.out.println("/board/reply/write.ajax doPost()");
		
		
		String boardReplyIdStr = request.getParameter("boardReplyId");
		System.out.println("boardReplyId : "+request.getParameter("boardReplyId"));
		int boardReplyId = 0;
		String boardNoStr = request.getParameter("boardNo");
		int boardNo = 0;
		String boardReplyContent = request.getParameter("boardReplyContent");
		// LOGIN
		MemberInfoDto memberInfoDto = (MemberInfoDto) request.getSession().getAttribute("ssslogin");
		String boardReplyWriter = memberInfoDto.getMem_id();
		String boardReplyWriteTime = null;
		
		Gson gson = new Gson();
		System.out.println("/board/reply/write.ajax boardNoStr : " + request.getParameter("boardNo"));
		// 글 번호가 없을 경우
		if (boardNoStr == null || boardNoStr.equals("")) {
			response.getWriter().append("-1");
			return;
		}
		// 글 번호가 없을경우
		if (boardNoStr != null && !boardNoStr.equals("")) {
			try {
				boardNo = Integer.parseInt(boardNoStr);
			} catch (NumberFormatException e) {
				response.getWriter().append("-1");
				return;
			}
			
		}
		// 글 작성자가 없을 경우 비로그인
		if (boardReplyIdStr != null && !boardReplyIdStr.equals("")) {
			try {
				boardReplyId = Integer.parseInt(boardReplyIdStr);
			} catch (NumberFormatException e) {
				response.getWriter().append("-1");
				return;
			}
		}
		// 글 작성자가 없을 경우 비로그인
		if (boardReplyIdStr == null || boardReplyIdStr.equals("")) {
			// 댓글 원본으로 간주
			boardReplyId = 0;
		}
		
		
		
		BoardReplyWriteDto dto = new BoardReplyWriteDto(boardReplyId, boardNo, boardReplyWriter, boardReplyContent, boardReplyWriteTime);
		System.out.println("댓글 작성 컨트롤러 dto : " + dto);
		System.out.println("댓글 작성 컨트롤러 dto : " + dto);
		int result = service.insertReply(dto);
		if (result > 0) {
			List<BoardReplyListDto> replydtolist = service.selectBoardReplyList(boardNo);
			
			response.getWriter().append(gson.toJson(replydtolist));
			
		}
	}

}
