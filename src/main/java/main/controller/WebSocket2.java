package main.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import com.google.gson.Gson;


@ServerEndpoint("/chat2")
public class WebSocket2 {
       private Gson gson = new Gson(); 
	 // 모든 클라이언트의 세션 관리
    private static Map<String, Session> clientSessions = new HashMap<>();
    
    // 관리자의 세션 관리
    private static Session adminSession;

    // 클라이언트가 연결되었을 때
    @OnOpen
    public void onOpen(Session session) {
        // 새로운 클라이언트 세션을 추가
        clientSessions.put(session.getId(), session);
        System.out.println("New client connected: " + session.getId());
    }

    // 클라이언트가 메시지를 보냈을 때
    @OnMessage
    public void onMessage(String message, Session session) {
    	
    	System.out.println("onMessage");
    	System.out.println(message);
    	System.out.println(session);
    	
        // 메세지 처리
    	if(isAdmin(session)) {
	    	String clientId = extractRecipientId(message);
	    	sendMessageToClient(clientId, message);
//	    	System.out.println(message);
    	} else {
    		sendMessageToAdmin(message);
//    		System.out.println(message);
    	}
    }

    // 클라이언트가 연결을 끊었을 때
    @OnClose
    public void onClose(Session session) {
        // 클라이언트 세션 제거
        clientSessions.remove(session.getId());
        System.out.println("Client disconnected: " + session.getId());
        
        // 관리자의 세션인 경우 변수 초기화
        if (session.equals(adminSession)) {
            adminSession = null;
            System.out.println("Admin disconnected: " + session.getId());
        	}
    }

    // 클라이언트에게 메시지 전송
    private void sendMessageToClient(String recipientId, String message) {
    	System.out.println("sendMessageToClient");
    	System.out.println(recipientId);
    	System.out.println(message);
        Session recipientSession = clientSessions.get(recipientId);
        if (recipientSession != null && recipientSession.isOpen()) {
            try {
            	System.out.println("sendMessageToClient - send");
                recipientSession.getBasicRemote().sendText(message);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
    
    // 관리자에게 메시지를 전송하는 메서드
    private void sendMessageToAdmin(String message) {
    	System.out.println("sendMessageToAdmin");
    	System.out.println(message);
        if (adminSession != null && adminSession.isOpen()) {
            try {
            	System.out.println("sendMessageToAdmin - send");
                adminSession.getBasicRemote().sendText(message);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
    
    // 세션이 관리자인지 판별하는 메서드
    private boolean isAdmin(Session session) {
        // 세션 속성을 확인하여 판별할 수 있습니다.
        // 예시: 세션 속성에 'isAdmin'이라는 키가 있는지 확인
        return session.getUserProperties().containsKey("isAdmin");
    }
    
    // 관리자가 메시지를 보냈을 때 수신자의 ID를 추출
    private String extractRecipientId(String message) {
        //JSON 형식의 메시지에서 추출
        return message.split(":")[0];
    }
}
