<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta http-equiv="imagetoolbar" content="no">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="format-detection" content="telephone=no">
  <meta name="title" content="웹사이트">
  <meta name="description" content="웹사이트입니다.">
  <meta name="keywords" content="키워드,키워드,키워드">
  <meta property="og:title" content="웹사이트">
  <meta property="og:description" content="웹사이트입니다">
  <meta property="og:image" content="https://웹사이트/images/opengraph.png">
  <meta property="og:url" content="https://웹사이트">
  <title>Products_Detail | ㅔㅔㅔ</title>
  <link rel="stylesheet" href="sunwoo/css/setting.css">
  <link rel="stylesheet" href="sunwoo/css/plugin.css">
  <link rel="stylesheet" href="sunwoo/css/template.css">
  <link rel="stylesheet" href="sunwoo/css/common.css">
  <link rel="stylesheet" href="sunwoo/css/style.css">
  
  <link rel="stylesheet" href="sunwoo/rosacss/rosasetting.css">
 	<link rel="stylesheet" href="sunwoo/rosacss/rosaplugin.css">
	<link rel="stylesheet" href="sunwoo/rosacss/rosatemplate.css">
	<link rel="stylesheet" href="sunwoo/rosacss/rosacommon.css">
	<link rel="stylesheet" href="sunwoo/rosacss/rosamain.css">
	<link rel="stylesheet" href="sunwoo/rosacss/rosastyle.css">
  
   <script src = "sunwoo/jquery/jquery-3.7.1.min.js"></script>
  



<style>

	.slider {
  position: relative;
  overflow: hidden;
  
  width: 600px;
  height: 400px;
}

.slide {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-size: cover;
  background-position: center;

  animation: slider 3s infinite linear;
}

.slide:nth-child(1) {
  background-image: url(img1.jpg);
  animation-delay: 0;
}
.slide:nth-child(2) {
  background-image: url(img2.jpg);
  animation-delay: -7.5s;
}
.slide:nth-child(3) {
  background-image: url(img3.jpg);
  animation-delay: -15s;
}

@keyframes slider {
  0% {
    transform: translateX(0);
  }

  26% {
    transform: translateX(0);
  }
  33% {
    transform: translateX(-100%);
    animation-timing-function: step-end;
  }
  93% {
    transform: translateX(100%);
  }

  100% {
    transform: translateX(0);
  }
}








.wrap {
	position: relative;
}

.magnifier {
	width: 150px;
	height: 150px;
	position: absolute;
	border-radius: 100%;
	box-shadow: 0 0 0 3px rgba(255, 255, 255, 0.85), 0 0 3px 3px rgba(0, 0, 0, 0.25);
	display: none;
}

.target {
	display: block;
}
  
  
  




</style>
  
</head>

<body>

<jsp:include page="../common/header.jsp" />
  
  <main class="th-layout-main ">
    <!-- [S]basic-N51 -->
    <div class="basic-N51" data-bid="FelqAJ2SO7">
      <div class="contents-inner">
        <div class="contents-container container-md">
         
          <div class="contents-left">
          <c:forEach items = "${alist}" var= "a">
          	<c:if test = "${a.attFno eq 1}">
            <div class="contents-thumbnail wrap">
              <img class="contents-thumbimg target" src="${a.attRename}" alt="Zoom Image on Mouseover"  >
            </div>
            </c:if>
            </c:forEach>
            <div style = "overflow:auto;">
            <ul class="contents-thumblist">
          	  <c:forEach items = "${alist}" var= "a">
            	  <li class="contents-thumbitem" onclick = "magni()">
                		<img class="contents-thumbimg" src="${a.attRename}" alt="썸네일이미지">
            	  </li>
              </c:forEach>
            </ul>
            </div>
          </div>
          
          <div class="contents-right">
            <div class="contents-right-group">
              <div class="contents-brand">
                <a href="javascript:void(0);" id = "proNo">${p.proNo}</a>
                <div class="contents-brand-group">
