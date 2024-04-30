<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script type="text/javascript">
		$(document.ready(function({
			//웹 소켓 초기화
			webSocketInit();
		})));
		
		//웹소켓 생성
		var webSocket;
		
		function webSocketInit() {
			webSocket = new WebSocket("ws://localhost:8080/websocket2");
				webSocket.onopen = function(event) { socketOpen(event);};
				webSocket.onclose = function(event) { socketClose(event);};
				webSocket.onmessage = function(event) { socketMessage(event);};
				webSocket.onerror = function(event) { socketError(event);};
		}
		
		//웹소켓 연결
		function socketOpen(event) {
			console.log("연결 완료");
		}
		
		//웹소켓 닫힘
		function socketClose(event){
			console.log("웹소켓 닫힘");
			
			//웹소켓 닫혀있으면 재연결 시도
			webSocketInit();
		}
		
		//메세지 송신
		function socketMsgSend() {
			//메세지 포맷
			var msg = {
					type : "message",
					value : "메세지",
					seq : $("#seq").val();
			}
			
			//세션리스트에 메세지 송신
			webSocket.send(msg);
		}
		
		//웹소켓 메세지 수신
		function socketMessage(event) {
			var receiveDate = event.data;	//수신 data
			alert("수신된 msg : " + receiveData);
		}
		
		//웹소켓 에러
		function socketError(event) {
			alert("에러발생");
		}
		
		//웹소켓 종료
		function disconnect() {
			webSocket.close();
		}
	</script>
</body>
</html>