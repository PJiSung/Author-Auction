<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>경매품 리스트 페이지</title>
<style type="text/css">
	body{
		background: rgba(240, 240, 240, 1);
	}

	.auction {
		cursor: pointer;
		width: 22%;
		height: 100%;
		display: inline-block;
		text-align: center;
		margin: 1% 1.5% 2% 1%;
		background-color: #f2f2f2;
		transform: scale(1.00);
		transition: transform 0.2s ease-in-out, box-shadow 0.2s ease-in-out;
		box-shadow: 0px 0px 0px black;
		border-radius: 5%;
	}
	
	.auction:hover{
		transform: scale(1.001);
		transition: transform 0.2s ease-in-out, box-shadow 0.2s ease-in-out;
		box-shadow: 1.5px 1.5px 4px black;
	}
	
	#containerCover {
		min-height: 1000px;
		width : 70%;
		margin: auto;
		width: 70%;
		margin-top: 3%;
		
	}
	
	#sorting {
		float: right;
		width: 80%;
		text-align: right;
	}
	
	.sortingDetail {
		margin: 0 1.5% 0 1.5%;
		font-weight: 500;
	}
	
	#searchType {
		height: 26px;
	}
	
	#searchLine {
		margin-bottom: 10px;
		margin-left: 2%;
		margin-right: 2%;
	}
	
	#searchBtn {
		height: 27px;
		color: white;
		background: black;
		padding-bottom: 6px;
		padding-top: -1px;
		
	}
	
	#searchInput {
		height: 26px;
	}
	
	#mainContent {
		margin-top: 1%;
	}
	
	.img {
		width: 350px;
		height: 300px;
		border-top-left-radius: 5%;
		border-top-right-radius: 5%;
	}
	
	#searchForm{
		display:inline-block;
	}
	
	.sortingDetail:hover{
		cursor:pointer;
		font-weight: 800;
	}
	
	#aucNums{
		font-weight: 600;
	}
	
	#searchType{
		border-radius: 10%;
	}
	
	#searchInput{
		height:27px;
		border-radius: 5%;
		
	}
	
	
</style>

