<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="imagetoolbar" content="no">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="format-detection" content="telephone=no">
<meta name="title" content="웹사이트">
<title>고객 목록</title>
<link rel="stylesheet" href="member/css/setting.css">
<link rel="stylesheet" href="member/css/plugin.css">
<link rel="stylesheet" href="member/css/template.css">
<link rel="stylesheet" href="member/css/common.css">
<link rel="stylesheet" href="member/css/style.css">

<link rel="stylesheet" href="main/css/setting.css">
<link rel="stylesheet" href="main/css/plugin.css">
<link rel="stylesheet" href="main/css/template.css">
<link rel="stylesheet" href="main/css/common.css">
<link rel="stylesheet" href="main/css/main.css">
<link rel="stylesheet" href="main/css/style.css">
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style>
.searchBox {
	display: flex;
	align-items: center;
	width: 1280px;
	border: 1px solid black;
	padding: 20px;
}
.searchBox table{
	width: 100%;
	padding: 20px;
}
.searchBox table tr{
	height: 50px;
}
.searchBox table .selectset{
	float: left;
	width: 12%;
}

.searchBox table .selectset .selectset-list{
	width: 91%;
}

.searchBox table .inputset{
	float: left;
}

.searchBox table .inputset input[type=text]{
	height: 40px;
}

.searchBox input[type=date]{
	height: 40px;
	border: 1px solid #E0E0E0;
	border-radius: 5px;
}

.searchBox input[type=date]:hover{
	cursor: pointer;
	border: 1px solid black;
}

.searchBox input[type=date]:focus{
	outline: none;
	border: 1px solid black;
}
tr .checkset {
	float: left;
	padding: 10px;
	margin-top: 0px !important;
}

.checkset-input {
  margin-right: 5px; 
}

.status-btn {
    padding: 5px 10px;
    border: 1px solid #000; 
    color: #000;
    background-color: #fff;
    cursor: pointer;
}

.status-btn.active {
    color: #fff;
    background-color: #000;
}

.status-btn:hover {
    background-color: #ccc;
    color: #000;
}
.tableset input[type=checkbox]{
	width: 16px;
	height: 16px;
}

.tableset tr:hover{
	background: #dcdcdc;
	cursor: pointer;
}

/* 모달 */
.modal {
    display: none;
    position: fixed;
    z-index: 10000;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.5);
    overflow-y: auto;
}

.modal-content {
 	overflow-y: auto;
	width: 27%;
	height: 80%;
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    background-color: #fff;
    padding: 20px;
    text-align: center;
}

.tabs {
    display: flex;
    margin-bottom: 15px;
}

.tab {
    cursor: pointer;
    padding: 5px;
    border: 1px solid #ccc;
    background-color: #f1f1f1;
    margin: 0;
}

.tab.active {
    background-color: white;
    border-bottom: none;
}

#tab1Content table tr td{
	height: 56px;
	border:1px solid white;
	text-align: left;
	width: 80%;
}

#tab1Content input[type=text]{
	border: none;
	border-bottom: 1px solid gray;
	width: 100%;
}

#tab1Content input[type=text]:hover{
	border-bottom: 1px solid black;
	width: 100%;
}

#tab1Content input[type=text]:focus{
	outline: none;
	border-bottom: 2px solid black;
	width: 100%;
}


#tab1Content table tr:not(:first-child):not(:last-child) th{
	text-indent: 20px;
	text-align: left;
}
/* 주소 */
#tab1Content table table tr td{
	border:1px solid white;
	height: 40px;
}
#tab1Content table table tr:first-child input[type=text]{
	width: 25%;
}
#tab1Content table table tr:last-child td{
	width: 50%;
}

#tab2Content{
	display:none;
}
#tab3Content{
	display:none;
}
.chatSearch{
	margin-top: 20px;
	border: 1px solid black;
	padding: 20px;
}
.chatSearch span{
	margin: 0 20px; 
}
.chatSearch button[type=button]{
	font-size: 18px;
	padding: 0;
	width: 55px;
	height: 38px;
	border-radius: 3px;
}
/* 문의 테이블 */
#iList{
	margin-top: 40px;
	margin-bottom: 30px;
}
#iList table{
	width: 100%;
	line-height: 50px;
}
#iList table tr:first-child{
	border-top: 1px solid black;
	background-color: #f7f7fb;
}
#iList table tr:not(:first-child){
	border-top: 1px solid #e5e5e5;
}
#iList table tr:not(:first-child):hover{
	background: #dcdcdc;
    cursor: pointer;
}

#iList input[type=date]{
	height: 40px;
	border: 1px solid #E0E0E0;
	border-radius: 5px;
}
#iList input[type=date]:hover{
	cursor: pointer;
	border: 1px solid black;
}

#iList input[type=date]:focus{
	outline: none;
	border: 1px solid black;
}

#iList{
	z-index: 2;
}
#chatPage{
	padding-top: 0;
	z-index: 1;
}
/* 채팅 */
#msg{
	margin-top: 30px;
}
#tab3Content hr{
	margin-top: 30px;
}
#tab3Content .chat {
    display: flex;
    align-items: flex-start;
    padding: 0;
}