<!--                   <button class="contents-btn btn-like-line"> -->
<!--                     <img src="sunwoo/icons/ico_like_black_line.svg" alt="하트 라인 아이콘"> -->
<!--                   </button> -->
<!--                   <button class="contents-btn btn-like-fill"> -->
<!--                     <img src="sunwoo/icons/ico_like_black_fill.svg" alt="하트 채워진 아이콘"> -->
<!--                   </button> -->
                  <button class="contents-btn" onclick = "share('on')">
                    <img src="sunwoo/icons/ico_share_black.svg" alt="공유 아이콘">
                  </button>
                </div>
              </div>
              <div class="textset">
                <h2 class="textset-tit">${p.proName}</h2>
                <p class="textset-desc">${p.proWriter}</p>
              </div>
<!--               <div class="contents-badge-group"> -->
<!--                 <div class="badgeset badgeset-tag badgeset-round badgeset-line"> -->
<!--                   <span class="badgeset-text">#피부민감</span> -->
<!--                 </div> -->
<!--                 <div class="badgeset badgeset-tag badgeset-round badgeset-line"> -->
<!--                   <span class="badgeset-text">#트러블</span> -->
<!--                 </div> -->
<!--                 <div class="badgeset badgeset-tag badgeset-round badgeset-line"> -->
<!--                   <span class="badgeset-text">#진정</span> -->
<!--                 </div> -->
<!--               </div> -->
              <p class="contents-price"><span>${p.proPrice}</span><span style = "font-size: 14px; color: #555;"> 원</span>
              </p>
            </div>
            <div class="contents-right-group">
              <ul class="contents-right-list">
                <li class="contents-right-item">
                  <strong>포인트적립</strong>
                  <c:if test="${loginUser != null}">
                  <span id = "creditpoint">dd</span><small>&nbsp;p</small>
                  </c:if>
                  <c:if test="${loginUser == null}">
                  <span>로그인시 포인트적립이 가능합니다</span>
                  </c:if>
                </li>
                <li class="contents-right-item">
                  <strong>배송정보</strong>
                  <span>무료배송</span>
                </li>
              </ul>
            </div>
            <div class="contents-right-group">
              <ul class="contents-right-list">
                <li class="contents-right-item">
                  <strong>개수</strong>
                  <div class="contents-amount">
                    <button class="contents-btn btn-minus" type="button" onclick = "pricechage(this)">
                      <img src="sunwoo/icons/ico_minus_black.svg" alt="마이너스 아이콘">
                    </button>
                    <p class="contents-amount-num" >1</p>
                    <button class="contents-btn btn-plus" type="button" onclick = "checkamount(); pricechage(this)">
                      <img src="sunwoo/icons/ico_plus_black.svg" alt="플러스 아이콘">
                    </button>
                  </div>
                </li>
              </ul>
              <div style = "text-align:right; color: #888; font-size: 13px;">
              	<span>주문 가능수량 : </span> 
              	<span id = "amount">${p.proAmount}</span>
              </div>
              <div class="contents-total">
                <strong>총 결제금액</strong>
                <p class="contents-price"><span></span><span> 원</span>
                </p>
              </div>
            </div>
            <div class="contents-btn-group">
              <button class="btnset btnset-line" type="button" onclick = "addtowishlist()">장바구니</button>
              <button class="btnset" type="button" onclick = "directPay()">구매하기</button>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- [E]basic-N51 -->
    <!-- [S]basic-N52 -->
    <div class="basic-N52" data-bid="QELQaj2sow">
      <div class="contents-inner">
        <div class="tabset tabset-fluid">
          <ul class="tabset-list container-md">
            <li class="tabset-item">
              <a class="tabset-link active" onclick= "showdetail('detaildiv')" style = "cursor:pointer;">
                <span>상세정보</span>
        
              </a>
            </li>
            
            <li class="tabset-item">
              <a class="tabset-link" onclick= "showdetail('delidiv')" style = "cursor:pointer;">
                <span>배송/교환/반품안내</span>
              </a>
            </li>
          </ul>
        </div>
        
        
        
        <div class="contents-container container-md" id = "detaildiv" style = " box-shadow: 0 0 5px 5px #888;"  >
        	<c:forEach items = "${alist}" var = "a">
        	<c:if test =  "${a.attFno eq 1 }">
          <div class="imageset " style = "width: 75%; height: 40%; margin: 0 auto; ">
            <img class="imageset-img" src="${a.attRename}" alt="이미지" style = "border: 1px solid black;">
          </div>
          </c:if>
          </c:forEach>
          
          
          <div style = " margin: 0 auto; margin-top: 5%; box-shadow: inset 0 0 5px 5px #888; height: 50vh; display:flex; flex-direction:column; justify-content:center; align-items:center; width: 50%;">
          	<div style = "width: 100%; text-align:center; margin-bottom: 5%; display:flex; align-items:center; "><div style = "font-size: 30px; font-weight: bold; width: 50%; display:flex; align-items:center; justify-content:center; ">품명 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/</div><div style = "font-size:30px; width:50%; "> ${p.proName}</div></div>
          	<div style = " width: 100%; text-align:center; margin-bottom: 5%; display:flex; align-items:center;"><div style = "font-size: 30px; font-weight: bold; width: 50%; ">작가 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/</div><div style = "font-size:30px; width:50%; "> ${p.proWriter}</div></div>
          	<div style = " width: 100%; text-align:center; margin-bottom: 5%; display:flex; align-items:center;"><div style = "font-size: 30px; font-weight: bold; width: 50%; ">재료 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/</div><div style = "font-size:30px; width:50%; "> ${p.proMaterial}</div></div>
          	<div style = " width: 100%; text-align:center; margin-bottom: 5%; display:flex; align-items:center;"><div style = "font-size: 30px; font-weight: bold; width: 50%; ">가로 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/</div><div style = "font-size:30px; width:50%; "> ${p.proWidth}<small> cm</small></div></div>
          	<div style = "width: 100%;  text-align:center; margin-bottom: 5%; display:flex; align-items:center;"><div style = "font-size:30px; font-weight: bold; width: 50%; ">세로 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/</div><div style = "font-size:30px; width:50%; "> ${p.proHeight}<small> cm</small></div></div>
          
          </div>
          <div style = "margin: 0 auto;display:flex; flex-direction: column; align-items:center; justify-content:center; height: 40vh;">
          	<img src = "sunwoo/icons/sign.png" style = "width: 25%;"/>
          	<span>*본 상품은 Author의 검수를 통한 정품임을 보증합니다</span>
          </div>
          
         <div style = "margin: 0 auto;background-color: #eee;   height: 230vh; ">
         	<div style = "padding-top: 3%; width: 100%; margin-top: 0px; text-align:right;color:white; height: 10%; font-size: 150px; font-weight: bold;">ARTSNOMICS</div>
         	<div style = "padding-left: 10%; width: 100%; margin-top: 0px; text-align:left;color:black; height: 2.5%; font-size: 35px; font-weight: 900;">구입 프로세스</div>
         	<div style = "margin: 0 auto; margin-bottom: 2.5%; padding-top: 3%; padding-left: 5%; width: 80%; background-color:white; margin-top: 0px; text-align:left;color:black; height: 12.5%; font-size: 35px; font-weight: bold;">
         		<div><span style = "color:#a67c00;">01</span>&nbsp;&nbsp;&nbsp;<span style = "font-weight: 200;">미술품 구매 계약 체결</span></div>
         		<ul style = "margin-top: 5%;">
         			<li style = "list-style-type: disc; margin-bottom: 2.5%; font-size: 15px; margin-left: 10%; font-weight: 100;">회사 홈페이지를 통해 작품을 구매하고 결제를 합니다</li>
         			<li style = "list-style-type: disc; margin-bottom: 2.5%; font-size: 15px;  margin-left: 10%;font-weight: 100;">동시에 작품 홈페이지에 배송지를 입력합니다</li>
         			<li style = "list-style-type: disc; margin-bottom: 2.5%; font-size: 15px;  margin-left: 10%;font-weight: 100;">결제 익일에 미술품 구매계산서를 전자계약서로 발송합니다</li>
         		</ul>
         	</div>
         	<div style = "margin: 0 auto; padding-top: 3%; padding-left: 5%;  width: 80%; background-color:white; margin-top: 0px; text-align:left;color:black; height: 15%; font-size: 35px; font-weight: bold;">
         		<div><span style = "color:#a67c00;">01</span>&nbsp;&nbsp;&nbsp;<span style = "font-weight: 200;">작품 발송 및 설치</span></div>
         		<ul style = "margin-top: 5%;">
         			<li style = "list-style-type: disc; margin-bottom: 2.5%; margin-left: 10%; font-size: 15px; font-weight: 100;">회사는 고객에게 전화를 걸어 배송설치 예정일, 설치방식을 조율합니다.</li>
         			<li style = "list-style-type: disc; margin-bottom: 2.5%; margin-left: 10%; font-size: 15px; font-weight: 100;">배송지가 제주/산간지역일 경우, 고객의 요청에 따라 위탁보관이 가능합니다.</li>
         			<li style = "list-style-type: disc; margin-bottom: 2.5%; margin-left: 10%; font-size: 15px; font-weight: 100;">배송 예정일에 작품을 발송하고 설치합니다.</li>
         			<li style = "list-style-type: disc; margin-bottom: 2.5%; margin-left: 10%; font-size: 15px; font-weight: 100;">동시에 진품확인서를 전달합니다.</li>
         		</ul>
         	</div>
         	<div style = "padding-left: 10%; width: 100%; margin-top: 10%; text-align:left;color:black; height: 2.5%; font-size: 35px; font-weight: 900;">작품 구매시 <br><br>배송 설치 안내</div>
         	<div style = "padding-left: 10%; width: 100%; margin-top: 2.5%; text-align:left;color:black; height: 2.5%; font-size: 15px; font-weight: 100; color: gray;">공휴일 제외, 영업일 기준 2~3일 이내 배송설치 기사님께서 고객님께 연락을 드립니다.<br>연락을 받으신 후 세부 배송설치 날짜와 유형을 확인하시고 배송설치가 진행됩니다.</div>
         	<div style = "padding-left: 10%; width: 100%; margin-top: 5%; text-align:center; display:flex; justify-content:center; align-itmes:center; padding-left: 7.5%;">
         		<img src = "sunwoo/images/desc1.png" style=  "margin-right: 5%;">
         		<img src = "sunwoo/images/desc2.png" style=  "margin-right: 5%;">
         		<img src = "sunwoo/images/desc3.png" style=  "margin-right: 5%;">
         	</div>	
         	<div style = "margin: 0 auto; margin-bottom: 2.5%; padding-top: 3%; padding-left: 5%; width: 80%; background-color:#ddd; margin-top: 5%; text-align:left;color:black; height: 10%; font-size: 35px; font-weight: bold;">
         		<div><span style = "font-weight: 600; color: lightblack;">배송 설치 관련 유의사항</span></div>
         		<ul style = "margin-top: 2.5%;">
         			<li style = "  font-size: 15px; font-weight: 100; color:black;">작품을 배송설치 받으신 후 발생하는 작품의 파손 및 훼손은 당사는 책임지지 않습니다</li>
         			<li style = " font-size: 15px; font-weight: 100; color:black;">직사광선을 받는 곳이나 온/습도가 변화가 큰 곳에 작품설치는 삼가주시기 바랍니다.</li>
         			<li style = " font-size: 15px; font-weight: 100; color:black;">전문 설치시 적합한 위치라는 가정하에 고객님의 원하시는 위치에 작품 설치 진행을 우선으로 하지만<br>단순 변심으로 인한 재설치 요청은 추가금이 부과됩니다.</li>
         		</ul>
         	</div>
          </div>
          <h1 style = "text-align:center; margin-top: 5%; margin-bottom: 5%;">이 작품과 비슷한 작품</h1>
          <div class="slider" style = "border-top:1px solid #eee; width: 100%;">
          		<c:forEach begin = "1" end = "${length}" varStatus = "status">
          		   <c:if test = "${status.index eq 1 }">
					    <div class="slide" style = "display:flex; align-items:center; justify-content:center;">
					        	<c:forEach items = "${mimiclist}" var = "m" begin = "0" end = "2" >
					        		<c:forEach items = "${mimicAlist}" var = "ma">
					        			<c:if test = "${m.proNo eq ma.attBno && ma.attFno eq 1}">
					   						 <img src = "${ma.attRename}" style = "margin-right:1.25%; margin-left:1.25%; width: 30%; cursor:pointer" alt = "이미지" onclick = "location.href = 'artsDetail.ar?proNo=${m.proNo}'">
					    				</c:if>
					    			</c:forEach>
					    		</c:forEach>
					    </div>
					</c:if>
					<c:if test = "${status.index eq 2 }">
						
					    <div class="slide" style = "display:flex; align-items:center; justify-content:center;">
					        	<c:forEach items = "${mimiclist}" var = "m2" begin = "3" end = "5">
					        		<c:forEach items = "${mimicAlist}" var = "ma2">
					        			<c:if test = "${m2.proNo eq ma2.attBno && ma2.attFno eq 1}">
					   						 <img src = "${ma2.attRename}" style = "margin-right:1.25%; margin-left:1.25%; width: 30%; cursor:pointer" alt = "이미지" onclick = "location.href = 'artsDetail.ar?proNo=${m2.proNo}'">
					    				</c:if>
					    			</c:forEach>
					    		</c:forEach>
					    </div>
					</c:if>
					<c:if test = "${status.index eq 3 }">
					    <div class="slide" style = "display:flex; align-items:center; justify-content:center;">
					        	<c:forEach items = "${mimiclist}" var = "m3" begin = "6" end = "8" >
					        		<c:forEach items = "${mimicAlist}" var = "ma3">
					        			<c:if test = "${m3.proNo eq ma3.attBno && ma3.attFno eq 1}">
					   						 <img src = "${ma3.attRename}" style = "margin-right:1.25%; margin-left:1.25%; width: 30%; cursor:pointer" alt = "이미지" onclick = "location.href = 'artsDetail.ar?proNo=${m3.proNo}'">
					    				</c:if>
					    			</c:forEach>
					    		</c:forEach>
					    </div>
					</c:if>
				</c:forEach>

 		</div>
          
        </div>
        
        
        
        
        
         <div class="contents-container container-md" id = "delidiv" style = "color: #444;">
         		<div style = "background-color: #333; height: 35vh; color: white; display:flex; align-items:center; justify-content:center; flex-direction:column; font-size: 25px; box-shadow: 0px 5px 10px gray;">
         			<h1>Q.</h1>
         			<br><br>
         			<h1>교환 및 반품 배송비는 어떻게 되나요?</h1>
         		</div>
         		<div style = "display:flex; align-items:center; justify-content:center; flex-direction:column; font-size: 25px; margin-top: 10%; margin-bottom: 10%;">
         			<h1>A.</h1>
         			<br><br>
         			<ul>
         					<li style="list-style-type: circle;"><h3>단순변심의 경우</h3></li>
         					<br>
         					<p>상품 수령일로부터 7일이내 교환/반품이 가능하며, 반송택배비는 고객 부담입니다.</p>
         					<br><br>
         					<p>반품 시 상품 및 무료증정 사은품은 모두 반품해주셔야 합니다.</p>
         					<br><br>
         					<p>제주도 및 도서산간지역은 추가 요금이 발생합니다.</p>
         					<br><br>
         					<p>-제주도 추가 배송비 : 3,000원 / 도서산간지역 추가 배송비: 5,000원</p>
         					<br><br>
         					<li style="list-style-type: circle;"><h3>상품 불량 오배송인 경우</h3></li>
         					<br>
         					<p>상품 수령일로부터 7일이내 교환/반품이 가능하며, 택배비는 어서옥션에서 부담합니다.</p>
         					<p>(상품 불량을 증명할 수 있는 사진 첨부는 필수입니다.)</p>
         					<br>
         					<hr>
         					<br>
         					<li style="list-style-type: circle;"><h3>반품 택배비 안내</h3></li>
         					<br>
         					<p>-유료 배송으로 받은 경우: 편도택배비 3,000원(반송배송비 3,000원) 고객부담</p>
         					<br><br>
         					<p>-무료 배송으로 받은 경우: 왕복택배비 6,000원(초기배송비 3,000원 + 반송배송비 3,000원) 고객부담</p>
         					<br>
         					<small>(제주도 추가 배송비: 3,000원 / 도서산간지역 추가 배송비: 5,000원)</small>
         					<br><br><br>
         					<li style="list-style-type: circle;"><h3>교환 택배비 안내</h3></li>
         					<br>
         					<p>-왕복택배비 6,000원(반송배송비 3,000원+교환상품배송비 3,000원) 고객부담</p>
							<p>(그 외에 교환 상품 추가 결제 비용은 홈페이지 아래의 계좌번호 입금 또는 고객센터에 문의해주세요.)</p>
						         				
         			</ul>
         		</div>
         
        </div>
        
        	
        
        </div>
      </div>
    <!-- [E]basic-N52 -->
    


  </main>
  
    
   <script src="sunwoo/js/setting.js"></script>
  <script src="sunwoo/js/plugin.js"></script>
  <script src="sunwoo/js/template.js"></script>
  <script src="sunwoo/js/common.js"></script>
  <script src="sunwoo/js/script.js"></script>
  
  <jsp:include page="../common/footer.jsp" />
  
  
  
 <div class="sns_share" style = "position: fixed;
	z-index: 9999;
	padding-top: 50vh;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	overflow: auto;
	background-color: rgba(0, 0, 0, 0.4);">
	
	<div style = "width: 500px;
	height: 200px;
	padding: 30px 30px;
	margin: 0 auto;
	border: 1px solid #777;
	background-color: #fff;">
	
 	<span style = "float: right;
	font-weight: bold;
	color: #777;
	font-size: 25px;
	cursor: pointer;" onclick = "share('off')">&times;</span>
	<h3>게시물 공유</h3>
	<div style = "margin-top: 5%;">
		<input id = "snsaddress" type = "text" readonly style = "width: 100%;">
			<span onclick="copy_to_clipboard()" style = "cursor:pointer; position: absolute; right: 40%; top: 57.3%;"><img src = "sunwoo/icons/copyicon.png" style = "width: 20px;"></span>
			</div>
	<div style = "margin: 0 auto; text-align:center; margin-top: 5%;">
	
	
          <img src="sunwoo/icons/icon-kakao.png" alt="카카오톡 공유하기" style = "width: 10%; cursor:pointer; " onclick="shareNaver()">
      
        <img src="sunwoo/icons/navericon.png" alt="네이버 공유하기" style = "width: 10%; cursor:pointer; " onclick="shareNaver()">
      
      <!-- facebook은 공유하려는 페이지에 meta og 설정 -->
        <img src="sunwoo/icons/icon-facebook.png" alt="페이스북 공유하기" style = "width: 10%; cursor:pointer; " onclick="shareFacebook()">
      
      
          <img src="sunwoo/icons/icon-twitter.png" alt="트위터 공유하기" style = "width: 10%; cursor:pointer;" onclick="shareTwitter()">
      
      
          <img src="sunwoo/icons/telegram.svg" alt="텔레그램 공유하기" style = "width: 10%; cursor:pointer; " onclick="shareTelegram()">

	</div>
	</div>
