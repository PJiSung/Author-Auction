	<%@ page language="java" contentType="text/html; charset=UTF-8"
		pageEncoding="UTF-8"%>
	
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
	<!DOCTYPE html>
	<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
	<link rel="stylesheet" href="main/css/setting.css">
	<link rel="stylesheet" href="main/css/plugin.css">
	<link rel="stylesheet" href="main/css/template.css">
	<link rel="stylesheet" href="main/css/common.css">
	<link rel="stylesheet" href="main/css/main.css">
	<link rel="stylesheet" href="main/css/style.css">
	<style type="text/css">
		
		body{
			width:100%;
			height:100%;
		}
		
		input::-webkit-outer-spin-button,
		input::-webkit-inner-spin-button {
		  -webkit-appearance:none;
		  margin: 0;
}
		
		
	
		div{
			border-radius: 5px;
		}
		
		span{
			border-radius: 5px;
		}
	
		th, td{
			padding: 5px 0 5px 0;
		}
	
		h2{
			text-align: center;
			background-color: black;
			color: white;
			height: 50px;
			padding-top: 10px;
		}
	
		.bidModalDiv{
			width: 48%;
			margin-right: 1%;
			text-align: center; 
			display: inline-block;
			text-align: center;
			margin: 5px 0 5px 0;
		}
	
		#priceTag, #bidModal {
			position: fixed;
			z-index: 1;
			left: 0;
			top: 0;
			width: 100%;
			height: 100%;
			overflow: auto;
			background-color: rgba(0, 0, 0, 0.4);
			display: none;
		}
		
		#priceTag::-webkit-scrollbar { display: none; }
		#bidModal::-webkit-scrollbar { display: none; }
		
		.modal-content {
			background-color: #fefefe;
			margin: 15% auto;
			padding: 20px;
			border: 1px solid #888;
			width: 80%;
		}
		
		.close {
			color: #aaa;
			float: right;
			font-size: 28px;
			font-weight: bold;
		}
		
		.close:hover, .close:focus {
			color: black;
			text-decoration: none;
			cursor: pointer;
		}
		
		.trLine {
			border-bottom: 1px gray solid;
		}
		
		#lotNum {
			font-size: x-large;
		}
		
		#lotNumDiv {
			margin: 2% 0 0 2%;
		}
		
		.productInfo {
			margin: 4.825% 0 4% 2%;
		}
		
		.infoSpan {
			border: 1px black solid;
			margin-left: 2%;
			margin-right: 3%;
			width: 30%;
			height: 8%;
			padding-top: 2%;
			padding-bottom: 1.5%;
			display: inline-block;
			cursor:pointer;
		}
		
		#chargeBtn, #closePicModal{
			background: black;
			color: white;
			margin: 50px 0 10px 0;
			border-radius: 5px;			
		}
		
		#authorPlace {
			font-size: large;
			font-weight: 500;
		}
		
		#productPlace{
			font-size: 80px;
			font-weight: 1000;
		}
		
		#authorPlaceCover{
			margin-bottom: 9%;
		}
		
		.picModal{
			position:absolute;
			width:100%;
			height:100%;
			display: none;
		}
		
		.picModal_overlay{
			 /* position: fixed;
	         z-index: 1;
	         left: 0;
	         top: 0;
	         width: 100%;
	         height: 100%;
	         overflow: auto;
	         background-color: rgba(0, 0, 0, 0.6);
	         display: none; */
	         
	         background-color: rgba(0, 0, 0, 0.6);
		  width: 100%;
		  height: 100%;
		  min-height: 1000px;
		  position: absolute;
		  z-index: 5;
		  display: flex;
		  justify-content: center;
		  align-items: center;
		}
		
		.picModal_content{
			box-shadow: 0 10px 20px rgba(0,0,0,0.19), 0 6px 6px rgba(0,0,0,0.23);
			background-color:white;
			border-radius:10px;
			postion:relative;
			z-index:2;
			width: 800px;
			height: 800px;
			margin:auto;
			margin-top:5%;
		}
		
		
		#closePicModal{
			float:right;
			border-radius: 5px;
			cursor:pointer;
			width: 10%;
			margin: 1% 5% 0 0;
		}
		
		#picModalImg{
			width:750px;
			height:750px;
			padding-left:50px;
			padding-top:25px;
			z-index:3;
			border-radius: 10px;
		}
		
		#explain{
			font-size: 25px;
		}
		
		#forInfoPlace{
			display:flex;
			text-align: center;
			align-items: center;
			justify-content: center;
		}
		
		.tooltip {
	    position: absolute;
	    left: -1px;
	    top: 52px;
	    background: black;
	    padding: 10px;
	    border-radius: 5px;
	    color: #fff;
	    text-align: center;
	    display: none;
	    opacity: 0;
	    transition: opacity 0.3s ease;
	    
	}
	
	.tooltip:after {
	    display: block;
	    content: '';
	    position: absolute;
	    top: -7px;
	    left: 50px;
	    width: 0px;
	    height: 0px;
	    border-top: 8px solid none;
	    border-left: 20px solid transparent;
	    border-right: 2px solid transparent;
	    border-bottom: 8px solid black;
	}
	  #fees:hover .tooltip{
	  	display: block;
	  	opacity: 1;
	  }
	  
	  .item{
	  	width: 50%;
	  	height: 200px;
	  	display:flex;
	  	align-items:center;
	  	text-align:center;
	  	justify-content:center;
	  	cursor:pointer;
	  	
	  }
		
		#api {
			width: 600px;
			margin-left: 15%;
			margin-bottom: 3%;
			height: 200px;
		}
		
		.owl-carousel{
			width: 600px;
			margin-bottom: 3%;
			margin:auto;
			text-align: center;
		}
		
		.littleImg{
			cursor:pointer;
		}	           
         
         img{
			border-radius: 10px;
		}
		
		#checkId{
			width: 96%;
			border: 1px black solid;
			text-align: center;
			margin-top: 2%;
			height: 9%;
			margin-left: 2%; 
			padding-top: 3%;
			padding-bottom: 3%;
			display:flex;
			justify-content: center;
			align-items: center;
			cursor:pointer;
			trans
		}
		
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
/* .chatWrap .ch1 .textbox {
    position: absolute;
    display: inline-block;
    max-width: calc(100% - 70px);
    margin-top: 17px;
    font-size: 13px;
    border-radius: 5px;
    left: 66px;
} */
.chatWrap .ch1 .textbox {
    position: relative;
    max-width: calc(100% - 70px);
    margin-top: 7px;
    font-size: 13px;
    border-radius: 5px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    transform: perspective(800px) rotateX(10deg);
    top: 10px;
	left: -50px;
}
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
     position: relative;
    max-width: calc(100% - 70px);
    margin-top: 7px;
    font-size: 13px;
    border-radius: 5px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    transform: perspective(800px) rotateX(10deg);
    top: 10px;
    left: -50px;
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

	#explain{
	background-color: E6E6FA;
	padding:10px;
	overflow: auto;
	white-space: pre-wrap;
	}
	
	</style>
	</head>
	<body>
		<div class="personal-rglq12YMbj" data-bid="uIlq13xFtx" id="">
		    <div class="header-container container-lg">
		      <div class="header-left">
		        <h1 class="header-title">
		          <a href="/">
		             <h5>A_AUCTION</h5>
		           <!-- <img src="images/" alt="로고"> -->
		          </a>
		        </h1>
		      </div>
		      <div class="header-center">
		        <ul class="header-member">
		        <c:if test="${ empty loginUser }">
		          <li>
		            <a href="loginView">로그인</a>
		          </li>
		          <li>
		            <a href="authenticationView">회원가입</a>
		          </li>
		         </c:if>
		         <c:if test="${ !empty loginUser }">
		          <li>
		            <a href="logout">로그아웃</a>
		          </li>
		         </c:if>
		        </ul>
		        <ul class="header-gnblist">
		          <li class="header-gnbitem">
		            <a class="header-gnblink" href="auctionList.ac">
		              <span>AUCTION</span>
		            </a>
		            <ul class="header-sublist">
		              <li class="header-subitem">
		                <a class="header-sublink" href="auctionList.ac">
		                  <span>온라인 경매</span>
		                </a>
		              </li>
		              <li class="header-subitem">
		                <a class="header-sublink" href="moveTocal.ac">
		                  <span>캘린더</span>
		                </a>
		              </li>
		            </ul>
		          </li>
		          <li class="header-gnbitem">
		            <a class="header-gnblink" href="artslist.ar">
		              <span>PRODUCT</span>
		            </a>
		            <ul class="header-sublist">
		              <li class="header-subitem">
		                <a class="header-sublink" href="artslist.ar">
		                  <span>미술품</span>
		                </a>
		              </li>
		            </ul>
		          </li>
		          <li class="header-gnbitem">
		          </li>
		          <li class="header-gnbitem">
		            <a class="header-gnblink" href="recommendationList.re">
		              <span>RECOMMEND</span>
		            </a>
		            <ul class="header-sublist">
		              <li class="header-subitem">
		                <a class="header-sublink" href="recommendationList.re">
		                  <span>미술품 추천</span>
		                </a>
		              </li>
		              <li class="header-subitem">
		                <a class="header-sublink" href="reviewList.rv">
		                  <span>구매 후기</span>
		                </a>
		              </li>
		            </ul>
		          </li>
		          <li class="header-gnbitem">
		            <a class="header-gnblink" href="directions.aa">
		              <span>HOW TO</span>
		            </a>
		            <ul class="header-sublist">
		              <li class="header-subitem">
		                <a class="header-sublink" href="directions.aa">
		                  <span>오시는 길</span>
		                </a>
		              </li>
		              <li class="header-subitem">
		                <a class="header-sublink" href="javascript:void(0)">
		                  <span>경매 안내</span>
		                </a>
		              </li>
		              <li class="header-subitem">
		                <a class="header-sublink" href="conInfo.co">
		                  <span>위탁 안내</span>
		                </a>
		              </li>
		            </ul>
		          </li>
		        </ul>
		      </div>
		      <div class="header-right">
		        <div class="header-utils">
		           <c:if test="${ empty loginUser }">
		               <a href="loginView"><span class="header-gnblink">LOGIN</span></a>
		           </c:if>
		           <c:if test="${ !empty loginUser }">
		                <a href="logout"><span class="header-gnblink">LOGOUT</span></a>
		          <div class="dropdown btn-user header-utils-btn">
		            <img src="main/icons/ico_user_black.svg" class="dropbtn" alt="유저 아이콘">
		            <div class="dropdown-content-user">
		               <table>
		                  <tr>
		                     <td class="profile">
		                        <div class="profilePic">
		                           <img src="${ loginUser.memFileName }" alt="프로필 사진" class="profileImg">
		                        </div>
		                     </td>
		                     <td style="line-height: 20px; cursor: pointer;" onclick="location.href='myInfo';">
		                        <div class="userText"><b>계정 관리</b></div>
		                        <div class="userText">${ loginUser.memId }</div>
		                     </td>
		                  </tr>
		                  <tr>
		                     <td class="cash">
		                        <span>예치금</span><br>
		                                <span onclick="location.href='';" class="cashButton">충전</span>
		                                <span onclick="location.href='';" class="cashButton">출금</span>
		                     </td>
		                     <td class="userText"><fmt:formatNumber type="number" value="${ loginUser.memBalance }"/>원</td>
		                  </tr>
		                  <tr>
		                     <td><a href="myBidList.ac" class="userMenu">나의 경매</a></td>
		                     <td></td>
		                  </tr>
		                  <tr>
		                     <td><a href="myReviewList.rv" class="userMenu">나의 주문</a></td>
		                     <td></td>
		                  </tr>
		                  <tr>
		                     <td><a href="#" class="userMenu">마이페이지</a></td>
		                     <td></td>
		                  </tr>
		               </table>
		             </div>
		          </div>
		          </c:if>
		          <c:if test="${ !empty loginUser }">
		          <a href="wishlist.ar" class="btn-cart header-utils-btn">
		            <img src="main/icons/ico_cart_black.svg" alt="쇼핑 아이콘">
		            <span class="cartCount">${ cartCount }</span>
		          </a>
		          </c:if>
		          <div class="dropdown btn-search header-utils-btn">
		            <img src="main/icons/ico_seach_black.svg" class="dropbtn" alt="검색 아이콘">
		            <div class="dropdown-content-keyword">
		              <form id="search-form" action="searchArts">
		                  <input type="text" name="keyword" id="search-input" placeholder="작품명 또는 작가명" oninput ="searchArts(this.value)">
		                  <button><img alt="검색 버튼" src="main/icons/ico_seach_black.svg"></button>
		              </form>
		              <div id="search-results">
		                 <div class="searchDiv" id="searchDiv">
		                 <table class="searchTable" style="table-layout: fixed; width: 93%;">
		                 <c:forEach items="${ searchAlist }" var="l">
		                    <tr onclick="searchArtDetail(this.id)" id="${ l.artNameEn }">
		                       <td style="width: 17%;">
		                          <div class="searchImg">
		                             <img alt="검색 사진" src="${ l.artImg }">
		                          </div>
		                       </td>
		                       <td style="width: 53%;">
		                          ${ l.artNameEn }
		                       </td>
		                       <td style="width: 30%;">
		                          ${ l.writerName }
		                       </td>
		                    </tr>
		                    </c:forEach>
		                 </table>
		                 </div>
		                 
		                 <table class="recoTable">
		                    <tr>
		                        <th colspan="2">&nbsp;&nbsp;&nbsp;추천 검색어</th>
		                    </tr>
		                    <tr>
		                       <td>
		                       <a href="javascript:void(0)">박광진</a>
		                       </td>
		                       <td>
		                       <a href="javascript:void(0)">한운성</a>
		                       </td>
		                    </tr>
		                    <tr>
		                       <td>
		                          <a href="javascript:void(0)">김인순</a>
		                       </td>
		                       <td>
		                          <a href="javascript:void(0)">이승택</a>
		                       </td>
		                    </tr>
		                    <tr>
		                       <td>
		                          <a href="javascript:void(0)">이선민</a>
		                       </td>
		                       <td>
		                          <a href="javascript:void(0)">황세준</a>
		                       </td>
		                    </tr>
		                 </table>
		             </div>
		          </div>
		          </div>
		          <button class="btn-allmenu header-utils-btn">
		            <img src="main/icons/ico_menu_black.svg" alt="PC메뉴">
		          </button>
		          <button class="btn-momenu header-utils-btn">
		            <img src="main/icons/ico_menu_black.svg" alt="모바일메뉴">
		          </button>
		          <button class="btn-moclose header-utils-btn">
		            <img src="main/icons/ico_close_black.svg" alt="닫기">
		          </button>
		        </div>
		      </div>
		    </div>
		    <div class="header-fullmenu fullmenu-top">
		      <div class="fullmenu-wrapper">
		        <div class="fullmenu-head">
		          <h4 class="fullmenu-title">
		            <a href="javascript:void(0)">
		              <img src="main/images/" alt="로고">
		            </a>
		          </h4>
		          <ul class="fullmenu-member">
		          <c:if test="${ empty loginUser }">
		            <li>
		              <a href="loginView">로그인</a>
		            </li>
		            <li>
		              <a href="authenticationView">회원가입</a>
		            </li>
		            </c:if>
		            <c:if test="${ !empty loginUser }">
		             <li>
		              <a href="logout">로그아웃</a>
		            </li>
		            </c:if>
		          </ul>
		        </div>
		        <ul class="fullmenu-gnblist">
		          <li class="fullmenu-gnbitem">
		            <a class="fullmenu-gnblink" href="auctionList.ac">
		              <span>AUCTION</span>
		            </a>
		            <ul class="fullmenu-sublist">
		              <li class="fullmenu-subitem">
		                <a class="fullmenu-sublink" href="auctionList.ac">
		                  <span>온라인 경매</span>
		                </a>
		              </li>
		              <li class="fullmenu-subitem">
		                <a class="fullmenu-sublink" href="moveTocal.ac">
		                  <span>캘린더</span>
		                </a>
		              </li>
		            </ul>
		          </li>
		          <li class="fullmenu-gnbitem">
		            <a class="fullmenu-gnblink" href="artslist.ar">
		              <span>PRODUCT</span>
		            </a>
		            <ul class="fullmenu-sublist">
		              <li class="fullmenu-subitem">
		                <a class="fullmenu-sublink" href="artslist.ar">
		                  <span>미술품 구매</span>
		                </a>
		              </li>
		            </ul>
		          </li>
		          <li class="fullmenu-gnbitem">
		            <a class="fullmenu-gnblink" href="recommendationList.re">
		              <span>RECOMMEND</span>
		            </a>
		            <ul class="fullmenu-sublist">
		              <li class="fullmenu-subitem">
		                <a class="fullmenu-sublink" href="recommendationList.re">
		                  <span>미술품 추천</span>
		                </a>
		              </li>
		              <li class="fullmenu-subitem">
		                <a class="fullmenu-sublink" href="reviewList.rv">
		                  <span>작품 리뷰</span>
		                </a>
		              </li>
		            </ul>
		          </li>
		          <li class="fullmenu-gnbitem">
		            <a class="fullmenu-gnblink" href="directions.aa">
		              <span>HOW TO</span>
		            </a>
		            <ul class="fullmenu-sublist">
		              <li class="fullmenu-subitem">
		                <a class="fullmenu-sublink" href="directions.aa">
		                  <span>오시는 길</span>
		                </a>
		              </li>
		              <li class="fullmenu-subitem">
		                <a class="fullmenu-sublink" href="javascript:void(0)">
		                  <span>경매 안내</span>
		                </a>
		              </li>
		              <li class="fullmenu-subitem">
		                <a class="fullmenu-sublink" href="conInfo.co">
		                  <span>위탁 안내</span>
		                </a>
		              </li>
		            </ul>
		          </li>
		        </ul>
		      </div>
		      <button class="fullmenu-close">
		        <img src="main/icons/ico_close_white.svg" alt="닫기">
		      </button>
		    </div>
		  </div>
		  
		  <script>

			$(document).ready(function(){
			   recSearch();
			});
			
			const searchArts = (value) =>{
			   let url = window.location.href;
			   if(!url.includes("?") && !url.includes("headkeyword=")){
			      url += "?headKeyword="+value;
			   }else if(url.includes("&headKeyword=")){
			      url = url.split("&headKeyword=")[0] + "&headKeyword="+value;
			   }else{
			      url = url.split("?headKeyword=")[0] + "?headKeyword="+value;
			   }
			   
			   window.history.pushState({}, "Title", url);
			   $("#search-results").load(location.href + " #search-results");
			}
			
			const recSearch = () =>{
			   let as = document.querySelectorAll(".recoTable a");
			   for(let i = 0; i<as.length; i++){
			      as[i].addEventListener("click", function(){
			         location.href = "searchArts?headKeyword="+this.innerText;
			      })
			   }
			}
			const searchArtDetail = (id) =>{
			   location.href = "searchArts?keyword="+id;
			}
			
			
			window.onpopstate = function() { 
			   let url = window.location.href;
			   if(url.includes("?headKeyword=")){
			      url = url.split("?headKeyword=")[0]
			   }else if(url.includes("&headKeyword=")){
			      url = url.split("&headKeyword=")[0]
			   }
			   
			   window.history.pushState({}, "Title", url);
			}
			</script>
			<!-- 여기까지 헤더 -->
			
			<a href="#" class="btn-chat header-utils-btn" onclick="openChat()" id="openChatting">
