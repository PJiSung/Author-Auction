<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<meta charset="UTF-8">
<title>Chating</title>
<style>
.chatContainer {
	margin: 0;
	padding: 0;
}

.chatContainer {
	z-index: 999;
	position: fixed;
	width: 400px;
	padding: 25px;
	display: none;
	right: 70px;
	top: 265px;
}

.chatingHeader{
	display:flex;
	justify-content: space-between;
	align-items:center;
	background-color: white;
	color:black;
	width: 100%;
	height: 50px;
	line-height: 50px;
	border: 1px solid black;
	font-size: 20px;
	border-top-right-radius: 5px;
	border-top-left-radius: 5px; 
}
.chatingHeader .center{
	text-align: center; 
	font-weight: bold;
	flex-grow: 1;
}
.chatingHeader .right{
	margin-left: auto; 
}

.exit {
	margin-top: 10px;
	text-align: center;
	font-weight: bold;
}

.chatModal {
	z-index: 10000;
	display: none;
	position: fixed;
	left: 680px;
	top: 40px;
	width: 100%;
	height: 100%;
	overflow: auto;
}

.chatModal-content {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	background-color: #fefefe;
	padding: 20px;
	border: 1px solid black;
	width: 20%; 
	max-width: 550px; 
}
.closeBtn {
    color: #aaa;
    float: right;
    font-size: 28px;
    font-weight: bold;
    cursor: pointer;
}

.closeBtn:hover {
    color: black;
}

.closeModal {
	color: #aaa;
	font-size: 16px;
	font-weight: bold;
	border: none;
	background: white;
	width:15%;
	float:right;
}

.closeModal:hover,
.closeModal:focus {
	color: black;
	text-decoration: none;
	cursor: pointer;
}

.del{
	color:#FF9999;
}
.del:hover, .del:focus{
	color: red;
	text-decoration: none;
	cursor: pointer;
}
/* 채팅 */
.chatWrap {
    padding: 20px 0;
    height: 400px;
    background-color: white;
    overflow-y: auto;
    border:1px solid black;
}

.chatWrap .chat {
    display: flex;
    align-items: flex-start;
    padding: 0;
}


.chatWrap .chat .icon {
	display: relative;
	overflow: hidden;
	width: 50px;
	height: 50px;
	border-radius: 50%;
	margin-left: 10px;
	z-index: 9999;
}
.chatWrap img{
	width: 50px;
	height: 50px;
}
/* 내 채팅 */
.chatWrap .chat .textbox {
    position: relative;
    display: inline-block;
    max-width: calc(100% - 70px);
    padding: 7px;
    margin-top: 7px;
    font-size: 13px;
    border-radius: 5px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    transform: perspective(800px) rotateX(10deg);
    padding-top: 4px;
    padding-bottom: 4px;
}


/* 상대 채팅 */
.chatWrap .ch1 .textbox {
    position: absolute;
    display: inline-block;
    max-width: calc(100% - 70px);
    margin-top: 17px;
    font-size: 13px;
    border-radius: 5px;
    left: 66px;
}
/* .chatWrap .ch1 .textbox {
    position: relative;
    max-width: calc(100% - 70px);
    margin-top: 7px;
    font-size: 13px;
    border-radius: 5px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    transform: perspective(800px) rotateX(10deg);
    top: 10px;
	left: -50px;
} */
.chatWrap .ch1 .userId{
	margin-left: 5px;
	margin-top: -5px;
}

.chatWrap .chat .textbox::before {
    position: absolute;
    display: block;
    top: 0;
    font-size: 1.5rem;
}

.chatWrap .ch1 .textbox { 
    margin-left: 35px;
    background-color: #F2F2F2;
}

.chatWrap .ch1 .textbox::before {
    left: -12px;
    content: "◀";
    color: #F2F2F2;
}


