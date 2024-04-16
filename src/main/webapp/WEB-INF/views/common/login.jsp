	<link href="${pageContext.request.contextPath}/resource/css/reset.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resource/css/core.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resource/css/common/login.css" rel="stylesheet">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
   
    <script>
$(loadedHandler)
function loadedHandler() {
	$("#login-form .login-submit").on("click", loginSubmitHandler);
	$(".login").on("keyup", loginBtnHandler);
}

function loginSubmitHandler() {
	$.ajax({
		url:"${pageContext.request.contextPath}/login"
		,method : "post"
		,data : $("#login-form").serialize()
		,success : function(result){
			if(result == 1){
				
				alert("어서오세요");
				
				location.href="${pageContext.request.contextPath}/home";
			} else {
				alert("아이디 또는 비밀번호를 확인해주세요");
				$("[name=pwd]").val("");
			}
		}
		, error : function(request, status, error) {
			alert("code:"  + request.status + "\n" + "message : "
					+ request.responseText + "\n"
					+"error : " + error);
			}	
	})
}

//로그인 버튼 활성화 조건
function loginBtnHandler() {
	if(($(".id").val().trim().length > 0) && ($(".pw").val().trim().length > 0)){
		$(".login-submit").prop('disabled', false);
	} else {
		$(".login-submit").prop('disabled', true);
	}
}


</script>
</head>
<body>
	<body>
    <div class="wrap-main">
        <div class="login-box">
            <div class="top-bar">
                <p>로그인</p>
            </div>
            <form id="login-form">
                <div class="main-login">
                    <input type="text" name="id" class="login id" placeholder="아이디">
                    <input type="password" name="pw" class="login pw" placeholder="비밀번호">
                    <input type="button" class="login-submit" value="로그인" disabled>
                </div>
            </form>
            <button type="button" class="join">회원 가입</button>
        </div>
    </div>
</body>
</html>