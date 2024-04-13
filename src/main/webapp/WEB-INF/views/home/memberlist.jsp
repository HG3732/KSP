<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<link href="${pageContext.request.contextPath}/resource/css/reset.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resource/css/core.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resource/css/home/memberlist.css" rel="stylesheet">  
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
            </div>
        <c:choose>
        	<c:when test="${empty map.dtoList}">
        			<p style="padding: 10px; border-bottom: 2px solid white;">일치하는 회원이 없습니다.</p>
        	</c:when>
        	<c:otherwise>
	        	<c:forEach items="${map.dtoList }" var="member">
	   				<div class="check-main">
		                <div>${member.mem_name}</div>
		                <div>${member.mem_id}</div>
		                <div>${member.mem_pwd}</div>
		                <div>${member.mem_email}</div>
		                <div>${member.mem_address}</div>
            		</div>
	        	</c:forEach>
        	</c:otherwise>
        </c:choose>
        </div>
        <div class="pagenum">
        	<c:if test="${map.startPageNum > 1}">
	            <div><a href="${pageContext.request.contextPath}/member/search?page=${map.startPageNum-1}"> &lt; &lt; </a></div>
        	</c:if>
        	<c:forEach begin="${map.startPageNum }" end="${map.endPageNum}" var="page">
        		<c:if test="${map.currentPageNum == page}">
	            	<div style="color: red; font-weight: bold;">${page}</div>
        		</c:if>
        		<c:if test="${map.currentPageNum != page}">
	            	<div><a href="${pageContext.request.contextPath}/member/search?page=${page}">${page}</a></div>
        		</c:if>
        	</c:forEach>
        	<c:if test="${map.startPageNum < map.totalPageCount}">
	            <div><a href="${pageContext.request.contextPath}/member/search?page=${map.endPageNum+1}"> &gt; &gt; </a></div>
        	</c:if>
        </div>
        <div class="searchbar">
            <form id="searchmem-keyword">
                <select class="category">
                    <option value="MEMBER_NAME" selected>이름</option>
                    <option value="MEMBER_ID">아이디</option>
                    <option value="MEMBER_PWD">비밀번호</option>
                    <option value="MEMBER_EMAIL">이메일 주소</option>
                    <option value="MEMBER_ADDRESS">주소</option>
                </select>
                <input type="text" name="search" class="search">
                <input type="button" name="btn-search" class="btn-search" value="검색">
            </form>
        </div>
    </section>
</body>
<script>
$(loadedHandler)
	function loadedHandler() {
		$(".btn-search").on('click', searchMemberHandler);
	}
	
	//카테고리 선택 후 회원 검색 함수
	function searchMemberHandler() {
		var categoryVal = $(".category option:selected").val();
		var keywordVal = $(".search").val();
		$.ajax({
			type: 'get'
			, url: "${pageContext.request.contextPath}/member/search"
			, data : { category : categoryVal
					, keyword : keywordVal}
			,success : function() {
				//검색결과 표현해주는 함수 기능부
			}
			, error : function(request, status, error) {
				alert("code:"  + request.status + "\n" + "message : "
						+ request.responseText + "\n"
						+"error : " + error);
				}
			
			
		})
		
	}
</script>
</html>