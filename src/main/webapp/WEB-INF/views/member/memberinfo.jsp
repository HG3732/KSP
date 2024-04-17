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
    <div class="wrap-changeinfo">
        <form id="change-info" method="post" action="${pageContext.request.contextPath}/change/admin">
            <table>
                <tr>
                    <td>
                        아이디      
                    </td>
                    <td>
                        <input type="text" name="mem_id" class="mem_id" value="${mem_id}" readonly>
                    </td>
                </tr>
                <tr>
                    <td>
                        회원 등급       
                    </td>
                    <td>
                       	<input type="text" name="grade" class="member_admin" value="${mem_admin }">
                    </td>
                    <td>
	                    <button type="submit" name="change-mem-Info" class="change-mem-Info">회원 관리</button>
                    </td>
                </tr>
       		</table>
       </form>
       <div class="mem-func">
	       <form method="post" action="${pageContext.request.contextPath}/member/delete">
	       		<button type="submit" name="delete-mem" class="change" value="${mem_id}" style="background-color: red;">회원 삭제</button>
	       </form>
	       <button type="button" name="change-mem-Info" class="change">신청 교육 목록</button>
       </div>
    </div>
<script>
</script>
</body>
</html>