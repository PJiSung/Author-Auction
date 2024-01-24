<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="imagetoolbar" content="no">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="format-detection" content="telephone=no">
<link rel="shortcut icon" type="image⁄x-icon"
	href="main/icons/logoImage.png">
<link rel="stylesheet" href="rs/reviewList/css/setting.css">
<link rel="stylesheet" href="rs/reviewList/css/style.css">
<link rel="stylesheet" href="rs/reviewDetail/css/setting.css">
<link rel="stylesheet" href="rs/reviewDetail/css/template.css">
<link rel="stylesheet" href="rs/reviewDetail/css/style.css?ver=1">
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<style type="text/css">

.conModal .modalset {
  display: flex;
  flex-direction: column;
  align-items: center;
  position: fixed;
  transition: 0.3s;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  width: 100%;
  max-width: 55rem;
  padding: 5.5rem 1rem;
  background-color: var(--white);
  visibility: hidden;
  opacity: 0;
  z-index: 999;
}

.conModal .modalset.modalset-active {
  visibility: visible;
  opacity: 1;
}

.conModal .modal-header {
  margin-bottom: 1.2rem;
}

.conModal .modal-title {
  font-size: var(--fs-h6);
  font-weight: 700;
  text-align: center;
}

.conModal .modal-body {
  max-height: 26rem;
  overflow-y: auto;
}

.conModal .modal-body p {
  padding: 0 1.7rem;
  text-align: center;
  font-size: var(--fs-p1);
  line-height: var(--lh-p1);
  font-weight: 400;
}

.conModal .modal-footer {
  width: 100%;
  margin-top: 4rem;
  text-align: center;
}

.conModal .modal-footer .btnset {
  width: 100%;
  max-width: 17.6rem;
}

.conModal .modalset-dim {
  display: none;
  position: fixed;
  left: 0;
  top: 0;
  width: 100%;
  height: 100%;
  background-color: rgba(17, 17, 17, 0.5);
  z-index: 300;
}

.basic-N50 .secTd .profilePic {
	display: inline-block;
	width: 35px;
	height: 35px;
	border-radius: 70%;
	overflow: hidden;
	text-align: right;
}

.basic-N50 .secTd .profileImg {
	width: 100%;
	height: 100%;
	object-fit: cover;
}

.basic-N50 .cardset-body {
	line-height: 10px;
	width: 100%;
	padding-left: 5px;
	padding-right: 5px;
}

.basic-N50 .cardset-body .firTd {
	text-align: right;
	height: 10px;
}

.basic-N50 .cardset-body .secTd {
	width: 20px;
}

.basic-N50 .cardset-body .cardset-tit {
	padding-left: 10px;
}

.basic-N50 #search-form button {
	border: 0;
	background-color: transparent;
}

.basic-N50 #search-form {
	border-bottom: 1px solid rgba(0, 0, 0);
	width: 140px;
}

.basic-N50 #search-input {
	width: 100px;
	flex: 1;
	border: none;
	outline: none;
	overflow: hidden;
}

.basic-N50 .addReview {
	width: 80px;
	height: auto;
	text-align: center;
	font-size: 1.5rem;
	padding: 2px;
	background-color: black;
	color: white;
	float: right;
	cursor: pointer;
}

.reviewDetail .reviewInfoTab {
	width: 100%;
}


.reviewDetail #proImgTd {
	width: 100px;
	height: 100px;
	overflow: hidden;
}

.reviewDetail .reviewInfoTab img {
	height: 100%;
}

.reviewDetail .contents-brand .profilePic {
	display: inline-block;
	width: 35px;
	height: 35px;
	border-radius: 70%;
	overflow: hidden;
	text-align: right;
}

.reviewDetail .contents-brand .profileImg {
	width: 100%;
	height: 100%;
	object-fit: cover;
}

.reviewDetail .reviewDetailDivs {
	margin-left: 10px;
	font-size: var(--fs-p2);
	font-weight: 400;
}

.reviewDetail .reviewInfoTab .firTd {
	width: 80%;
}

.reviewDetail .reviewInfoTab .secTd {
	width: 20%;
	text-align: right;
}

.reviewDetail .reviewContentPre {
	padding: 8px;
	min-height: 150px;
	font-weight: 400;
	font-family: var(--ff);
	font-size: 1.5rem;
	color: #14161a;
	box-sizing: content-box;
}

.reviewDetail #productWriter{
	font-size: 1.6rem;
	font-weight: 400;
}

.reviewDetail .newbadge {
	font-size: 1.4rem;
	color: #dc0000;
	margin-left: 10px;
	display: flex;
    align-items: center;
    justify-content: center;
    font-weight: bold;
}

.reviewDetail #timeAgo{
	font-size: 1.4rem;
	color: var(--text-color3);
	margin-left: 10px;
	display: flex;
    align-items: center;
    justify-content: center;
}

.reviewDetail .secTd{
	font-size: 1.5rem;
	color: var(--text-color3);
}

.reviewDetail .updateDeleteDiv {
	margin-left: auto;
	font-size: 1.5rem;
	text-align: center;
	cursor: pointer;
}

.reviewDetail .updateButton {
	display: inline-block;
	width: 50px;
	height: auto;
	padding: 2px;
	background-color: white;
	color: black;
	margin-right: 0.5px;
	border: 1px solid black;
}

