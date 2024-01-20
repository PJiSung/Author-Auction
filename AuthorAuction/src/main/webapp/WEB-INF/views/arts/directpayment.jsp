<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Insert title here</title>
<!--   <link rel="stylesheet" href="css/setting.css"> -->
<!--   <link rel="stylesheet" href="css/plugin.css"> -->
<!--   <link rel="stylesheet" href="css/template.css"> -->
<!--   <link rel="stylesheet" href="css/common.css"> -->
  <link rel="stylesheet" href="sunwoo/css/style.css">
<!--   <link rel="stylesheet" href="css/wishlist.css"> -->
  
 <link rel="stylesheet" href="main/css/setting.css">
<link rel="stylesheet" href="main/css/plugin.css">
<link rel="stylesheet" href="main/css/template.css">
<link rel="stylesheet" href="main/css/common.css">
<link rel="stylesheet" href="main/css/main.css">
<link rel="stylesheet" href="main/css/style.css">
	
<style>

  html,body{
  	margin:0;
  	padding:0;
  }
  
	
 div{
 	margin: 0;
 	padding: 0;
  	display: block; 
 }

ul,li,ol{
	list-style: none;
}



input.check_btn{
  display:none;
  }

input.check_btn + label{
  cursor:pointer;
 }

input.check_btn + label > span{
  vertical-align: middle;
  padding-left: 5px;
 }

/* label:before에 체크하기 전 상태 CSS */
input.check_btn + label:before{
  content:"";
  display:inline-block;
  width:17px;
  height:17px;
  border:2px solid #888;
  border-radius: 4px;
  vertical-align:middle;
  
   width: 2rem;
    height: 2rem;
    border-radius: 50%;
    border: 1px solid #999;
    appearance: none;
    cursor: pointer;
    transition: background 0.2s;
  }
  
/* label:before에 체크 된 상태 CSS */  
input.check_btn:checked + label:before{
  content:"";
  background-color:black;
     border: none;
  background-image: url('check_btn.png');
  background-repeat: no-repeat;
  background-position: 50%;
  }


.deadd{

background-color:#fffff0;
border-bottom: 1px solid #eee;
}
.nodeadd{
	background-color: white;
border-bottom: 1px solid #eee;
}

.ordererinfo{
	outline :none;
}













/* START TOOLTIP STYLES */
[tooltip] {
  position: relative; /* opinion 1 */
}

/* Applies to all tooltips */
[tooltip]::before,
[tooltip]::after {
  text-transform: none; /* opinion 2 */
  font-size: .9em; /* opinion 3 */
  line-height: 1;
  user-select: none;
  pointer-events: none;
  position: absolute;
  display: none;
  opacity: 0;
}
[tooltip]::before {
  content: '';
  border: 5px solid transparent; /* opinion 4 */
  z-index: 1001; /* absurdity 1 */
}
[tooltip]::after {
  content: attr(tooltip); /* magic! */
  
  /* most of the rest of this is opinion */
  font-family: Helvetica, sans-serif;
  text-align: center;
  
  /* 
    Let the content set the size of the tooltips 
    but this will also keep them from being obnoxious
    */
  min-width: 30em;
  max-width: 210em;
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
  padding: 1ch 1.5ch;
  border-radius: .3ch;
  box-shadow: 0 1em 2em -.5em rgba(0, 0, 0, 0.35);
  background: #333;
  color: #fff;
  z-index: 1000; /* absurdity 2 */
}

/* Make the tooltips respond to hover */
[tooltip]:hover::before,
[tooltip]:hover::after {
  display: block;
}

/* don't show empty tooltips */
[tooltip='']::before,
[tooltip='']::after {
  display: none !important;
}

/* FLOW: UP */
[tooltip]:not([flow])::before,
[tooltip][flow^="up"]::before {
  bottom: 100%;
  border-bottom-width: 0;
  border-top-color: #333;
}
[tooltip]:not([flow])::after,
[tooltip][flow^="up"]::after {
  bottom: calc(100% + 5px);
}
[tooltip]:not([flow])::before,
[tooltip]:not([flow])::after,
[tooltip][flow^="up"]::before,
[tooltip][flow^="up"]::after {
  left: 50%;
  transform: translate(-50%, -.5em);
}

/* FLOW: DOWN */
[tooltip][flow^="down"]::before {
  top: 100%;
  border-top-width: 0;
  border-bottom-color: #333;
}
[tooltip][flow^="down"]::after {
  top: calc(100% + 5px);
}
[tooltip][flow^="down"]::before,
[tooltip][flow^="down"]::after {
  left: 50%;
  transform: translate(-50%, .5em);
}

/* FLOW: LEFT */
[tooltip][flow^="left"]::before {
  top: 50%;
  border-right-width: 0;
  border-left-color: #333;
  left: calc(0em - 5px);
  transform: translate(-.5em, -50%);
}
[tooltip][flow^="left"]::after {
  top: 50%;
  right: calc(100% + 5px);
  transform: translate(-.5em, -50%);
}

/* FLOW: RIGHT */
[tooltip][flow^="right"]::before {
  top: 50%;
  border-left-width: 0;
  border-right-color: #333;
  right: calc(0em - 5px);
  transform: translate(.5em, -50%);
}
[tooltip][flow^="right"]::after {
  top: 50%;
  left: calc(100% + 5px);
  transform: translate(.5em, -50%);
}

/* KEYFRAMES */
@keyframes tooltips-vert {
  to {
    opacity: .9;
    transform: translate(-50%, 0);
  }
}

@keyframes tooltips-horz {
  to {
    opacity: .9;
    transform: translate(0, -50%);
  }
}

/* FX All The Things */ 
[tooltip]:not([flow]):hover::before,
[tooltip]:not([flow]):hover::after,
[tooltip][flow^="up"]:hover::before,
[tooltip][flow^="up"]:hover::after,
[tooltip][flow^="down"]:hover::before,
[tooltip][flow^="down"]:hover::after {
  animation: tooltips-vert 300ms ease-out forwards;
}

