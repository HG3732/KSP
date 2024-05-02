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

let webSocket;

	function loadedHandler() {
		$(".logout").on("click", logoutHandler);
		$(".mypage").on("click", myPageHandler);
		
		$(".chat").on("click", faqHandler);
	}
	
	function logoutHandler() {
		alert("안녕히가십시오");
		
		var frmlogout = document.getElementById("logout");
		frmlogout.action = "${pageContext.request.contextPath}/logout";
		frmlogout.method = "post";
		frmlogout.submit();
	}
	
 	function myPageHandler(){
		
 		let options = "width=600, height=500, menubar=no, toolbar=no, scrollbars=no, resizable=no";
 		window.open("${pageContext.request.contextPath}/star/mypage", "_blank", options);
 		
	}
 	
 	function faqHandler() {
 		
		$(".wrap-chatbox").css("display","flex");
		$("#btn-sendmsg").on("click", socketMsgSend);
		$(".close-chat").on("click", closeChatHandler);
		
		webSocketInit();
		function webSocketInit() {
		    webSocket = new WebSocket("ws://192.168.10.41:8080/star/chat2");
			webSocket.onopen = function(event) { socketOpen(event);};
			webSocket.onclose = function(event) { socketClose(event);};
			webSocket.onmessage = function(event) { socketMessage(event);};
			webSocket.onerror = function(event) { socketError(event);};
		}  

		//웹소켓 연결
	    // WebSocket이 열렸을 때 실행
		function socketOpen(event){
	        //서버에 사용자 정보 전달
	    	webSocket.send('${ssslogin.mem_id}' + "님이 입장하셨습니다.");
		    console.log("연결 완료");
		  }

	  //메시지를 송신할 때 사용
	    function socketMsgSend(){
	       
		  if($("#inputmsg").val().trim() != ""){
			  // 메시지 포맷
		       var msg = "${ssslogin.mem_id} : " + $("#inputmsg").val();
		       console.log("송신한 메세지 : " + msg);
		       // 세션리스트에 메시지를 송신
		       webSocket.send(msg);

			   //채팅창에 보낸 메세지 표시
		       $(".content-box").append('<div class="msgbox">${ssslogin.mem_id} : ' + $("#inputmsg").val() + '</div>');
		       $(".content-box").scrollTop($(".content-box")[0].scrollHeight);
		       $("#inputmsg").val("");
			}
	    }
	    
	    //메시지를 수신했을 때
	    function socketMessage(event){
	    	  var receiveData = event.data; // 수신 data
	    	  //채팅창에 받은 메세지 표시
	    	  $(".content-box").append('<div class="receivebox">' + receiveData + "</div>");
	    	  $(".content-box").scrollTop($(".content-box")[0].scrollHeight);
	    }

	    // WebSocket 연결이 닫혔을 때
	    function socketClose(event){
	     	console.log("웹소켓이 닫혔습니다.");
	     }
	    
	  	//웹소켓 에러
	    function socketError(event){
	    	alert("에러가 발생하였습니다.");
	    }
	  	
	  	//웹소켓 종료
	    function disconnect(){
	    	webSocket.close();
	    }
		function closeChatHandler() {
	    	webSocket.send('${ssslogin.mem_id}' + "님이 나가셨습니다.");
			disconnect();
			$(".wrap-chatbox").css("display","none");
		}
		
	}
 	
	function entermsg() {
		if (window.event.keyCode == 13) {
	    	document.getElementById('btn-sendmsg').click();
	    }
	}
</script>
</head>
<body>
	<div class="wrap-chatbox">
		<div class="topbar"><button type="button" class="close-chat">X</button></div>
		<div class="content-box">
			<div class="msgbox"> message : 첫메세지</div>
			<div class="receivebox">receiveData</div>
		</div>
		<div class="input-box">
			<input type="text" id="inputmsg" onkeyup="entermsg()"><button type="button" id="btn-sendmsg">전송</button>
		</div>
	</div>
    <header>
	    <div class="wrap-header">
	    	<div class="top-bar">
	    		<c:choose>
		    		<c:when test="${empty ssslogin}">
		                <div><a href="${pageContext.request.contextPath}/login">로그인</a></div>
		                <div><a href="${pageContext.request.contextPath}/star/join" target="_blank">회원가입</a></div>
	                </c:when>
	                <c:otherwise>
	                	<div>
	                		<button type="button" class="chat">오픈채팅</button>
	                	</div>
	                	<form id="logout">
		                	<div><a href="#" class="logout">로그아웃</a></div>
		                </form>
		                <div><a href="#" class="mypage">${ssslogin.mem_name}님의 페이지</a></div>
		                <c:if test="${ssslogin.mem_admin == 2}">
		                	<div><a href="${pageContext.request.contextPath}/member/list" class="memberlist" style="color: yellow;">회원 관리</a></div>
		                </c:if>
	                </c:otherwise>
	            </c:choose>
            </div>
	        <div class="logo"><a href="${pageContext.request.contextPath}/home" class="logo">김서박</a></div>
	        <div class="nav">
	            <div><a href="${pageContext.request.contextPath}/edu" class="edu">교육 신청</a></div>
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
                <div class="weather-box">
                   <c:choose>
                   		<c:when test="${empty weatherInfo }">
							날씨 데이터를 불러오는데 실패하였습니다.	                   		
                   		</c:when>
                   		<c:otherwise>
                   			<MARQUEE behavior="scroll" scrollamount="12">
	                   			<c:forEach items="${weatherInfo}" var="weatherinfo">
	                   				<span>${weatherinfo.fcstDate}</span> &nbsp; <span>${weatherinfo.fcstHour}시</span> &nbsp; <span>기온 : ${weatherinfo.t1h}도</span> &nbsp; <span>하늘 상태 : ${weatherinfo.sky}</span> &nbsp; <span>강수 : ${weatherinfo.pty}</span> &nbsp; | &nbsp;
	                   			</c:forEach>
                   			</MARQUEE>
                   		</c:otherwise>
                   </c:choose>
                </div>
            </div>
	    </div>
    </header>
</body>
</html>