.reviewDetail .deleteButton {
	display: inline-block;
	width: 50px;
	height: auto;
	padding: 2px;
	background-color: black;
	color: white;
}

.reviewDetail .submitButton {
	float: right;
	font-size: 1.5rem;
	text-align: center;
	cursor: pointer;
	display: inline-block;
	width: 50px;
	height: auto;
	padding: 2px;
	background-color: black;
	color: white;
}

.reviewDetail #replyContent {
	height: 10rem;
	border-color: transparent;
	padding: 1.6rem 0;
	border-radius: 0;
	box-shadow: none;
	font-family: inherit;
	font-size: var(--fs-p4);
	font-weight: 400;
	width: 100%;
	resize: none;
}

.reviewDetail #reviewReplyBut {
	margin-left: auto;
	cursor: pointer;
}

.reviewDetail .badgeset-text {
	border-radius: 0.6rem;
	max-width: 20rem;
	padding: 0.6rem 1.2rem;
	font-size: var(--fs-p4);
	line-height: 1.8rem;
	color: var(--text-color3);
	border: 1px solid #e5e5e5;
}

body.modal-open {
	overflow: hidden;
 }
 
.modal {
	display: none;
	position: fixed;
	z-index: 200;
	left: 0;
	top: 50%;
	width: 100%;
	overflow: auto;
	background-color: rgb(0, 0, 0);
	background-color: rgba(0, 0, 0, 0.4);
	transform: translateY(-50%); /* 화면 중앙에 맞추기 위한 추가 */
}

.modal-content {
	background-color: #fefefe;
	margin: 15% auto;
	border: 1px solid #888;
	width: 1100px;
	height: 750px;
}

.close {
	display:inline-block;
	*display:inline;
	float: right;
	margin-right: 15px;
	margin-top: 10px;
	cursor: pointer;
}
.close:after {
	display: inline-block;
	content: "\00d7"; 
	font-size:25pt;
}

.reviewDetail {
	width: 100%;
	height: 100%;
}

#selectImagDiv {
	width: 535px;
	height: 535px;
}

#selectImagDiv img {
	width: 100%;
	height: 100%;
	overflow: hidden;
}

#contentsRightId {
	overflow: auto;
	height: 670px;
}

#contentsRightId {
   -ms-overflow-style: none;
}
#contentsRightId::-webkit-scrollbar{
  display:none;
}

#reviewLike{
	margin-left: 5px;
}

.selectReplyDiv{
	padding-top: 15px;
	padding-bottom: 15px;
	border-top: 1px solid #e5e5e5;
}

.newRepTextarea{
	width: 100%;
	height: 10rem;
	margin-top: 10px;
	background-color: #fff;
    background-clip: padding-box;
    border: 1px solid #ced4da;
    transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
	resize: none;
}

.adminDelete{
	position: absolute; 
	right: 35px; 
	top: 30px;
	background-color: black; 
	width: 20px; 
	height: 18px; 
	color: white;
	text-align: center;
	border-radius: 30%;
	display: flex;
  	align-items: center;
  	justify-content: center;
  	cursor: pointer;
}

.EmptySearchResult{
	width: 100%; 
	height:450px; 
	text-align: center; 
	display: flex; 
	align-items: center; 
	justify-content: center; 
	flex-direction: column;
}

.EmptySearchResult p{
	margin-top: 10px;
	color:var(--text-color3)
}

.basic-N50 .contents-sort .tabset .tabset-list, .cardset{
	cursor: pointer;
}


.reviewDetail .contents-thumblist::-webkit-scrollbar {
    width: 5px;
    height: 12px;
}

.reviewDetail .contents-thumblist::-webkit-scrollbar-thumb {
    background-color: rgb(0,0,0,0.1);
    border-radius: 10px;
    background-clip: padding-box;
}

.reviewDetail .contents-thumblist::-webkit-scrollbar-track {
    border-radius: 10px;
}

#repContent{
	padding: 3%;
}

</style>