#tab3Content .chat .icon {
	display: relative;
	overflow: hidden;
	width: 50px;
	height: 50px;
	border-radius: 50%;
	margin-left: 10px;
	z-index: 9999;
}
#tab3Content img{
	width: 50px;
	height: 50px;
}

#tab3Content .chat .icon i {
    position: absolute;
    top: 10px;
    left: 50%;
    font-size: 2.5rem;
    color: #aaa;
    transform: translateX(-50%);
}

/* 내 채팅 */
#tab3Content .chat .textbox {
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
#tab3Content .ch1 .textbox {
    position: absolute;
    display: inline-block;
    max-width: calc(100% - 70px);
    margin-top: 17px;
    font-size: 13px;
    border-radius: 5px;
    left: 60px;
}
#tab3Content .ch1 .userId{
	margin-left: 5px;
	margin-top: -5px;
}

#tab3Content .chat .textbox::before {
    position: absolute;
    display: block;
    top: 0;
    font-size: 1.5rem;
}

#tab3Content .ch1 .textbox { 
    margin-left: 35px;
    background-color: #F2F2F2;
}

#tab3Content .ch1 .textbox::before {
    left: -12px;
    content: "◀";
    color: #F2F2F2;
}

#tab3Content .ch2 {
    flex-direction: row-reverse;
}

#tab3Content .ch2 .textbox {
    margin-right: 20px;
    background-color: #ffeb33;
}

#tab3Content .ch2 .textbox::before {
    right: -12px; 
    content: "▶";
    color: #ffeb33;
}

/* 연속 채팅 */
#tab3Content .ch3 .textbox {
    position: relative;
    display: inline-block;
    max-width: calc(100% - 70px);
    margin-top: 20px;
    font-size: 13px;
    border-radius: 5px;
}

#tab3Content .ch3 .textbox { 
    margin-left: 75px; 
    margin-top: 7px;
    background-color: #f2f2f2;
}

#tab3Content .ch4 {
    flex-direction: row-reverse;
}

#tab3Content .ch4 .textbox {
    margin-right: 20px;
    background-color: #ffeb33;
}
</style>
<script>
window.onload = () =>{
	let url = window.location.href;
	if(url.includes("?id=")){
		url = url.split("?id=")[0];
	}else if(url.includes("&id=")){
		url = url.split("&id=")[0];
	}
	window.history.pushState({}, "Title", url);
	
	selectSet();
	checkAllSpan();
	checkAll('search');
	keepSort();
	maxDate();
	
}

function sample6_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            var addr = '';
            var extraAddr = '';

            if (data.userSelectedType === 'R') {
                addr = data.roadAddress;
            } else {
                addr = data.jibunAddress;
            }

            if(data.userSelectedType === 'R'){
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                document.getElementById("sample6_extraAddress").value = extraAddr;
            
            } else {
                document.getElementById("sample6_extraAddress").value = '';
            }

            document.getElementById('sample6_postcode').value = data.zonecode;
            document.getElementById("sample6_address").value = addr;
            document.getElementById("sample6_detailAddress").focus();
        }
    }).open();
} 

const selectSet = () =>{
	const selectsetToggle = document.querySelectorAll(".selectset-toggle");
	const selectsetLink = document.querySelectorAll(".selectset-link");
		selectsetToggle.forEach((buttonElement) => {
		    const clickEventHandler = (event) => {
		    event.stopPropagation();
		    const button = event.target.closest(".selectset-toggle");
		    const buttonParent = button.closest(".selectset");
		    buttonParent.classList.toggle("active");
		  };
		  buttonElement.removeEventListener("click", clickEventHandler);
		  buttonElement.addEventListener("click", clickEventHandler);
	});
	 
	selectsetLink.forEach((buttonElement) => {
	    const clickEventHandler = (event) => {
		    event.stopPropagation();
		    const button = event.target.closest(".selectset-link");
		    const buttonText = button.querySelector("span").innerHTML;
		    const buttonGrandParent = button.closest(".selectset-list");
		    const buttonParent = button.closest(".selectset-item");
		    const buttonParentSiblings = getSiblings(buttonGrandParent, buttonParent);
		    const buttonSelectsetToggle = button.closest(".selectset").querySelector(".selectset-toggle");
		    
		    buttonParentSiblings.forEach((siblingElement) => {
		        siblingElement.querySelector(".selectset-link").classList.remove("on");
		    });
		    
		    button.classList.toggle("on");
		    buttonSelectsetToggle.querySelector("span").innerHTML = buttonText;
	   	};
		buttonElement.removeEventListener("click", clickEventHandler);
		buttonElement.addEventListener("click", clickEventHandler);
	 });
	  
	function getSiblings(parent, element) {
	    return [...parent.children].filter((item) => item !== element);
	}
	
	const selectedButs = document.querySelectorAll('.selectset-link');
	for(let i = 0; i < selectedButs.length; i++){
	    selectedButs[i].addEventListener('click', function() {
	        document.getElementById('selectedCat').value = this.value;
	    });
	}
}

const checkAll = (value) =>{
	let cboxs;
	if(value == "search"){
		cboxs = document.querySelectorAll(".searchBox input[type=checkbox]");
	}else{
		cboxs = document.querySelectorAll(".tableset input[type=checkbox]");
	}
	for(let i=1; i<cboxs.length; i++){
		cboxs[i].checked = cboxs[0].checked;
	}
}