[tooltip][flow^="left"]:hover::before,
[tooltip][flow^="left"]:hover::after,
[tooltip][flow^="right"]:hover::before,
[tooltip][flow^="right"]:hover::after {
  animation: tooltips-horz 300ms ease-out forwards;
}




  

</style>


	
</head>
<body>

	<jsp:include page="../common/header.jsp" />




    <div class="basic-N51" data-bid="FelqAJ2SO7">
    

		<div id="l_order_header" style = "height: 50px !important; display:flex; align-items:center; border-top: 1px solid lightgray; border-bottom: 1px solid lightgray; box-shadow: 0 1px 2px 0 rgba(0, 0, 0, 0.06), 0 2px 12px 0 rgba(0, 0, 0, 0.03); z-index: 10; padding:3%;">
						<h1 class="c_order_header">주문결제</h1>
						<ul class="step" style = "padding: 1%; display:flex; position:absolute; right: 3%; border-radius: 25px; height: 4%; width: 20%; border: 1px solid #eee;">
							<!-- D : 활성페이지 active 클래스 추가 -->
							<li class="active" style = "color:#333; line-height:0%;float: left; word-spacing: 20px; margin-right: 5%; margin-left: 10%; cursor:pointer;"><i class="number" onclick ="location.href = 'wishlist.ar'" >01장바구니</i></li>
							<li class="second" style = " line-height:0%; float: left; word-spacing: 20px; margin-right: 5%; margin-left: 5%;"><i class="number" style = "color:red;" >02주문서</i></li>
							<li style = "line-height:0%; float: left; word-spacing: 20px; margin-right: 5%; margin-left: 5%;"><i class="number" >03주문완료</i></li>
						</ul>
						
		</div>
		
		
		
		
		<div id  ="selectdiv" style = "width: 60vw; margin-left: 5vw; height: 6vh; display: flex; align-items: center; 	
 	
 	border-bottom : 1px solid #888;
 	margin-top: 2%;
 	font-size: 17px;
 	color: #333;">
 			<div style = "display: flex; align-items: center; height: 100%; width: 20%;"><h2>배송정보</h2></div>
		</div>
			
		
			
		<div style = " border-bottom: 1px solid #888; width: 60vw; margin-left: 5vw;">
				<div style = "border-bottom: 1px solid #ccc; margin-top: 2.5vh;">
					<div style = " height: 25vw; width: 100%;">
						<div style = "display:flex; align-items: center;height: 15%;  ">
								<h2>주문자 정보</h2>						
						</div>
						<div style = " display:flex; align-items: center;height: 5%; color: #777; ">
							소셜 로그인 회원의 회원정보는 최초 주문자 정보(이름, 휴대폰 번호, 이메일)로 업데이트되며, 본인인증 또는 회원정보 변경을 통해 수정 가능합니다.		
						</div>
						<div style = "display:flex; align-items: center;height: 25%;">
							<input type = "text" placeholder = "주문자명" style = "width: 50%; height: 55%; border: 1px solid #aaa; outline:none; text-align:center;" class = "ordererinfo" value = "${loginUser.memName}" readonly>
						</div>
						<div style = " display:flex; align-items: center;height: 25%;">
						
							<div style = "width: 15%; height: 100%; display: flex; align-items: center;">
							<input type = "text" style = " border: 1px solid #aaa; width: 100%; height: 55%; text-align:center;" class = "ordererinfo" readonly>
<!-- 								<select style = " border: 1px solid #aaa; width: 100%; height: 55%; text-align:center;" class = "ordererinfo"> -->
<!-- 									<option value = "010">010</option> -->
<!-- 									<option value = "011">011</option> -->
<!-- 									<option value = "016">016</option> -->
<!-- 									<option value = "017">017</option> -->
<!-- 									<option value = "018">018</option> -->
<!-- 									<option value = "019">019</option> -->
<!-- 								</select> -->
							</div>
							<div style = " display:flex; align-items: center; height: 100%; width: 40%; justify-content: center;">
								<input type = "text" placeholder = "휴대폰 앞자리" style = "width: 70%; height: 55%; border: 1px solid #aaa; text-align:center;" class = "ordererinfo" readonly>
							</div>
							<div style = " display:flex; align-items: center; height: 100%; width: 40%;">
								<input type = "text" placeholder = "휴대폰 뒷자리" style = "width: 70%; height: 55%; border: 1px solid #aaa; text-align:center;" class = "ordererinfo" readonly>
							</div>
							<div style = " display:flex; align-items: center; height: 100%; width: 20%;" class = "check_wrap">
							</div>
						</div>
						<div style = " display:flex; align-items: center;height: 25%;">
							<div style = " display:flex; align-items: center; height: 100%; width: 30%;">
								<input type = "text" placeholder = "이메일아이디" style = "width: 95%; height: 55%; border: 1px solid #aaa; text-align:center; " id = "emailforward" class = "ordererinfo" readonly>
							</div>
							<div style = "display:flex; align-items: center; font-size: 30px; padding-right:5px;">
								<span>@</span>
							</div>
							<div style = " display:flex; align-items: center; height: 100%; width: 30%; justify-content: center;">
								<input type = "text" placeholder = "이메일서비스도메인" style = "width: 95%; height: 55%; border: 1px solid #aaa; text-align:center;" id = "emaildomain" oninput = "fullfill()" class = "ordererinfo" readonly>
							</div>