</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<main class="th-layout-main ">
		<div class="basic-N50" data-bid="SclqBZ0HLO" id="">
			<div class="contents-inner">
				<div class="contents-container container-md">
					<div class="textset">
						<h2 class="textset-tit">REVIEW</h2>
						<button class="contents-btn btn-filter" type="button">
							<img src="rs/reviewList/icons/ico_filter_black.svg" alt="모바일 필터 아이콘">
						</button>
					</div>
					<div style="height: 4rem">
						<div class="addReview" id="goWriteReviewButton">등록</div>
					</div>
					<div class="contents-body">
						<form class="contents-sort" action="searchReview.rv" method="get" id="sortSearchForm">
								<p class="contents-sort-total">AUTHOR AUCTION과 함께하는 일상을 공유해 주세요.</p>
								<div class="contents-sort-sel" style="gap: 1rem">
									<div class="tabset tabset-text" style="width: 120px;">
										<ul class="tabset-list">
											<li class="tabset-item">
												<div class="tabset-link" id="lastetSort"> 
													<span>최신순</span>
												</div>
											</li>
											<li class="tabset-item">
												<div class="tabset-link" id="recommendSort"> 
													<span>추천순</span>
												</div>
											</li>
										</ul>
									</div>
									<div class="selectset selectset-round selectset-lg" style="min-width: 12px;">
										<button class="selectset-toggle btn" type="button" style="height: 40px; width: 100px;">
											<span>전체</span>
										</button>
										<ul class="selectset-list" style="width: 100px;">
											<li class="selectset-item">
												<button class="selectset-link btn" type="button" value="전체">
													<span>전체</span>
												</button>
											</li>
											<li class="selectset-item">
												<button class="selectset-link btn" type="button" value="작품명">
													<span>작품명</span>
												</button>
											</li>
											<li class="selectset-item">
												<button class="selectset-link btn" type="button" value="작가명">
													<span>작가명</span>
												</button>
											</li>
										</ul>
									</div>
									<input type="hidden" name="category" id="selectedCat">
									<input type="hidden" id="selectedSort" name="selectedSort" value="${ selectedSort }">
									<div id="search-form">
										<input type="text" id="search-input" placeholder=" Search" name="keyword" value="${ s.keyword }">
										<button>
											<img alt="검색 버튼" src="main/icons/ico_seach_black.svg">
										</button>
									</div>
								</div>
						</form>

						<div class="contents-list">
							<c:if test="${ !empty rList }">
								<c:forEach items="${ rList }" var="r">
									<div class="cardset cardset-shopping" id="reviewCardset">
										<input type="hidden" value="${ r.revNo }" id="reviewNo">
										<input type="hidden" value="${ r.hasAttm }" id="hasAttachment">
										<input type="hidden" value="${ r.proNo }" id="productNo">
										<input type="hidden" value="${ r.memId }" id="memId">
										<c:if test="${ loginUser.memIsAdmin == 'Y' }">
											<div class="adminDelete" onclick="notGoDetail(event, ${r.revNo})">
												<span>X</span>
											</div>
										</c:if>
										<c:if test="${ r.hasAttm eq 'Y' }">
											<c:forEach items="${ aList }" var="a">
												<c:if test="${ r.revNo eq  a.attBno && a.attFno == 0 && a.attCategory == 1 }">
													<figure class="cardset-figure">
														<img class="cardset-img" src="${a.attRename}" alt="리뷰 이미지">
													</figure>
												</c:if>
											</c:forEach>
										</c:if>
										<c:if test="${ r.hasAttm eq 'N' }">
											<c:forEach items="${ aList }" var="a">
												<c:if test="${ r.proNo eq  a.attBno && a.attFno == 1 && a.attCategory == 4 }">
													<figure class="cardset-figure">
														<img class="cardset-img" src="${a.attRename}" alt="상품 이미지">
													</figure>
												</c:if>
											</c:forEach>
										</c:if>
										<table class="cardset-body"> 
											<tr>
												<td class="secTd">
													<div class="profilePic">
														<img src="${ r.memFileName }" alt="프로필 사진" class="profileImg">
													</div>
												</td>
												<td>
													<h2 class="cardset-tit">${ r.memNickName }</h2>
												</td>
												<td colspan="2" class="firTd"><span class="cardset-name">${ r.revModifyDate }</span>
												</td>
											</tr>
											<tr>
												<td colspan="3">
													<p class="cardset-desc" id="proNameWriter">${ r.proName }&nbsp;|&nbsp;${ r.proWriter }</p>
												</td>
											</tr>
										</table>
									</div>
								</c:forEach>
								
							</c:if>
							<c:if test="${ empty rList }">
								<div class="EmptySearchResult">
									<h2>검색 결과가 없습니다.</h2>
									<p>정확한 검색어 인지 확인하시고 다시 검색해 주세요.</p>
								</div>
							</c:if>
						</div>
					</div>
					<c:if test="${ !empty rList }">
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
										<c:param name="page" value="${ pi.startPage }"></c:param>
										<c:param name="category" value="${ s.category }"></c:param>
										<c:param name="keyword" value="${ s.keyword }"></c:param>
										<c:param name="selectedSort" value="${ s.selectedSort }"></c:param>
									</c:url>
									<a class="pagiset-link pagiset-first" href="${ goFirst }">
										<span class="visually-hidden">처음</span>
									</a>
								</div>
								<div class="pagiset-ctrl">
									<c:url var="goBack" value="${ loc }">
										<c:param name="page" value="${ pi.currentPage-1 }"></c:param>
									</c:url>
									<a class="pagiset-link pagiset-prev" href="${ goBack }"> 
										<span class="visually-hidden">이전</span>
									</a>
								</div>
							</c:if>
							<div class="pagiset-list">
								<c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
									<c:url var="goNum" value="${ loc }">
										<c:param name="page" value="${ p }"></c:param>
										<c:param name="category" value="${ s.category }"></c:param>
										<c:param name="keyword" value="${ s.keyword }"></c:param>
										<c:param name="selectedSort" value="${ selectedSort }"></c:param>
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
									<a class="pagiset-link pagiset-next">
										<span class="visually-hidden">다음</span>
									</a>
								</div>
								<div class="pagiset-ctrl">
									<a class="pagiset-link pagiset-last"> 
										<span class="visually-hidden">마지막</span>
									</a>
								</div>
							</c:if>
							<c:if test="${ pi.currentPage < pi.maxPage }">
								<div class="pagiset-ctrl">
									<c:url var="goNext" value="${ loc }">
										<c:param name="page" value="${ pi.currentPage+1 }"></c:param>
										<c:param name="category" value="${ s.category }"></c:param>
										<c:param name="keyword" value="${ s.keyword }"></c:param>
										<c:param name="selectedSort" value="${ selectedSort }"></c:param>
									</c:url>
									<a class="pagiset-link pagiset-next" href="${ goNext }"> <span
										class="visually-hidden">다음</span>
									</a>
								</div>
								<div class="pagiset-ctrl">
									<c:url var="goList" value="${ loc }">
										<c:param name="page" value="${ pi.maxPage }"></c:param>
										<c:param name="category" value="${ s.category }"></c:param>
										<c:param name="keyword" value="${ s.keyword }"></c:param>
										<c:param name="selectedSort" value="${ selectedSort }"></c:param>
									</c:url>
									<a class="pagiset-link pagiset-last" href="${ goList }"> 
										<span class="visually-hidden">마지막</span>
									</a>
								</div>
							</c:if>
						</nav>
					</c:if>
				</div>
			</div>
		</div>
	</main>
	
	<div id="myModal" class="modal">
		<div class="modal-content">
			<span class="close" id="closeSelectRevMd"></span>
			<div class="reviewDetail" data-bid="qWlQHt9Vh1" id="reviewDetail">
				<form id="reviewDetailForm" method="post">
					<input type="hidden" name="revNo" value="${review.revNo}" id="revNo"> 
					<input type="hidden" name="hasAttachment" value="${review.hasAttm}"> 
					<input type="hidden" name="page" value="${ pi.currentPage }">
					<input type="hidden" value="${ review.memId }" id="reviewMemId">
					<div class="contents-inner">
					<div class="contents-container container-md">
					<div class="contents-left" style="margin: auto; margin-right: 25px; margin-left: 25px;">
						<c:if test="${ review.hasAttm == 'Y' }">
							<c:forEach items="${ aList }" var="a">
								<c:if test="${ a.attFno == 0 && a.attBno == review.revNo && a.attCategory == 1 }">
									<div class="contents-thumbnail" id="selectImagDiv">
										<img class="contents-thumbimg" src="${ a.attRename }" alt="리뷰 썸네일">
									</div>
								</c:if>
							</c:forEach>
							<ul class="contents-thumblist" id="reviewImgUl">
								<c:forEach items="${ aList }" var="a">
									<c:if test="${ a.attBno == review.revNo && a.attCategory == 1 }">
										<li class="contents-thumbitem">
											<img class="contents-thumbimg" src="${ a.attRename }" alt="썸네일이미지">
										</li>
									</c:if>
								</c:forEach>
							</ul>
						</c:if>
						<c:if test="${ review.hasAttm == 'N' }">
							<c:forEach items="${ aList }" var="a">
								<c:if test="${ a.attBno == review.proNo && a.attCategory == 4 && a.attFno == 1 }">
									<div class="contents-thumbnail" id="selectImagDiv">
										<img class="contents-thumbimg" src="${ a.attRename }" alt="상품 썸네일">
									</div>
								</c:if>
							</c:forEach>
							<ul class="contents-thumblist" id="reviewImgUl">
								<c:forEach items="${ aList }" var="a">
									<c:if test="${ a.attBno == review.proNo && a.attCategory == 4 && a.attFno == 1 }">
										<li class="contents-thumbitem">
											<img class="contents-thumbimg" src="${ a.attRename }" alt="썸네일이미지">
										</li>
									</c:if>
								</c:forEach>
							</ul>
						</c:if>
						</div>
							<div class="contents-right" id="contentsRightId">
								<div class="contents-right-group">
									<table class="reviewInfoTab">
										<tbody>
											<tr>
												<td class="firTd" id="productName">
													<h4 class="p1 fw-500" style="font-size: var(--fs-p1);">${ review.proName }</h4>
												</td>
												<td class="secTd" id="reviewCount">조회수 ${ review.revCount }</td>
											</tr>
											<tr>
												<td><h4 class="p1 fw-500" id="productWriter">${ review.proWriter }</h4></td>
												<td class="secTd" id="reviewModifyDate">${ review.revModifyDate }</td>
											</tr>
											<tr>
												<td id="proImgTd" colspan="2">
													<c:forEach items="${ aList }" var="a">
														<c:if test="${a.attBno == review.proNo && a.attCategory == 4 && a.attFno == 1}">
															<img src="${ a.attRename }" alt="작품사진" id="proImage">
														</c:if>
													</c:forEach>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
								<div class="contents-right-group">
									<div class="contents-brand">
										<div class="profilePic">
											<img src="${ review.memFileName }" alt="프로필 사진" class="profileImg" id="memFileName">
										</div>
										<h6 class="reviewDetailDivs" id="memNickname">${ review.memNickName }</h6>
										<c:if test="${ loginUser.memId == review.memId }">
											<div class="updateDeleteDiv">
												<div class="updateButton" id="reviewUpdbut" onclick="updateReview()">수정</div>
												<div class="deleteButton delReview" id="reviewDelBut" onclick="deleteReview()">삭제</div>
											</div>
										</c:if>
									</div>
									<div>
										<pre class="reviewContentPre" id="reviewContent">${ review.revContent }</pre>
									</div>
									<div class="contents-badge-group">
										<div class="contents-brand">
											<div class="contents-brand-group" id="reviewLikeGroup">
												<c:if test="${ empty lList}">
													<button class="contents-btn btn-like-line" type="button" onclick="reviewLikeUp();">
								                        <img src="rs/reviewDetail/icons/ico_like_black_line.svg" alt="하트 라인 아이콘">
								                    </button>
												</c:if>
												 <c:if test="${ !empty lList}">
												 	<c:set var="likeFull" value="false" />
											        <c:forEach items="${lList}" var="l">
											        	<c:if test="${loginUser.memId == l.MEM_ID && review.revNo == l.REV_NO}">
										                	<c:set var="likeFull" value="true"/>
										                </c:if>
											        </c:forEach>
										        	<c:if test="${not likeFull}">
											            <button class="contents-btn btn-like-line" type="button"  onclick="reviewLikeUp();" id="lineLikebut">
											                <img src="rs/reviewDetail/icons/ico_like_black_line.svg" alt="하트 라인 아이콘">
											            </button>
											        </c:if>
											        <c:if test="${likeFull}">
											            <button class="contents-btn btn-like-fill" type="button" onclick="reviewLikeDown();" id="fillLikebut" style="display: block;">
									                        <img src="rs/reviewDetail/icons/ico_like_black_fill.svg" alt="하트 채워진 아이콘">
									                    </button>
											        </c:if>
											    </c:if>
											</div>
										</div>
										<span>좋아요<span id="reviewLike" style="padding-left: 1.2px;">${ review.revLike }</span></span>
										<div id="reviewReplyBut" onclick="reviewReplyBut()">
											<span class="badgeset-text">댓글 ${fn:length(replyList) }</span>
										</div>
									</div>
								</div>
								<div class="contents-right-group" id="replyDiv" style="display: none">
									<div>
										<div class="writeReplyDiv">
											<h4 class="p1 fw-500" style="display: inline-block;">댓글 작성</h4>
											<div class="submitButton" id="submitReply" role="button" onclick="submitReply()">등록</div>
											<textarea class="inputset-textarea form-control" id="replyContent" placeholder="내용을 입력해주세요."></textarea>
										</div>
									</div>
									<div id="ReplyListDiv">
										<c:forEach items="${ replyList }" var="reply" varStatus="status">
											<div class="selectReplyDiv" id="selectReplyDiv">
												<input type="hidden" id="repModifyDate" value="${ reply.repModifyDate }">
												<input type="hidden" id="repCreateDate" value="${ reply.repCreateDate }">
												<input type="hidden" id="repMemId" value="${ reply.memId }">
												<input type="hidden" id="repNo" value="${ reply.repNo }" name="repNo">
												<div class="contents-brand">
													<div class="profilePic">
														<img alt="프로필 사진" src="${ reply.memFileName }" class="profileImg" id="repFileName">
													</div>
													<h6 class="reviewDetailDivs" id="repNickName">${ reply.memNickName }</h6>
													<div class="reviewDetailDivs timeAgo" id="timeAgo"></div>
													<div class="newbadge" id="newbadge"></div>
													<c:if test="${loginUser.memId == reply.memId}">
														<div class="updateDeleteDiv" id="updateDeleteDiv">
															<div class="updateButton" id="replyUpBut" onclick="updateReply(this)">수정</div>
															<div class="deleteButton" id="replyDelBut" onclick="deleteReply(${ reply.repNo })">삭제</div>
														</div>
													</c:if>
												</div>
												<div>
													<p id="repContent">${ reply.repContent }</p>
												</div>
											</div>
										</c:forEach>
									</div>
								</div>
								<div class="contents-right-group">
									<ul class="contents-right-list">
										<li class="contents-right-item">
											<strong>이 작품의 다른 리뷰</strong>
											<div class="contents-amount">
												<button class="contents-btn btn-minus" type="button">
													<img class="icon-md" src="rs/reviewDetail/icons/ico_chevron_left_black.svg" alt="아이콘">
												</button>
												<button class="contents-btn btn-plus" type="button">
													<img class="icon-md" src="rs/reviewDetail/icons/ico_chevron_right_black.svg" alt="아이콘">
												</button>
											</div></li>
										<li>
											<ul class="contents-thumblist" id="anotherReview">
												<c:forEach items="${ allRlist }" var="r">
													<c:if test="${ review.revNo != r.revNo && review.proNo == r.proNo && r.hasAttm == 'Y' }">
														<c:forEach items="${ aList }" var="a">
															<c:if test="${r.revNo == a.attBno && a.attFno == 0 && a.attCategory == 1}">
																<li class="contents-thumbitem" onclick="goAnotherReview(${r.revNo})">
																	<img class="contents-thumbimg" src="${ a.attRename }" alt="리뷰썸네일이미지">
																</li>
															</c:if>
														</c:forEach>
													</c:if>
													<c:if test="${ review.revNo != r.revNo && review.proNo == r.proNo && r.hasAttm == 'N'}">
														<c:forEach items="${ aList }" var="a">
															<c:if test="${a.attBno == review.proNo && a.attCategory == 4 && a.attFno == 1}">
																<li class="contents-thumbitem" onclick="goAnotherReview(${r.revNo})">
																	<img class="contents-thumbimg" src="${ a.attRename }" alt="상품썸네일이미지">
																</li>
															</c:if>
														</c:forEach>
													</c:if>
												</c:forEach>
											</ul>
										</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>


	<div class="conModal">
		<div id="modalSet1" class="modalset">
			<div class="modal-header">
				<h6 class="modal-title">DELETE</h6>
			</div>
			<div class="modal-body">
				<p></p>
			</div>
			<div class="modal-footer">
				<a class="btnset btnset-confirm" id="delConfirmButton" onclick="delConfirmButton()">삭제</a>
				<button type="button" class="btnset btnset-ghost modal-close" id="delCelButton" style="border: 1px solid;">취소</button>
			</div>
		</div>
		<div class="modalset-dim"></div>
	</div>
	
