<!-- 사용자가 Email 인증 버튼을 눌렀을 때 처리해주는 페이지 -->
<%@page import="member.model.dto.MemberInfoDto"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="education.book.controller.SHA256"%>
<%@page import="java.io.PrintWriter"%>


<%
	request.setCharacterEncoding("UTF-8");
	String code = null;
	if(request.getParameter("code") != null){
		code = request.getParameter("code");
	}
	MemberInfoDto dto = (MemberInfoDto)session.getAttribute("ssslogin");
	String mem_id = null;
	
	if(session.getAttribute("ssslogin") != null){
		mem_id = dto.getMem_email();
	}
	if(mem_id == null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인 해주세요');");
		script.println("location.href = 'http://192.168.10.11:8080/star/login'");
		script.println("</script>");
		script.close();
		return;
	}
	
	// hash 처리한 결과를 비교해 결과 값 반환
	String mem_email = dto.getMem_email();
	boolean isRight = (SHA256.getSHA256(mem_email).equals(code)) ? true : false;
	if(isRight == true){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('인증에 성공했습니다.');");
		script.println("close();");
		script.println("</script>");
		script.close();
		return;
	}else{
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('잘못된 이메일 주소입니다.');");
		script.println("close();");
		script.println("</script>");
		script.close();
	}

%>