/* 어드민 상대방 채팅 */
.chatWrap .ch1Admin{
	display: flex;
}
.chatWrap .ch1Admin .textbox {
    position: absolute;
    max-width: calc(100% - 70px);
    margin-top: 17px;
    font-size: 13px;
    border-radius: 5px;
    left: 66px;
}

.chatWrap .ch1Admin .userId{
	display: inline-block; /* 추가 */
    height: 20px; /* 추가 */
    margin-left: 5px;
    margin-top: -5px;
}
.chatWrap .ch1Admin .textbox{ 
	margin-left: 35px;
	background-color: #F2F2F2;
	float:left !important;
}
.chatWrap .ch1Admin .textbox::before {
    left: -12px;
    content: "◀";
    color: #F2F2F2;
}
/*                        */

/* 어드민 상대방 채팅 */
.chatWrap .ch3Admin .textbox {
    position: relative;
    display: inline-block;
    max-width: calc(100% - 70px);
    margin-top: 20px;
    font-size: 13px;
    border-radius: 5px;
}
.chatWrap .ch3Admin .textbox{ 
	margin-left: 75px; 
    margin-top: 7px;
    background-color: #f2f2f2;
}
/*                        */

.chatWrap .ch2 {
    flex-direction: row-reverse;
}

.chatWrap .ch2 .textbox {
    margin-right: 20px;
    background-color: #ffeb33;
}

.chatWrap .ch2 .textbox::before {
    right: -12px; 
    content: "▶";
    color: #ffeb33;
}

/* 연속 채팅 */
.chatWrap .ch3 .textbox {
    position: relative;
    display: inline-block;
    max-width: calc(100% - 70px);
    margin-top: 20px;
    font-size: 13px;
    border-radius: 5px;
}

.chatWrap .ch3 .textbox { 
    margin-left: 75px; 
    margin-top: 7px;
    background-color: #f2f2f2;
}

.chatWrap .ch4 {
    flex-direction: row-reverse;
}

.chatWrap .ch4 .textbox {
    margin-right: 20px;
    background-color: #ffeb33;
}
/* 메시지창 */
#yourMsg{
	width:100%;
	height: 60px;
	margin-top: 0;
	border: 1px solid black;
	border-bottom-right-radius: 5px;
	border-bottom-left-radius: 5px;
	border-top:none;
	border-left:none;
	background: white;
}
#yourMsg textarea{
	font-size: 16px;
	height: 60px;
	border-top: none;
	resize: none;
	width: 266px;
	border-color:black;
	border-right: none;
	border-bottom-left-radius: 5px;
	line-height: 19px;
}
#yourMsg textarea:focus{
	outline: none;
}
.textarea-container {
    position: relative;
    display: inline-block;
    float: left;
}
.sendBtn{
	float:right;
	width: 76px;
	margin-top: 9px;
}
#sendBtn {
    padding: 15px;
    padding-top: 8px;
    padding-bottom: 8px;
    background-color: black;
    color: white;
    border: none;
    border-radius: 3px;
    cursor: pointer;
}
#sendBtn:hover {
    background-color: #333;
}

.btn-chat{
	position: fixed;
	top: 780px;
	right: 100px;
}

.waitingCount{
	position: absolute;
	left: 52px;
	top: 40px;
	background-color: black;
	width: 20px;
	height: 20px;
	color: white;
	border-radius: 70%;
	font-size: 1.3rem;
	text-align: center;
	line-height: 20px;
}
</style>
</head>

<script type="text/javascript">
let ws;
let isAdmin = '${loginUser.memIsAdmin}';
let sId;
let profileImg = null; 
$(document).ready(function(){
	setInterval(waiting, 1000);
	document.getElementById("roomNumber").value = 1;
	enterSend();
});