<!-- 							<div style = " display:flex; align-items: center; height: 100%; width: 20%; justify-content: center;"> -->
<!-- 								<select style = " border: 1px solid #aaa; width: 100%; height: 55%; text-align:center;" id = "emaildomainselect" onchange="selectEmailChange(this.value)"> -->
<!-- 									<option value = "naver.com">naver.com</option> -->
<!-- 									<option value = "hanmail.net">hanmail.net</option> -->
<!-- 									<option value = "nate.com">nate.com</option> -->
<!-- 									<option value = "yahoo.co.kr">yahoo.co.kr</option> -->
<!-- 									<option value = "gmail.com">gmail.com</option> -->
<!-- 									<option value = "daum.net">daum.net</option> -->
<!-- 									<option value = "">직접 입력</option> -->
<!-- 								</select> -->
<!-- 							</div> -->
						</div>
					</div>
				</div>	
					
					
					
				<div style = "border-bottom: 1px solid #ccc; margin-top: 2.5vh;">
					<div style = " height: 40vw; width: 100%;">
						<div style = "display:flex; align-items: center;height: 9.375%;  ">
								<h2>배송 정보</h2>	&nbsp;&nbsp;&nbsp;
								<input type = "checkbox"  style = "border: 1px solid #aaa;" class = "check_btn" id = "checkmemberequal" onchange = "checkequalordered(this)"><label for = "checkmemberequal"><span>주문자 정보와 동일</span></label>					
						</div>
						<div style = "display:flex; align-items: center;height: 15.625%;">
							<input type = "text" placeholder = "받는 사람" style = "width: 50%; height: 55%; border: 1px solid #aaa; text-align:center;" class= "deliveryinfo">
						</div>
						<div style = " display:flex; align-items: center;height: 15.625%;">
							<div style = "width: 10%; height: 100%; display: flex; align-items: center;">
									<div style = " cursor: pointer; border: 1px solid red; width: 100%; display: flex; height: 55%; align-items: center; justify-content:center; color: red;" onclick = "sample6_execDaumPostcode()">주소찾기</div>
									
							</div>
							<div style = " display:flex; align-items: center; height: 100%; width: 20%; justify-content: center; ">
								<input type = "text" placeholder = "우편번호" style = "width: 90%; height: 55%; border: 1px solid #aaa; text-align:center;" id ="sample6_postcode" class= "deliveryinfo" readonly>
							</div>
							
							
							<div style = " display:flex; align-items: center; height: 100%; width: 20%; justify-content: center; ">
								<div style = " cursor: pointer; border: 1px solid #888; width: 52.5%; display: flex; height: 30%; align-items: center; justify-content:center; color: #555;" onclick= "popadd('on')">배송지 조회</div>
							</div>
							
							
						</div>
						<div style = " display:flex; align-items: center;height: 15.625%;">
							<div style = " display:flex; align-items: center; height: 100%; width: 50%;">
								<input type = "text" placeholder = "기본 주소" style = "width: 100%; height: 55%; border: 1px solid #aaa; text-align:center;" id = "sample6_address" class= "deliveryinfo" readonly>
							</div>
						</div>
						<div style = " display:flex; align-items: center;height: 15.625%;">
							<div style = " display:flex; align-items: center; height: 100%; width: 50%;">
								<input type = "text" placeholder = "상세 주소 및 상세 건물명" style = "width: 100%; height: 55%; border: 1px solid #aaa; text-align:center;" id = "sample6_detailAddress" class= "deliveryinfo" readonly>
							</div>
						</div>
						<div style = " display:flex; align-items: center;height: 15.625%;">
							<div style = "width: 15%; height: 100%; display: flex; align-items: center;">
								<select style = " border: 1px solid #aaa; width: 100%; height: 55%; text-align:center;" class= "deliveryinfo">
									<option value = "010">010</option>
									<option value = "011">011</option>
									<option value = "016">016</option>
									<option value = "017">017</option>
									<option value = "018">018</option>
									<option value = "019">019</option>
								</select>
							</div>
							<div style = " display:flex; align-items: center; height: 100%; width: 40%; justify-content: center;">
								<input type = "text" placeholder = "휴대폰 앞자리" style = "width: 70%; height: 55%; border: 1px solid #aaa; text-align:center;" class= "deliveryinfo" id = "fotel">
							</div>
							<div style = " display:flex; align-items: center; height: 100%; width: 40%;">
								<input type = "text" placeholder = "휴대폰 뒷자리" style = "width: 70%; height: 55%; border: 1px solid #aaa; text-align:center;" class= "deliveryinfo" id = "batel">
							</div>
							<div style = " display:flex; align-items: center; height: 100%; width: 20%;">
							</div>
						</div>
						<div style = " display:flex; align-items: center;height: 9.375%;">
							<div style = " display:flex; align-items: center; height: 100%; width: 40%;">
								<select style = " border: 1px solid #aaa; width: 100%; height: 55%; text-align:center;" onchange = "selectmessage(this)" id = "messel">
									<option value = "none">배송시 요청사항 선택하기</option>
									<option value = "직접 수령하겠습니다">직접 수령하겠습니다</option>
									<option value = "문 앞에 놓아주세요">문 앞에 놓아주세요</option>
									<option value = "경비실에 맡겨주세요">경비실에 맡겨주세요</option>
									<option value = "배송 전 연락주세요">배송 전 연락주세요</option>
									<option value = "파손 위험이 있는 상품이니 조심히 다뤄주세요">파손 위험이 있는 상품이니 조심히 다뤄주세요</option>
									<option>직접입력</option>
								</select>
							</div>
							<div style = "display:flex; align-items: center; height: 100%; width: 50%;">
								<div style = "display:flex; align-items:center; justify-content:center; width: 100%; height: 100%;">
									<input type = "text" style = " border: 1px solid #aaa; width: 90%; height: 55%; text-align:center;"  maxlength="50" placeholder= "수령 방법을 입력해주세요(최대 50자)" id = "messagetext">
								</div>
							</div>
							<div style = "display:flex; align-items: center; height: 100%; width: 10%;">
								<p style = "font-weight: bold;" id = "messagetextlength"></p>
							</div>
						</div>
					</div>
				</div>	
				
				
				<div style = "border-bottom: 1px solid #ccc; margin-top: 5vh;">
					<div style = "height: 100%; width: 100%;">
						<div style = "display:flex; align-items: center;height: 9.375%;  ">
								<h2>주문상품</h2>	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<p style = "color: #888;">상품수량 및 옵션변경은 상품상세 또는 장바구니에서 가능합니다.</p>
						</div>
						
							<input type ="hidden" value = "${p.proNo}" class = "pronofororder">
							<div style = "width: 100%; height: 30vh; display:flex; align-items: center;">
							<c:forEach items = "${atlist}" var = "at">
								<c:if test = "${at.attFno eq 1 }">
								<img src="${at.attRename}" style = "width: 20%; height: 80%; border-top: 1px solid #aaa; border-bottom: 1px solid #aaa;">
								</c:if>
								</c:forEach>
								<div style = "display:flex; align-items:center; justify-content: center; width:40%; border-top: 1px solid #aaa; border-bottom: 1px solid #aaa; border-right: 1px solid #aaa;   height: 80%;">
									<p>${p.proName}</p>
								</div>
								<div style = "height: 80%; width: 10%; display:flex; align-items:center; justify-content:center;border-top: 1px solid #aaa; border-bottom: 1px solid #aaa; border-right:1px solid #aaa;">
								     <p class = "wisAmountfororder">${amount}</p>
								</div>
								<div style = "height: 80%; width: 20%; display:flex; align-items:center; justify-content:center; border-top: 1px solid #aaa; border-bottom: 1px solid #aaa; border-right:1px solid #aaa;">
								     <p style = "font-weight: bold; font-size: 20px;" class = "proprices popopo">${amount*p.proPrice}</p><small> 원</small>
								</div>
								<div style = "height: 80%; width: 10%; display:flex; align-items:center; justify-content:center; border-top: 1px solid #aaa; border-bottom: 1px solid #aaa;">
								     <p>무료배송</p><div style = "margin-left: 5px;border: 1px solid #888; color: #888; border-radius: 100%; width: 20px; height: 20px; display:flex; justify-content:center; align-items: center;" tooltip="같은 판매자의 상품도 출고지에 따라 배송비 무료 조건이 각각 적용될 수 있습니다." flow="down">?</div>
								</div>
							</div>
					</div>
				</div>	
				
				
				
				
				
