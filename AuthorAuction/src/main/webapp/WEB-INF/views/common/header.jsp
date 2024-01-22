<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="imagetoolbar" content="no">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="format-detection" content="telephone=no">
<link rel="stylesheet" href="main/css/setting.css">
<link rel="stylesheet" href="main/css/plugin.css">
<link rel="stylesheet" href="main/css/template.css">
<link rel="stylesheet" href="main/css/common.css">
<link rel="stylesheet" href="main/css/main.css">
<link rel="stylesheet" href="main/css/style.css">
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

<style type="text/css">

.headerLogoText{
	padding: 1.2rem; 
	justify-content:center; 
	align-items: center; 
	display: flex;
    font-size: var(--fs-p1);
    font-weight: 500;
    color: var(--text-color5);
}

</style>
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
            <a href="/" class="headerLogoText">
              <!-- <img src="main/icons/logoImage.png" alt="로고"> --> 
              A_AUCTION
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
  <!-- [E]header -->
  <script src="main/js/setting.js"></script>
  <script src="main/js/plugin.js"></script>
  <script src="main/js/template.js"></script>
  <script src="main/js/common.js"></script>
  <script src="main/js/script.js"></script>
</body>
</html>