<img src="main/icons/chatIcon.png">
<c:if test="${ loginUser.memIsAdmin eq 'Y' }">
<span class="waitingCount" id="waiting">0</span>
</c:if>
</a>

	<div id="chatContainer" class="chatContainer">
	
		<input type="hidden" name="userName" id="userName" value="${loginUser.memId}">
		<input type="text" id="sessionId" value="">
		<input type="text" id="roomNumber" value="${roomNumber}">
		
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
	<!-- 여기까지 채팅 -->
			
			
			
		<%-- <jsp:include page="../common/header.jsp" /> --%>
		<%-- <jsp:include page="../common/chat.jsp"/> --%>
		
		<!-- 사진 확대 모달 제작 -->
		<div class="picModal">
	  		<div class="picModal_overlay">
		  		<div class="picModal_content">
		  			<img id="picModalImg">
		  			<div>
		  				<button id="closePicModal"> 닫기 </button>
		  			</div>
		  		</div>
	  		</div>
	  	</div>	
		
		<div id="content-allOver-cover"	style=" width: 70%; margin: auto; margin-top: 8%; display: flex; height: 100%; postion: absolute;">
			<div id="content-left" style="width: 49%; display: inline-block;">
				<img src="${ auction.attRename }" style="width: 600px; height: 600px; border-radius: 30px;">
			</div>
			<div id="contentRightCover" style="width: 49%; position: absolute; left: 900px; z-index: 0;">
				<div style="width: 600px; height: 800px;">
					<div style="text-align: right; margin: 1% 1% 1%;">
						<span>남은 경매 시간</span> <span id="remainingTime"></span>
					</div>
					<div id="lotNumDiv">
						<span id="lotNum">LOT NUMBER ${ auction.aucNo }</span>
					</div>
					<div class="productInfo" id="authorPlaceCover">
						<span id="authorPlace">${ auction.conAuthor }</span>
					</div>
					<div class="productInfo">
						<span id="productPlace">${ auction.conProduct }</span>
					</div>
					<div class="productInfo">
						<div>
							<div style="height: 100%; width: 98%;">
								가로 : <span>${ auction.conWidth } cm</span><br> 세로 : <span>${ auction.conHeight }
									cm</span>
							</div>
						</div>
					</div>
					<hr style="margin-left: 2%; width: 96%; margin-top: 3%;">
					<span> <span
						style="text-align: left; display: inline-block; margin-left: 2%; margin-top: 2%; margin-bottom: 2%; font-size: x-large; font-weight: 600;">경매
							시작가</span> <span
						style="float: right; margin-right: 2%; margin-top: 2%; margin-bottom: 2%; font-size: x-large; font-weight: 600;"><fmt:formatNumber
								value="${ auction.aucStartPrice }" pattern="#,##0" /> 원</span>
					</span> <br clear="all">
					<hr style="margin-left: 2%; width: 96%;">
					<span> <span id="nowPriceWord"
						style="text-align: left; display: inline-block; margin-left: 2%; margin-top: 2%; margin-bottom: 2%; font-size: x-large; font-weight: 600;">현재
							입찰가</span> <span
						style="float: right; margin-right: 2%; margin-top: 2%; margin-bottom: 2%; font-size: x-large; font-weight: 600;"
						id="nowPrice"></span>
					</span> <br clear="all">
					<hr style="margin-left: 2%; width: 96%;">
					<span> <span
						style="text-align: left; display: inline-block; margin-left: 2%; margin-top: 2%; margin-bottom: 2%; font-size: x-large; font-weight: 600;">경매
							마감 시간</span> <span
						style="float: right; margin-right: 2%; margin-top: 2%; margin-bottom: 2%; font-size: x-large; font-weight: 600;"> ${ fn:split(auction.aucFinishDate, " ")[0] }</span>
					</span> <br clear="all">
					<hr style="margin-left: 2%; width: 96%; margin-bottom: 3%;">
					<div id="forInfoPlace">
					    <div class="infoSpan" id="fees" style="display : inline-block; position:relative" >
							낙찰 수수료 <div class="tooltip">현재 가격을 기준으로 낙찰 수수료는 <span id="fees"></span>원입니다.</div>
						</div>
						<span class="infoSpan" id="priceTagBtn">경매 호가표</span> <span class="infoSpan" id="likeBtn">관심 목록 추가</span>
						</div>
					<div id="checkId"></div>
				</div>
			</div>
		</div>
		<div id="picturePlace" style="width: 34.3%; display: flex; margin-top:0.25%; margin-left:15%; align-items: center; justify-content: center; text-align: center;">
			<c:forEach items="${ attachmentList }" var="attachmentList">
				<img class="littleImg" src="${ attachmentList.attRename }" style="width: 100px; height: 100px; margin:auto; margin-left:85px;" onclick="expansion(this);">
			</c:forEach>
		</div>
		<br>
		<div id="api">
			<h1>이 작가의 다른 작품</h1>
			<h1 id="noShow" style="text-align:center; display:none; align-items: center; justify-content: center; height:100%;"> 조회된 데이터가 없습니다</h1>
			<div class="owl-carousel owl-theme">
			</div>
		</div>
	
	
		<div style="width: 600px; margin-left: 15%;">
			<div style="font-size:40px; font-weight: 1000;">작품 설명</div>
			<br>
			<pre id="explain">${ auction.conEtc }</pre>
		</div>
	
		
		<!-- 호가표 모달창 -->
		<div id="priceTag" style="display: none;">
			<div class="modal-content" style="width: 30%;">
				<h2
					style="text-align: center; background-color: black; width:90%; margin:auto; color: white; height: 50px; padding-top: 10px;">호가표</h2>
				<table
					style="margin: auto; border-collapse: collapse; text-align: center; width: 80%;">
					<tr class="trLine">
						<th style="width: 65%; margin-left: 30%">현재가 구간(원)</th>
						<th style="width: 35%">호가 단위(원)</th>
					</tr>
					<tr class="trLine">
						<td>30만 미만</td>
						<td>20,000</td>
					</tr>
					<tr class="trLine">
						<td>30만 이상 ~ 100만 미만</td>
						<td>50,000</td>
					</tr>
					<tr class="trLine">
						<td>100만 이상 ~ 300만 미만</td>
						<td>100,000</td>
					</tr>
					<tr class="trLine">
						<td>300만 이상 ~ 500만 미만</td>
						<td>200,000</td>
					</tr>
					<tr class="trLine">
						<td>500만 이상 ~ 1,000만 미만</td>
						<td>500,000</td>
					</tr>
					<tr class="trLine">
						<td>1,000만 이상 ~ 3,000만 미만</td>
						<td>1,000,000</td>
					</tr>
					<tr class="trLine">
						<td>3,000만 이상 ~ 5,000만 미만</td>
						<td>2,000,000</td>
					</tr>
					<tr class="trLine">
						<td>5,000만 이상 ~ 2억 미만</td>
						<td>5,000,000</td>
					</tr>
					<tr class="trLine">
						<td>2억 이상 ~ 5억 미만</td>
						<td>10,000,000</td>
					</tr>
					<tr class="trLine">
						<td>5억 이상</td>
						<td>20,000,000</td>
					</tr>
				</table>
				<div style="text-align: right; margin-top: 2%; margin-right: 5%;">
					<button id="closePriceTag" style="width: 10%; color:white; background:black;">닫기</button>
				</div>
			</div>
		</div>
	
		<!-- 입찰 모달 -->
		<div id="bidModal">
			<div class="modal-content" style="width: 20%;">
				<h2>입찰</h2>
				<div>
						<div class="bidModalDiv">
							현재입찰가
						</div>
						<div class="bidModalDiv" id="modalNowPrice"></div>
						<div class="bidModalDiv">
							최소 입찰가
						</div>
						<div class="bidModalDiv" id="minPrice"></div>
						<div class="bidModalDiv">
							보유한 금액
						</div>
						<div class="bidModalDiv" id="possession">
							<fmt:formatNumber value="${ memBalance }" pattern="#,##0" /> 원
						</div>
	
					<div style="margin-top: 5%; margin-bottom: 2%;">
						<div
							style="width: 48%; margin-right: 1%; text-align: center; display: inline-block;">입찰할
							금액</div>
						<input type="number" value="" id="myInputPoint" pattern="\d*"
							style="margin-left: 4%; width: 30%; text-align: center;">
						원
						<div style="text-align: center; margin-top: 2%;">
							<button id="chargeBtn" onclick="movePointCharge();">금액 충전</button>
						</div>
						
					</div>
				</div>
				<div style="text-align: right; margin-top: 2%; margin-right: 5%;">
					<div id="closeBidModal"
						style="width: 48%; display: inline-block; text-align: center;">닫기</div>
					<div id="insertBid"
						style="width: 48%; display: inline-block; text-align: center;">입찰</div>
				</div>
			</div>
		</div>
	
	
		<br>
		<br>
		
		<jsp:include page="../common/footer.jsp" />
	
		<!-- 현재 입찰가를 낙찰 금액으로 변경 -->
	
		<script>
			const movePointCharge = () =>{
				location.href='pointpayment.ar';
			}
		
	        window.onload = function(){
	        	const priceTagBtn = document.getElementById("priceTagBtn");
	        	const priceTag = document.getElementById("priceTag");
	        	const closePriceTag = document.getElementById("closePriceTag");
	        	const nowPrice = document.getElementById("nowPrice");
	        	const likeBtn = document.getElementById("likeBtn");
	        	const modalNowPrice = document.getElementById("modalNowPrice");
	        	const minPrice = document.getElementById("minPrice");
	        	const bidModal = document.getElementById("bidModal");
	        	const closeBidModal = document.getElementById("closeBidModal");
	        	const myInputPoint = document.getElementById("myInputPoint");
	        	const insertBid = document.getElementById("insertBid");
	        	const check = document.getElementById("checkId");
	        	let remainingTime = document.getElementById("remainingTime");
	        	const possession = document.getElementById("possession");
	        	const nowPriceWord = document.getElementById('nowPriceWord')
	        	
	        	document.getElementById("closePicModal").addEventListener('click',function(){
	        		document.querySelector("div[class='picModal']").style.display = 'none';
	        	})
	        	
	        	
	        	/* 모달창 컨트롤 */
	        	priceTagBtn.addEventListener('click',function(){
	        		priceTag.style.display='block';
	        	})
	        	closePriceTag.addEventListener('click',function(){
	        		priceTag.style.display='none';
	        	})
	        	
	        	closeBidModal.addEventListener('click',function(){
	        		bidModal.style.display="none";
	        		if(nowPrice.innerText == "0 원"){
	    				myInputPoint.value = '${ auction.aucStartPrice }';
	    			}else{
	    				if(jsonObject == null){
		    				const aucFinishPrice = parseInt('${ auction.aucFinishPrice }');
		    				let minIncrement = 0;
		    				let minPoint = 0;
		    				
		    				
		    				switch (true) {
		    				  case aucFinishPrice < 300000:
		    				    minIncrement = 20000;
		    				    break;
		    				  case aucFinishPrice < 1000000:
		    				    minIncrement = 50000;
		    				    break;
		    				  case aucFinishPrice < 5000000:
		    				    minIncrement = 100000;
		    				    break;
		    				  case aucFinishPrice < 10000000:
		    				    minIncrement = 200000;
		    				    break;
		    				  case aucFinishPrice < 30000000:
		    				    minIncrement = 1000000;
		    				    break;
		    				  case aucFinishPrice < 50000000:
		    				    minIncrement = 2000000;
		    				    break;
		    				  case aucFinishPrice < 200000000:
		    				    minIncrement = 5000000;
		    				    break;
		    				  case aucFinishPrice < 500000000:
		    				    minIncrement = 1000000;
		    				    break;
		    				  default:
		    				    minIncrement = 20000000;
		    				}
		    				
		    				minPoint = aucFinishPrice + minIncrement;
		    				
		    				const formatMinPoint = minPoint.toLocaleString();
		
		    				myInputPoint.setAttribute("min", aucFinishPrice + minIncrement);
		    				myInputPoint.value = aucFinishPrice + minIncrement;
		    				minPrice.innerText = formatMinPoint.concat(' 원');
		    				
		    			}
	    			}
	        	})
	        	
	        	//들어왔을시 좋아요 체크
	        	if(${ loginUser != null }){
		        	$.ajax({
		        		url:'checkLike.ac',
		        		type:'get',
		        		data:{aucNo:'${auction.aucNo}'},
		        		success: data =>{
		        			if(data != 0){
		        				console.log(data);
		        				likeBtn.innerText = '관심 목록 삭제';
		                		likeBtn.style.background = 'black';
		                		likeBtn.style.color = 'white';
		        			}
		        		},
		        		error: data => console.log(data)
		        	})
	        	}
	        	
	        	function bidding(){
	        		bidModal.style.display="block";
	        	}
	        	
	        	
	        	//로그인에 따른 입찰/로그인/관심목록 추가
	        	if(${ loginUser != null }){
					check.innerText = "입찰하기";
					check.addEventListener('click', bidding);
					likeBtn.addEventListener('click',function(){
						if(checkId.innerText != '경매 종료'){
							$.ajax({
								url:'interest.ac',
								type:'get',
								data:{aucNo:'${ auction.aucNo }'},
								success: data =>{
									if(data == 'insert'){
										likeBtn.innerText = '관심 목록 삭제';
										likeBtn.style.background = 'black';
										likeBtn.style.color = 'white';
									}else{
										likeBtn.innerText = '관심 목록 추가';
										likeBtn.style.background = 'white';
										likeBtn.style.color = 'black';
									}
								},
								error: data => console.log(data)
							})
						}else{
							if(likeBtn.style.background = 'black'){
								$.ajax({
									url:'interest.ac',
									type:'get',
									data:{aucNo:'${ auction.aucNo }'},
									success: data =>{
											likeBtn.innerText = '관심 목록 추가';
											likeBtn.style.background = 'white';
											likeBtn.style.color = 'black';
									},
									error: data => console.log(data)
								})
							}else{
								alert('종료된 경매입니다')	
							}
						}
					})
	        	}else{
	        		check.innerText = "로그인 후 입찰 가능합니다";
	        		check.addEventListener('click',function(){
	        			location.href="loginView";
	        		})
	        		likeBtn.addEventListener('click',function(){
	    				if(confirm("로그인을 하셔야 관심 목록에 추가하실 수 있습니다. \n로그인 하시겠습니까?")){
	    					location.href='loginView';
	    				}
	    			})
	        	}
	        	
	        	//남은 경매시간 계속 갱신 및 경매 종료시 입찰 기능 삭제
	            const dateObject = new Date('${ auction.aucFinishDate }');
	            
	            let date = new Date();
	            
	            let remainTime = (dateObject - date);
	            
				let seconds = Math.floor(remainTime / 1000);
				let minutes = Math.floor(seconds / 60);
				let hours = Math.floor(minutes / 60);
				let days = Math.floor(hours / 24);
	
				hours %= 24;
				minutes %= 60;
				seconds %= 60;
				
				if(seconds.toString().indexOf('-') == -1){
					remainingTime.innerText = days + "일 " + hours + "시간 " + minutes + "분 " + seconds + "초";
				}else{
					remainingTime.innerText = '경매 종료';
					check.innerText = '경매 종료'
					check.removeEventListener('click',bidding);
					nowPriceWord.innerText = '최종 낙찰가';
				}
				
				let timer = setInterval(() => {
					let date = new Date();
					let remainTime = (dateObject - date);
		            
					let seconds = Math.floor(remainTime / 1000);
					let minutes = Math.floor(seconds / 60);
					let hours = Math.floor(minutes / 60);
					let days = Math.floor(hours / 24);
	
					hours %= 24;
					minutes %= 60;
					seconds %= 60;
					
					remainingTime.innerText = days + "일 " + hours + "시간 " + minutes + "분 " + seconds + "초";
					
					if(remainingTime.innerText == '0일 0시간 0분 0초' || seconds.toString().indexOf('-') != -1){
						clearInterval(timer);
						remainingTime.innerText = '경매 종료';
						check.innerText = '경매 종료'
						check.removeEventListener('click',bidding);
						nowPriceWord.innerText = '최종 낙찰가';
					}
				}, 1000);
				
				// 상태에 따른 최소 입찰가 및 최초 기본 입찰가 변경
				if(${ auction.aucFinishPrice eq 0 }){
					nowPrice.innerText = "0 원"; 
					modalNowPrice.innerText = "0 원";
					minPrice.innerHTML = '<fmt:formatNumber value="${ auction.aucStartPrice }"/> 원';
					myInputPoint.setAttribute("min", ${ auction.aucStartPrice })
					myInputPoint.value= '${ auction.aucStartPrice }';
				}else{
					nowPrice.innerHTML = '<fmt:formatNumber value="${ auction.aucFinishPrice }"/> 원';
					modalNowPrice.innerHTML = '<fmt:formatNumber value="${ auction.aucFinishPrice }"/> 원';
					
					const aucFinishPrice = parseInt('${ auction.aucFinishPrice }');
					let minIncrement = 0;
					let minPoint = 0;
					
					
					switch (true) {
					  case aucFinishPrice < 300000:
					    minIncrement = 20000;
					    break;
					  case aucFinishPrice < 1000000:
					    minIncrement = 50000;
					    break;
					  case aucFinishPrice < 5000000:
					    minIncrement = 100000;
					    break;
					  case aucFinishPrice < 10000000:
					    minIncrement = 200000;
					    break;
					  case aucFinishPrice < 30000000:
					    minIncrement = 1000000;
					    break;
					  case aucFinishPrice < 50000000:
					    minIncrement = 2000000;
					    break;
					  case aucFinishPrice < 200000000:
					    minIncrement = 5000000;
					    break;
					  case aucFinishPrice < 500000000:
					    minIncrement = 1000000;
					    break;
					  default:
					    minIncrement = 20000000;
					}
					
					minPoint = aucFinishPrice + minIncrement;
					
					const formatMinPoint = minPoint.toLocaleString();
	
					myInputPoint.setAttribute("min", aucFinishPrice + minIncrement);
					myInputPoint.value = aucFinishPrice + minIncrement;
					minPrice.innerText = formatMinPoint.concat(' 원');
				}
				
								
				document.querySelector("span[id='fees']").innerText = (Math.floor(parseInt('${auction.aucFinishPrice}')/ 100 * 0.198) * 100 ).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") ; 
				
				//입찰 버튼 눌렀을때 반응
				insertBid.addEventListener('click',function(){
					if(myInputPoint.value != parseInt(myInputPoint.value)){
						alert("숫자만 입력하실 수 있습니다");
						myInputPoint.value = '';
					}else{
						if(parseInt(myInputPoint.value) > '${ loginUser.memBalance }'){
							if(confirm('보유하신 금액이 부족합니다, \n충전 페이지로 이동하시겠습니까?')){
									location.href="pointpayment.ar";
							}
						}else{
							if(nowPrice.innerText == "0 원") {
								if(parseInt(myInputPoint.value) < '${ auction.aucStartPrice}'){
									alert('최소입찰가보다 작게 입찰할 수 없습니다');
								}else if(confirm("입찰하시고 나면 취소하실 수 없습니다\n그래도 입찰시겠습니까?")){
									$.ajax({
										url: 'insertBid.ac',
										type: 'post',
										data:{bidMoney:myInputPoint.value, aucNo:'${ auction.aucNo}'},
										success: data =>{
											if(data != 'fail'){
												let jsonObject = JSON.parse(data)
												const aucFinishPriceJs = jsonObject[0].aucFinishPrice;
												const memBalanceJs = jsonObject[0].memBalance;
												alert("입찰에 성공하였습니다.") //에이젝스로 새로 갱신
												bidModal.style.display = 'none';
												nowPrice.innerText = aucFinishPriceJs.toLocaleString().concat(" 원");
												modalNowPrice.innerText = aucFinishPriceJs.toLocaleString().concat(" 원");
												//
												
												let minIncrement = 0;
												let minPoint = 0;
												
												
												switch (true) {
												  case aucFinishPriceJs < 300000:
												    minIncrement = 20000;
												    break;
												  case aucFinishPriceJs < 1000000:
												    minIncrement = 50000;
												    break;
												  case aucFinishPriceJs < 5000000:
												    minIncrement = 100000;
												    break;
												  case aucFinishPriceJs < 10000000:
												    minIncrement = 200000;
												    break;
												  case aucFinishPriceJs < 30000000:
												    minIncrement = 1000000;
												    break;
												  case aucFinishPriceJs < 50000000:
												    minIncrement = 2000000;
												    break;
												  case aucFinishPriceJs < 200000000:
												    minIncrement = 5000000;
												    break;
												  case aucFinishPriceJs < 500000000:
												    minIncrement = 1000000;
												    break;
												  default:
												    minIncrement = 20000000;
												}
												
												minPoint = aucFinishPriceJs + minIncrement;
												
												const formatMinPoint = minPoint.toLocaleString();
								
												myInputPoint.setAttribute("min", aucFinishPriceJs + minIncrement);
												myInputPoint.value = aucFinishPriceJs + minIncrement;
												minPrice.innerText = formatMinPoint.concat(' 원');
												possession.innerText = memBalanceJs.toLocaleString().concat(" 원");
												
												//
											}else{
												alert("입찰에 실패하였습니다.");
												location.reload();
											}
										},
										error: data => console.log(data)
									})
								}
							}else{
								if(parseInt(myInputPoint.value) < parseInt(minPrice.innerText.replace(/,/g, '').split(' ')[0])){
									alert('최소입찰가보다 작게 입찰할 수 없습니다');
								}else if(confirm("입찰하시고 나면 취소하실 수 없습니다\n그래도 입찰시겠습니까?")){
									$.ajax({
										url: 'insertBid.ac',
										type: 'post',
										data:{bidMoney:myInputPoint.value, aucNo:'${ auction.aucNo}'},
										success: data =>{
											
											
											if(data != 'fail'){
												let jsonObject = JSON.parse(data)
												const aucFinishPriceJs = jsonObject[0].aucFinishPrice;
												const memBalanceJs = jsonObject[0].memBalance;
												alert("입찰에 성공하였습니다.") //에이젝스로 새로 갱신
												
												bidModal.style.display = 'none';
												nowPrice.innerText = aucFinishPriceJs.toLocaleString().concat(" 원");
												modalNowPrice.innerText = aucFinishPriceJs.toLocaleString().concat(" 원");
												//
												
												let minIncrement = 0;
												let minPoint = 0;
												
												
												switch (true) {
												  case aucFinishPriceJs < 300000:
												    minIncrement = 20000;
												    break;
												  case aucFinishPriceJs < 1000000:
												    minIncrement = 50000;
												    break;
												  case aucFinishPriceJs < 5000000:
												    minIncrement = 100000;
												    break;
												  case aucFinishPriceJs < 10000000:
												    minIncrement = 200000;
												    break;
												  case aucFinishPriceJs < 30000000:
												    minIncrement = 1000000;
												    break;
												  case aucFinishPriceJs < 50000000:
												    minIncrement = 2000000;
												    break;
												  case aucFinishPriceJs < 200000000:
												    minIncrement = 5000000;
												    break;
												  case aucFinishPriceJs < 500000000:
												    minIncrement = 1000000;
												    break;
												  default:
												    minIncrement = 20000000;
												}
												
												minPoint = aucFinishPriceJs + minIncrement;
												
												const formatMinPoint = minPoint.toLocaleString();
								
												myInputPoint.setAttribute("min", aucFinishPriceJs + minIncrement);
												myInputPoint.value = aucFinishPriceJs + minIncrement;
												minPrice.innerText = formatMinPoint.concat(' 원');
												possession.innerText = memBalanceJs.toLocaleString().concat(" 원");
												
												//
											}else{
												alert("입찰에 실패하였습니다.");
												location.reload();
											}
										},
										error: data => console.log(data)
									})
								}
							}
						}
					}
				})
			}
	       
	        
	        const contentRightCover = document.getElementById("contentRightCover");
	
	        function handleScroll() {
	          let scrollPosition = window.scrollY;
	
	          let divPosition = contentRightCover.getBoundingClientRect().top;
	
	          if ( 182 >= scrollPosition) {
	        	  contentRightCover.style.position = "absolute";
	        	  contentRightCover.style.marginTop = "0";
	          } else {
	        	  if(window.scrollY <= 250){
	        	  	contentRightCover.style.position = "fixed";
	        	  	contentRightCover.style.marginTop = "-8%";
	        	  }else{
	          	  	contentRightCover.style.marginTop = "-4.5%";
	        	  }
	          }
	        }
	        
	        window.addEventListener("scroll", handleScroll);
	        
	        const expansion = (data) =>{
	        	
	        	const modalPicture = document.querySelector("div[class='picModal_content']").children[0];
	        	document.querySelector("div[class='picModal_overlay']").style.height = window.innerHeight + "px";
	        	modalPicture.setAttribute("src", data.src)
	        	modalPicture.style.borderRadius = '10px';
	        	
	        	console.log(modalPicture);
	        	
	        	document.querySelector("div[class='picModal']").style.display = 'block';
	        }

	        
	        let itemsNum = 0;
	        
	        var xhr = new XMLHttpRequest();
	    	var url = 'http://openapi.seoul.go.kr:8088/6b645362786b79773339516a6f6f59/json/SemaPsgudInfoKorInfo/1/1000'; 
	    	xhr.open('GET', url,false);
	    	xhr.onreadystatechange = function () {
	    	    if (this.readyState == xhr.DONE) {  
	    	        if(xhr.status == 200||xhr.status == 201){
	    	            let jsonResponse = JSON.parse(xhr.responseText);
	    	            let itemsContainer = document.querySelector("div[class='owl-carousel owl-theme']");
	    	            
	    	            for (let i = 0; i < jsonResponse.SemaPsgudInfoKorInfo.row.length; i++){
	    	                let row = jsonResponse.SemaPsgudInfoKorInfo.row[i];
	    	                
	    	                
	                    	if(row.writr_nm == '${ auction.conAuthor }'){
	    	                	if (row.prdct_cl_nm === '드로잉&판화' || row.prdct_cl_nm === '회화' || row.prdct_cl_nm === '한국화') { 
		    	                    let imgElement = document.createElement("img");
		    	                    imgElement.src = row.main_image;
		    	                    imgElement.className = 'item'
		    	                    	
		    	                    itemsNum++;
		    	                    
		    	                    imgElement.onclick = function(){
		    	                    	expansion(this)
		    	                    }
		    	                    itemsContainer.appendChild(imgElement);
		    	                }
		    	            }
	    	            }
	    	            carasel(itemsNum);
	    	        }
	    	    }
	    	};
	    	xhr.send('');

        	function carasel(itemsNum){
        		
        		if(itemsNum > 2){
        			itemsNum = 2
        		}else if(itemsNum == 0){
        			document.querySelector("h1[id='noShow']").style.display = 'flex';
        		}
        		
        	    var owl = $('.owl-carousel'); 
        	    owl.owlCarousel({
        	        items: itemsNum,
        	        loop: true, // 항목들을 무한으로 반복하여 보여줄지 여부
        	        autoplay: true, // 자동	으로 슬라이드 쇼를 시작할지 여부
        	        autoplayTimeout: 3000, // 다음 이미지로 넘어가는 시간 (단위 : 밀리초)
        	        autoplayHoverPause: true, // 마우스가 이미지에 위에 있을 때 자동 슬라이드를 일시중지 할지 여부
        	    });
        	    
        	}

	    </script>
	     <script src="main/js/setting.js"></script>
		  <script src="main/js/plugin.js"></script>
		  <script src="main/js/template.js"></script>
		  <script src="main/js/common.js"></script>
		  <script src="main/js/script.js"></script>
	    
	</body>
</html>
