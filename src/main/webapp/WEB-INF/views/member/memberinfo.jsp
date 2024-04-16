	<link href="${pageContext.request.contextPath}/resource/css/reset.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resource/css/core.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resource/css/common/memberinfo.css" rel="stylesheet">
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
    <div class="wrap-mypage">
        <form id="change-info" method="post" action="${pageContext.request.contextPath}/member/info">
            <table>
                <tr>
                    <td>
                        아이디      
                    </td>
                    <td>
                        <input type="text" name="name" class="name" value="${member.mem_id}" disabled>
                    </td>
                </tr>
                <tr>
                    <td>
                        회원 등급       
                    </td>
                    <td>
                        <input type="text" name="member_admin" class="member_admin" value="${member.mem_admin}">
                    </td>
                </tr>
                <tr>
                    <td>
                        <button type="button" name="change-mem-Info" class="change">정보 수정</button>
                    </td>
                    <td>    
                        <button type="button" name="stop-mem" class="change">회원 정지</button>
                    </td>
                </tr>
       		</table>
       </form>
    </div>
</body>
</html>