<script type="text/javascript">

const loadReviewDetail = () =>{
    const getSysdate = () => new Date(); // 현재 날짜와 시간 가져오기
    
	const getTimeAgo = (repModifyDate) => { // 인자로 댓글 수정 시간 받아오기
	    const seconds = Math.floor((getSysdate() - repModifyDate) / 1000); // 현재 시간과 리뷰 수정 시간 사이의 초 단위 차이 계산
	    // 시간 간격에 따른 날짜/시간 단위 문자열 정의
	    const interval = { '년': 31536000, '월': 2592000, '주': 604800, '일': 86400, '시간': 3600, '분': 60, '초': 1 };
		
		// 정의된 시간 간격을 기준으로 현재 시간과 경과 시간을 계산하여 날짜/시간 단위 반환
	    for (let i in interval) {
	        const num = Math.floor(seconds / interval[i]);
	        if (num >= 1) {
	            return num + i + '전';
	        }
	    }
	    return '방금 전'; // 경과 시간이 없으면 반환
	};
	
	// 각 댓글들의 수정 시간을 가져와서 Date형식으로 변환
	const repModifyDates = document.querySelectorAll('#repModifyDate');
	for (let i = 0; i < repModifyDates.length; i++) {
	    const repModifyDateValue = repModifyDates[i].value;
	    const repModifyDate = new Date(repModifyDateValue);
		
	    // 시간 경과 단위를 표기할 요소를 선택하고 getTimeAgo 함수를 통해 시간 간격에 따른 문자열 출력
	    const timeAgoDiv = repModifyDates[i].closest('.selectReplyDiv').querySelector('.reviewDetailDivs.timeAgo');
	    timeAgoDiv.innerText = getTimeAgo(repModifyDate);
	}
	
	const newBadge = (repCreateDate) => { // 인자로 댓글 작성시간 받아오기
	    const timeDifference = getSysdate() - repCreateDate; //현재 시간과 댓글 작성 시간 사이의 밀리초 단위 차이 계산
	    const daysDifference = Math.floor(timeDifference / (1000 * 60 * 60 * 24)); // 시간차를 일 수로 변환
	    return daysDifference <= 3 ? 'NEW' : ''; // 댓글 작성 시간이 현재 시간을 기준으로 3일 이내면 'new' 뱃지 반환
	};
	
	// 각 댓글의 작성 시간을 받아와서 Date형식으로 변환
	const repCreateDates = document.querySelectorAll('#repCreateDate');
	for (let i = 0; i < repCreateDates.length; i++) {
	    const repCreateDateValue = repCreateDates[i].value;
	    const repCreateDate = new Date(repCreateDateValue);
		
	    // new 뱃지를 표기할 요소를 선택하여 'newBadge' 함수를 통해 작성날짜가 3일 이내인 댓글에 'new' 뱃지 출력
	    const newBadgeDiv = repCreateDates[i].closest('.selectReplyDiv').querySelector('.newbadge');
	    newBadgeDiv.innerText = newBadge(repCreateDate);
	}
}