</div>
  
  
  

  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
  
  
  <script>
  	//주문가능수량 스크립트
  	
  	var amount = document.getElementById('amount').innerText;
  	

  	function checkamount(){
  		var num = parseInt(document.getElementsByClassName('contents-amount-num')[0].innerText);

  		if(num+1>amount){
  			Swal.fire({
			      icon: 'warning',
			      title: '주문가능 수량을 초과했습니다'
			    });	
  			document.getElementsByClassName('contents-amount-num')[0].innerText = num-1;
  		}
  		
  	}
  
  </script>
  
  <script>
  
	
	
  		//총 결제 금액 스크립트
  		const originalprice = parseInt(document.getElementsByClassName('contents-price')[0].children[0].innerText);
  		document.getElementsByClassName('contents-price')[0].children[0].innerText = originalprice.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
  		
  		document.getElementsByClassName('contents-price')[1].children[0].innerText= originalprice.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
  		
		//포인트 적립 가격 변동 스크립트
		const originalPoint = ${loginUser.graBonus}/100 * originalprice;
		const newPoint = parseInt(Math.round((originalPoint/10)) * 10);
		document.getElementById('creditpoint').innerText = newPoint.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
		
		function pricechage(btn){
			var newprice = originalprice*(parseInt(document.getElementsByClassName('contents-amount-num')[0].innerText));
			var newnewPoint = newPoint*(parseInt(document.getElementsByClassName('contents-amount-num')[0].innerText));
			switch(btn.className){
					
				case "contents-btn btn-plus": 
					newprice = newprice+originalprice;  
					newnewPoint = newnewPoint+newPoint; break;
				case "contents-btn btn-minus":
					
					if(parseInt(document.getElementsByClassName('contents-amount-num')[0].innerText) != 1){
					newprice = newprice-originalprice;  
					newnewPoint = newnewPoint-newPoint;
					}
					break;
			
				}
			document.getElementsByClassName('contents-price')[1].children[0].innerText = newprice.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
			document.getElementById('creditpoint').innerText = newnewPoint.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
		}		
		
		
		
		
		
  
  </script>
  
  
  
  
  <script>
  	//게시물 공유 스크립트
  	
  	document.getElementsByClassName('sns_share')[0].style.display = "none";
  	document.getElementById('snsaddress').value = " " + window.location.href;
  	
  	function share(condition){
  		
  		if(condition == 'on'){
  			document.getElementsByClassName('sns_share')[0].style.display = "block";
  			
  		}else{
  			document.getElementsByClassName('sns_share')[0].style.display = "none";
  		};
  		
  	}
  	
  	const uri = window.location.href;
