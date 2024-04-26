package board.controller;

import java.io.IOException;
import java.lang.reflect.Member;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.dto.BoardDto;
import board.model.dto.BoardInsertDto;
import board.model.dto.BoardViewDto;
import board.model.dto.FileWriteDto;
import board.model.service.BoardService;
import common.controller.AlertController;
import member.model.dto.MemberInfoDto;

/**
 * Servlet implementation class BoardUpdateController
 */
@WebServlet("/board/update")
public class BoardUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	BoardService service = new BoardService();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public BoardUpdateController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
//		String noStr = request.getParameter("no");
//		try {
//			int no = Integer.parseInt(noStr);
//			request.setAttribute("detail", service.selectOne(no));
//			request.getRequestDispatcher("/WEB-INF/views/board/board_update.jsp").forward(request, response);
//		} catch (Exception e) {
//			// TODO: handle exception
//		}

		try {
			AlertController.loginPermission(request, response, "로그인 후 글 작성이 가능합니다.");
			MemberInfoDto memberInfoDto = (MemberInfoDto) request.getSession().getAttribute("ssslogin");

			String boardNoStr = request.getParameter("no");
			Integer boardNo = Integer.parseInt(boardNoStr);
			BoardViewDto viewDto = service.selectOne(boardNo);
			String reTitle = viewDto.getBoardTitle();
			String reContent = viewDto.getBoardContent();
			reContent = reContent.replaceAll("<br>", "");
			BoardViewDto reDto = new BoardViewDto(boardNo, reTitle, memberInfoDto.getMem_id(),
					viewDto.getBoardWriteTime(), viewDto.getHit(), reContent);
			request.setAttribute("detail", reDto);

			System.out.println("업데이트 doGet boardNo : " + boardNo);
		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect(request.getContextPath() + "home");
		}
		request.getRequestDispatcher("/WEB-INF/views/board/board_update.jsp").forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		MemberInfoDto memberInfoDto = (MemberInfoDto) request.getSession().getAttribute("ssslogin");
		BoardViewDto viewDto = new BoardViewDto();
		String boardNoStr = request.getParameter("boardNo");
		Integer boardNo = Integer.parseInt(boardNoStr);
		request.setAttribute("dto", service.selectOne(boardNo));

		String title = request.getParameter("title");
		String content = request.getParameter("content");

		System.out.println("업데이트 doPost boardNo : " + boardNo);

		try {
			BoardDto detail = new BoardDto(boardNo, memberInfoDto.getMem_id(), title, content,
					viewDto.getBoardWriteTime(), viewDto.getHit(), null);
			int result = service.update(detail);
			System.out.println("글 업데이트 result : " + result);
			if (result > 0) {
				result = 1;
				response.getWriter().append(String.valueOf(result));
			}
		} catch (Exception e) {
			System.out.println("업데이트 포스트 에러 : ");
		}
		System.out.println("업데이트 title : " + title);
		System.out.println("업데이트 content : " + content);
		response.sendRedirect(request.getContextPath() + "/board/community");
	}

}