const checkAllSpan = () =>{
	let	spans = document.querySelectorAll(".checkset span");
	let	cboxs = document.querySelectorAll(".searchBox input[type=checkbox]");
	spans[0].addEventListener("click", function(){
		if(cboxs[0].checked){
			cboxs[0].checked = false;
		}else if(!cboxs.checked){
			cboxs[0].checked = true;
		}
		checkAll('search');
	});
	
	for(let i=1; i<spans.length; i++){
		spans[i].addEventListener("click", function(){
			if(cboxs[i].checked){
				cboxs[i].checked = false;
			}else if(!cboxs[i].checked){
				cboxs[i].checked = true;
			}
			checkSelect('search');
		});
	}
}

const checkSelect = (value) =>{
	let checkAllcBox;
	let cboxs;
	let checkCboxs;
	if(value == "search"){ 
		checkAllcBox = document.querySelectorAll("input[type=checkbox]")[0];
		cboxs = document.querySelectorAll("input[name='searchCbox']");
		checkCboxs = document.querySelectorAll("input[name='searchCbox']:checked");
	}else{
		checkAllcBox = document.querySelectorAll(".tableset input[type=checkbox]")[0];
		cboxs = document.querySelectorAll("input[name='tableCbox']");
		checkCboxs = document.querySelectorAll("input[name='tableCbox']:checked");
	}
	if(cboxs.length == checkCboxs.length){
		checkAllcBox.checked = true;
	}else{
		checkAllcBox.checked = false;
	}
};

const deleteMember = () =>{
	const checkboxes = document.querySelectorAll("input[name='tableCbox']:checked");
    const deleteIds = [];
   
    for(i=0; i<checkboxes.length; i++){
       deleteIds[i] = checkboxes[i].id;
    }
    if(deleteIds.length != 0){
        $.ajax({
	        url : 'deleteMember.adme',
	        type : 'post',
	        data: {ids: deleteIds},
	        success : (data) =>{
	        	console.log(data);
	        	if(data == "success"){
	        		reloadMyDiv();
	        	}
	        },
	        error : data => console.log(data)
		}); 
    }
};

const reloadMyDiv = () =>{
	$("#totalCount").load(location.href + " #totalCount");
	$("#tableset").load(location.href + " #tableset");
	$("#page").load(location.href + " #page");
} 

const search = () =>{
	
	//회원등급
	let isAdmin = document.getElementsByName("isAdmin")[0];
	let cboxs = document.querySelectorAll(".searchBox input[type=checkbox]:checked");
	if(cboxs.length == 1){
		isAdmin.value = cboxs[0].value;
	}
	
	//검색어
	let keyword = document.getElementsByName("keyword")[0];
	let selectBtn = document.querySelector(".selectset-toggle span");
	switch(selectBtn.innerText){
	case "아이디":
		keyword.value = "MEM_ID";
		break;
	case "이름":
		keyword.value = "MEM_NAME";
		break;
	case "닉네임":
		keyword.value = "MEM_NICKNAME";
		break;
	}
	
	document.getElementById("searchMember").submit();
}

const sort = (value) =>{
	let status = document.getElementsByName("status")[0];
	
	let url = window.location.href;
	
	
	if(url.includes("status") && url.includes("isAdmin")){ //검색 진행후 정렬할때
		let preStatus = url.split("&status=")[1];
		url = url.split("&status="+preStatus)[0] + "&status="+value;
	}else if(url.includes("status") && !url.includes("isAdmin")){ // 정렬만 진행했을때
		url = url.replace(url.split("adme?")[1], "status="+value);
	}else if(!url.includes("?")){ // 검색, 정렬 둘다 한적없을때
		url = "?status="+value;
	}
	let page = '${pi.currentPage}'
    url = url.replace("?page="+page, "?page=1");

	status.value = value;
	window.history.pushState({}, "Title", url);
	
	reloadMyDiv();
}

const keepSort = () =>{
	let sorts = document.querySelectorAll(".tabset-item a");
	let currentSort = "${ status }"
	
	if(currentSort == ""){
		sorts[0].classList.add("active");
	}else if(currentSort == "Y"){
		sorts[1].classList.add("active");
	}else{
		sorts[2].classList.add("active");
	}
}

const maxDate = () =>{
	let dates = document.querySelectorAll("input[type=date]");
	let today = new Date();
	let year = today.getFullYear();
	let month = today.getMonth() + 1;
	let day = today.getDate();
	
	month = month < 10 ? '0' + month : month;
	day = day < 10 ? '0' + day : day;
	
	for(let i=0; i<dates.length; i++){
		dates[i].setAttribute("max", year+"-"+month+"-"+day);
	}
}

const changeIsAdmin = (btn) =>{
	let id = btn.parentElement.parentElement.children[1].innerText;
	$.ajax({
        url : 'updateMemberIsAdmin.adme',
        type : 'post',
        data: {memId: id, memIsAdmin : btn.value == "일반회원" ? "N" : "Y"},
        success : (data) =>{
        	console.log(data);
        	if(data == "success"){
        		reloadMyDiv();
        	}
        },
        error : data => console.log(data)
	});
}

