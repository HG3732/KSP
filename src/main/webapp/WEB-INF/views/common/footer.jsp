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
	</footer>
</body>
<script>
$(loadedHandler)

let webSocket;
	function loadedHandler(){
		// WebSocket 객체
		
		$(".faq").on("click", faqHandler);
	}
	
	function faqHandler() {
		webSocketInit();
		function webSocketInit() {
		    webSocket = new WebSocket("ws://localhost:8080/star/chat2");
			webSocket.onopen = function(event) { socketOpen(event);};
			webSocket.onclose = function(event) { socketClose(event);};
			webSocket.onmessage = function(event) { socketMessage(event);};
			webSocket.onerror = function(event) { socketError(event);};
		}  

		//웹소켓 연결
		function socketOpen(event){
			console.log("연결 완료");
		}
		 
	    // WebSocket이 열렸을 때 실행
		function socketOpen(event){
	        //서버에 사용자 정보 전달
	    	webSocket.send(JSON.stringify({ type: 'message', data: 'aaaa' }));
		    console.log("연결 완료");
		  }

	  //메시지를 송신할 때 사용
	    function socketMsgSend(){
	       // 메시지 포맷
	       var msg = {
	       	type : "message",
	          value : "메시지입니다.",
	          seq : $("#seq").val()
	       }
	       
	       // 세션리스트에 메시지를 송신
	       webSocket.send(msg)
	    }
	    
	    //메시지를 수신했을 때
	    function socketMessage(event){
	    	  var receiveData = event.data; // 수신 data
	        alert("수신된 msg : " + receiveData);
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
</script>
</html>