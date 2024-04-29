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
	const cookieString = document.cookie;
	const cookies = cookieString.split('; ');
	var savedMemberId = null;
	for(let cookie of cookies) {
		const [cookieName, cookieValue] = cookie.split('=');
		 
		if (cookieName === "rememberedId") {
	        savedMemberId = cookieValue;
	 		}
	}
	
	/* 불러올 아이디가 있다면 아이디 기억 체크상태로 */
	if(savedMemberId != null){
			$(".remember-id").attr('checked', true);
	} else {
			$(".remember-id").attr('checked', false);
	}
	
	/* 아이디 기억이 체크되어있다면 input.id 채우기 */
	var checknum = document.querySelectorAll('input.remember-id:checked');
	if(checknum.length > 0){
		$(".id").attr('value', savedMemberId);
	}
		
	$("#login-form .login-submit").on("click", loginSubmitHandler);
	$(".login").on("keyup", loginBtnHandler);
	$(".join").on("click", joinHandler);
}

function loginSubmitHandler() {
	<%
		String referer = request.getHeader("referer");
		if(referer == null) referer = "/";
	%>
	$.ajax({
		url:"${pageContext.request.contextPath}/login"
		, async : false
		, method : "post"
		, data : $("#login-form").serialize()
		, success : function(result){
			switch (result) {
			case '-1':
				alert("이용이 정지된 계정입니다. 다른 계정으로 접속해주세요.");
				break;
			case '-2':
				alert("존재하지 않는 아이디입니다.");
				break;
			case '0':
				alert("반갑습니다");
				location.href="<%=referer%>";
				break;
			case '5':
				alert("로그인 실패 횟수 5회로 계정이 잠김처리되었습니다.");
				location.href="${pageContext.request.contextPath}/home";
				break;
			case '1' : case '2' : case '3' : case '4' :
				alert("아이디 또는 비밀번호를 확인해주세요(틀린 횟수 : " + result + " )");
				$("[name=pwd]").val("");
				break;
			default:
				alert("아이디 또는 비밀번호를 확인해주세요");
				break;
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

//회원가입창 이동
function joinHandler(){
	let options = "width=600, height=500, menubar=no, toolbar=no, scrollbars=no, resizable=no";
	window.open("${pageContext.request.contextPath}/star/join", options);
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
                    <input type="password" name="pw" class="login pw" placeholder="비밀번호" autocomplete="false">
                    <div><input type="checkbox" name="remember-id" class="remember-id" value="remember"> <span>ID 기억하기</span></div>
                    <input type="button" class="login-submit" value="로그인" disabled>
                </div>
            </form>
            <button type="button" class="join">회원 가입</button>
        </div>
    </div>
</body>
</html>