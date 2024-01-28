<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
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

    <style>
        body {
            font-family: Arial, sans-serif;
            background-image: url('image/background.jpg');
  			background-repeat: no-repeat;
  			background-size: cover;
        }

        #calendar {
            text-align: center;
        }

        #header {
            font-size: 24px;
            margin:30px 0 10px 0;
            color:white;
            
        }

        #navigation {
            font-size: 18px;
            display: flex;
            justify-content: space-between;
        }

        #dates {
        	margin-top:1%;
            font-size: 20px;
            display: flex;
            justify-content: center;
            color:white;
        }

        .date-item {
            margin: 5px;
            cursor: pointer;
            color:white;
            text-align: center;
            width:28px; 
        }

        .current-date {
            background-color: orange;
            color:white;
            border-radius:100%;
            text-align: center;
        }

        .future-date {
            color: white;
        }
        
        .auction {
			cursor: pointer;
			width: 350px;
			height: 450px;
			display: inline-block;
			text-align: center;
			margin: 2% 1.5% 2% 2.1%;
			background: white;
			color:wihte;
			transform: scale(1.00);
			transition: transform 0.2s ease-in-out, box-shadow 0.2s ease-in-out;
			box-shadow: 0px 0px 0px black;
			border-radius: 5%;
		}
		
		.auction:hover{
			transform: scale(1.001);
			transition: transform 0.2s ease-in-out, box-shadow 0.2s ease-in-out;
			box-shadow: 5px 5px 10px black;
		}
			
			.img {
				width: 350px;
				height: 350px;
				border-top-left-radius: 5%;
				border-top-right-radius: 5%;
			}
			
			.auctionPlace::-webkit-scrollbar {
			 	display: none;
			}
			
			#prevBtn{
				margin-top:0.2%;
				height:50px;
				display:inline-block;
				border-radius: 10px;
				width:150px;
				
				
			}
			
			#nextBtn{
				margin-top:0.2%;
				color:white;
				background:darkgray;
				height:50px;
				display:inline-block;
				border-radius: 10px;
				width:150px;
			}
			
			.owl-carousel {
	               width: 1200px;
	               height: 350px;
	               margin:auto;
	               text-align: center;
	               
	           }
	           
	         .item{
	          background:#FFECB3;/* #FFD699 */
	          padding-bottom:4%;
	          height:500px;
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
          <c:if test="${ loginUser.memIsAdmin eq 'Y' }">
	          <li class="header-gnbitem">
	            <a class="header-gnblink" href="adminMain.adac">
	              <span>ADMIN</span>
	            </a>
	            <ul class="header-sublist">
	              <li class="header-subitem">
	                <a class="header-sublink" href="memberList.adme">
	                  <span>회원 관리</span>
	                </a>
	              </li>
	              <li class="header-subitem">
	                <a class="header-sublink" href="adminInquiry.adac">
	                  <span>경매 관리</span>
	                </a>
	              </li>
	              <li class="header-subitem">
	                <a class="header-sublink" href="artsadmin.ar">
	                  <span>미술품 관리</span>
	                </a>
	              </li>
	              <li class="header-subitem">
	                <a class="header-sublink" href="searchList.adco">
	                  <span>위탁 관리</span>
	                </a>
	              </li>
	              <li class="header-subitem">
	                <a class="header-sublink" href="admOrderList.adod">
	                  <span>주문 관리</span>
	                </a>
	              </li>
	            </ul>
	          </li>
          </c:if>
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
	                  <tr style="height: 50px;">
	                  <!-- 
	                     <td class="cash">
	                        <span>예치금</span><br>
	                                <span onclick="location.href='';" class="cashButton">충전</span>
	                                <span onclick="location.href='';" class="cashButton">출금</span>
	                     </td>
	                  	<td class="cash">
		                  	<span>예치금</span><br>
	                  	</td>
	                  	-->
	                     <td class="userText" colspan="2" style="text-align: center;">
	                     	<span style="margin-right: 15px;">예치금</span>
	                     	<fmt:formatNumber type="number" value="${ loginUser.memBalance }"/>원
	                    	<span onclick="location.href='pointpayment.ar';" class="cashButton">충전</span>
	                   	</td>
	                  </tr>
	                  <tr>
	                     <td colspan="2"><a href="myBidList.ac" class="userMenu">나의 경매</a></td>
	                  </tr>
	                  <tr>
	                     <td colspan="2"><a href="myOrderList.od" class="userMenu">나의 주문</a></td>
	                  </tr>
	                  <tr>
	                     <td colspan="2"><a href="myInfo" class="userMenu">마이페이지</a></td>
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
                  <input type="text" name="keyword" id="search-input" placeholder="작품명 또는 작가명">
                  <button><img alt="검색 버튼" src="main/icons/ico_seach_black.svg"></button>
              </form>
              <div id="search-results">
              	<div class="searchDiv">
                 <table class="searchTable" style="table-layout: fixed; width: 93%;">
                    <tr>
                       <td style="width: 17%;">
                          <div class="searchImg">
                             <img alt="검색 사진" src="main/mainPic/news1.jpg">
                          </div>
                       </td>
                       <td style="width: 53%;">
                          Tell me your wish
                       </td>
                       <td style="width: 30%;">
                          김재언
                       </td>
                    </tr>
                    <tr>
                       <td>
                          <div class="searchImg">
                             <img alt="검색 사진" src="main/mainPic/auction4.png">
                          </div>
                       </td>
                       <td>
                          very very cold
                       </td>
                       <td>
                          김가현
                       </td>
                    </tr>
                    <tr>
                       <td>
                          <div class="searchImg">
                             <img alt="검색 사진" src="main/mainPic/news3.jpeg">
                          </div>
                       </td>
                       <td>
                          나는야 젤리 부자
                       </td>
                       <td>
                          김용우
                       </td>
                    </tr>
                    <tr>
                       <td>
                          <div class="searchImg">
                             <img alt="검색 사진" src="main/mainPic/product2.png">
                          </div>
                       </td>
                       <td>
                         정글에서 살아남는 법
                       </td>
                       <td>
                          오선우
                       </td>
                    </tr>
                    <tr>
                       <td>
                          <div class="searchImg">
                             <img alt="검색 사진" src="main/mainPic/product4.png">
                          </div>
                       </td>
                       <td>
                         떡볶이와 나
                       </td>
                       <td>
                          김로사
                       </td>
                    </tr>
                    <tr>
                       <td>
                          <div class="searchImg">
                             <img alt="검색 사진" src="main/mainPic/product1.png">
                          </div>
                       </td>
                       <td>
                         금주는 오늘까지
                       </td>
                       <td>
                          박지성
                       </td>
                    </tr>
                 </table>
              	</div>
                 
                 <table class="recoTable">
                    <tr>
                        <th colspan="2">&nbsp;&nbsp;&nbsp;추천 검색어</th>
                    </tr>
                    <tr>
                       <td>
                       <a href="">박지성</a>
                       </td>
                       <td>
                       <a href="">김가현</a>
                       </td>
                    </tr>
                    <tr>
                       <td>
                          <a href="">김용우</a>
                       </td>
                       <td>
                          <a href="">오선우</a>
                       </td>
                    </tr>
                    <tr>
                       <td>
                          <a href="">김로사</a>
                       </td>
                       <td>
                          <a href="">아무개</a>
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
            <li>
              <a href="loginView">로그인</a>
            </li>
            <li>
              <a href="authenticationView">회원가입</a>
            </li>
          </ul>
        </div>
        <ul class="fullmenu-gnblist">
          <li class="fullmenu-gnbitem">
            <a class="fullmenu-gnblink" href="javascript:void(0)">
              <span>AUCTION</span>
            </a>
            <ul class="fullmenu-sublist">
              <li class="fullmenu-subitem">
                <a class="fullmenu-sublink" href="javascript:void(0)">
                  <span>온라인 경매</span>
                </a>
              </li>
              <li class="fullmenu-subitem">
                <a class="fullmenu-sublink" href="javascript:void(0)">
                  <span>캘린더</span>
                </a>
              </li>
            </ul>
          </li>
          <li class="fullmenu-gnbitem">
            <a class="fullmenu-gnblink" href="javascript:void(0)">
              <span>PRODUCT</span>
            </a>
            <ul class="fullmenu-sublist">
              <li class="fullmenu-subitem">
                <a class="fullmenu-sublink" href="javascript:void(0)">
                  <span>아트</span>
                </a>
              </li>
            </ul>
          </li>
          <li class="fullmenu-gnbitem">
            <a class="fullmenu-gnblink" href="javascript:void(0)">
              <span>RECOMMEND</span>
            </a>
            <ul class="fullmenu-sublist">
              <li class="fullmenu-subitem">
                <a class="fullmenu-sublink" href="javascript:void(0)">
                  <span>1:1   추천</span>
                </a>
              </li>
              <li class="fullmenu-subitem">
                <a class="fullmenu-sublink" href="javascript:void(0)">
                  <span>작품 리뷰</span>
                </a>
              </li>
            </ul>
          </li>
          <li class="fullmenu-gnbitem">
            <a class="fullmenu-gnblink" href="javascript:void(0)">
              <span>HOW TO</span>
            </a>
            <ul class="fullmenu-sublist">
              <li class="fullmenu-subitem">
                <a class="fullmenu-sublink" href="javascript:void(0)">
                  <span>오시는 길</span>
                </a>
              </li>
              <li class="fullmenu-subitem">
                <a class="fullmenu-sublink" href="javascript:void(0)">
                  <span>경매 안내</span>
                </a>
              </li>
              <li class="fullmenu-subitem">
                <a class="fullmenu-sublink" href="javascript:void(0)">
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
  <!--  -->
  <!--  -->
  <!--  -->  
  
	<div style="width:100%; height:100%; min-height: 790px;">
		<div id="calendarPlace">
		    <div id="calendar">
		        <div id="header"></div>
		        <div id="navigation">
		            <button  onclick="moveMonth(-1)" id="prevBtn"> previous Month</button>
		            <div id="dates"></div>
		            <button onclick="moveMonth(1)" id="nextBtn">Next Month</button>
		        </div>
		    </div>
	    </div>
	    <div style="color:white; text-align: center; margin-top:1.5%; font-size: xx-large;">온라인 경매 일정</div>
	    <div style="text-align: center; margin-top: 15px; color:white;">
		    <svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" fill="currentColor" class="bi bi-calendar2-check" viewBox="0 0 16 16">
			  <path d="M10.854 8.146a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708 0l-1.5-1.5a.5.5 0 0 1 .708-.708L7.5 10.793l2.646-2.647a.5.5 0 0 1 .708 0"/>
			  <path d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5M2 2a1 1 0 0 0-1 1v11a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V3a1 1 0 0 0-1-1z"/>
			  <path d="M2.5 4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5H3a.5.5 0 0 1-.5-.5z"/>
			</svg>
		</div>
	 	<div style="color:white; text-align: center; margin-top:1.5%; margin-bottom:1.5%; font-size: xx-large;">매일 열리는 경매일정을 확인해 보세요!</div>
	    <div id="divinePlace" style="min-height:500px;">
			<div id="mainContent">
				<c:if test="${ empty aList }">
					<h1 style="text-align:center; width:1200px; display:flex; justify-content:center; align-items:center; color:white; background:black; padding: 13% 0 13% 0; margin-bottom:-20%; margin-left:17.5%;"> 해당 날짜에 시작하는 경매가 없습니다 </h1>
				</c:if>
			
				<div class="owl-carousel owl-theme">
					<c:forEach items="${ aList }" var="auction">
							<div class="item">
								<div class="auction" onclick="moveAuction(${auction.aucNo})">
									<img src="${ auction.attRename }" class="img"> <span>${ auction.conProduct }</span><br>
									<span>경매 시작 금액 : <fmt:formatNumber value="${ auction.aucStartPrice }" /> 원
									</span><br>
									<span>경매 기간 : ${ fn:split(auction.aucStartDate, " ")[0] } ~ ${ fn:split(auction.aucFinishDate, " ")[0] }</span><br>
								</div>
							</div>  
					</c:forEach>
				</div>
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

</script> -->
<body>

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
	
	
	
	
	<jsp:include page="../common/footer.jsp" />
	
	<script>
		window.onload = () =>{
			let url = window.location.href;
			if(url.includes("?date=")){
				handleDateClick(url.split("-")[2] + "/새로고침");
				displayCalendar();
			}else{
				displayCalendar();
			}
		}
		
		function moveAuction(aucNo){
			location.href='scheduledAuction.ac?aucNo=' + aucNo;
		}
		
	
    	function carasel(){
    		const itemsLength = document.querySelectorAll("div[class='item']").length;
    		let itemsNum = 0;
    		switch(true){
	       	  case itemsLength == 1 :
	       		itemsNum = 1
	       		break;
	       	  case itemsLength == 2 :
	       		itemsNum = 2
	       		break;
	       	  default : 
	       		itemsNum = 3
	       		break;
	       	  }
    		var owl = $('.owl-carousel'); 
	    	owl.owlCarousel({
	       	  // 한번에 보여지는 이미지 수
	       	  items: itemsNum,
	          loop: true, // 항목들을 무한으로 반복하여 보여줄지 여부
	          autoplay: true, // 자동으로 슬라이드 쇼를 시작할지 여부
	          autoplayTimeout: 3000, // 다음 이미지로 넘어가는 시간 (단위 : 밀리초)
	          autoplayHoverPause: true, // 마우스가 이미지에 위에 있을 때 자동 슬라이드를 일시중지 할지 여부
	        });           
    	}
    
    
	    $(document).ready(function(){
	    	carasel();
	      });
    
        let currentDate = new Date();
        let selectedDate = new Date();
        

        function displayCalendar() {
        	 const header = document.getElementById('header');
             const dates = document.getElementById('dates');
             const prevBtn = document.getElementById('prevBtn');
             const nextBtn = document.getElementById('nextBtn');
             const today = new Date();
        	
       		const url = window.location.href;
       		console.log("url : " + url)
       		if(url.includes("?date=")){
       			selectedDate = new Date( url.split("=")[1] + 'T00:00:00+09:00');
       		}
       		
       		console.log("디스플레이 selectedDate : " + selectedDate)
       		
            header.textContent = currentDate.toLocaleString('ko-KR', { year: 'numeric', month: 'long' });
            
            let dateContent = '';


            const firstDay = new Date(currentDate.getFullYear(), currentDate.getMonth(), 1);
            const lastDayOfMonth = new Date(currentDate.getFullYear(), currentDate.getMonth() + 1, 0).getDate();

            for (let i = 1; i <= lastDayOfMonth; i++) {
                const currentDay = new Date(currentDate.getFullYear(), currentDate.getMonth(), i);
                
                
                let	isFutureDate = currentDay > today || currentDay.toDateString() === today.toDateString();
                
                if (isFutureDate) {
                    const classNames = currentDay.toDateString() === selectedDate.toDateString() ? 'date-item current-date' : 'date-item future-date';
                    if(i <= 9) {
                    	dateContent += "<span class='" + classNames + "' onclick='handleDateClick(this.innerText)'>" + "&nbsp;" + i + "&nbsp;" + "</span>";
                    }else{
                    	dateContent += "&nbsp" + "<span class='" + classNames + "' onclick='handleDateClick(this.innerText)'>" + i + "</span>";
                    }
                }
            }

            dates.innerHTML = dateContent;

            // 이전 달 버튼 활성화/비활성화
            prevBtn.disabled = currentDate.getMonth() === today.getMonth() && currentDate.getFullYear() === today.getFullYear();
            if(prevBtn.disabled){
            	prevBtn.style.color = 'black';
            	prevBtn.style.background = 'gray';
            }else{
            	prevBtn.style.color = 'white';
            	prevBtn.style.background = 'darkgray';
            }
        }
        
        function moveMonth(months) {
        	const currentMonth = currentDate.getMonth();
        	console.log(currentMonth)
        	currentDate.setMonth(currentMonth + months);

        	    // 이동한 후에도 월이 변경되었는지 확인
        	if (currentDate.getMonth() !== (currentMonth + months) % 12) {
        	       // 변경된 경우, 월의 마지막 날짜로 설정
        	    currentDate.setDate(0);
        	}
        	    
            displayCalendar();
        }
        

        function handleDateClick(element) {
        	
        	if(element.includes("/새로고침")){
        		
	            const clickedDate = parseInt(element.split("/")[0]);
	            currentDate.setDate(clickedDate);
	            
	            selectedDate = new Date(currentDate);
	            displayCalendar();
        	}else{
	            const clickedDate = parseInt(element);
	            currentDate.setDate(clickedDate);
	            
	            const selectDate = currentDate.toLocaleDateString().split(".");
	            let selectYear = selectDate[0];
	            let selectMonth = selectDate[1].trim();
	            let selectDay = selectDate[2].trim();
	            
	            
	            
	            if(selectMonth.length == 1 ){
	                selectMonth = "0" + selectMonth;
	            }
	            
	            if(selectDay.length == 1 ){
	                selectDay = "0" + selectDay;
	            }
	            
	            let url = window.location.href;
	            let newUrl = null;
	            
	            switch(true){
	                case !url.includes("?date="):
	                    newUrl = url + "?date=" + selectYear + "-" + selectMonth + "-" + selectDay;
	                    history.pushState(null,null,newUrl);
	                    break;
	                case url.includes("?date="):
	                    newUrl = url.split("?")[0] + "?date=" + selectYear + "-" + selectMonth + "-" + selectDay;
	                    history.pushState(null,null,newUrl);
	                    break;
	            }
	            
	            selectedDate = new Date(currentDate);
	            displayCalendar();
	            
	            $("#mainContent").load(location.href + " #mainContent",()=>{
	            	carasel();        
	            });
	        }
        }
    </script>
</body>
</html>
