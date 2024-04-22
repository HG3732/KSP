//package filter;
//
//import java.io.IOException;
//import java.net.URLEncoder;
//
//import javax.servlet.Filter;
//import javax.servlet.FilterChain;
//import javax.servlet.ServletException;
//import javax.servlet.ServletRequest;
//import javax.servlet.ServletResponse;
//import javax.servlet.annotation.WebFilter;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//
//@WebFilter(filterName = "loginFilter", urlPatterns = {"/board/*", "/edu/*"})
//public class LoginFilter implements Filter {
//
//	@Override
//	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
//			throws IOException, ServletException {
//		
//		HttpServletRequest req = (HttpServletRequest)request;
//		HttpServletResponse res = (HttpServletResponse)response;
//		HttpSession session = req.getSession();
//		
//		if(session.getAttribute("ssslogin") == null) {
//			String url = req.getRequestURI();	//원래 가려던 URL 정보 읽어오기
//			String query = req.getQueryString();	// Get query 문자열로 읽어오기 ( a=xxx&b=xxx&c=xxx )
//			
//			String encodeUrl=null;
//			if(query == null) {	//전송 파라미터 없으면
//				encodeUrl=url;
//			} else {
//				encodeUrl = url + "?" + query;
//			}
//			
//			//경고 메세지
//			String alertMsg = "";
//			alertMsg = "&alertMsg=" + URLEncoder.encode("로그인 후 이용 가능합니다.", "UTF-8");
//			
//		
//			res.sendRedirect(req.getContextPath() + "/login?url="+encodeUrl + alertMsg);
//		} else {
//			String url = req.getRequestURI();
//			chain.doFilter(request, response);
//		}
//
//	}
//}
