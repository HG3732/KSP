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
        <form id="change-info" method="post" action="${pageContext.request.contextPath}/member/info">
            <table>
                <tr>
                    <td>
                        아이디      
                    </td>
                    <td>
                    	<form class="adminupdate" method="post" action="${pageContext.request.contextPath}/member/info">
                        <input type="text" name="name" class="name" disabled>
                    </td>
                </tr>
                <tr>
                    <td>
                        회원 등급       
                    </td>
                    <td>
                       	<input type="text" name="member_admin" class="member_admin">
                       	</td>
                       	<td>
	                       	<button type="submit" name="change-mem-Info" class="change-mem-Info">등급 변경</button>
                       	</form>
                    </td>
                </tr>
                <tr>
                    <td>
                        <form class="memberdelete" method="post" action="${pageContext.request.contextPath}/member/info"><button type="button" name="delete-mem" class="change" style="background-color: red;">회원 삭제</button></form>
                    </td>
                    <td>   
	                	<button type="button" name="change-mem-Info" class="change">신청 교육 목록</button>
                    </td>
                </tr>
       		</table>
       </form>
    </div>
</body>
<script>
		var member_id = new URLSearchParams(window.location.search).get("memberid");
		var member_admin = new URLSearchParams(window.location.search).get("memberadmin");
		$(".name").prop("value", member_id);
		$(".member_admin").prop("value", member_admin);
</script>
</html>