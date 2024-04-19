package education.book.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.dto.MemberInfoDto;

/**
 * Servlet implementation class EmailCheckController
 */
@WebServlet("/email/check")
public class EmailCheckController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EmailCheckController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String code = null;
		if(request.getParameter("code") != null){
			code = request.getParameter("code");
		}
		MemberInfoDto dto = (MemberInfoDto)request.getSession().getAttribute("ssslogin");
		String mem_id = null;
		
		if(request.getSession().getAttribute("ssslogin") != null){
			mem_id = dto.getMem_email();
		}
		if(mem_id == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인 해주세요.');");
			script.println("location.href = 'http://192.168.10.11:8080/star/login';");
			script.println("</script>");
			return;
		}
		
		// hash 처리한 결과를 비교해 결과 값 반환
		String mem_email = dto.getMem_email();
		boolean isRight = (SHA256.getSHA256(mem_email).equals(code)) ? true : false;
		if(isRight == true){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('인증에 성공했습니다.');");
			script.println("location.href = 'http://192.168.10.11:8080/star/edu/book/form';");
			script.println("</script>");
			return;
		}else{
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('잘못된 이메일 주소입니다.');");
			script.println("close();");
			script.println("</script>");
			script.close();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
