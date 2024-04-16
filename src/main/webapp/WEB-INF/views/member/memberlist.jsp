 	<link href="${pageContext.request.contextPath}/resource/css/reset.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resource/css/core.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resource/css/home/memberlist.css" rel="stylesheet">  
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp"%>

		    <section class="search-member">
		        <div class="check-title">
		            회원 관리
		        </div>
		        <div class="wrap-checkmember">
		            <div class="check-head">
		                <div>이름</div>
		                <div>아이디</div>
		                <div>비밀번호</div>
		                <div>이메일 주소</div>
		                <div>주소</div>
		                <div>등급</div>
		            </div>
		        <c:choose>
		        	<c:when test="${empty map.dtoList}">
		        			<p style="padding: 10px; border-bottom: 2px solid white;">일치하는 회원이 없습니다.</p>
		        	</c:when>
		        	<c:otherwise>
			        	<c:forEach items="${map.dtoList }" var="member">
			   				<div class="check-main">
				                <div>${member.mem_name}</div>
				                <div><a href="${pageContext.request.contextPath}/member/info?memberid=${member.mem_id}&memberadmin=${member.mem_admin}" class="change-mem-id" target="_blank">${member.mem_id}</a></div>
				                <div>${member.mem_pwd}</div>
				                <div>${member.mem_email}</div>
				                <div>${member.mem_address}</div>
				                <div>${member.mem_admin}</div>
		            		</div>
			        	</c:forEach>
		        	</c:otherwise>
		        </c:choose>
		        </div>
		        <c:choose>
		        	<c:when test="${searchStatus == 0}">
		        		<div class="pagenum">
				        	<c:if test="${map.startPageNum > 1}">
					            <div><a href="${pageContext.request.contextPath}/member/list?page=${map.startPageNum-1}"> &lt; &lt; </a></div>
				        	</c:if>
				        	<c:forEach begin="${map.startPageNum }" end="${map.endPageNum}" var="page">
				        		<c:if test="${map.currentPageNum == page}">
					            	<div style="color: red; font-weight: bold;">${page}</div>
				        		</c:if>
				        		<c:if test="${map.currentPageNum != page}">
					            	<div><a href="${pageContext.request.contextPath}/member/list?page=${page}">${page}</a></div>
				        		</c:if>
				        	</c:forEach>
				        	<c:if test="${map.startPageNum < map.totalPageCount}">
					            <div><a href="${pageContext.request.contextPath}/member/list?page=${map.endPageNum+1}"> &gt; &gt; </a></div>
				        	</c:if>
		        		</div>
		        	</c:when>
		        <c:otherwise>
		        <div class="pagenum">
		        	<c:if test="${map.startPageNum > 1}">
			            <div><a href="${pageContext.request.contextPath}/member/list?${searchword}&page=${map.startPageNum-1}"> &lt; &lt; </a></div>
		        	</c:if>
		        	<c:forEach begin="${map.startPageNum }" end="${map.endPageNum}" var="page">
		        		<c:if test="${map.currentPageNum == page}">
			            	<div style="color: red; font-weight: bold;">${page}</div>
		        		</c:if>
		        		<c:if test="${map.currentPageNum != page}">
			            	<div><a href="${pageContext.request.contextPath}/member/list?${searchword}&page=${page}">${page}</a></div>
		        		</c:if>
		        	</c:forEach>
		        	<c:if test="${map.startPageNum < map.totalPageCount}">
			            <div><a href="${pageContext.request.contextPath}/member/list?${searchword}&page=${map.endPageNum+1}"> &gt; &gt; </a></div>
		        	</c:if>
		        </div>
		        </c:otherwise>
		        </c:choose>
		        <div class="searchbar">
		            <form id="searchmem-keyword" method="get" action="${pageContext.request.contextPath}/member/list">
		                <select class="category" name="category">
		                    <option value="MEMBER_NAME" selected>이름</option>
		                    <option value="MEMBER_ID">아이디</option>
		                    <option value="MEMBER_PWD">비밀번호</option>
		                    <option value="MEMBER_EMAIL">이메일 주소</option>
		                    <option value="MEMBER_ADDRESS">주소</option>
		                    <option value="MEMBER_GRADE">등급</option>
		                </select>
		                <input type="text" name="search" class="search">
		                <button type="submit" name="btn-search" class="btn-search">검색</button>
		            </form>
		        </div>
		    </section>
<%-- 		    	<c:choose>
	<c:when test="${ssslogin.mem_admin < 2 }">
		<div class="alert">열람 권한이 없습니다.</div>
	</c:when>
	<c:when test="${empty ssslogin}">
		<div class="alert">열람 권한이 없습니다.</div>
	</c:when>
		<c:otherwise>
	    </c:otherwise>
    </c:choose> --%>
</body>
<script>
$(loadedHandler);
	function loadedHandler() {
	}

</script>
</html>