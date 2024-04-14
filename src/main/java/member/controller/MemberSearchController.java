package member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.vo.service.MemberService;

@WebServlet("/member/search")
public class MemberSearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private MemberService service = new MemberService();
	
	
    public MemberSearchController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int pageSize = 8;
		int pageBlockSize = 7;
		int currentPageNum = 1;
		String pageNum = request.getParameter("page");

		String category = request.getParameter("category");
		String keyword = request.getParameter("keyword");
		
		System.out.println(category);
		System.out.println(keyword);
		
		//페이지 번호 url로 입력해서 들어갈 때 공란/null 체크
		if(pageNum != null && !pageNum.equals("")) {
			try {
				currentPageNum = Integer.parseInt(pageNum);
			} catch (NumberFormatException e) {
				e.printStackTrace();
			}
		}
		
		request.setAttribute("map", service.selectMemberList(pageSize, pageBlockSize, currentPageNum, category, keyword));
		request.getRequestDispatcher("/WEB-INF/views/home/memberlist.jsp").forward(request, response);
	}

}