function wsOpen() {
	document.getElementById("sendBtn").disabled = true;
	document.getElementById("chatting").value = "";
	ws = new WebSocket("ws://" + location.host + "/chating/" + $("#roomNumber").val() + "/isAdmin/" + isAdmin);
	if(wsEvt()){document.getElementById("roomNumber").value = '${roomNumber}'}
}
function wsEvt() {
	ws.onopen = function(data) {
		
	}
	ws.onclose = function(data){
		
	}
	ws.onmessage = function(data) {
		var msg = data.data;
		if (msg != null && msg.trim() != '') {
			var d = JSON.parse(msg);
			if (d.type == "getId") {
				var si = d.sessionId != null ? d.sessionId : "";
				if (si != '') {
					$("#sessionId").val(si);
					if(isAdmin == "Y"){
						$("#roomNumber").val(d.roomNumber);
					}
				}
			} else if (d.type == "message") {
				
				const createChat = (d, profileImg) =>{
					let mainDiv = document.getElementById("chating");
					let chatDiv = document.createElement("div");
					let textDiv = document.createElement("div");
					textDiv.classList.add("textbox");
					if (d.sessionId == $("#sessionId").val()) { // 나
						if(sId != d.sessionId){
							chatDiv.classList.add("chat", "ch2");
						}else{
							chatDiv.classList.add("chat", "ch4");
						}
					} else { //상대방
						
						if(sId != d.sessionId){
							let firstDiv = document.createElement("div");
							if(isAdmin == 'Y'){
								chatDiv.classList.add("chat", "ch1Admin");
							}else{
								chatDiv.classList.add("chat", "ch1");
							}
							let iconDiv = document.createElement("div");
							iconDiv.classList.add("icon");
							iconDiv.innerHTML = "<img src='"+profileImg+"'>"
							
							let idDiv = document.createElement("div");
							idDiv.classList.add("userId");
							idDiv.innerHTML = d.userName;
							//idDiv.innerHTML = "ssssssssssssssssssssss";
							
							chatDiv.append(iconDiv);
							chatDiv.append(idDiv);
						}else{
							if(isAdmin == 'Y'){
								chatDiv.classList.add("chat", "ch3Admin");
							}else{
								chatDiv.classList.add("chat", "ch3");
							}
						}
					}
					
					textDiv.innerHTML = d.msg;	
					chatDiv.append(textDiv);
					mainDiv.append(chatDiv);
					sId = d.sessionId; 
					scrollToBottom();
					scroll();
				}
				
				if(profileImg == null && d.sessionId != $("#sessionId").val()){
					$.ajax({
						type: 'post',
				 		url: 'selectImg',
				 		data: {id: d.userName},
				 		success: (data) =>{
				 			profileImg = data;
				 			createChat(d, profileImg);
				 		},
				 		error: data => console.log(data)
				 	});	
				}else{
					createChat(d, profileImg);
				}
				
			} else if (d.type == "notification" && isAdmin == "Y"){
				document.getElementById("sendBtn").disabled = false;
				document.getElementById("chating").innerText = "";
			} else if (d.type == "sessionCount"){ //채팅방에 고객만 있을때
				if(d.sessionCount == 0 && isAdmin == "N"){
					let text = "상담사를 배정중입니다. 잠시만 기다려주세요."
					$("#chating").append("<p class='exit'>"+text+"</p>");
				}else{
					document.getElementById("sendBtn").disabled = false;
					document.getElementById("chating").innerText = "";
				}
			} else if (d.type == "exit"){
				$("#chating").append("<p class='exit'>"+d.msg+"</p>");
				document.getElementById("sendBtn").disabled = true;
				sendMessage = null;
			} else if (d.type == "newRoom") {
				
				var si = d.sessionId != null ? d.sessionId : "";
				if (si != '') {
					$("#sessionId").val(si);
				}
				document.getElementById("roomNumber").value = parseInt(document.getElementById("roomNumber").value)+1;
				wsOpen();
			} else {
				console.warn("unknown type!")
			}
		}
	}
}

