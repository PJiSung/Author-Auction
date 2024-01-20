
package com.kh.auction.inquiry.handler;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.stream.Collectors;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.kh.auction.user.model.vo.ChatMessage;
import com.kh.auction.user.model.vo.Inquiry;
import com.kh.auction.user.service.MainService;

import kotlin.reflect.jvm.internal.impl.types.model.TypeSystemOptimizationContext;

@Component
public class SocketHandler extends TextWebSocketHandler {
	
	@Autowired
	MainService mService;

	private List<HashMap<String, Object>> rls = new ArrayList<>();
	private ArrayList<ChatMessage> cList = new ArrayList<>();
	private ArrayList<String> aloneList = new ArrayList<>();
	public static int waiting = 0;
	
	@Override
	public void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception { // 메시지 발송
		String msg = message.getPayload();
		String url = session.getUri().toString();
		JSONObject obj = jsonToObjectParser(msg);
		String objMsg = (String) obj.get("msg");
		String id = (String) obj.get("userName");
		String rN = (String) obj.get("roomNumber");
		String isAdmin = (String) obj.get("isAdmin");
		
		boolean checkClist = false;
		int index = 0;

		if (!cList.isEmpty()) {
			for (int i = 0; i < cList.size(); i++) {
				if (cList.get(i).getRoomNum().equals(rN)) {
					index = i;
					checkClist = true;
					break;
				}
			}
		}
		ChatMessage cm = new ChatMessage();
		if (!checkClist) {
			if(isAdmin.equals("N")) {
				cm.setCustomerId(id);
			}else{
				cm.setAdminId(id);
			}
			cm.setContent("[" + id + "] " + objMsg + "\n");
			cm.setRoomNum(rN);
			cList.add(cm);
		} else {
			if(cList.get(index).getCustomerId() == null) {
				if(isAdmin.equals("N")) {
					cList.get(index).setCustomerId(id);
				}
			}else if(cList.get(index).getAdminId() == null) {
				if(isAdmin.equals("Y")) {
					cList.get(index).setAdminId(id);
				}
			}
			String content = cList.get(index).getContent();
			cList.get(index).setContent(content + "[" + id + "] " + objMsg + "\n");
		}
		
		HashMap<String, Object> temp = new HashMap<>();
		if (rls.size() > 0) {
			for (int i = 0; i < rls.size(); i++) {
				String roomNumber = (String) rls.get(i).get("roomNumber");
				if (roomNumber.equals(rN)) {
					temp = rls.get(i);
					break;
				}
			}
			for (String k : temp.keySet()) {
				if (k.equals("roomNumber")) {
					continue;
				}
				WebSocketSession wss = (WebSocketSession) temp.get(k);
				if (wss != null) {
					try {
						wss.sendMessage(new TextMessage(obj.toString()));
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			}
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		super.afterConnectionEstablished(session);
		boolean checkRoom = true;
		String url = session.getUri().toString();
		String roomNumber = (url.split("/chating/")[1]).split("/isAdmin/")[0]; 			//방번호
		String isAdmin = url.split("/isAdmin/")[1]; 									// 관리자여부
		int idx = rls.size();
		
		
		List<WebSocketSession> roomSessions = rls 										//해당 방에 현재 접속 중인 세션 목록
				.stream().filter(map -> map.get("roomNumber").equals(roomNumber)).flatMap(map -> map.values().stream()
						.filter(value -> value instanceof WebSocketSession).map(value -> (WebSocketSession) value))
				.collect(Collectors.toList());
		
		
		if(isAdmin.equals("Y") && (!roomNumber.equals(rls.get(0).get("roomNumber")))) { // 관리자가 입장한 방번호가 제일 먼저 들어온 고객의 방번호와 같지 않을때 
			checkRoom = false;															// 방에 대한 접속 가능 여부를 false로 변경
		}else if(isAdmin.equals("N")) {													// 고객일때 
			for (int i = 0; i < rls.size(); i++) {										
				if(rls.get(i).get("roomNumber").equals(roomNumber)) {					// 고객이 접속한 채팅방이 이미 존재한다면
					checkRoom = false;													// 방 접속 여부 false로 변경
					break;
				}
			}
		}
		
		if (rls.size() > 0) { 															//채팅방에 고객이 있는지 확인하고 있으면 index 저장
			for (int i = 0; i < rls.size(); i++) {
				String rN = (String) rls.get(i).get("roomNumber"); 
				if (rN.equals(roomNumber)) {
					idx = i;
					break;
				}
			}
		}
			
		if (checkRoom == true && ((roomSessions.size() == 0 && isAdmin.equals("N")) || (roomSessions.size() == 1 && isAdmin.equals("Y")))) { 
																					//방 접속 가능 여부가 true이고 고객인데 해당 채팅방에 아무도 없거나, 관리자인데 방에 1명의 고객이 있을때
			if(roomSessions.size() == 0 && isAdmin.equals("N")) {					//
				HashMap<String, Object> map = new HashMap<String, Object>();
				map.put("roomNumber", roomNumber);
				map.put(session.getId(), session);
				rls.add(map);
				aloneList.add(roomNumber);
				++waiting;
			}else if(roomSessions.size() == 1 && isAdmin.equals("Y")){
				HashMap<String, Object> map = rls.get(idx);
				map.put(session.getId(), session);
				if(aloneList.contains(roomNumber)) {
					int index = aloneList.indexOf(roomNumber);
					aloneList.remove(index);
					--waiting;
				}
			}
			notifySessionCount(roomNumber, roomSessions.size());
			notifyAllAdmins();
		} else if (roomSessions.size() == 1 && isAdmin.equals("N")) {
			checkRoom = false;
		} else { // 2명이상일때
			checkRoom = false;
		}
		JSONObject obj = new JSONObject();
		if (!checkRoom) {
			obj.put("type", "newRoom");
		} else {
			obj.put("type", "getId");
		}
		obj.put("sessionId", session.getId());
		obj.put("roomNumber", roomNumber);
		session.sendMessage(new TextMessage(obj.toString()));
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception { // 소켓 종료
		int index = 0;
		String url = session.getUri().toString();
		String roomNumber = (url.split("/chating/")[1]).split("/isAdmin/")[0]; // 방번호 체크
		
		if (rls.size() > 0) {
			
			for (int i = 0; i < rls.size(); i++) {
				rls.get(i).remove(session.getId());
			}
			
			for(int i=0; i<cList.size(); i++) {
				if(cList.get(i).getRoomNum().equals(roomNumber)) {
					index = i;
					break;
				}
			}
			
			if(aloneList.contains(roomNumber)) {
				int aloneIndex = aloneList.indexOf(roomNumber);
				aloneList.remove(aloneIndex);
				--waiting;
			}
			
			if (index >= 0 && index < cList.size()) {
				notifyRoomAboutExit(roomNumber);
				if(cList.get(index).getContent() != null) {
					createFile(session.getId(), cList.get(index).getContent(), cList.get(index).getCustomerId(), cList.get(index).getAdminId());
				}
				cList.remove(index);
			}
			
			for (int i = rls.size()-1; i >= 0; i--) {
		        if(rls.get(i).get("roomNumber").equals(roomNumber)) {
		            rls.remove(i);
		            break;
		        }
		    }
			
		}

		super.afterConnectionClosed(session, status);
	}

	private void notifyRoomAboutExit(String roomNumber) {
		List<WebSocketSession> roomSessions = rls
				.stream().filter(map -> map.get("roomNumber").equals(roomNumber)).flatMap(map -> map.values().stream()
						.filter(value -> value instanceof WebSocketSession).map(value -> (WebSocketSession) value))
				.collect(Collectors.toList());

		for (WebSocketSession roomSession : roomSessions) {
			JSONObject notification = new JSONObject();
			notification.put("type", "exit");
			notification.put("msg", "상담이 종료되었습니다.");

			try {
				roomSession.sendMessage(new TextMessage(notification.toString()));
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

	}

	private void createFile(String sessionid, String content, String customerId, String adminId) {
		String root = "D:\\";
		String savePath = root + "\\logs\\inquiry";
		File folder = new File(savePath);
		if (!folder.exists()) {
			folder.mkdir();
		}
		String fileName = "chat-" + sessionid + ".log";
		String fullPath = savePath + "\\" + fileName;
		File file = new File(fullPath);
		try (BufferedWriter writer = new BufferedWriter(new FileWriter(file, false))) {
			writer.write(content);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		insertInquiry(customerId, adminId, fileName);
	}

	private void insertInquiry(String customerId, String adminId, String fileName) {
		Inquiry inq = new Inquiry();
		inq.setInqFileName(fileName);
		inq.setMemId(customerId);
		inq.setAdminId(adminId);
		mService.insertInquiry(inq);
	}

	private static JSONObject jsonToObjectParser(String jsonStr) {
		JSONObject obj = null;
		try {
			obj = new JSONObject(jsonStr);
		} catch (org.json.JSONException e) {
			e.printStackTrace();
		}
		return obj;
	}

	private void notifySessionCount(String roomNumber, int sessionCount) {
		List<WebSocketSession> roomSessions = rls
				.stream().filter(map -> map.get("roomNumber").equals(roomNumber)).flatMap(map -> map.values().stream()
						.filter(value -> value instanceof WebSocketSession).map(value -> (WebSocketSession) value))
				.collect(Collectors.toList());

		for (WebSocketSession roomSession : roomSessions) {
			JSONObject notification = new JSONObject();
			notification.put("type", "sessionCount");
			notification.put("sessionCount", sessionCount);

			try {
				roomSession.sendMessage(new TextMessage(notification.toString()));
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	private void notifyAllAdmins() {
		List<WebSocketSession> adminSessions = rls.stream().flatMap(map -> map.values().stream()
				.filter(value -> value instanceof WebSocketSession).map(value -> (WebSocketSession) value))
				.collect(Collectors.toList());

		for (WebSocketSession adminSession : adminSessions) {
			JSONObject notification = new JSONObject();
			notification.put("type", "notification");

			try {
				adminSession.sendMessage(new TextMessage(notification.toString()));
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

}
