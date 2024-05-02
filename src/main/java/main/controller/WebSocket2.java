package main.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint(value="/chat2", configurator = WebSocketSessionConfigurator.class)
public class WebSocket2 {
	 // 모든 클라이언트의 세션 관리
    private static Map<String, Session> clientSessions = new HashMap<>();

    // 클라이언트가 연결되었을 때
    @OnOpen
    public void onOpen(Session session) {
        // 새 유저 접속 시 새로운 클라이언트 세션을 추가
        clientSessions.put(session.getId(), session);
    }

    // 클라이언트가 메시지를 보냈을 때
    @OnMessage
    public void onMessage(String message, Session session) {
        // 메세지 처리
	    	sendMessageToClient(session.getId(), message);
    }

    // 클라이언트가 연결을 끊었을 때
    @OnClose
    public void onClose(Session session) {
        // 클라이언트 세션 제거
        clientSessions.remove(session.getId());
    }

    // 클라이언트에게 메시지 전송
    private void sendMessageToClient(String recipientId, String message) {
    	//현재 접속해 있는 모든 클라이언트들
    	Set<String> connectedSessionKeySet = clientSessions.keySet();
    	for(String sessionKey : connectedSessionKeySet) {
    		//자기자신을 제외한 모두에게 메세지 전송
    		//메세지를 보내는 사람의 session.getId와 현재 연결한 사람의 session.getId 비교해서 다르다면(즉, 현재 연결한 사람들 중 송신자를 제외한 모든 이들)
    		if(!recipientId.equals(sessionKey)) {
    			//그사람을 수신자로 추가
    			Session recipientSession = clientSessions.get(sessionKey);
    			//연결 오류가 없거나 연결이 끊기지 않았다면
    			if (recipientSession != null && recipientSession.isOpen()) {
    				try {
    					recipientSession.getBasicRemote().sendText(message);
    				} catch (IOException e) {
    					e.printStackTrace();
    				}
    			}
    		}
    	
        }
    }
}
