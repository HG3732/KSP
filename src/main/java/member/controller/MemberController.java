package member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.vo.service.MemberService;

@WebServlet("/member/list")
public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private MemberService service = new MemberService();
       
    public MemberController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int pageSize = 8;
		int pageBlockSize = 7;
		int currentPageNum = 1;
		int searchStatus = 0;
		String pageNum = request.getParameter("page");
		//페이지 번호 url로 입력해서 들어갈 때 공란/null 체크
		//순서 주의!!!!!!!!!!!!!!!!!!!!!! 특히 currentPageNum
		if(pageNum != null && !pageNum.equals("")) {
			try {
				currentPageNum = Integer.parseInt(pageNum);
			} catch (NumberFormatException e) {
				e.printStackTrace();
			}
		}
		String category = request.getParameter("category");
		String keyword = request.getParameter("search");
		
		if(keyword != null && keyword.trim().length() != 0) {
			searchStatus = 1;
		}
		
		
		request.getSession().setAttribute("searchword", "category="+category+"&search="+keyword+"&btn-search=");
		request.setAttribute("searchStatus", searchStatus);
		request.setAttribute("map", service.selectMemberSearch(pageSize, pageBlockSize, currentPageNum, category, keyword));
		
		request.getRequestDispatcher("/WEB-INF/views/member/memberlist.jsp").forward(request, response);
	}


}