const keepSort = () =>{
	let sort = '${ selectedSort }';
	let divs = document.querySelectorAll(".tabset-item div");
	if(sort == "latest"){divs[0].classList.add("active")}
	else if(sort == "recommend"){divs[1].classList.add("active")}
}

window.onload = () =>{
	keepSort();
	const selectedButs = document.querySelectorAll('.selectset-link');
	document.getElementById('selectedCat').value = '전체';
	
	for(let i = 0; i < selectedButs.length; i++){
	   selectedButs[i].addEventListener('click', function() {
	      document.getElementById('selectedCat').value = this.value;
	   });
	}
   
	const selectSort = document.getElementById('selectedSort');
	const sortSearchForm = document.getElementById('sortSearchForm');
	const lastetSort = document.getElementById('lastetSort');
	const recommendSort = document.getElementById('recommendSort');
	lastetSort.addEventListener('click', function(){
	   selectSort.value = 'latest';
	   sortSearchForm.action = 'searchReview.rv';
	   sortSearchForm.submit();
	});
	
	recommendSort.addEventListener('click', function(){
	   selectSort.value = 'recommend';
	   sortSearchForm.action = 'searchReview.rv';
	   sortSearchForm.submit();
	});
	
	const urlSearchParams = new URLSearchParams(window.location.search);
	const selectedSort = urlSearchParams.get('selectedSort');
	if (selectedSort == 'recommend') {
	   recommendSort.classList.add('active');
	   lastetSort.classList.remove('active');
	} else if(selectedSort == 'latest') {
	   recommendSort.classList.remove('active');
	   lastetSort.classList.add('active');
	}
   
   document.getElementById('goWriteReviewButton').addEventListener('click', () =>{
      if( '${loginUser}' != '' ){
         if( '${oList}' != '[]'){
            location.href='writeReview.rv';               
         } else{
            alert('리뷰 등록 가능한 작품이 없습니다.');
         }
      } else{
         alert('리뷰는 로그인 후 등록 가능합니다.');
         location.href="loginView";
      }
   });
   
   
   // 리뷰 상세보기
   const revNos = [];
   const cardsetDiv = document.getElementsByClassName('cardset cardset-shopping');
   for(const card of cardsetDiv){
		const revNo = card.querySelector('#reviewNo').value;
      
		revNos.push(revNo);
		card.addEventListener('click', function(){
		   showModal(revNo);
		   const memId = document.querySelector('#reviewMemId').value;
		   if( '${loginUser.memId}' != memId ){
		      $.ajax({
		         url: 'updateReviewCount.rv',
		         data:{revNo: revNo},
		         success: data =>{
		            const count = document.querySelector('#reviewCount');
		            count.innerText = "조회수 " + data;
		         },
		         error: data => console.log(data)
		      })
		   };
         
         $("#reviewDetail").load(location.href + " #reviewDetail", function() {
            const reviewImgUl = document.getElementById('reviewImgUl');
            const selectImagDiv = document.getElementById('selectImagDiv');

            const reviewImgs = reviewImgUl.querySelectorAll('img');
             for (let i = 0; i < reviewImgs.length; i++) {
                 reviewImgs[i].onclick = function() {
                     selectImagDiv.querySelector('img').src = this.src;
                 };
             }
             loadReviewDetail();
         });
         
      });
   };
   
   document.getElementById("closeSelectRevMd").addEventListener('click', function () {
       for (const revNo of revNos) {
           closeModal(revNo);
       }
   });
}