const sendMessage = () =>{
	if(document.getElementById("chatting").value.trim() != ""){
		var option = {
			type : "message",
			roomNumber : $("#roomNumber").val(),
			sessionId : $("#sessionId").val(),
			userName : $("#userName").val(),
			msg : $("#chatting").val(),
			isAdmin : isAdmin
		}
		ws.send(JSON.stringify(option));
		$('#chatting').val("");
		$('#chatting').focus();
		
		scrollToBottom();
	}
}

const openChat = () =>{
	let login = "${loginUser}";
	let waiting = document.getElementById("waiting");
	if(login == ""){
		alert("로그인후에 진행해주세요");
	}else if(isAdmin == 'Y' && waiting.innerText == 0)
		alert("대기중인 고객이 없습니다.");
	else{
		$("#chatContainer").toggle();
		document.getElementById("openChatting").style.display="none";
		wsOpen();
	}
}

const closeChat = () =>{
	$(".chatContainer").toggle();
	document.getElementById("openChatting").style.display="block";
	document.getElementById("chating").innerText = "";
	if (ws) {
	    ws.close();
		document.getElementById("roomNumber").value = 1;
	}
}

const waiting = () =>{
	let waiting = document.getElementById("waiting");
	if(isAdmin == 'Y'){
		$.ajax({
	 		url: 'getWaiting',
	 		success: (data) =>{
				if(data >= 0){
					waiting.innerText = data;
				}else{
					waiting.innerText = 0;
				}
	 		},
	 		error: data => console.log(data)
	 	});	
	}
}

const showChatModal = () =>{
	let modal = document.getElementById('myChatModal');
	modal.style.display = 'block';
}

const closeChatModal = () =>{
	let modal = document.getElementById('myChatModal');
	modal.style.display = 'none';
}

const scrollToBottom = () =>{
    let chatContainer = document.getElementById('chating');
    chatContainer.scrollTop = chatContainer.scrollHeight;
}

const enterSend = () =>{
	document.getElementsByClassName('textarea-container')[0].addEventListener('keydown', function (event) {
		if (event.key === 'Enter') {
		  	event.preventDefault();
		  	if(document.getElementById("sendBtn").disabled == false){
				sendMessage();
		  	}else{
		  		document.getElementById("chatting").value = "";
		  	}
		}
	});
}

</script>
<body>

<a href="#" class="btn-chat header-utils-btn" onclick="openChat()" id="openChatting">
<img src="main/icons/chatIcon.png">
<c:if test="${ loginUser.memIsAdmin eq 'Y' }">
<span class="waitingCount" id="waiting">0</span>
</c:if>
</a>

	<div id="chatContainer" class="chatContainer">
	
		<input type="hidden" name="userName" id="userName" value="${loginUser.memId}">
		<input type="hidden" id="sessionId" value="">
		<input type="hidden" id="roomNumber" value="${roomNumber}">
		
		<div class="chatingHeader">
			<span class="center">&nbsp;&nbsp;&nbsp;&nbsp;AuthorAuction&nbsp;상담문의</span><span class="right closeBtn" onclick="showChatModal()">X&nbsp;</span>
		</div>
		<div class="chatWrap" id="chating">
    	</div>
		
		<div id="yourMsg">
			 <div class="textarea-container">
		        <textarea rows="5" wrap="soft" id="chatting"></textarea>
		    </div>
	        <div class="sendBtn">
	        	<button onclick="sendMessage()" id="sendBtn">전송</button>
	        </div>
		</div>
	  <div id="myChatModal" class="chatModal">
		  <div class="chatModal-content">
		    <h3>채팅방에서 나가시겠습니까?</h3><br>
		    <p>나가기를 하면 대화내용이 모두 삭제됩니다.</p><br>
		    <input type="button" class="closeModal del" value="확인" onclick="closeChatModal();closeChat()">
		    <input type="button" class="closeModal can" value="취소" onclick="closeChatModal()">
		  </div>
	</div>
	</div>
	
</body>
</html>
