	<link href="${pageContext.request.contextPath}/resource/css/reset.css" type="text/css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resource/css/core.css" type="text/css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resource/css/common/header.css?ver=1" type="text/css" rel="stylesheet">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
$(loadedHandler)
	function loadedHandler() {
		$(".logout").on("click", logoutHandler);
		$(".mypage").on("click", myPageHandler);
		$(".board").on("click", boardHandler);
	}
	
	function logoutHandler() {
		alert("안녕히가십시오");
		
		var frmlogout = document.getElementById("logout");
		frmlogout.action = "${pageContext.request.contextPath}/logout";
		frmlogout.method = "post";
		frmlogout.submit();
	}
	
	var count = 0;
	
 	function myPageHandler(){
		
 		let options = "width=600, height=500, menubar=no, toolbar=no, scrollbars=no, resizable=no";
 		window.open("${pageContext.request.contextPath}/star/mypage", "_blank", options);
 		
	}
 	
 	function boardHandler() {
 		console.log(`${pageContext.request.contextPath}`);
 	}

</script>
</head>
<body>
    <header>
	    <div class="wrap-header">
	    	<div class="top-bar">
	    		<c:choose>
		    		<c:when test="${empty ssslogin}">
		                <div><a href="${pageContext.request.contextPath}/login">로그인</a></div>
		                <div><a href="${pageContext.request.contextPath}/star/join" target="_blank">회원가입</a></div>
	                </c:when>
	                <c:otherwise>
	                	<form id="logout">
		                	<div><a href="#" class="logout">로그아웃</a></div>
		                </form>
		                <div><a href="#" class="mypage" target="_blank">${ssslogin.mem_name}님의 페이지</a></div>
		                <c:if test="${ssslogin.mem_admin == 2}">
		                	<div><a href="${pageContext.request.contextPath}/member/list" class="memberlist" style="color: yellow;">회원 관리</a></div>
		                </c:if>
	                </c:otherwise>
	            </c:choose>
            </div>
	        <div class="logo"><a href="${pageContext.request.contextPath}/home">김서박</a></div>
	        <div class="nav">
	            <div><a href="${pageContext.request.contextPath}/edu/list" class="edu">교육 신청</a></div>
	            <div><a href="${pageContext.request.contextPath}/board/community" class="board">게시판</a></div>
	        </div>
	        <div class="bottom-info">
	        	<c:choose>
	        		<c:when test="${empty recentEdu }">
	        			등록된 교육이 없습니다.
	        		</c:when>
	        		<c:otherwise>
		                <div class="recent-edu">
		                    ${recentEdu }
		                </div>
	        		</c:otherwise>
	        	</c:choose>
                <div class="wether-box">
                    오늘의 날씨 간단 표시
                </div>
            </div>
	    </div>
    </header>
</body>
</html>