<!-- 				<div style = "border-bottom: 1px solid #ccc; margin-top: 5vh;"> -->
<!-- 					<div style = "height: 100%; width: 100%;"> -->
<!-- 						<div style = "display:flex; align-items: center;height: 9.375%;  "> -->
<!-- 								<h2>할인/포인트</h2> -->
<!-- 						</div> -->
						
<!-- 						<div style = "height:10vh; width: 100%; display:flex; align-items: center;"> -->
<!-- 								<div style = "width: 5%; display:flex; align-items:center; justify-content:center;"><img src = "sunwoo/images/discount.svg" style = "width: 50%;"></div> -->
<!-- 								<div style = "width: 7.5%; display:flex; align-items:center;"><h4>포인트 할인</h4></div> -->
<!-- 						</div> -->
<!-- 						<div style = " height: 20vh; width: 80%; margin: 0 auto; background-color: #FFFFF2;"> -->
<!-- 								<div style = "width: 100%; height: 50%; display:flex; align-items:center;"> -->
<!-- 									<div style = "width: 20%; height:100%; border-right: 1px solid #fff; border-bottom: 1px solid #fff; display:flex; align-items:center; justify-content:center;"><h3>배송비 쿠폰</h3></div> -->
<!-- 									<div style = "width: 80%; height:100%;  border-bottom: 1px solid #fff; display:flex; align-items:center; justify-content:center;">- 87,450 원</div> -->
<!-- 								</div> -->
<!-- 								<div style = "width: 100%; height: 50%; display:flex; align-items:center;"> -->
<!-- 									<div style = "width: 20%; height:100%; border-right: 1px solid #fff;  border-bottom: 1px solid #fff;  display:flex; align-items:center; justify-content:center;"><h3>장바구니 쿠폰</h3></div> -->
<!-- 									<div style = "width: 80%; height:100%; border-bottom: 1px solid #fff; display:flex; align-items:center; justify-content:center;">- 87,450 원</div> -->
<!-- 								</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div>	 -->
				
				
				<div style = "border-bottom: 1px solid #ccc; margin-top: 5vh; margin-bottom: 10%;">
					<div style = "height: 100%; width: 100%;">
						<div style = "display:flex; align-items: center;height: 9.375%;  ">
							<h2>결제방법</h2>
						</div>
						<div style = "border-top: 1px solid #aaa; border-bottom: 1px solid #aaa; display:flex; height: 10vh; align-items: center; margin-top: 2.5%;">
							<div style = "width: 50%; border-right: 1px solid #aaa; height: 100%; display:flex; align-items: center;">
								<input type = "radio" id="creditcard" style = "width: 40px;" name = "paymethod" class = "paymethod"><label for = "creditcard"><h4>신용카드</h4></label>
							</div>
							<div style = "width: 80%; height: 100%; display:flex; align-items: center;">
								<div style = "margin-right: 0px; height: 100%; display:flex; align-items:center; justify-content:center; width: 90%; color: #555"><h5>포인트 사용</h5></div>
								<div style = "margin-right: 0px; height: 100%; display:flex; align-items:center; justify-content:center; width: 90%; color: #aaa;"><input type = "text" id = "pointinput"></div> 
								<div style = "margin-right: 0px; height: 100%; display:flex; align-items:center; justify-content:center; width: 90%; color: #aaa;">보유 포인트 : <span class = "popopo">${point}</span><small>&nbsp;p</small></div>
							</div>
						</div>
								<div>배송일은 주문일 기준 2~3일 소요됩니다</div>
					</div>
				</div>	
					
			</div>
	</div>	
	
	   <div style = "background-color: #fafafa; position: fixed; top: 25vh; width: 25%; right: 5%; height: 70vh; z-index: 5;">
	  	<div style = " height: 85%;">
	  		<div style = "display:flex; align-items:center; height: 20%;">
	  			<h2 style ="margin-left: 10%; width:70%;">적립혜택</h2>
	  		</div>
	  		
	  		<div style = "display:flex; align-items:center; height: 7.5%;">
	  		 <div style = "width: 60%; padding-left: 10%; font-size: 23px;">포인트 적립</div>
	  		  <div><h2 id = "pointBonus">0</h2></div>
	  		 <div><small> p</small></div>
	  		 </div>
	  		<div style = "padding-left: 10%; height: 10%; border-bottom: 1px dotted #666;"></div>
	  		<div style = "display:flex; align-items:center; height: 20%;">
	  			<h2 style ="margin-left: 10%;">결제 예정금액	</h2>
	  		</div>
	  		<div style = "display:flex; align-items:center; height: 7.5%;">
	  			 <div style = "width: 60%; padding-left: 10%; font-size: 23px;">상품금액</div>
	  			 <div><h2 id = "propribill">0</h2></div>
	  			 <div><small> 원</small></div>
	  		</div>	
	  		<div style = "display:flex; align-items:center; height: 7.5%;">
	  			 <div style = "width: 60%; padding-left: 10%; font-size: 23px;">배송비</div>
	  			 <div><h2 id = "delibill">0</h2></div>
	  			 <div><small> 원</small></div>
	  		</div>
	  		<div style = "display:flex; align-items:center; height: 7.5%;">
	  			 <div style = "width: 60%; padding-left: 10%; font-size: 23px;">포인트</div>
	  			 <div><h2 id = "pointprice">0</h2></div>
	  			 <div><small> p</small></div>
	  		</div>
	  		<div style = "display:flex; align-items:center; height: 20%;">
	  			 <div style = "width: 60%; padding-left: 10%; color:red; font-size: 23px;">합계</div>
	  			 <div><h1 id = "totalbill" style = "color:red;">0</h1></div>
	  			 <div><small> 원</small></div>
	  		</div>
	  	</div>
	  
	  	<div style = "position:absolute; bottom: 0%; color: #fff; width: 100%; height: 15%; display: flex; align-items:center; justify-content:center; word-break:break-all; background-color: black; cursor:pointer;" onclick = "checkall()">
	  		<h2>결제하기</h2>
	  	</div>
	  </div>
	
	
	<!-- 	배송비 팝업 -->
	<div style = "width: 15vw; height: 40vh; display:none;  position : absolute; top: 192%; left: 50%; z-index: 20; background-color: white; border: 1px solid #eee;" id = "qqq">
		<div style = "height: 10%; padding: 5px; font-size: 12px; font-weight: bold;">배송비 조건 안내</div>
		<div style = " padding: 5px; font-size: 14px;">같은 판매자의 상품도 출고지에 따라 배송비 무료 조건이 각각 적용될 수 있습니다.</div>
		<div style = "background-color: #eee; width: 95%; margin: 0 auto; height: 11%; padding: 5px; font-size: 15px;">무료</div>
		<div style = "height: 10%; padding: 5px; font-size: 12px; font-weight: bold;">제주/도서 산간지역 추가 배송비</div>
		<div style = " padding: 5px; font-size: 14px;">제주/도서 산간 배송지의 경우 구매자는 추가 운송비를 지불하셔야합니다.</div>
		<div style = "background-color: #eee; width: 95%; margin: 0 auto; height: 19%; padding: 3px; font-size: 15px;">
			<div>제주지역  <span style = "font-weight: bold; position:absolute; right: 10%;">4천원</span></div>
			<div>도서산간	<span style = "font-weight: bold; position:absolute; right: 10%;">4천원</span></div>
		</div>
	</div>
	
	

