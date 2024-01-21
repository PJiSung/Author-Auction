<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="com.kh.auction.user.model.vo.Auction" %>
<%@ page import="java.util.Date"%>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<style type="text/css">
	.seeWhich{
		 width: 9%;
		 display: inline-block;
		 text-align: center;
		 padding: 1%;
		 font-weight: 600;
	}
	
	#frame{
		width: 100%;
		height: 100%;
		display: flex;
		align-items: center;
		justify-content: center;
		text-align: center;
		border-top: 1px black solid;
		border-bottom: 1px black solid;
		background: lightgray;
		font-weight: 800;
	}
	
	.firstLine{
		width:14%;
		margin: 1% 0 1% 0;
		
	}
	
	.auction{
		width: 100%;
		height: 110px;
		border-bottom: 1px black solid;
		display: flex;
		align-items: center;
		justify-content: center; 
		text-align: center;
		cursor:pointer;
		transform: scale(1.00);
		transition: transform 0.3s ease-in-out, box-shadow 0.3s ease-in-out;
		box-shadow: 0px 0px 0px black;
	}
	
	.auction:hover{
		transform: scale(1.001);
		transition: transform 0.3s ease-in-out, box-shadow 0.3s ease-in-out;
		box-shadow: 1.5px 1.5px 4px black;
	}
	
	.auctionNoData{
	width: 100%;
		height: 110px;
		border-bottom: 1px black solid;
		display: flex;
		align-items: center;
		justify-content: center; 
		text-align: center;
	}
	
	.checkZone{
		width: 14%;
		height: 100px;
		display: flex;
		justify-content: center;
		align-items: center;
		text-align: center;
	}
	
	#term{
		width: 14%;
		display: flex;
		justify-content: center;
		align-items: center;
		text-align: center;
	}
	
	.detailInfo{
		width: 14%;
		display: flex;
		justify-content: center;
		align-items: center;
		text-align: center;
	}
	
	#deleteBtnPlace{
		width: 100%;
		height: 100%; 
		text-align: right;
		margin-top: 1%;
	}
	
	
	#delBtn{
		width:5%;
		border-radius: 10px;
		color: white;
		background:black;
	}
	
	.eachCheck:hover{
		cursor:pointer;
	}
	
	.price{
		font-weight: 500;
	}
	
	.price:hover{
		cursor:pointer;
		font-weight: 800;
	}
	
</style>