const showModal = (value) =>{
	let tab1 = document.getElementById('tab1Content');
	let tab2 = document.getElementById('tab2Content');
	let tab3 = document.getElementById('tab3Content');
	let id = value.children[1].children[0].innerText;
	let url = window.location.href;
	
	url = !url.includes("?") ? "?id="+id : url += "&id="+id;
	window.history.pushState({}, "Title", url);
	
	tab1.style.display = 'block';
    tab2.style.display = 'none';
    tab3.style.display = 'none';
    document.querySelector('.tab.tab1').classList.add('active');
    document.querySelector('.tab.tab2').classList.remove('active');
	
	$("#tab1Content").load(location.href + " #tab1Content", function() {
		let modal = document.getElementById('myModal');
		modal.style.display = 'block';
		document.body.style.overflow = 'hidden';
	});
		
	$("#chatPage").load(location.href + " #chatPage", ()=>{
		$("#iList").load(location.href + " #iList")
	});
}

const closeModal = (value) =>{
	let modal = document.getElementById('myModal');
	let id = value.parentElement.parentElement.parentElement.children[1].children[1].innerText;
	
	let url = window.location.href;
	if(url.includes("?id="+id)){
		url = url.split("?id="+id)[0];
	}else if(url.includes("&id="+id)){
		url = url.split("&id="+id)[0];
	}
	window.history.pushState({}, "Title", url);
	
	modal.style.display = 'none';
	document.body.style.overflow = 'auto';
}

window.onclick = function(event) {
	let modal = document.getElementById('myModal');
    let url = window.location.href;
    if (event.target == modal) {
    	if(url.includes("?id=")){
    		url = url.split("?id=")[0];
    	}else if(url.includes("&id=")){
    		url = url.split("&id=")[0];
    	}
    	window.history.pushState({}, "Title", url);
        modal.style.display = 'none';
        document.body.style.overflow = 'auto';
    }
}

const openTab = (tabName) =>{
	let tab1 = document.getElementById('tab1Content');
	let tab2 = document.getElementById('tab2Content');
	let tab3 = document.getElementById('tab3Content');
    if (tabName === 'tab1') {
        tab1.style.display = 'block';
        tab2.style.display = 'none';
        tab3.style.display = 'none';
        document.querySelector('.tab.tab1').classList.add('active');
        document.querySelector('.tab.tab2').classList.remove('active');
    } else if (tabName === 'tab2') {
        tab1.style.display = 'none';
        tab2.style.display = 'block';
        tab3.style.display = 'none';
        document.querySelector('.tab.tab1').classList.remove('active');
        document.querySelector('.tab.tab2').classList.add('active');
    }
}

const submitBtn = (value) =>{
	//주소
	let address = "";
	address += document.getElementById("sample6_postcode").value+"@";
	address += document.getElementById("sample6_address").value+"@";
	address += document.getElementById("sample6_detailAddress").value+"@";
	address += document.getElementById("sample6_extraAddress").value;
	
	let id = value.parentElement.parentElement.parentElement.children[1].children[1].innerText;
	let nickName = document.getElementById("nickName").value;
	let email = document.getElementById("email").value;
	let phone = document.getElementById("phone").value;
	
	$.ajax({
        url : 'updateMember.adme',
        type : 'post',
        data: {memId: id, memNickName: nickName, memEmail: email, memPhone: phone, memAddress: address },
        success : (data) =>{
        	console.log(data);
        	if(data == "success"){
        		reloadMyDiv();
        	}
        },
        error : data => console.log(data)
	});
	closeModal(value);
}

const chatPaging = (page) =>{
	let url = window.location.href;
	if(url.includes("&modalPage=")){
		url = url.split("&modalPage=")[0] + "&modalPage="+page;
	}else{
		url += "&modalPage="+page;
	}
	window.history.pushState({}, "Title", url);
	$("#iList").load(location.href + " #iList", ()=>{
		$("#chatPage").load(location.href + " #chatPage");
	})
}

const chatSearch = () =>{
	let strDate = document.getElementsByName("startDate")[1];
	let endDate = document.getElementsByName("endDate")[1];
	
	let url = window.location.href;
	if(url.includes("&chatStartDate=")){
		url = url.split("&chatStartDate=")[0] + "&chatStartDate="+strDate.value+"&chatEndDate="+endDate.value;
	}else{
		url += "&chatStartDate="+strDate.value+"&chatEndDate="+endDate.value;
	}
	window.history.pushState({}, "Title", url);
	
	$("#iList").load(location.href + " #iList", ()=>{
		$("#chatPage").load(location.href + " #chatPage", ()=>{
			strDate.value = "";
			endDate.value = "";
		});
		
	});
}

const selectInq = (element) =>{
	let inqNo = element.children[0].innerText;
	let url = window.location.href;
	if(url.includes("&inqNo")){
		url = url.split("&inqNo=")[0] + "&inqNo="+inqNo;
	}else{
		url += "&inqNo="+inqNo;
	}
	window.history.pushState({}, "Title", url);
	
	$("#msg").load(location.href + " #msg", ()=>{
		document.getElementById("tab2Content").style.display = "none";
		document.getElementById("tab3Content").style.display = "block";
		msg();
	});
	
}

