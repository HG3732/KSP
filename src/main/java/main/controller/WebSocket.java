package main.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import com.fasterxml.jackson.databind.ObjectMapper;


@ServerEndpoint("/chat")
public class WebSocket {
       
	static List<Session> sessionList = Collections.synchronizedList(new ArrayList<>());

	  // 웹 소켓 연결시 호출
	  @OnOpen
	  public void handleOpen(){
	  	System.out.println("웹 소켓 연결");
	    sessionList.add(userSession); // 웹 소켓 연결시 세션리스트에 추가
	  }

	  // 웹소켓 메시지 수신시 호출
	  @OnMessage
	  public void handleMessage(String message){
	  	System.out.println("수신 된메시지 : " + message);

		//jsonStr을 Map으로 변환
		Map<String,Object> messageMap = new ObjectMapper().writeValueAsString(messageMap);

	    //세션리스트에게 데이터를 보낸다.
	    Iterator<Session> iterator = sessionUsers.iterator();
	    while(iterator.hasNext()){
	    	//해당 데이터를 다른 세션들에게 뿌린다.
	  	  iterator.next().getBasicRemote().sendText(messageMap);
	    }
	  }

	  // 웹 소켓이 닫힐 때 세션 제거
	  @OnClose
	  public void handleClose(Session userSession){
	      sessionList.remove(userSession);
	  }
	  /**
	  * 웹 소켓이 에러가 나면 호출되는 이벤트
	  * @param t
	  */
	  @OnError
	  public void handleError(Throwable t){
	      t.printStackTrace();
	  }

}