// NAVER
	function shareNaver() {
	  const title = "어서옥션";
	  window.open(
    "https://share.naver.com/web/shareView?url=" + uri + "&title=" + title
  );
}

// Facebook
	function shareFacebook() {
	  const title = "어서옥션";
	  window.open(
    "http://www.facebook.com/sharer/sharer.php?u=" + uri + "&title=" + title
  );
}

// Twitter
	function shareTwitter() {
	  const text = "어서옥션";
	  const url = "https://sample.com/index.php";
	  window.open(
    "https://twitter.com/intent/tweet?text=" + uri + text
  );
}

// Telegram
	function shareTelegram() {
	  const text = "어서옥션";
	  const url = "https://sample.com/index.php";
	  window.open("https://telegram.me/share/url?url=" + uri + "&text=" + text);
}




//클립보드에 링크 복사 스크립트


function copy_to_clipboard(){
var r = document.createRange();
r.selectNode(document.getElementById('snsaddress'));
window.getSelection().removeAllRanges();
window.getSelection().addRange(r);
document.execCommand('copy');
window.getSelection().removeAllRanges();

alert('클립보드에 복사되었습니다');

}

</script>

  
  <script>
  	
  		//장바구니에 물건 담든 스크립트
  
  		function addtowishlist(){
  			
  			if(${countwis} == 0){	
  				
  			const proNo = parseInt(document.getElementById('proNo').innerText);
  			var wisAmount = parseInt(document.getElementsByClassName('contents-amount-num')[0].innerText);
  			
  		  $.ajax({
			    url: 'addtowishlist.ar',
			    type: 'GET',
			    data: {
			    	memId: '${loginid}',
			    	proNo: proNo,
			    	wisAmount: wisAmount
			    },
			    success: function onData (msg) {
			    	
			        Swal.fire({
					      icon: 'success',
					      title: msg
					    });	
			        
			        var btn = document.getElementsByClassName('btnset-line')[0];
			  		 btn.style.backgroundColor = "#bbb";
			  		 btn.style.cursor = 'not-allowed';
			  		$("#cartCount").load(location.href + " #cartCount");
			  		 
			    },
			    error: function onError (error) {
			        console.error(error);
			    }
			});
  		}else{
  			
  		   Swal.fire({
			      icon: 'warning',
			      title: '장바구니에 이미 상품이 있습니다.'
			    });	
  		}
  	}	
  
  </script>
  
  <script>
  		//장바구니 버튼 바꾸기 스크립트
  	
  		if(${countwis} != 0){
  			
  	   var btn = document.getElementsByClassName('btnset-line')[0];
  		 btn.style.backgroundColor = "#bbb";
  		 btn.style.cursor = 'not-allowed';
  	
  	}
  
  </script>
  
  <script>
  
  
  	//바로 구매
  	function directPay(){
  		
  		var amount = parseInt(document.getElementsByClassName('contents-amount-num')[0].innerText);
  		
  		location.href = 'directPayment.ar?proNo='+${p.proNo}+"&amount="+amount;
  		
  		
  	}
  
  
  </script>
  
  <script>
   var  delidiv = document.getElementById('delidiv');
  var detaildiv = document.getElementById('detaildiv');
  
 	 delidiv.style.display = "none";
  
  	function showdetail(kind){
  
  		switch(kind){
  		
  		case 'delidiv': 
  		delidiv.style.display = "block";
  		detaildiv.style.display = "none";
  					break;	
  		
  		
  		case 'detaildiv': 
  	  detaildiv.style.display = "block";
  		delidiv.style.display = "none";
  					break;	
  		
  		}
  		
  	}
  
  
  </script>
  
  

  
  
  
  <script>