</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<div id="containerCover">
		<div id="searchLine">
			<span id="aucNums">전체 경매<span>${ total }</span> 개
			</span>
			<div id="sorting" style="display:flex; justify-content: flex-end; align-items: center;">
				<span class="sortingDetail" onclick="changeSort('low');">입찰가 낮은순</span>
				<span class="sortingDetail" onclick="changeSort('high');">입찰가 높은순</span>
				<form action="searchAuctionList.ac" id="searchForm" method="get">
					<select name="searchType" id="searchType">
						<option value="all">---------</option>
						<option value="artist">작가명</option>
						<option value="work">작품명</option>
					</select>
					<input type="text" id="searchInput" name="searchContent">
					<button id="searchBtn">&nbsp;검색&nbsp;</button>
				</form>
			</div>
		</div>

		<div id="mainContentCover">
			<div id="mainContent">
				<c:if test="${ empty aList }">
					<h1 style="text-align:center; margin-top:10%; margin-bottom:10%;"> 조회할 데이터가 없습니다</h1>
				</c:if>
			
				<c:forEach items="${ aList }" var="auction">
					<div class="auction" onclick="moveAuction(${auction.aucNo})">
						<img src="${ auction.attRename }" class="img"> <span>${ auction.conProduct }</span><br>
						<span>최고 입찰금 : <fmt:formatNumber value="${ auction.aucFinishPrice }" /> 원
						</span><br>
						<span>경매 기간 : ${ fn:split(auction.aucStartDate, " ")[0] } ~ ${ fn:split(auction.aucFinishDate, " ")[0] }</span>
					</div>
				</c:forEach>
			</div>

			<br>

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
							<c:if test="${ (empty searchContent and searchContent eq '') or  !empty searchContent}">
								<c:param name="searchContent" value="${ searchContent }"/>
							</c:if>
							<c:if test="${ !empty searchType }">
								<c:param name="searchType" value="${ searchType }"/>
							</c:if>
							<c:if test="${ !empty sort }">
								<c:param name="sort" value="${ sort }"></c:param>
							</c:if>
							<c:param name="page" value="${ pi.startPage }"></c:param>
						</c:url>
						<a class="pagiset-link pagiset-first" href="${ goFirst }"> <span
							class="visually-hidden">처음</span>
						</a>
					</div>
					<div class="pagiset-ctrl">
						<c:url var="goBack" value="${ loc }">
							<c:if test="${ (empty searchContent and searchContent eq '') or  !empty searchContent}">
								<c:param name="searchContent" value="${ searchContent }"/>
							</c:if>
							<c:if test="${ !empty searchType }">
								<c:param name="searchType" value="${ searchType }"/>
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
					<c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
						<c:url var="goNum" value="${ loc }">
							<c:if test="${ (empty searchContent and searchContent eq '') or  !empty searchContent}">
								<c:param name="searchContent" value="${ searchContent }"/>
							</c:if>
							<c:if test="${ !empty searchType }">
								<c:param name="searchType" value="${ searchType }"/>
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
							<c:if test="${ (empty searchContent and contsearchContentent eq '') or  !empty searchContent}">
								<c:param name="searchContent" value="${ searchContent }"/>
							</c:if>
							<c:if test="${ !empty searchType }">
								<c:param name="searchType" value="${ searchType }"/>
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
							<c:if test="${ (empty searchContent and searchContent eq '') or  !empty searchContent}">
								<c:param name="searchContent" value="${ searchContent }"/>
							</c:if>
							<c:if test="${ !empty searchType }">
								<c:param name="searchType" value="${ searchType }"/>
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
	<br>
	<jsp:include page="../common/footer.jsp" />
	<script>
		window.onload = () =>{
			const sortingDetail = document.querySelectorAll("span[class='sortingDetail']")
			if(window.location.href.includes("sort=low")){
				sortingDetail[0].style.fontWeight = '1000';
			}else if(window.location.href.includes("sort=high")){
				sortingDetail[1].style.fontWeight = '1000';
			}
		}
		
        function moveAuction(data) {
        	location.href = 'auctionDetail.ac?aucNo=' + data + "&page=" + ${ pi.currentPage};
        }
        
        const changeSort = (data) =>{
        	let url = window.location.href;
        	for(const sortBtn of document.querySelectorAll("span[class='sortingDetail']")){
        		if(sortBtn == event.target){
        			sortBtn.style.fontWeight = '1000';
        			
        			newUrl = null;
        			switch(true){
        			case (url.includes("auctionList.ac") && !url.includes("?page=")):
        				if(!url.includes("?sort=")){
	        				newUrl = url + "?sort=" + data;
	        				history.pushState(null,null,newUrl);
        				}else{
        					newUrl = url.split("?")[0] + "?sort=" + data;
            				history.pushState(null,null,newUrl);
        				}
        				break;
        			case (url.includes("auctionList.ac") && url.includes("?page=")):
        				newUrl = url.split("?")[0] + "?sort=" + data;
        				history.pushState(null,null,newUrl);
        				break;
        			case (url.includes("searchAuctionList.ac") && !url.includes("&page=")):
        				if(!url.includes("&sort=")){
	        				newUrl = url + "&sort=" + data;
	        				history.pushState(null,null,newUrl);
        				}else{
        					newUrl = url.split("&sort=")[0] + "&sort=" + data;
        					history.pushState(null,null,newUrl);
        				}
        				break;
        			case (url.includes("searchAuctionList.ac") && url.includes("&page=")):
        				newUrl = url.split("&page=")[0] + "&sort=" + data;
        				history.pushState(null,null,newUrl);
        				break;
        			}
        		
        		} else{
        			sortBtn.style.fontWeight = '500';
        		}
        	}
        	
        	$("#mainContentCover").load(location.href + " #mainContentCover");
        	
        }
    </script>
</body>
</html>
