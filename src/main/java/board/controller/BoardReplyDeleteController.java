package board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.ant.jmx.JMXAccessorQueryTask;

import com.google.gson.Gson;

import board.model.dto.BoardReplyDto;
import board.model.dto.BoardReplyListDto;
import board.model.service.BoardService;
import member.model.dto.MemberInfoDto;

/**
 * Servlet implementation class BoardReplyDeleteController
 */
@WebServlet("/board/reply/delete.ajax")
public class BoardReplyDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	BoardService service = new BoardService();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardReplyDeleteController() {
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
		// TODO Auto-generated method stub
		doGet(request, response);
		System.out.println("보드 댓글 삭제 컨트롤러 doPost");
		MemberInfoDto memberInfoDto = (MemberInfoDto) request.getSession().getAttribute("ssslogin");
		BoardReplyDto dto = new BoardReplyDto();
		
		String boardNoStr = request.getParameter("boardNo");
		int boardNo = Integer.parseInt(boardNoStr);
		String baordReplyWriter = memberInfoDto.getMem_id();
		String boardReplyIdStr = request.getParameter("boardReplyId");
		int boardReplyId = Integer.parseInt(boardReplyIdStr);
		
		Gson gson = new Gson();
		int result = service.replyDelete(boardReplyId);
		
		try {
			if(result > 0) {
				response.getWriter().append(gson.toJson(dto));
				response.sendRedirect(request.getContextPath() + "/board/view=?" + boardNo);
//				response.sendRedirect(request.getContextPath() + "/board/community");
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		
	}
}