<!-- 	내 배송지 팝업 -->
<div class="sns_share" style = "position: fixed;
	z-index: 9999;
	padding-top:10vh;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	overflow: auto;
	background-color: rgba(0, 0, 0, 0.4);">
	
	<div style = "width: 1000px;
	height: 800px;
	padding: 30px 30px;
	margin: 0 auto;
	border: 1px solid #777;
	background-color: #fff;">
	
 	<span style = "float: right;
	font-weight: bold;
	color: #777;
	font-size: 25px;
	cursor: pointer;" onclick = "popadd('off')">&times;</span>
	
	<div style = "display: flex; align-items:center; justify-content: center; height: 25%; border: 1px solid #aaa;">
			<span><input type = "radio" name = "addre" class = "addrelist" id = "defaultaddre" checked><label for = "defaultaddre" style = "font-size: 25px;">기본 배송지</label></span>
			<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
			<span><input type = "radio" name = "addre" class = "addrelist" id = "recentaddre"><label for = "recentaddre" style = "font-size: 25px;">최근 배송지</label></span>
	</div>
	<div style = "border: 1px solid #aaa; height: 75%; overflow:auto;" class = "delilist">
	
		
		
		<c:forEach items = "${alist}" var = "addr">
			<div style = "height: 30%;" class = "${addr.addDefault eq 'Y' ? 'deadd' : 'nodeadd'}">
					<div style = "display:flex; align-items:center;"><div style = "font-weight: bold; display:flex; align-itmes:center; justify-content:center; width: 30%;  "> 배송지 명   </div>${addr.addName}</div>
				<div style = "display:flex; align-items:center;"><div style = "font-weight: bold; display:flex; align-itmes:center; justify-content:center; width: 30%;  "> 수신인</div>	${addr.addRecipient}</div>	
				<div style = "display:flex; align-items:center;"><div style = "font-weight: bold; display:flex; align-itmes:center; justify-content:center; width: 30%;  "> 주소</div>${addr.addAddress}</div>	
				<div style = "display:flex; align-items:center;"><div style = "font-weight: bold; display:flex; align-itmes:center; justify-content:center; width: 30%;  "> 수신인 번호</div> ${addr.addPhone}</div>	
				<div style = "display:flex; justify-content:right; align-items:center; height: 30%; "><button onclick = "choiceaddress('${addr.addAddress}','${addr.addNo}')" style = "border: none; width: 10%; color:white; background-color: black;">선택</button></div>	
			</div>
		</c:forEach>	
			<input type ="hidden" id = "addNoinput">
	</div>
	
	<div style = "border: 1px solid #888; height: 75%; overflow:auto;" class = "delilist">
		<c:forEach items = "${aolist}" var = "ao">
			<div style = " height: 30%;" class  = "nodeadd">
				<div style = "display:flex; align-items:center;"><div style = "font-weight: bold; display:flex; align-itmes:center; justify-content:center; width: 30%;  "> 배송지 명   </div>${ao.addName}</div>
				<div style = "display:flex; align-items:center;"><div style = "font-weight: bold; display:flex; align-itmes:center; justify-content:center; width: 30%;  "> 수신인</div>${ao.addRecipient}</div>	
				<div style = "display:flex; align-items:center;"><div style = "font-weight: bold; display:flex; align-itmes:center; justify-content:center; width: 30%;  "> 주소</div>${ao.addAddress}</div>	
				<div style = "display:flex; align-items:center;"><div style = "font-weight: bold; display:flex; align-itmes:center; justify-content:center; width: 30%;  "> 수신인 번호</div>${ao.addPhone}</div>	
				<div style = "display:flex; justify-content:right; align-items:center; height: 30%; "><button onclick = "choiceaddress('${ao.addAddress}','${ao.addNo}')" style = "border: none; width: 10%; color:white; background-color: black;">선택</button></div>	
			</div>
		</c:forEach>	
	</div>
	</div>
