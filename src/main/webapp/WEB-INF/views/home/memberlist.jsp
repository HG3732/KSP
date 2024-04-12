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
            회원 조회
        </div>
        <c:choose>
        	<c:forEach items="${map.dtoList }">
        	</c:forEach>
        </c:choose>
        <div class="wrap-checkmember">
            <div class="check-head">
                <div>이름</div>
                <div>아이디</div>
                <div>비밀번호</div>
                <div>이메일 주소</div>
                <div>주소</div>
            </div>
            <div class="check-main">
                <div>이름</div>
                <div>아이디</div>
                <div>비밀번호</div>
                <div>이메일 주소</div>
                <div>주소</div>
            </div>
            <div class="check-main">
                <div>이름</div>
                <div>아이디</div>
                <div>비밀번호</div>
                <div>이메일 주소</div>
                <div>주소</div>
            </div>
            <div class="check-main">
                <div>이름</div>
                <div>아이디</div>
                <div>비밀번호</div>
                <div>이메일 주소</div>
                <div>주소</div>
            </div>
            <div class="check-main">
                <div>이름</div>
                <div>아이디</div>
                <div>비밀번호</div>
                <div>이메일 주소</div>
                <div>주소</div>
            </div>
            <div class="check-main">
                <div>이름</div>
                <div>아이디</div>
                <div>비밀번호</div>
                <div>이메일 주소</div>
                <div>주소</div>
            </div>
            <div class="check-main">
                <div>이름</div>
                <div>아이디</div>
                <div>비밀번호</div>
                <div>이메일 주소</div>
                <div>주소</div>
            </div>
            <div class="check-main">
                <div>이름</div>
                <div>아이디</div>
                <div>비밀번호</div>
                <div>이메일 주소</div>
                <div>주소</div>
            </div>
            <div class="check-main">
                <div>이름</div>
                <div>아이디</div>
                <div>비밀번호</div>
                <div>이메일 주소</div>
                <div>주소</div>
            </div>
        </div>
        <div class="pagenum">
            <div><a href="#"> &lt &lt </a></div>
            <div><a href="#">1</a></div>
            <div><a href="#">2</a></div>
            <div><a href="#">3</a></div>
            <div><a href="#">4</a></div>
            <div><a href="#">5</a></div>
            <div><a href="#">6</a></div>
            <div><a href="#">7</a></div>
            <div><a href="#"> &gt &gt</a></div>
        </div>
        <div class="searchbar">
            <form>
                <select>
                    <option value="name" selected>이름</option>
                    <option value="id">아이디</option>
                    <option value="pwd">비밀번호</option>
                    <option value="email">이메일 주소</option>
                    <option value="address">주소</option>
                </select>
                <input type="text" name="searchmember">
                <input type="button" name="search" class="search" value="검색">
            </form>
        </div>
    </section>
</body>
</html>