//상세보기 모달
const showModal = (value) =>{
   let revNo = value;
   let url = window.location.href;
   url = !url.includes("?") ? "?revNo="+revNo : url += "&revNo="+revNo;
   window.history.pushState({}, "Title", url);
   
   $("#reviewDetail").load(location.href + " #reviewDetail");
   
   let modal = document.getElementById('myModal');
   const body = document.body;
   
   modal.style.display = 'block';
   body.style.overflow = 'hidden';
}

const closeModal = (value) =>{
   let modal = document.getElementById('myModal');
   let revNo = value;
   
   let url = window.location.href;
   if(url.includes("?revNo="+revNo)){
      url = url.replace("?revNo="+revNo, "");
   }else if(url.includes("&revNo="+revNo)){
      url = url.replace("&revNo="+revNo, "");
   }
   window.history.pushState({}, "Title", url);
   const body = document.body;
   
   modal.style.display = 'none';
   body.style.overflow = 'auto';
};

//삭제 모달
const showDelModal = () => {
    let modal = document.getElementById('modalSet1');
    let dim = document.querySelector('.modalset-dim');
    modal.classList.add('modalset-active');
    dim.style.display = 'block';
};

const closeDelModal = () => {
    let modal = document.getElementById('modalSet1');
    let dim = document.querySelector('.modalset-dim');
    modal.classList.remove('modalset-active');
    dim.style.display = 'none';
};


