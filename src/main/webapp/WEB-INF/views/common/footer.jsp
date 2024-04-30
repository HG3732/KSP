<link href="${pageContext.request.contextPath}/resource/css/reset.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resource/css/core.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resource/css/common/footer.css" rel="stylesheet">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <footer>
		<div class="wrap-footer">
            <div class="companyinfo">
                <div>이용 약관</div>
                <div>|</div>
                <div>개인정보 처리방침</div>
                <div>|</div>
                <div>인재 채용 문의</div>
                <div>|</div>
                <div>교육 강사 구인</div>
                <div>|</div>
                <div><button type="button" class="faq">FAQ</button></div>
            </div>
            <div class="bottom-box">
                <div class="ourinfo">
                    <div><img src="${pageContext.request.contextPath}/resource/image/GPS_Icon.png" width="20px"/></div>
                    <div>강남지원2관 : 서울특별시 강남구 테헤란로10길 9 그랑프리 빌딩 5F</div>
                </div>
                <div class="copyright">
                    <div style="line-height: 20px;">Copyright @2024-3024 KSP GoodGuys All Right Reserved</div>
                </div>
            </div>
            <div class="icon-box">
                <div><img src="${pageContext.request.contextPath}/resource/image/facebook.png" width="50px"/></div>
                <div><img src="${pageContext.request.contextPath}/resource/image/instagram.png" width="50px"/></div>
                <div><img src="${pageContext.request.contextPath}/resource/image/kakaotalk.png" width="50px"/></div>
            </div>
		</div>
		
		<div class="wrap-chatbox">
		<div class="topbar"><button type="button" class="close-chat">X</button></div>
			<div class="content-box">
				<div class="msgbox"> message : 첫메세지</div>
				<div class="receivebox">receiveData</div>
			</div>
			<div class="input-box">
				<input type="text" id="inputmsg"><button type="button" id="btn-sendmsg">전송</button>
			</div>
		</div>
	</footer>
</body>
<script>
$(loadedHandler)

var contentbox = document.querySelector(".content-box");
let webSocket;

	function loadedHandler(){
		
		$(".faq").on("click", faqHandler);
	}
	
	function faqHandler() {
		$(".wrap-chatbox").css("display","flex");
		$("#btn-sendmsg").on("click", socketMsgSend);
		$(".close-chat").on("click", closeChatHandler);
		
		webSocketInit();
		function webSocketInit() {
		    webSocket = new WebSocket("ws://localhost:8080/star/chat2");
			webSocket.onopen = function(event) { socketOpen(event);};
			webSocket.onclose = function(event) { socketClose(event);};
			webSocket.onmessage = function(event) { socketMessage(event);};
			webSocket.onerror = function(event) { socketError(event);};
		}  

		//웹소켓 연결
	    // WebSocket이 열렸을 때 실행
		function socketOpen(event){
	        //서버에 사용자 정보 전달
	    	webSocket.send(JSON.stringify({ type: 'Member_Id', data: '${ssslogin.mem_id}' }));
		    console.log("연결 완료");
		  }

	  //메시지를 송신할 때 사용
	    function socketMsgSend(){
	       
		  if($("#inputmsg").val().trim() != ""){
			  // 메시지 포맷
		       var msg = {
		       	type : "message",
		          value : $("#inputmsg").val()
		          //,seq : $("#seq").val()
		       }
		       // 세션리스트에 메시지를 송신
		       webSocket.send(JSON.stringify(msg));

			   //채팅창에 보낸 메세지 표시
		       $(".content-box").append('<div class="msgbox">${ssslogin.mem_id} : ' + $("#inputmsg").val() + '</div>');
		       contentbox.scrollTop = contentbox.scrollHeight;
		       $("#inputmsg").val("");
			}
	    }
	    
	    //메시지를 수신했을 때
	    function socketMessage(event){
	    	  var receiveData = event.data; // 수신 data
	        alert("수신된 msg : " + receiveData);
	    	  //채팅창에 받은 메세지 표시
	    	  $(".content-box").append('<div class="receivebox">' + receiveData + "</div>");
	    	  contentbox.scrollTop = contentbox.scrollHeight;
	    }

	    // WebSocket 연결이 닫혔을 때
	    function socketClose(event){
	     	console.log("웹소켓이 닫혔습니다.");
	     	 
	        // 웹소켓이 닫혀있으면 재연결을 시도
	        webSocketInit(); 
	     }
	    
	  	//웹소켓 에러
	    function socketError(event){
	    	alert("에러가 발생하였습니다.");
	    }
	  	
	  	//웹소켓 종료
	    function disconnect(){
	    	webSocket.close();
	    }
	}
	
	function closeChatHandler() {
		//disconnect();
		$(".wrap-chatbox").css("display","none");
	}
</script>
</html>