</div>	
	
	
	<jsp:include page="../common/footer.jsp" />
	
<!-- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> -->
<!-- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> -->
<!-- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> -->
<!-- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> -->
<!-- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> -->
<!-- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> -->
<!-- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> -->
<!-- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> -->
<!-- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> -->
<!-- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> -->
<!-- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> -->
<!-- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> ---- <!> -->
	
  <script src="sunwoo/js/setting.js"></script>
  <script src="sunwoo/js/plugin.js"></script>
  <script src="sunwoo/js/template.js"></script>
  <script src="sunwoo/js/common.js"></script>
  <script src="sunwoo/js/script.js"></script>
  
  
  
 <script src="sunwoo/jquery/jquery-3.7.1.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>

<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                
                } 

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                console.log(data.zonecode);
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                
                // 커서를 상세주소 필드로 이동하고 readonly 해제.
                 document.getElementById("sample6_detailAddress").readOnly = false;
                document.getElementById("sample6_detailAddress").focus();
                
                //파라미터로 넘길 주소를 끈다
                document.getElementById("addNoinput").value = 0;
            }
        }).open();
    }
</script>
  
  
  
<script>
	
	//이메일 자동 채우기 스크립트 
// 	document.getElementById('emaildomain').value = document.getElementById('emaildomainselect').value
	
// 	function selectEmailChange(value){
		
// 		document.getElementById('emaildomain').value = value;
// 	}
	
// 	function fullfill(){
		
// 		if(document.getElementById('emaildomain').value != document.getElementById('emaildomainselect').value){
// 			document.getElementById('emaildomainselect').options[6].selected = true;
// 		}

// 	}
</script>
  
  
<script>
	//주문자 정보와 동일 스크립트
	var deliveryinfo = document.getElementsByClassName('deliveryinfo');
	var ordererinfo = document.getElementsByClassName('ordererinfo');
	function checkequalordered(value){
		
		
		if(value.checked == true){
			
			deliveryinfo[0].value = ordererinfo[0].value;
			deliveryinfo[4].value = ordererinfo[1].value;
			deliveryinfo[5].value = ordererinfo[2].value;
			deliveryinfo[6].value = ordererinfo[3].value;
			
			
		}else{
			deliveryinfo[0].value = '';
			deliveryinfo[4].options[0].selected = true;
			deliveryinfo[5].value = '';
			deliveryinfo[6].value = '';
			
		}
}
	
	window.onload=()=>{
		
		for(d of deliveryinfo){
			d.addEventListener('change', ()=>{
			
				checkmemberequal.checked = false;
				
			})
		}	
		
	}

</script>  


<script>

	//배송 메세지 스크립트
	var messagetext = document.getElementById('messagetext');
	var messagetextlength = document.getElementById('messagetextlength');
	
	messagetext.style.display = "none";
	messagetextlength.style.display = "none";
	
	function selectmessage(data){
		
		if(data.options[6].selected ==true){
			
			messagetext.style.display = "block";
			messagetextlength.style.display = "block";
			
		}else{
			
			messagetext.value = "";
			messagetextlength.innerText = "";
			
			messagetext.style.display = "none";
			messagetextlength.style.display = "none";
		}
		
	}

	$(document).ready(function(){
		
		$("#messagetext").keyup(function(e) {
			var content = $(this).val();
			$("#messagetextlength").text("(" + content.length + "/ 50)"); //실시간 글자수 카운팅
			if (content.length > 50) {
				Swal.fire({
				      icon: 'warning',
				      title: '최대 50자까지 입력 가능합니다.'
				    });	
				$(this).val(content.substring(0, 50));
				$('#messagetextlength').html("(200 / 최대 200자)");
			}
		});

		
	});

</script>



<script>

$(document).ready(function(){

	$('.questiondeliver').hover(function(){
	 if(document.getElementById('qqq').style.display == "none"){
		 document.getElementById('qqq').style.display = "block";
	 }else{
		
		 document.getElementById('qqq').style.display = "none";
		 
	 }
		
	});

});

</script>
  
  
  <script>
  
//   	배송지 조회 스크립트
	document.getElementsByClassName('sns_share')[0].style.display = "none";
  	
  	function popadd(condition){
  		
  		if(condition == 'on'){
  			document.getElementsByClassName('sns_share')[0].style.display = "block";
  			
  		}else{
  			document.getElementsByClassName('sns_share')[0].style.display = "none";
  		}
  		
  	}
  
  	
  	
  	//배송지 스크립트
  	
  	document.getElementsByClassName('delilist')[1].style.display = "none";
  	
  	console.log(document.getElementsByClassName('addrelist'));
  	
  	for(a of document.getElementsByClassName('addrelist')){
  	
  		a.addEventListener('change', function(){
				
  				switch(this.id){
  				
  				
  				case 'recentaddre':
  					document.getElementsByClassName('delilist')[1].style.display = "block";
  					document.getElementsByClassName('delilist')[0].style.display = "none";
  					
  					break;
  				case 'defaultaddre':
  					document.getElementsByClassName('delilist')[0].style.display = "block";
  					document.getElementsByClassName('delilist')[1].style.display = "none";
  					
  					break;
  					
  				}
  		
  		});
  	
  	}
  	
  	
  	
  	
  	
  	
  
  
  </script>


  <script>
  
	//천단위 콤마 스크립트
	for(p of document.getElementsByClassName('popopo')){
		
		p.innerText = p.innerText.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
		
	}
	
	
  
  </script>
  
  
  
  <script>
  	//포인트 천단위로 입력시키기 스크립트
  	