const delModalBody = document.querySelector('.modal-body').querySelector('p');
const deleteReview = () =>{
   showDelModal();
   delModalBody.innerHTML = "정말로 삭제하시겠습니까?<br> 삭제 후 게시글을 되돌릴 수 없습니다.";
   document.getElementById('delConfirmButton').setAttribute('data-isReview', 'true');
}

const deleteReply = (repNo) =>{
	showDelModal();
	delModalBody.innerHTML = "정말로 삭제하시겠습니까?<br> 삭제 후 댓글을 되돌릴 수 없습니다.";
	
	const delConfirmButton = document.getElementById('delConfirmButton');
	delConfirmButton.setAttribute('data-isReview', 'false');
	delConfirmButton.setAttribute('data-repNo', repNo);
}

const adminDeleteReview = () =>{
	showDelModal();
	delModalBody.innerHTML = "정말로 삭제하시겠습니까?<br> 삭제 후 게시글을 되돌릴 수 없습니다.";
	document.getElementById('delConfirmButton').setAttribute('data-isReview', 'true');
}

const notGoDetail = (event, revNo) =>{
	document.getElementById('revNo').value = revNo;
	event.stopPropagation();
	adminDeleteReview(revNo);
}

const delConfirmButton = () => {
	const delConfirmButton = document.getElementById('delConfirmButton');
	const isReview = delConfirmButton.getAttribute('data-isReview') == 'true';
    const repNo = delConfirmButton.getAttribute('data-repNo');
	
	if(isReview){
		const revDetailForm = document.getElementById('reviewDetailForm');
		revDetailForm.action = 'deleteReview.rv';
	    revDetailForm.submit();
	} else{
		$.ajax({
			url: "deleteReply.rv",
			data:{repNo: repNo},
			success: (data) =>{
				if(data == 'success'){
					console.log(data);
					$("#ReplyListDiv").load(location.href + " #ReplyListDiv", () =>{
						loadReviewDetail();
					});
					$("#reviewReplyBut").load(location.href + " #reviewReplyBut");
				}
			},
			error: data => console.log(data)
		})
	}
	closeDelModal();
}

document.getElementById('delCelButton').addEventListener('click', () =>{
   closeDelModal();
});