//   	let splitStr = [...document.getElementById('proDatespan').innerText];
//   	let newstring = "";
// 	for(var i =0; i<splitStr.length; i++){
		
// 		if(i == 3 || i == 5 ){
// 			newstring = newstring + splitStr[i] + "-";	
// 		}
// 		console.log(splitStr[i]);
// 		newstring = newstring+ splitStr[i];
		
// 	}
// 	console.log(newstring);
  
  </script>
  
  
  <script>
		
//주의 : hTML에서 보여지는 이미지 크기가 본래 이미지 크기보다 작아야 함. ( width , height )

function magni(){
	$(".wrap")
	.on('mousemove', magnify)
	.prepend("<div class='magnifier'></div>")
	.children('.magnifier').css({
		"background": "url('" + $(".target").attr("src") + "') no-repeat"
	});

var target = $('.target');
var magnifier = $('.magnifier');

function magnify(e) {

	// 마우스 위치에서 .magnify의 위치를 차감해 컨테이너에 대한 마우스 좌표를 얻는다.
	var mouseX = e.pageX - $(this).offset().left;
	var mouseY = e.pageY - $(this).offset().top;

	// 컨테이너 밖으로 마우스가 벗어나면 돋보기를 없앤다.
	if (mouseX < $(this).width() && mouseY < $(this).height() && mouseX > 0 && mouseY > 0) {
		magnifier.fadeIn(100);
	} else {
		magnifier.fadeOut(100);
	}

	//돋보기가 존재할 때
	if (magnifier.is(":visible")) {

		/* 이미지에 대한 마우스 포인터 아래의 픽셀 비율(본래 이미지 크기에 대한)을 얻고 
		이를 사용하여 돋보기 내부에 큰 이미지를 배치한다. */
		var rx = -(mouseX / target.width() * target[0].naturalWidth - magnifier.width() / 2);
		var ry = -(mouseY / target.height() * target[0].naturalHeight - magnifier.height() / 2);

		//돋보기를 마우스 위치에 따라 움직인다.
		//돋보기의 width, height 절반을 마우스 좌표에서 차감해 마우스와 돋보기 위치를 일치시킨다.
		var px = mouseX - magnifier.width() / 2;
		var py = mouseY - magnifier.height() / 2;

		//적용
		magnifier.css({
			left: px,
			top: py,
			backgroundPosition: rx + "px " + ry + "px"
		});
	}
}
};

magni();


  
  </script>
  
  
  
 
</body>
</html>