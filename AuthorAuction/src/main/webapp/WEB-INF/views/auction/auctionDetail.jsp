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
	  	width: 50px;
	  	height: 100px;
	  	display:inline-block;
	  	cursor:pointer;
	  }
		
		#api {
			width: 600px;
			margin-left: 15%;
			margin-bottom: 3%;
			height: 150px;
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
	
	</style>
	</head>
	<body>
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
				<img src="${ auction.attRename }" style="width: 600px; height: 600px; border-radius: 15px;">
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
			<div class="owl-carousel owl-theme">
			</div>
		</div>
	
	
		<div style="width: 600px; margin-left: 15%;">
			<div style="font-size:40px; font-weight: 1000;">작품 설명</div>
			<br>
			<p id="explain">${ auction.conEtc } overflow${ auction.conEtc } overflow${ auction.conEtc } overflow${ auction.conEtc } overflow${ auction.conEtc } overflow${ auction.conEtc } overflow${ auction.conEtc } overflow${ auction.conEtc } overflow${ auction.conEtc } overflow${ auction.conEtc } overflow${ auction.conEtc } overflow${ auction.conEtc } overflow${ auction.conEtc } overflow${ auction.conEtc } overflow${ auction.conEtc } overflow</p>
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

        	var xhr = new XMLHttpRequest();
        	var url = 'http://openapi.seoul.go.kr:8088/6b645362786b79773339516a6f6f59/json/SemaPsgudInfoKorInfo/1/1000'; /* URL */
        	xhr.open('GET', url,false);
        	xhr.onreadystatechange = function () {
        	    if (this.readyState == xhr.DONE) {  
        	        if(xhr.status == 200||xhr.status == 201){
        	            let jsonResponse = JSON.parse(xhr.responseText);
        	            let itemsContainer = document.querySelector("div[class='owl-carousel owl-theme']");

        	            for (let i = 0; i < jsonResponse.SemaPsgudInfoKorInfo.row.length; i++){
        	                let row = jsonResponse.SemaPsgudInfoKorInfo.row[i];
	 
        	                console.log(row.main_image);
        	                if(row.writr_nm == '${ auction.conAuthor }'){
        	                    let imgElement = document.createElement("img");
        	                    imgElement.src = row.main_image;
        	                    imgElement.className = 'item'
        	                    imgElement.onclick = function(){
        	                    	expansion(this)
        	                    }

        	                    itemsContainer.appendChild(imgElement);
        	                }
        	            }

        	            // 호출된 API의 응답을 받은 후 캐러셀을 초기화
        	            carasel();
        	        }
        	    }
        	};
        	xhr.send('');

        	function carasel(){
        	    const itemsLength = document.querySelectorAll("div[class='item']").length;

        	    var owl = $('.owl-carousel'); 
        	    owl.owlCarousel({
        	        items: 5,
        	        loop: true, // 항목들을 무한으로 반복하여 보여줄지 여부
        	        autoplay: true, // 자동	으로 슬라이드 쇼를 시작할지 여부
        	        autoplayTimeout: 3000, // 다음 이미지로 넘어가는 시간 (단위 : 밀리초)
        	        autoplayHoverPause: true, // 마우스가 이미지에 위에 있을 때 자동 슬라이드를 일시중지 할지 여부
        	    });           
        	}

	    </script>
	</body>
</html>