const updateReview = () =>{
   const revDetailForm = document.getElementById('reviewDetailForm');
   revDetailForm.action = 'goUpdateReview.rv';
   revDetailForm.submit();
}

const reviewReplyBut = () =>{
   if(replyDiv.style.display == 'none'){
      replyDiv.style.display = 'block';
   } else{
      replyDiv.style.display = 'none';
   }
}

const submitReply = () =>{
   if('${loginUser}' != ''){
      $.ajax({
         url: "insertReply.rv",
         data:{revNo: document.getElementById('revNo').value, 
              repContent: document.getElementById('replyContent').value,
              memId:'${loginUser.memId}'},
         success: (data) =>{
            if(data == 'success'){
               console.log(data);
               $("#ReplyListDiv").load(location.href + " #ReplyListDiv", () =>{
					loadReviewDetail();
				});
				$("#reviewReplyBut").load(location.href + " #reviewReplyBut");
				document.getElementById('replyContent').value='';
            }
         },
         error: data => console.log(data)
      })
   } else{
      alert('댓글은 로그인 후 등록 가능합니다.');
      location.href="loginView";
   }
}

let isUpdating = false;
const updateReply = (btn) => {
    if (isUpdating) {
        return;
    }

    isUpdating = true;

    btn.innerText = '완료';
    btn.nextElementSibling.style.display = 'none';

    const repDiv = btn.closest('.selectReplyDiv');
    const repNo = repDiv.querySelector('#repNo').value;

    const repContent = repDiv.querySelector('#repContent');
    const newTextarea = document.createElement('textarea');
    newTextarea.className = 'newRepTextarea';
    newTextarea.value = repContent.innerText.trim();
    repContent.parentNode.replaceChild(newTextarea, repContent);

    if (btn.innerText === '완료') {
        btn.onclick = () => {
            const newRepContent = repDiv.querySelector('.newRepTextarea').value.trim();
            console.log(newRepContent);
            $.ajax({
                url: "updateReply.rv",
                data: {
                    repNo: repNo,
                    repContent: newRepContent,
                    memId: '${loginUser.memId}'
                },
                success: (data) => {
                    if (data == 'success') {
                        console.log(data);
                        $("#ReplyListDiv").load(location.href + " #ReplyListDiv", () =>{
    						loadReviewDetail();
    					});
                    }
                    isUpdating = false;
                },
                error: (data) => {
                    console.log(data);
                    isUpdating = false;
                }
            });
        };
    }
}


const reviewLikeUp = () =>{
	const reviewMemId = document.querySelector('#reviewMemId').value;
	console.log('${loginUser.memId}');
	if('${loginUser.memId}' == ''){
		alert('로그인 후 이용 가능합니다.');
	} else if('${loginUser.memId}' == reviewMemId) {
		alert('작성하신 글은 [좋아요] 버튼을 누를 수 없습니다.');
	} else{
		$.ajax({
		      url: 'insertReviewLike.rv',
		      data:{memId: '${loginUser.memId}', 
		           revNo: document.getElementById('revNo').value},
		      success: data =>{
		         console.log(data);
		         const like = document.querySelector('#reviewLike');
		         like.innerText = data;
		         $("#reviewLikeGroup").load(location.href + " #reviewLikeGroup");
		      },
		      error: data => console.log(data)
		   })
	}
}

const reviewLikeDown = () =>{
   $.ajax({
      url: 'deleteReviewLike.rv',
      data:{memId: '${loginUser.memId}', 
           revNo: document.getElementById('revNo').value},
      success: data =>{
         console.log(data);
         const like = document.querySelector('#reviewLike');
         like.innerText = data;
         $("#reviewLikeGroup").load(location.href + " #reviewLikeGroup");
      },
      error: data => console.log(data)
   })
}

const goAnotherReview = (value) =>{
	   let revNo = value;
	   let url = window.location.href;
	   url = "?revNo="+revNo;
	   window.history.pushState({}, "Title", url);
	   
	   $("#reviewDetail").load(location.href + " #reviewDetail", function() {
		   
		   const memId = document.querySelector('#reviewMemId').value;
		   if( '${loginUser.memId}' != memId ){
		      $.ajax({
		         url: 'updateReviewCount.rv',
		         data:{revNo: revNo},
		         success: data =>{
		            const count = document.querySelector('#reviewCount');
		            count.innerText = "조회수 " + data;
		         },
		         error: data => console.log(data)
		      })
		   };
		   
           const reviewImgUl = document.getElementById('reviewImgUl');
           const selectImagDiv = document.getElementById('selectImagDiv');

           const reviewImgs = reviewImgUl.querySelectorAll('img');
            for (let i = 0; i < reviewImgs.length; i++) {
                reviewImgs[i].onclick = function() {
                    selectImagDiv.querySelector('img').src = this.src;
                };
            }
            loadReviewDetail();
        });
	   
	   let modal = document.getElementById('myModal');
	   modal.style.display = 'block';
}
</script> 

	<jsp:include page="../common/footer.jsp" />
	<script src="rs/reviewList/js/setting.js"></script>
	<script src="rs/reviewList/js/script.js"></script>
	<script src="rs/reviewDetail/js/setting.js"></script>
	<script src="rs/reviewDetail/js/script.js"></script>
</body>