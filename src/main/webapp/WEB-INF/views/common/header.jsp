<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<link href="${pageContext.request.contextPath}/resource/css/reset.css" type="text/css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resource/css/core.css" type="text/css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resource/css/common/header.css?ver=1" type="text/css" rel="stylesheet">
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
 		window.open("http://localhost:8080/star/mypage", "_blank", options);
 		
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
		                <div><a href="http://localhost:8080/star/login">로그인</a></div>
		                <div><a href="http://localhost:8080/star/star/join" target="_blank">회원가입</a></div>
	                </c:when>
	                <c:otherwise>
	                	<form id="logout">
		                	<div><a href="#" class="logout">로그아웃</a></div>
		                </form>
		                <div><a href="#" class="mypage">${ssslogin.mem_name}님의 페이지</a></div>
	                </c:otherwise>
	            </c:choose>
            </div>
	        <div class="logo"><a href="http://localhost:8080/star/home">김서박</a></div>
	        <div class="nav">
	            <div><a href="http://localhost:8080/star/edu/list" class="edu">교육 신청</a></div>
	            <div><a href="#" class="board">게시판</a></div>
	        </div>
	        <div class="bottom-info">
                <div class="recent-edu">
                    ${recentEdu }
                </div>
                <div class="wether-box">
                    오늘의 날씨 간단 표시
                </div>
            </div>
	    </div>
    </header>
</body>
</html>