//   	$("#pointinput").keydown(function(e) {
//   			var n = $(this).val(); 
//   			 n = Math.floor(n/10) * 10;
//   			 if(n>=10){
//   		     $(this).val(n);
//   			 }
// 		});
  
  </script>
  
  
  <script>
  	//총 상품 금액 스크립트
  	function updateproTotalPrice(){	
  		
  	var prototal=0;
  		
  		for(p of document.getElementsByClassName('proprices')){
  	  		
  			prototal = prototal + parseInt(p.innerText.replace(/,/g,""));
  	  		
  	  	}
  		
  		document.getElementById('propribill').innerText = prototal.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
  	}
  	
  	updateproTotalPrice();
  	
  	
  //총 금액 스크립트
		
	document.getElementById('totalbill').innerText = 
	document.getElementById('propribill').innerText;
	
  
 	//포인트 금액 및 총 금액 스크립트
 	const totalbill = document.getElementById('totalbill').innerText;
 	
 	
 	 //사용 포인트에 문자 못들어가게 막는 스크립트
	$('#pointinput').on('input', function() {
	    var sanitizedValue = this.value.replace(/[^0-9]/g, ''); 
	    this.value = sanitizedValue;

	    
	    if(!isNaN( parseInt($(this).val()))) {
	    	
	    var content = parseInt($(this).val());
	   
		$("#pointprice").text('-'+content.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",")); //실시간 포인트 
		$("#totalbill").text( (parseInt(totalbill.replace(/,/g,""))+parseInt(document.getElementById('pointprice').innerText.replace(/,/g,""))).toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ","));
	    }
	    
	    if (content > ${point}) {
			Swal.fire({
			      icon: 'warning',
			      title: '보유 포인트보다 더 사용할 수 없습니다'
			    });	
			$(this).val('');
			$("#pointprice").text(0);
			$("#totalbill").text(totalbill);
			
		}
		else if(content > parseInt(totalbill.replace(/,/g,"")) ){
			Swal.fire({
			      icon: 'warning',
			      title: '상품 가격보다 더 사용할 수 없습니다'
			    });	
			$(this).val(parseInt(totalbill.replace(/,/g,"")) );
			$("#pointprice").text('-'+parseInt(totalbill.replace(/,/g,"")).toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ","));
			$("#totalbill").text(0);
		}
	    if(this.value == ''){
	    	$("#pointprice").text(0);
	    	$("#totalbill").text(totalbill);
	    }
	    
	});
 	 
 	 
 	
// 		$("#pointinput").keyup(function(e) {
// 			if(isNaN(document.getElementById('pointinput').value)   || document.getElementById('pointinput').value.trim() == "" ){
// 				$("#pointprice").text(0);
// 				$("#pointinput").val(0);
// 				document.getElementById('totalbill').innerText = 
// 	 				document.getElementById('propribill').innerText;
				
// 			};
			
// 			var content = parseInt($(this).val());
			
// 			$("#pointprice").text('-'+content.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",")); //실시간 포인트 
// 			$("#totalbill").text( (parseInt(totalbill.replace(/,/g,""))+parseInt(document.getElementById('pointprice').innerText.replace(/,/g,""))).toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ","));
			
			
// 			if (content > ${point}) {
// 				alert('보유 포인트보다 더 사용할 수 없습니다');
// 				$(this).val(0);
// 				$("#pointprice").text(0);
// 				$("#totalbill").text(totalbill);
				
// 			}
// 			else if(content > parseInt(totalbill.replace(/,/g,"")) ){
// 				alert('상품 가격보다 더 사용할 수 없습니다.');
// 				$(this).val(parseInt(totalbill.replace(/,/g,"")) );
// 				$("#pointprice").text('-'+parseInt(totalbill.replace(/,/g,"")).toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ","));
// 				$("#totalbill").text(0);
// 			}
		
			
// 		});
 	
 	
		
		//포인트에 문자 못들어가게 막는 스크립트
// 		$("#pointinput").keyup(function(e) {
// 			var content = $(this).val();
// 			var regex = /[^0-9]/g;	
// // 			$(this).val(content.replace(regex, ""));
			
			
			
// 		});
		
		
	
	
	
  
  </script>



  <script>
  
  		//비어있는 곳 체크 확인
  		
 	function checkall(){
 		
 		var count = 0;
 		
 		for(var i=0; i<=3; i++){
 			
 			if(i<=3 && document.getElementsByClassName('deliveryinfo')[i].value.trim() == ''){
 				
 				Swal.fire({
				      icon: 'warning',
				      title: document.getElementsByClassName('deliveryinfo')[i].placeholder+' 입력해 주십시오.'
				    });	
 				
 				break;
 				
 			}
 			count++;
 		}
 		
 			
 		
 		if(count == 4 && !document.getElementsByClassName('paymethod')[0].checked){
 				
 				
 				Swal.fire({
				      icon: 'warning',
				      title: '결제 수단을 선택해주세요.'
				    });	
 			}
 				
 		if(count == 4 && document.getElementsByClassName('paymethod')[0].checked ){
 			
 				requestpay();
 			}
 		}
  
  
  
  </script>




<script>
		
</script>