</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<jsp:include page="../common/myPageSide.jsp"/>
	<div id="content-allOver-cover" style="width: 100%; height: 100%; min-height: 1000px;">
		<div id="divine" style="width: 100%; height: 100%;">
			<div id="headline" style="width: 70%; height: 100%; margin: auto;">
				<div
					style="width: 100%; margin-top: 5%; margin-bottom: 5%; font-size: x-large; font-weight: 1000;">관심
					경매 목록</div>
				<div id="btnPlace" style="width: 100%;">
					<div class="seeWhich"
						style="background: gray;"
						onclick="chooseAuction('all');">전체 보기</div>
					<div class="seeWhich"
						style="background: lightgray"
						id="scheduled" onclick="chooseAuction('scheduled');">예정 경매</div>
					<div class="seeWhich"
						style="background: lightgray;"
						id="ongoing" onclick="chooseAuction('ongoing');">진행 경매</div>
					<div class="seeWhich"
						style="background: lightgray;"
						id="end" onclick="chooseAuction('end');">종료 경매</div>
					<span class="price" style="float:right; margin-left:1%;" onclick="sortPrice('high');">금액 높은순</span>
					<span class="price" style="float:right;" onclick="sortPrice('low');">금액 낮은순</span>
				</div>
				<div id="frame">
					<div class="firstLine">
						<input type="checkbox" id="allCheck" name="allCheck" onclick="allCheck(this);">
						<label for="allCheck">전체 선택</label>
					</div>
					<div class="firstLine">경매 번호</div>
					<div class="firstLine">작품 사진</div>
					<div class="firstLine">작가 명</div>
					<div class="firstLine">작품 명</div>
					<div class="firstLine">경매 기간</div>
					<div class="firstLine">경매 현황</div>
				</div>


				

				<div id="onlyLoad">
					<c:if test="${ empty aList }">
						<div class="auctionNoData">
							<h1>조회 가능한 데이터가 없습니다</h1>
						</div>
					</c:if>
					
					<div id="new">
						<c:forEach items="${ aList }" var="auction" varStatus="num">
								<div class="auction" onclick="moveAuction(${auction.aucNo});">
									<div class="checkZone">
										<input type="checkbox" class="eachCheck" onclick="eachCheckForAll();">
									</div>
									<div class="detailInfo">${ auction.aucNo }</div>
									<div class="detailInfo" style="padding: 0.3%;">
										<img src="${ auction.attRename }"
											style="height: 100px; width: 100px;">
									</div>
									<div class="detailInfo" >${ auction.conAuthor }</div>
									<div class="detailInfo">${ auction.conProduct }</div>
									<div id="term">
										<div>시작일 : ${ fn:split(auction.aucStartDate, " ")[0] }<br>종료일 : ${ fn:split(auction.aucFinishDate, " ")[0] }</div>
									</div>
			
									<c:set var="startDateVar" value="${auction.aucStartDate}" />
									<c:set var="endDateVar" value="${auction.aucFinishDate}" />
									<c:set var="num" value="${num.index}" />
									
									
									<%
									Date today = new Date();
									SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
									
									List<Auction> auctionList = (List<Auction>)request.getAttribute("aList");
									int i = (int)pageContext.getAttribute("num");
			
									String auctionStartDateStr = auctionList.get(i).getAucStartDate(); // "2024-01-10 15:30:00" 형태의 값으로 가정
									String auctionEndDateStr = auctionList.get(i).getAucFinishDate();
			
									Date auctionStartDate = dateFormat.parse(auctionStartDateStr);
									Date auctionEndDate = dateFormat.parse(auctionEndDateStr);
									
									if(today.compareTo(auctionStartDate) < 0){
									%>
										<div class="detailInfo"">
											진행 상황 : 예정 경매<br> 시작 금액 : <fmt:formatNumber value="${ auction.aucStartPrice }"/> 원
										</div>
									<%
									}else if(today.compareTo(auctionEndDate) > 0){
									%>
										<div class="detailInfo"">
											진행 상황 : 종료 경매<br> 낙찰 금액 : <fmt:formatNumber value="${ auction.aucFinishPrice }"/> 원
										</div>
									<%
									}else{
									%>
										<div class="detailInfo"">
											진행 상황 : 진행 경매<br> 입찰 금액 : <fmt:formatNumber value="${ auction.aucFinishPrice }"/> 원
										</div>
									<%								
									}
									%>
								</div>
						</c:forEach>
					</div>
					<div id="deleteBtnPlace">
						<button id="delBtn" onclick="deleteLike();">삭제</button>
					</div>
					
					
					<nav class="pagiset pagiset-line">
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
		                  	<c:if test="${ !empty aucStatus }">
		                    	<c:param name="aucStatus" value="${ aucStatus }"></c:param>
		                    </c:if>
		                    <c:if test="${ !empty sort }">
		                    	<c:param name="sort" value="${ sort }"></c:param>
		                    </c:if>
		                     <c:param name="page" value="${ pi.startPage }"></c:param>
		                  </c:url>
		                  <a class="pagiset-link pagiset-first" href="${ goFirst }">
		                     <span class="visually-hidden">처음</span>
		                  </a>
		               </div>
		               <div class="pagiset-ctrl">
		                  <c:url var="goBack" value="${ loc }">
		                    <c:if test="${ !empty aucStatus }">
		                    	<c:param name="aucStatus" value="${ aucStatus }"></c:param>
		                    </c:if>
		                    <c:if test="${ !empty sort }">
		                    	<c:param name="sort" value="${ sort }"></c:param>
		                    </c:if>
		                     <c:param name="page" value="${ pi.currentPage-1 }"></c:param>
		                  </c:url>
		                  <a class="pagiset-link pagiset-prev" href="${ goBack }"> <span
		                     class="visually-hidden">이전</span>
		                  </a>
		               </div>
		            </c:if>
		            <div class="pagiset-list">
		               <c:forEach begin="${ pi.startPage }" end="${ pi.endPage }"
		                  var="p">
		                  <c:url var="goNum" value="${ loc }">
		                     <c:if test="${ !empty aucStatus }">
		                    	<c:param name="aucStatus" value="${ aucStatus }"></c:param>
		                    </c:if>
		                    <c:if test="${ !empty sort }">
		                    	<c:param name="sort" value="${ sort }"></c:param>
		                    </c:if>
		                     <c:param name="page" value="${ p }"></c:param>
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
		                     <c:if test="${ !empty aucStatus }">
		                    	<c:param name="aucStatus" value="${ aucStatus }"></c:param>
		                    </c:if>
		                    <c:if test="${ !empty sort }">
		                    	<c:param name="sort" value="${ sort }"></c:param>
		                    </c:if>
		                     <c:param name="page" value="${ pi.currentPage+1 }"></c:param>
		                  </c:url>
		                  <a class="pagiset-link pagiset-next" href="${ goNext }"> <span
		                     class="visually-hidden">다음</span>
		                  </a>
		               </div>
		               <div class="pagiset-ctrl">
		                  <c:url var="goList" value="${ loc }">
		                     <c:if test="${ !empty aucStatus }">
		                     	<c:param name="aucStatus" value="${ aucStatus }"></c:param>
		                     </c:if>
		                     <c:if test="${ !empty sort }">
		                     	<c:param name="sort" value="${ sort }"></c:param>
		                     </c:if>
		                     <c:param name="page" value="${ pi.maxPage }"></c:param>
		                  </c:url>
		                  <a class="pagiset-link pagiset-last" href="${ goList }"> <span
		                     class="visually-hidden">마지막</span>
		                  </a>
		               </div>
		            </c:if>
		         </nav>
	         </div>
		</div>
	</div>
	</div>
	
	
	<jsp:include page="../common/footer.jsp" />

	<script>
		window.onload = () =>{
			const url = window.location.href;
			if(url.includes("sort=low")){
				document.querySelectorAll("span[class='price']")[1].style.color='orange';
			}else if(url.includes("sort=high")){
				document.querySelectorAll("span[class='price']")[0].style.color='orange';
			}
			
			switch(true){
			case url.includes("aucStatus=all"): 
				changeSee(0);
				break;
			case url.includes("aucStatus=scheduled"): 
				changeSee(1);
				break;
			case url.includes("aucStatus=ongoing"): 
				changeSee(2);
				break;
			case url.includes("aucStatus=end"): 
				changeSee(3);
				break;
			default:
				changeSee(0);
				break;
			}
		}
		
		
		function changeSee(data) {
			const seeWhich = document.querySelectorAll("div[class='seeWhich']");
			seeWhich[data].style.background = 'gray'
			
			for (let i = 0; i < seeWhich.length; i++){
				if(seeWhich[i] != seeWhich[data]){
					seeWhich[i].style.background = 'lightgray'
				}
			}
			
			/* for(const change of seeWhich){
				if(change[data]){
					change[data].style.background = 'gray'
				}else{
					change.style.background = 'lightgray'
				}
			} */
			
		}
		
	
		function allCheck(data){
			if(data.checked){
				for(const checkBox of document.querySelectorAll("input[class='eachCheck']")){
					checkBox.checked = true;
				}
			}else{
				for(const checkBox of document.querySelectorAll("input[class='eachCheck']")){
					checkBox.checked = false;
				}
			}
		}
		
		function eachCheckForAll(){
			let checkCount = 0;
			for(const checkBox of document.querySelectorAll("input[class='eachCheck']")){
				if(checkBox.checked){
					checkCount++;
				}
				if(checkCount == document.querySelectorAll("input[class='eachCheck']").length){
					document.getElementById("allCheck").checked = true;
				}else{
					document.getElementById("allCheck").checked = false;
				}
			}
		}
		
		const deleteLike = () =>{
			let checkedNum = [];
			for(let checkedBox of document.querySelectorAll("input[class='eachCheck']")){
				if(checkedBox.checked){
					checkedNum.push(checkedBox.parentElement.nextElementSibling.innerText);
				}
			}
			if(checkedNum.length > 0){
				$.ajax({
					url:'interest.ac',
					type:'get',
					data:{checkedNum:checkedNum},
					success: (data) =>{
						if(data == 'deleteMypage'){
							$("#new").load(location.href + " #new");
						}
					},
					error: data => console.log(data)
				})
			}
		}
		
		function moveAuction (aucNo){
			if(document.querySelectorAll("div[class='auction']")[0].children[0].tagName != 'H1'){
				if(event.target.className != 'eachCheck' && event.target.className != 'checkZone'){
					switch(event.target.parentElement.children[6].innerText.split(":")[1].trim().split(" ")[0]){
					case '예정':
						//location.href='auctionDetailScheduled.ac?aucNo=' + aucNo + "&page="  + ${ pi.currentPage };
						break;
					default:
						location.href='auctionDetail.ac?aucNo=' + aucNo + "&page=" + ${ pi.currentPage };
						break;
					}
				}
	       	}
		}
		
		const chooseAuction = (data) =>{
		
			for(const priceBtn of document.querySelectorAll("span[class='price']")){
				priceBtn.style.color = 'black';
			}
			const url = window.location.href;
			
			let newUrl = null;
			
			if(!url.includes("?aucStatus=") && !url.includes("?page=") && !url.includes("?sort=")){
			    let newUrl = url + "?aucStatus=" + data;
			    history.pushState(null, null, newUrl);
			}else{
				let newUrl = url.split("?")[0] + "?aucStatus=" + data;
				history.pushState(null, null, newUrl);
			}
			
		    refreshData();
			seeWhich();
		}
		
		function refreshData() {
			$("#onlyLoad").load(location.href + " #onlyLoad");
		}
		
		const seeWhich = () =>{
			document.addEventListener('click',function(event){
				if(event.target.className == 'seeWhich'){
					event.target.style.background = 'gray';
					const clickedElement = event.target;

                    for(let b of document.getElementsByClassName('seeWhich')){
                    	if(b != clickedElement) {
                        	b.style.background = 'lightgray';
						}
					}
				}
			})
		}
		
		const sortPrice = (data) =>{
			
			const url = window.location.href;
			
			let newUrl = null;
			
			let sort = data;
			
			switch(true){
			case (!url.includes("?aucStatus=") && !url.includes("?page=")):
				if(!url.includes("?sort")){
					newUrl = url + "?sort=" + data;
					history.pushState(null,null,newUrl);
				}else{
					newUrl = url.split("?")[0] + "?sort=" + data;
					history.pushState(null,null,newUrl);
				}
				break;
			case (!url.includes("?aucStatus=") && url.includes("?page=")):
				newUrl = url.split("?")[0] + "?sort=" + data;
				history.pushState(null,null,newUrl);
				break;
			case (url.includes("?aucStatus=") && !url.includes("&page=")):
				if(!url.includes("&sort")){
					newUrl = url +"&sort=" + data;
					history.pushState(null,null,newUrl);
				}else{
					newUrl = url.split("&")[0] +"&sort=" + data;
					history.pushState(null,null,newUrl);
				}
				break;
			case (url.includes("?aucStatus=") && url.includes("&page=")):
				newUrl = url.split("&")[0] + "&sort=" + data;
				history.pushState(null,null,newUrl);
				break;
			}
			
			refreshData();
			for(const sortBtn of document.querySelectorAll("span[class='price']")){
				if(sortBtn == event.target){
					sortBtn.style.color = 'orange';
				}else{
					sortBtn.style.color = 'black';
				}
			}	    
		}
    </script>
</body>
</html>