const msg = () => {
	let sId = null;
	let preDiv = null; 
    let message = document.getElementById("chatMsg").value;
    console.log("ssss="+message);
    var regex = /\[([^\]]+)\] (\d+)/g;
    var matches = [];
    var match;

    while ((match = regex.exec(message)) !== null) {
        var id = match[1];
        var msg = parseInt(match[2], 10);
        
        matches.push({ id: id, msg: msg });
    }
    console.log(matches);
    if (matches.length > 0) {
        matches[0].id = matches[0].id.replace('[', '');
         
        let id = document.getElementById("tab1Content").children[0].children[1].children[0].children[1].children[1].innerText;
        for (let i = 0; i < matches.length; i++) {
        	let mainDiv = document.getElementById("msg");
			let chatDiv = document.createElement("div");
			let textDiv = document.createElement("div");
			textDiv.classList.add("textbox");
			if(id == matches[i].id){
				if(sId != matches[i].id){
					chatDiv.classList.add("chat", "ch2");
				}else{
					chatDiv.classList.add("chat", "ch4");
				}
			}else{
				if(sId != matches[i].id){
					chatDiv.classList.add("chat", "ch1");
					let iconDiv = document.createElement("div");
					iconDiv.classList.add("icon");
					iconDiv.innerHTML = "<img src='member/images/defaultProfile.svg'>"
					
					let idDiv = document.createElement("div");
					idDiv.classList.add("userId");
					idDiv.innerHTML = matches[i].id;
					
					chatDiv.append(iconDiv);
					chatDiv.append(idDiv);
				}else{
					chatDiv.classList.add("chat", "ch3");
				}
			}
		textDiv.innerHTML = matches[i].msg;	
		chatDiv.append(textDiv);
		mainDiv.append(chatDiv);
		sId = matches[i].id; 
        }
    }
}

</script>
</head>