<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<!-- iamport.payment.js -->
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
  
 <script>
 	
 	//결제 스크립트

 IMP.init("imp41106724"); // 예시 : imp00000000
 
 
 function requestpay(){
	 
	 //물건가격 
	 const amount = parseInt(document.getElementById('totalbill').innerText.replace(/,/g,""))
	 const ordernum = Math.floor(Math.random()*1000000000*new Date().getMilliseconds());
	 const ordererName = document.getElementsByClassName('ordererinfo')[0].value;
	 const phoneNum = document.getElementsByClassName('ordererinfo')[1].value +  '-' + 
		document.getElementsByClassName('ordererinfo')[2].value.trim() + '-' +
		document.getElementsByClassName('ordererinfo')[3].value.trim();
	 
	 const email = document.getElementById('emailforward').value.trim()+'@'+document.getElementById('emaildomain').value.trim();
	 const address = document.getElementById('sample6_address').value.trim()+'@'+
	   document.getElementById('sample6_detailAddress').value.trim();
	 const postcode = document.getElementById('sample6_postcode').value.trim();
	 
	 
	 var deliveryMsg = "";

		if(document.getElementById('messel').options[0].selected){
			
			deliveryMsg = 'none';
		}
		else if(document.getElementById('messel').options[6].selected){
			
			deliveryMsg = document.getElementById('messagetext').value.trim();
		}
		else{
			deliveryMsg = document.getElementById('messel').value;
		}
		
	 var ordPoPrice = document.getElementById('pointprice').innerText == '0' ? 0 : parseInt(document.getElementById('pointprice').innerText.replace(/,/g,"").split('-')[1]);
	 
	 
	 const receiver = document.getElementsByClassName('deliveryinfo')[0].value.trim();
		
		const receiverPhone = 
		document.getElementsByClassName('deliveryinfo')[4].value +  '-' + 
		document.getElementsByClassName('deliveryinfo')[5].value.trim() + '-' +
		document.getElementsByClassName('deliveryinfo')[6].value.trim();
		
		var pronofororder = [];
		var wisAmountfororder= [];
		
		for(pro of document.getElementsByClassName('pronofororder')){
			
			pronofororder.push(parseInt(pro.value));
			
		}
		
		for(wisa of document.getElementsByClassName('wisAmountfororder')){
			
			wisAmountfororder.push(parseInt(wisa.innerText));
		}
		
		var pointBonus = parseInt(document.getElementById('pointBonus').innerText.replace(/,/g,""));
		
		var addNo = parseInt(document.getElementById("addNoinput").value);
		
	 
 IMP.request_pay({
	    pg : 'html5_inicis',
	    pay_method : 'card',
	    merchant_uid: ordernum, // 상점에서 관리하는 주문 번호
	    name : '주문명:결제테스트',
	    amount : amount,
	    buyer_email : email,
	    buyer_name : ordererName,
	    buyer_tel : phoneNum,
	    buyer_addr : address,
	    buyer_postcode : postcode
	}, function(rsp) {
		
	    if (rsp.success) {
	    	
	    	location.href = "payresult.ar?impUid="+rsp.imp_uid+"&ordNo="+rsp.merchant_uid+"&ordMessage="+deliveryMsg+"&ordPoPrice="+ordPoPrice+"&ordCaPrice="+amount+"&ordMethod=card&memId=${loginUser.memId}"
	 		+"&postcode="+postcode+"&address="+address+"&receiver="+receiver+"&receiverPhone="+receiverPhone+"&pronofororder="+pronofororder+"&wisAmountfororder="+wisAmountfororder+"&pointBonus="+pointBonus+"&addNo="+addNo;
	    	
// 	        결제 성공 시: 결제 승인 또는 가상계좌 발급에 성공한 경우
// 	        jQuery로 HTTP 요청
// 	        jQuery.ajax({
// 	          url: "insertorder.ar", 
// 	          method: "POST",
// 	          headers: { "Content-Type": "application/json" },
// 	          data: {
// 	            imp_uid: rsp.imp_uid,            // 결제 고유번호
// 	            merchant_uid: rsp.merchant_uid   // 주문번호
// 	          }
// 	        }).done(function (data) {
// 	          // 가맹점 서버 결제 API 성공시 로직
// 	        })
	      } else {
	        alert("결제에 실패하였습니다. " + rsp.error_msg);
	      }

	});
 }
 
</script>

<script>

	//적립 포인트 채우기 스크립트
var totalprice = parseInt(document.getElementById('totalbill').innerText.replace(/,/g,""));
var originalPoint = ${loginUser.graBonus}/100 * totalprice;
var newPoint = parseInt(Math.round((originalPoint/10)) * 10);
	document.getElementById('pointBonus').innerText = newPoint.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");;

</script>



<script>

//배달 주소 자동 채우기 스크립트
	function choiceaddress(address, addNo){
	
    var addpostcode = address.split('@')[0];
    var addaddress = address.split('@')[1];
    var adddetailaddress = address.split('@')[2];
    
	document.getElementsByClassName('deliveryinfo')[1].value = addpostcode;
	document.getElementsByClassName('deliveryinfo')[2].value = addaddress;
	document.getElementsByClassName('deliveryinfo')[3].value = adddetailaddress;
	
	  document.getElementById("sample6_detailAddress").readOnly = true;
	  document.getElementById("addNoinput").value = addNo;
	  
    
}




</script>

<script>	
	const ordererphone = '${loginUser.memPhone}';
	const ordereremail = '${loginUser.memEmail}';

	document.getElementsByClassName('ordererinfo')[1].value = 	ordererphone.split('-')[0];
	document.getElementsByClassName('ordererinfo')[2].value = 	ordererphone.split('-')[1];
	document.getElementsByClassName('ordererinfo')[3].value = 	ordererphone.split('-')[2];
	document.getElementsByClassName('ordererinfo')[4].value = 	ordereremail.split('@')[0];
	document.getElementsByClassName('ordererinfo')[5].value = 	ordereremail.split('@')[1];


</script>

<script>


$('#fotel').on('input', function() {
    var sanitizedValue = this.value.replace(/[^0-9]/g, ''); 
    this.value = sanitizedValue;

});
$('#batel').on('input', function() {
    var sanitizedValue = this.value.replace(/[^0-9]/g, ''); 
    this.value = sanitizedValue;

});
</script>
  
  
  
</body>
</html>