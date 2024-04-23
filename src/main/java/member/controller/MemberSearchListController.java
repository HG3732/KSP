package member.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import member.service.MemberService;

@WebServlet("/member/search/list.ajax")
public class MemberSearchListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private MemberService service = new MemberService();
       
    public MemberSearchListController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Gson gson = new Gson();
		
		int pageSize = 8;
		int pageBlockSize = 7;
		int currentPageNum = 1;
		String pageNum = request.getParameter("page");

		String category = request.getParameter("category");
		String keyword = request.getParameter("keyword");
		String sort = request.getParameter("sortby");
		String val = request.getParameter("value");
		System.out.println(category);
		System.out.println(sort);
		System.out.println(val);
		
		if(pageNum != null && !pageNum.equals("")) {
			try {
				currentPageNum = Integer.parseInt(pageNum);
			} catch (NumberFormatException e) {
				e.printStackTrace();
			}
		}
		
		Map<String, Object> sortMap = service.selectMemberSearch(pageSize, pageBlockSize, currentPageNum, category, keyword, sort, val);
		
		
		//request.setAttribute("map", service.selectMemberSearch(pageSize, pageBlockSize, currentPageNum, category, keyword, sort, val));
		//request.getRequestDispatcher("/WEB-INF/views/home/memberlist.jsp").forward(request, response);
		response.getWriter().append(gson.toJson(sortMap));
	}


}