<body>
<jsp:include page="../common/adminHeadSide.jsp"/>
<%-- <jsp:include page="../common/header.jsp"/> --%>
  <main class="th-layout-main ">
    <!-- [S]hooms-N36 -->
    <div class="hooms-N36" data-bid="HNlqYGbwI5">
      <div class="contents-inner">
        <div class="contents-container container-md">
          <div class="textset textset-h2">
            <h2 class="textset-tit">회원 목록​<br></h2>
          </div>
          <div class="contents-search">
            <div class="contents-form">
            <input type="hidden" name="category" id="selectedCat" value="전체">
            
            <form action="memberList.adme" id="searchMember">
            <div class="searchBox">
            <input type="hidden" name="isAdmin">
            <input type="hidden" name="keyword">
              	<table>
              		<tr>
              			<td>회원등급</td>
              			<td colspan="3">
							<div class="checkset">
								<input id="checkset-a-1-1" class="checkset-input input-fill" type="checkbox" aria-label="전체" onclick="checkAll('search')">
								<label class="checkset-label" for="checkset-a-1-1"></label>
								<span class="checkset-text">전체</span>
							</div>
							<div class="checkset">
								<input id="checkset-a-2-1" class="checkset-input input-fill" name="searchCbox" type="checkbox" aria-label="선택" value="Y" onclick="checkSelect('search')">
								<label class="checkset-label" for="checkset-a-2-1"></label>
								<span class="checkset-text">관리자</span>
							</div>
							<div class="checkset">
								<input id="checkset-a-3-1" class="checkset-input input-fill" name="searchCbox" type="checkbox" aria-label="선택" value="N" onclick="checkSelect('search')">
								<label class="checkset-label" for="checkset-a-3-1"></label>
								<span class="checkset-text">일반회원</span>
							</div>
						</td>
              		</tr>
              		<tr>
              			<td>검색어</td>
              			<td>
              				<div class="selectset selectset-round selectset-lg">
              				<button class="selectset-toggle btn" type="button" style="height: 40px; width: 100px;">
	                       		<span>아이디</span>
		                    </button>
		                    <ul class="selectset-list">
		                       <li class="selectset-item">
		                          <button class="selectset-link btn" type="button" value="아이디">
		                             <span>아이디</span>
		                          </button>
		                       </li>
		                       <li class="selectset-item">
		                          <button class="selectset-link btn" type="button" value="이름">
		                             <span>이름</span>
		                          </button>
		                       </li>
		                       <li class="selectset-item">
		                          <button class="selectset-link btn" type="button" value="닉네임">
		                             <span>닉네임</span>
		                          </button>
		                       </li>
                    		</ul>
                    		</div>
                    		<div class="inputset inputset-lg">
			                    <input type="text" name="searchText" class="inputset-input form-control" placeholder="검색어를 입력해주세요." aria-label="내용">
			                </div>
              			</td>
              			<td>
              				
              			</td>
              			<td>
              				<button class="btnset btnset-lg btnset-line" type="button" onclick="search()">&nbsp;&nbsp;검색&nbsp;&nbsp;</button>
              			</td>
              		</tr>
              		<tr>
              			<td>조회 기간</td>
              			<td colspan="3"><input type="date" name="startDate"> ~ <input type="date" name="endDate"></td>
              		</tr>
              	</table>
              </div>
              <input type="hidden" name="status" value="${ status }">
              </form>
            </div>
          </div>
          <div class="contents-search">
          <div id="totalCount" >
            <p class="contents-result"> 전체<span> ${ total }</span>개</p>
          </div>
            <div class="contents-form">
              <div class="container">
                <div class="tabset tabset-text">
                  <ul class="tabset-list">
                    <li class="tabset-item">
                      <a class="tabset-link" href="javascript:void(0)" onclick="sort('')">
                        <span>전체</span>
                      </a>
                    </li>
                    <li class="tabset-item">
                      <a class="tabset-link" href="javascript:void(0)" onclick="sort('Y')">
                        <span>활동회원</span>
                      </a>
                    </li>
                    <li class="tabset-item">
                      <a class="tabset-link" href="javascript:void(0)" onclick="sort('N')">
                        <span>탈퇴회원</span>
                      </a>
                    </li>
                  </ul>
                </div>
              </div>
            </div>
          </div>
          <div id="tableset" class="tableset">
            <table class="tableset-table table">
              <colgroup>
                <col>
                <col>
                <col>
                <col>
                <col>
                <col>
                <col>
              </colgroup>
              <thead class="thead-light thead-border-top">
                <tr>
                  <th scope="col">
                  	<input id="checkset-b-1-1" class="checkset-input input-fill" type="checkbox" onclick="checkAll('table')"> 
                  </th>
                  <th scope="col">아이디</th>
                  <th scope="col">이름</th>
                  <th scope="col">핸드폰</th>
                  <th scope="col">등급</th>
                  <th scope="col">가입일</th>
                  <th scope="col">권한</th>
                </tr>
              </thead>
              <tbody>
              <c:if test="${ !empty list }">
               <c:forEach items="${ list }" var="m">
                <tr onclick="showModal(this)">
                  <td class="tableset-mobile" onclick='javascript:event.stopPropagation()';>
                  	<input type="checkbox" class="checkset-input input-fill" id="${ m.memId }" name="tableCbox" onclick="checkSelect('table')">
                  </td>
                  <td class="tableset-tit tableset-order02">
                      <span>${ m.memId }</span>
                  </td>
                  <td class="tableset-order05">${ m.memName }</td>
                  <td class="tableset-mobile">${ m.memPhone }</td>
                  <td class="tableset-mobile">${ m.memRating }</td>
                  <td class="tableset-order01">${ m.memDate }</td>
                  <td class="tableset-mobile" onclick="javascript:event.stopPropagation()">
                  	<input type="button" value="일반회원" class="status-btn<c:if test='${ m.memIsAdmin eq "N" }'> active</c:if>" onclick="changeIsAdmin(this)">
                  	<input type="button" value="&nbsp;&nbsp;관리자&nbsp;&nbsp;" class="status-btn<c:if test='${ m.memIsAdmin eq "Y" }'> active</c:if>" onclick="changeIsAdmin(this)">
                  </td>
                </tr>
               </c:forEach>
               </c:if>
               
               
               <c:if test="${ empty list }">
               		<tr>
               			<td colspan="7" style="height:300px; text-align:center"><h1>검색 결과가 없습니다.</h1></td>
               		</tr>
               </c:if>
              </tbody>
            </table>
            
            <c:if test="${ !empty list }">
            	<input class="btnset btnset-lg" value="선택 삭제" type="button" onclick="deleteMember()">
	        </c:if>
	        </div>
	        
	        <c:if test="${ !empty list }">
			<nav id="page" class="pagiset pagiset-line">
				<c:if test="${ pi.currentPage <= 1 }">
				   <div class="pagiset-ctrl">
				      <a class="pagiset-link pagiset-first"> <span
				         class="visually-hidden">처음</span>
				      </a>
				   </div>
				   <div class="pagiset-ctrl">
				      <a class="pagiset-link pagiset-prev"> <span
				         class="visually-hidden">이전</span>
				      </a>
				   </div>
				</c:if>
				
				
				<c:if test="${ pi.currentPage > 1 }">
				   <div class="pagiset-ctrl">
				      <c:url var="goFirst" value="${ loc }">
				         <c:param name="page" value="${ pi.startPage }"></c:param>
				         <c:param name="isAdmin" value="${ sm.isAdmin }"></c:param>
				         <c:param name="keyword" value="${ sm.keyword }"></c:param>
				         <c:param name="searchText" value="${ sm.searchText }"></c:param>
				         <c:param name="startDate" value="${ sm.startDate }"></c:param>
				         <c:param name="endDate" value="${ sm.endDate }"></c:param>
				         <c:param name="status" value="${ sm.status }"></c:param>
				      </c:url>
				      <a class="pagiset-link pagiset-first" href="${ goFirst }">
				         <span class="visually-hidden">처음</span>
				      </a>
				   </div>
				   <div class="pagiset-ctrl">
				      <c:url var="goBack" value="${ loc }">
				         <c:param name="page" value="${ pi.currentPage-1 }"></c:param>
				      </c:url>
				      <a class="pagiset-link pagiset-prev" href="${ goBack }"> <span
				         class="visually-hidden">이전</span>
				      </a>
				   </div>
				</c:if>
				<div id="pagiset-list" class="pagiset-list">
				   <c:forEach begin="${ pi.startPage }" end="${ pi.endPage }"
				      var="p">
				      <c:url var="goNum" value="${ loc }">
				         <c:param name="page" value="${ p }"></c:param>
				         <c:param name="isAdmin" value="${ sm.isAdmin }"></c:param>
				         <c:param name="keyword" value="${ sm.keyword }"></c:param>
				         <c:param name="searchText" value="${ sm.searchText }"></c:param>
				         <c:param name="startDate" value="${ sm.startDate }"></c:param>
				         <c:param name="endDate" value="${ sm.endDate }"></c:param>
				         <c:param name="status" value="${ sm.status }"></c:param>
				      </c:url>
				      <c:choose>
				         <c:when test="${p eq pi.currentPage}">
				            <a class="pagiset-link active-fill" href="${ goNum }">${ p }</a>
				         </c:when>
				         <c:otherwise>
				            <a class="pagiset-link" href="${ goNum }">${ p }</a>
				         </c:otherwise>
				      </c:choose>
				   </c:forEach>
				</div>
				
				<c:if test="${ pi.currentPage >= pi.maxPage }">
				   <div class="pagiset-ctrl">
				      <a class="pagiset-link pagiset-next"> <span
				         class="visually-hidden">다음</span>
				      </a>
				   </div>
				   <div class="pagiset-ctrl">
				      <a class="pagiset-link pagiset-last"> <span
				         class="visually-hidden">마지막</span>
				      </a>
				   </div>
				</c:if>
				<c:if test="${ pi.currentPage < pi.maxPage }">
				   <div class="pagiset-ctrl">
				      <c:url var="goNext" value="${ loc }">
				         <c:param name="page" value="${ pi.currentPage+1 }"></c:param>
				         <c:param name="isAdmin" value="${ sm.isAdmin }"></c:param>
				         <c:param name="keyword" value="${ sm.keyword }"></c:param>
				         <c:param name="searchText" value="${ sm.searchText }"></c:param>
				         <c:param name="startDate" value="${ sm.startDate }"></c:param>
				         <c:param name="endDate" value="${ sm.endDate }"></c:param>
				         <c:param name="status" value="${ sm.status }"></c:param>
				      </c:url>
				      <a class="pagiset-link pagiset-next" href="${ goNext }"> <span
				         class="visually-hidden">다음</span>
				      </a>
				   </div>
				   <div class="pagiset-ctrl">
				      <c:url var="goLast" value="${ loc }">
				         <c:param name="page" value="${ pi.maxPage }"></c:param>
				         <c:param name="isAdmin" value="${ sm.isAdmin }"></c:param>
				         <c:param name="keyword" value="${ sm.keyword }"></c:param>
				         <c:param name="searchText" value="${ sm.searchText }"></c:param>
				         <c:param name="startDate" value="${ sm.startDate }"></c:param>
				         <c:param name="endDate" value="${ sm.endDate }"></c:param>
				         <c:param name="status" value="${ sm.status }"></c:param>
				      </c:url>
				      <a class="pagiset-link pagiset-last" href="${ goLast }"> <span
				         class="visually-hidden">마지막</span>
				      </a>
				   </div>
				</c:if>
			</nav>     
			</c:if>
	      </div>
      </div>
    </div>
    <div id="myModal" class="modal">
	    <div class="modal-content" id="">
	        <div class="tabs">
	            <div class="tab tab1 active" onclick="openTab('tab1')">회원정보</div>
	            <div class="tab tab2" onclick="openTab('tab2')">1:1상담</div>
	        </div>
	
	        <div id="tab1Content" class="tab-content">
	        <input type="hidden" id="m" value="${ m }">
	            <table>
	            	<tr>
	            		<th><h2>회원 정보</h2></th>
	            		<td>&nbsp;(${ m.memDate })</td>
	            	</tr>
	            	<tr>
	            		<th>아이디</th>
	            		<td>${ m.memId }</td>
	            	</tr>
	            	<tr>
	            		<th>이름</th>
	            		<td>${ m.memName }</td>
	            	</tr>
	            	<tr>
	            		<th>닉네임</th>
	            		<td><input type="text" id="nickName" value="${ m.memNickName }"></td>
	            	</tr>
	            	<tr>
	            		<th>이메일</th>
	            		<td><input type="text" id="email" value="${ m.memEmail }"></td>
	            	</tr>
	            	<tr>
	            		<th>연락처</th>
	            		<td><input type="text" id="phone" value="${ m.memPhone }"></td>
	            	</tr>
	            	<tr>
	            		<th>주소</th>
	            		<td>
	            			<table>
	            				<tr>
	            					<td colspan="2"><input type="text" id="sample6_postcode" value="${ fn:split(m.memAddress, '@')[0] }" readonly="readonly"> <input type="button" value="우편번호 찾기" onclick="sample6_execDaumPostcode()"></td>
	            				</tr>
	            				<tr>
	            					<td colspan="2"><input type="text" id="sample6_address" value="${ fn:split(m.memAddress, '@')[1] }" readonly="readonly"></td>
	            				</tr>
	            				<tr>
	            					<td><input type="text" placeholder="상세주소" id="sample6_detailAddress" value="${ fn:split(m.memAddress, '@')[2] }"></td>
	            					<td><input type="text" id="sample6_extraAddress" value="${ fn:split(m.memAddress, '@')[3] }" readonly="readonly"></td>
	            				</tr>
	            			</table>
	            		</td>
	            	</tr>
	            	<tr>
	            		<th>회원등급</th>
	            		<td>${ m.memRating }</td>
	            	</tr>
	            	<tr>
	            		<th>충전금</th>
	            		<td><fmt:formatNumber type="number" value="${ m.memBalance }"/>원</td>
	            	</tr>
	            	<tr>
	            		<th>상태</th>
	            		<td>
	            		<c:if test="${ m.memStatus eq 'Y' }">활동회원</c:if>
	            		<c:if test="${ m.memStatus eq 'N' }">탈퇴회원</c:if>
	            		</td>
	            	</tr>
	            	<tr>
	            		<th colspan="2"><input type="button" class="closeModal del" value="저장" onclick="submitBtn(this)"><input type="button" class="closeModal can" value="취소" onclick="closeModal(this)"> </th> 
	            	</tr>
	            </table>
	        </div>
	
	        <div id="tab2Content" class="tab-content">
	            <h1>1:1 문의내역</h1>
	            <div class="chatSearch">
	            	기간
	            	<span><input type="date" name="startDate"> ~ <input type="date" name="endDate"></span>
	            	<button class="btnset btnset-lg btnset-line" type="button" onclick="chatSearch()">검색</button>
	            </div>
	            <div id="iList">
	            <table>
	            	<tr>
	            		<th>NO.</th>
	            		<th>상담일</th>
	            		<th>답변자</th>
	            	</tr>
	            
	            <c:if test="${ iList ne '[]' }">
	            <c:forEach items="${ iList }" var="i">
	            	<tr onclick="selectInq(this)">
	            		<td>${ i.inqNo }</td>
	            		<td>${ i.inqDate }</td>
	            		<td>${ i.adminId }</td>
	            	</tr>
            	</c:forEach>
	            </c:if>
	            <c:if test="${ iList eq '[]' }">
            		<tr>
            			<td colspan="3" style="height:180px"><h2>채팅 내역이 없습니다.</h2></td>
            		</tr>
            	</c:if>
	            </table>
	            </div>
				
	            <nav id="chatPage" class="pagiset pagiset-line">
				<c:if test="${ iList ne '[]' }">
				<c:if test="${ iPi.currentPage <= 1 }">
				   <div class="pagiset-ctrl">
				      <a class="pagiset-link pagiset-first"> <span
				         class="visually-hidden">처음</span>
				      </a>
				   </div>
				   <div class="pagiset-ctrl">
				      <a class="pagiset-link pagiset-prev"> <span
				         class="visually-hidden">이전</span>
				      </a>
				   </div>
				</c:if>
				<c:if test="${ iPi.currentPage > 1 }">
				   <div class="pagiset-ctrl">
				      <a class="pagiset-link pagiset-first" href="javascript:void(0)" onclick="chatPaging(1)">
				         <span class="visually-hidden">처음</span>
				      </a>
				   </div>
				   <div class="pagiset-ctrl">
				      <a class="pagiset-link pagiset-prev" href="javascript:void(0)" onclick="chatPaging(${ iPi.currentPage - 1 })"> <span
				         class="visually-hidden">이전</span>
				      </a>
				   </div>
				</c:if>
				<div id="chat-pagiset-list" class="pagiset-list">
				   <c:forEach begin="${ iPi.startPage }" end="${ iPi.endPage }"
				      var="p">
				      <c:choose>
				         <c:when test="${p eq iPi.currentPage}">
				            <a class="pagiset-link active-fill" href="javascript:void(0)" onclick="chatPaging(${p})">${ p }</a>
				         </c:when>
				         <c:otherwise>
				            <a class="pagiset-link" href="javascript:void(0)" onclick="chatPaging(${p})">${ p }</a>
				         </c:otherwise>
				      </c:choose>
				   </c:forEach>
				</div>
				
				<c:if test="${ iPi.currentPage >= iPi.maxPage }">
				   <div class="pagiset-ctrl">
				      <a class="pagiset-link pagiset-next"> <span
				         class="visually-hidden">다음</span>
				      </a>
				   </div>
				   <div class="pagiset-ctrl">
				      <a class="pagiset-link pagiset-last"> <span
				         class="visually-hidden">마지막</span>
				      </a>
				   </div>
				</c:if>
				<c:if test="${ iPi.currentPage < iPi.maxPage }">
				   <div class="pagiset-ctrl">
				      <a class="pagiset-link pagiset-next" href="javascript:void(0)" onclick="chatPaging(${ iPi.currentPage + 1 })"> <span
				         class="visually-hidden">다음</span>
				      </a>
				   </div>
				   <div class="pagiset-ctrl">
				      <a class="pagiset-link pagiset-last" href="javascript:void(0)" onclick="chatPaging(${ iPi.endPage })"> <span
				         class="visually-hidden">마지막</span>
				      </a>
				   </div>
				</c:if>
			</c:if>
			</nav>
	        </div>
	        
	        <div id="tab3Content" class="tab-content">
	        	<h1>1:1 상담내역</h1><hr>
	        	<div id="msg">
	        		<input type="hidden" id="chatMsg" value="${ chatMsg }">
	        	</div>
	        </div>
	        
		    </div>
	</div>
<%-- <jsp:include page="../common/footer.jsp"/> --%>
    <!-- [E]hooms-N36 -->
 </main>
<script src="member/js/setting2.js"></script>
<script src="member/js/plugin.js"></script>
<script src="member/js/template.js"></script>
<script src="member/js/common.js"></script>
<script src="member/js/script.js"></script>
</body>
