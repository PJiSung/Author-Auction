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
<style type="text/css">
	
	body{
		width:100%;
		height:100%;
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
	}
	
	#api {
		width: 600px;
		margin-left: 15%;
		margin-bottom: 3%;
		height: 150px;
		border: 1px black solid;
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
	
	img{
		border-radius: 10px;
	}
	
	.picModal{
		position:absolute;
		width:100%;
		height:100%;
		display: none;
	}
	
	.picModal_overlay{
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
		background:black;
		color:white;
		float:right;
		border-radius: 5px;
		cursor:pointer;
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
	
	

</style>
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	
	<!-- 사진 확대 모달 제작 -->
	<div class="picModal">
  		<div class="picModal_overlay">
	  		<div class="picModal_content">
	  			<img id="picModalImg">
	  			<div>
	  				<button id="closePicModal" onclick="closeModal();" style="width: 10%; margin: 1% 5% 0 0;"> 닫기 </button>
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
				<div style="text-align: right; margin: 1% 1% 1%;" id="timerZone">
					<span></span> <span id="remainingTime"></span>
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
					style="text-align: left; display: inline-block; margin-left: 2%; margin-top: 2%; margin-bottom: 2%; font-size: x-large; font-weight: 600;">경매 시작일</span> <span
					style="float: right; margin-right: 2%; margin-top: 2%; margin-bottom: 2%; font-size: x-large; font-weight: 600;"
					id="nowPrice"> ${ fn:split(auction.aucStartDate, " ")[0] }</span>
				</span> <br clear="all">
				<hr style="margin-left: 2%; width: 96%;">
				<span> <span
					style="text-align: left; display: inline-block; margin-left: 2%; margin-top: 2%; margin-bottom: 2%; font-size: x-large; font-weight: 600;">경매
						마감일</span> <span
					style="float: right; margin-right: 2%; margin-top: 2%; margin-bottom: 2%; font-size: x-large; font-weight: 600;"> ${ fn:split(auction.aucFinishDate, " ")[0] }</span>
				</span> <br clear="all">
				<hr style="margin-left: 2%; width: 96%; margin-bottom: 3%;">
				<div id="forInfoPlace">
				    <div class="infoSpan" id="fees" style="display : inline-block; position:relative" >
						낙찰 수수료 <div class="tooltip">시작 가격을 기준으로 낙찰 수수료는 <span id="fees"></span>원입니다.</div>
					</div>
					<span class="infoSpan" id="priceTagBtn" onclick="onenPriceModal();">경매 호가표</span> <span class="infoSpan" id="likeBtn">관심 목록 추가</span>
					</div>
				<div id="checkId"
					style="width: 96%; border: 1px black solid; display:flex; justify-content:center; align-items: center; text-align: center; margin-top: 2%; height: 9%; margin-left: 2%; padding-top: 3%; padding-bottom: 3%;"></div>
			</div>
		</div>
	</div>
	<div id="picturePlace" style="width: 34.3%; display: flex; margin-top:0.25%; margin-left:15%; align-items: center; justify-content: center; text-align: center;">
		<c:forEach items="${ attachmentList }" var="attachmentList">
			<img src="${ attachmentList.attRename }" style="width: 100px; height: 100px; margin:auto; margin-left:85px;" onclick="expansion(this);">
		</c:forEach>
	</div>
	<br>
	<div id="api">
		<h1>이 작가의 다른 작품</h1>
		api place
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

	<br>
	<br>
	
	<jsp:include page="../common/footer.jsp" />


	<script type="text/javascript">
		window.onload = () =>{
			document.querySelector("span[id='fees']").innerText = (Math.floor(parseInt('${ auction.aucStartPrice}') * 0.198)).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
			const likeBtn = document.querySelector("span[id='likeBtn']")
			
			const check = document.querySelector(("div[id='checkId']"));
			
			if(${ empty loginUser}){
				likeBtn.innerText = '로그인후 관심 목록 추가';
				likeBtn.addEventListener('click',function(){
					location.href="loginView";
				})
			}else{
				if(!likeBtn.innerText.includes("로그인후 관심 목록 추가")){
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
	        	
	        	likeBtn.addEventListener('click',function(){
					if(check.innerText != '로그인을 하셔야 관심 목록에 추가하실 수 있습니다'){
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
					}
	        	})
			}
			
			
			const dateObject = new Date('${ auction.aucStartDate }');
            
			let date = new Date();
            
            let remainTime = (dateObject - date);
            
			let seconds = Math.floor(remainTime / 1000);
			let minutes = Math.floor(seconds / 60);
			let hours = Math.floor(minutes / 60);
			let days = Math.floor(hours / 24);

			hours %= 24;
			minutes %= 60;
			seconds %= 60;
			
			check.innerText = "경매 시작까지 남은 시간 " + days + "일 " + hours + "시간 " + minutes + "분 " + seconds + "초";
			
				if(check == '0일 0시간 0분 0초' || seconds.toString().indexOf('-') != -1){
					check.innerText = '경매 시작'
					document.querySelector("div[id='timerZone']").innerText = '경매 시작'
						check.addEventListener('click',function(){
							if(confirm('경매가 시작되었습니다. \n경매 페이지로 이동하시겠습니까?')){
								location.href='auctionDetail.ac?aucNo=${auction.aucNo}'
							}
						})
					}
			
			const timer = setInterval(function(){
				
				let date = new Date();
	            
	            let remainTime = (dateObject - date);
	            
	            
				let seconds = Math.floor(remainTime / 1000);
				let minutes = Math.floor(seconds / 60);
				let hours = Math.floor(minutes / 60);
				let days = Math.floor(hours / 24);

				hours %= 24;
				minutes %= 60;
				seconds %= 60;
				
				check.innerText = "경매 시작까지 남은 시간 " + days + "일 " + hours + "시간 " + minutes + "분 " + seconds + "초";
				
					if(check == '0일 0시간 0분 0초' || seconds.toString().indexOf('-') != -1){
						clearInterval(timer);
						check.innerText = '경매 시작'
						document.querySelector("div[id='timerZone']").innerText = '경매 시작'
							check.addEventListener('click',function(){
								if(confirm('경매가 시작되었습니다. \n경매 페이지로 이동하시겠습니까?')){
									location.href='auctionDetail.ac?aucNo=${auction.aucNo}'
								}
							})
						}
				}, 1000);
			}
			
		
		const expansion = (data) =>{
        	
        	const modalPicture = document.querySelector("div[class='picModal_content']").children[0];
        	document.querySelector("div[class='picModal_overlay']").style.height = window.innerHeight + "px";
        	modalPicture.setAttribute("src", data.src)
        	modalPicture.style.borderRadius = '10px';
        	
        	console.log(modalPicture);
        	
        	document.querySelector("div[class='picModal']").style.display = 'block';
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
        	  	contentRightCover.style.marginTop = "-5%";
        	  }else{
          	  	contentRightCover.style.marginTop = "-3.5%";
        	  }
          }
        }
        
        window.addEventListener("scroll", handleScroll);
		
        
        const onenPriceModal = () =>{
        	document.querySelector("div[id='priceTag']").style.display = 'block';
        }
        
        const closeModal = () =>{
        	document.querySelector("div[id='priceTag']").style.display = 'none';
        }
	</script>
	<!-- 현재 입찰가를 낙찰 금액으로 변경 -->
	</body>
</html>
		