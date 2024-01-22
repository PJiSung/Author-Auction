<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="imagetoolbar" content="no">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="format-detection" content="telephone=no">
<link rel="stylesheet" href="rs/myReviewList/css/setting.css">
<link rel="stylesheet" href="rs/myReviewList/css/template.css">
<link rel="stylesheet" href="rs/myReviewList/css/style.css">
<link rel="stylesheet" href="rs/reviewDetail/css/setting.css">
<link rel="stylesheet" href="rs/reviewDetail/css/template.css">
<link rel="stylesheet" href="rs/reviewDetail/css/style.css?ver=1">
<title>Insert title here</title>

<style type="text/css">
.tableset-proImg img{
   margin: 0;
   width:50px;
   height: 50px;
   overflow: hidden;
}

.tableset-author{
	overflow: hidden;
 	text-overflow: ellipsis;
 	white-space: nowrap;
}

.tableset-content{
	text-overflow:ellipsis; 
	overflow:hidden; 
	white-space:nowrap;
}

.selectDateDiv{
	position: relative;
	left: 9.5%;
}

.selectDateDiv input{
	height: 56px;
	border: 1px solid var(--border-color);
	padding: 10px;
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
	height: 100%;
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

#revContentTd, .tableset-order04, .tableset-content, .tableset-order05{
	max-width:200px;
	overflow:hidden;
	white-space:nowrap;
	text-overflow:ellipsis;
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

.reviewTableTr, .replyTableTr,.selectDateDiv input{
	cursor: pointer;
}

.selectDateDiv input, .selectset.selectset-lg .btn{
	border-radius: 0.6rem
}

</style>
</head>
<body>
  <jsp:include page="../common/header.jsp"/>
  <jsp:include page="../common/myPageSide.jsp"/>
  <main class="th-layout-main ">
    <div class="myReview" data-bid="ftLQde19y6">
      <div class="contents-inner">
        <div class="contents-container container-md">
          <div class="textset textset-h2">
            <h2 class="textset-tit">MY PAGE - REVIEW</h2>
          </div>
          <div class="tabset tabset-brick">
            <ul class="tabset-list tabset-sm tabset-fill">
              <li class="tabset-item">
                <a href="myReviewList.rv?listType=reviewList" class="tabset-link" id="reviewListbutton">
                  작성한 리뷰
                </a>
              </li>
              <li class="tabset-item">
                <a href="myReviewList.rv?listType=replyList" class="tabset-link" id="replyListbutton">
                  작성한 댓글
                </a>
              </li>
            </ul>
          </div>
          <div id="myPage-reviewListDiv">
          	<form id="myReviewListForm" action="myReviewList.rv">
          	  <input type="hidden" name="selectedSort" value="${ sr.selectedSort }" id="selectedSort">
          	  <input type="hidden" name="category" id="revCategory">
	          <div class="contents-search">
	            <p class="contents-result" id="revTotalCount"> 전체<span> ${ revListCount }</span>개 </p>
	            <div class="selectDateDiv">
	            	<input type="date" name="strDate">&nbsp;-&nbsp;
	            	<input type="date" name="endDate">
	            </div>
	            <div class="contents-form">
	              <div class="selectset selectset-lg">
	                <button class="selectset-toggle btn" type="button">
	                  <span id="selectedCategorySpan">전체</span>
	                </button>
	                <ul class="selectset-list">
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
	              <div class="inputset inputset-lg">
	                <button class="inputset-icon icon-right icon-search btn" type="submit" aria-label="아이콘"></button>
	                <input type="text" class="inputset-input form-control" placeholder="Serach" aria-label="내용" name="keyword">
	              </div>
	            </div>
	          </div>
	          <c:if test="${ !empty rList }">
	          	<div class="tableset" id="reviewTable">
	            <table class="tableset-table table" >
	              <colgroup>
	                <col>
	                <col>
	                <col>
	                <col>
	                <col>
	                <col>
	                <col>
	              </colgroup>
	              <thead class="thead-light thead-border-top">
	                <tr>
	                  <th scope="col">No.</th>
	                  <th scope="col">사진</th>
	                  <th scope="col">작품명</th>
	                  <th scope="col">작가명</th>
	                  <th scope="col">리뷰 내용</th>
	                  <th scope="col">리뷰 작성일</th>
	                  <th scope="col">추천수</th>
	                  <th scope="col">조회수</th>
	                </tr>
	              </thead>
	              <tbody>
	                <c:forEach items="${ rList }" var="r" varStatus="status">
		                <tr id="reviewTableTr" class="reviewTableTr">
		                  <td class="tableset-mobile">${ r.revNo }<input type="hidden" value="${ r.revNo }" id="reviewNo"></td>
		                  <td class="tableset-proImg">
		                  	<c:forEach items="${ aList }" var="a">
		                  		<c:if test="${a.attBno == r.proNo && a.attCategory == 4 && a.attFno == 1}">
				                  	<img alt="작품 사진" src="${ a.attRename }">
		                  		</c:if>
		                  	</c:forEach>
						  </td>
		                  <td class="tableset-author">${ r.proName }</td>
		                  <td class="tableset-order04">${ r.proWriter }</td>
			              <td class="tableset-order05" id="revContentTd">${ r.revContent }</td>
		                  <td class="tableset-order05">${ r.revCreateDate }</td>
		                  <td class="tableset-mobile">${ r.revLike }</td>
		                  <td class="tableset-mobile">${ r.revCount }</td>
		                </tr>
	                </c:forEach>
	              </tbody>
	            </table>
	          </div>
	          <nav class="pagiset pagiset-line">
				<c:if test="${ revPi.currentPage <= 1 }">
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
				<c:if test="${ revPi.currentPage > 1 }">
					<div class="pagiset-ctrl">
						<c:url var="goFirst" value="${ loc }">
							<c:param name="page" value="${ revPi.startPage }"></c:param>
							<c:param name="category" value="${ sr.category }"></c:param>
							<c:param name="keyword" value="${ sr.keyword }"></c:param>
							<c:param name="strDate" value="${ sr.strDate }"></c:param>
							<c:param name="endDate" value="${ sr.endDate }"></c:param>
							<c:param name="selectedSort" value="${ sr.selectedSort }"></c:param>
							<c:param name="listType" value="${ listType }"/>
						</c:url>
						<a class="pagiset-link pagiset-first" href="${ goFirst }">
							<span class="visually-hidden">처음</span>
						</a>
					</div>
					<div class="pagiset-ctrl">
						<c:url var="goBack" value="${ loc }">
							<c:param name="page" value="${ revPi.currentPage-1 }"></c:param>
							<c:param name="category" value="${ sr.category }"></c:param>
							<c:param name="keyword" value="${ sr.keyword }"></c:param>
							<c:param name="strDate" value="${ sr.strDate }"></c:param>
							<c:param name="endDate" value="${ sr.endDate }"></c:param>
							<c:param name="selectedSort" value="${ sr.selectedSort }"></c:param>
							<c:param name="listType" value="${ listType }"/>
						</c:url>
						<a class="pagiset-link pagiset-prev" href="${ goBack }"> 
							<span class="visually-hidden">이전</span>
						</a>
					</div>
				</c:if>
				<div class="pagiset-list" id="pagiset-list">
					<c:forEach begin="${ revPi.startPage }" end="${ revPi.endPage }" var="p">
						<c:url var="goNum" value="${ loc }">
							<c:param name="page" value="${ p }"></c:param>
							<c:param name="category" value="${ sr.category }"></c:param>
							<c:param name="keyword" value="${ sr.keyword }"></c:param>
							<c:param name="strDate" value="${ sr.strDate }"></c:param>
							<c:param name="endDate" value="${ sr.endDate }"></c:param>
							<c:param name="selectedSort" value="${ sr.selectedSort }"></c:param>
							<c:param name="listType" value="${ listType }"/>
						</c:url>
						<c:choose>
							<c:when test="${p eq revPi.currentPage}">
								<a class="pagiset-link active-fill" href="${ goNum }">${ p }</a>
							</c:when>
							<c:otherwise>
								<a class="pagiset-link" href="${ goNum }">${ p }</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</div>
	
				<c:if test="${ revPi.currentPage >= revPi.maxPage }">
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
				<c:if test="${ revPi.currentPage < revPi.maxPage }">
					<div class="pagiset-ctrl">
						<c:url var="goNext" value="${ loc }">
							<c:param name="page" value="${ revPi.currentPage+1 }"></c:param>
							<c:param name="category" value="${ sr.category }"></c:param>
							<c:param name="keyword" value="${ sr.keyword }"></c:param>
							<c:param name="strDate" value="${ sr.strDate }"></c:param>
							<c:param name="endDate" value="${ sr.endDate }"></c:param>
							<c:param name="listType" value="${ listType }"/>
						</c:url>
						<a class="pagiset-link pagiset-next" href="${ goNext }"> <span
							class="visually-hidden">다음</span>
						</a>
					</div>
					<div class="pagiset-ctrl">
						<c:url var="goList" value="${ loc }">
							<c:param name="page" value="${ revPi.maxPage }"></c:param>
							<c:param name="category" value="${ sr.category }"></c:param>
							<c:param name="keyword" value="${ sr.keyword }"></c:param>
							<c:param name="strDate" value="${ sr.strDate }"></c:param>
							<c:param name="endDate" value="${ sr.endDate }"></c:param>
							<c:param name="listType" value="${ listType }"/>
						</c:url>
						<a class="pagiset-link pagiset-last" href="${ goList }"> 
							<span class="visually-hidden">마지막</span>
						</a>
					</div>
				</c:if>
			</nav>
	          </c:if>
	          <c:if test="${ empty rList }">
	          	<div class="EmptySearchResult">
					<h2>검색 결과가 없습니다.</h2>
					<p>정확한 검색어 인지 확인하시고 다시 검색해 주세요.</p>
				</div>
	          </c:if>
	          
			<input type="hidden" name="listType" value="${ listType }">
			</form>
          </div>
          
          <div id="myPage-replyListDiv" style="display: none;">
          	<form action="myReviewList.rv">
          	 	<input type="hidden" name="category" id="repCategory">
	          	<div class="contents-search">
		            <p class="contents-result" id="repTotalCount"> 전체<span> ${ repListCount }</span>개 </p>
		            <div class="selectDateDiv">
		            	<input type="date" name="strDate">&nbsp;-&nbsp;
		            	<input type="date" name="endDate">
		            </div>
		            <div class="contents-form" style="padding-right: 0">
		              <div class="selectset selectset-lg">
		                <button class="selectset-toggle btn" type="button">
		                  <span id="selectedRepCategorySpan">전체</span>
		                </button>
		                <ul class="selectset-list">
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
		              <div class="inputset inputset-lg">
		                <button class="inputset-icon icon-right icon-search btn" type="submit" aria-label="아이콘"></button>
		                <input type="text" class="inputset-input form-control" placeholder="Serach" aria-label="내용" name="keyword">
		              </div>
		            </div>
		          </div>
		          
		          <c:if test="${ !empty pList }">
		          	<div class="tableset" id="replyTable">
			            <table class="tableset-table table" style="table-layout:fixed; width: 100%" id="replyTable">
			              <colgroup>
			                <col>
			                <col>
			                <col>
			                <col>
			                <col>
			                <col>
			                <col>
			              </colgroup>
			              <thead class="thead-light thead-border-top">
			                <tr>
			                  <th scope="col" style="width: 10%;">No.</th>
			                  <th scope="col" style="width: 8%;">사진</th>
			                  <th scope="col" style="width: 16%;">작품명</th>
			                  <th scope="col" style="width: 22%;">작가명</th>
			                  <th scope="col" style="width: 32%;">댓글 내용</th>
			                  <th scope="col" style="width: 12%;">댓글 작성일</th>
			                </tr>
			              </thead>
			              <tbody>
			                <c:forEach items="${ pList }" var="p">
				                <tr class="replyTableTr">
				                  <td class="tableset-mobile">${ p.repNo }<input type="hidden" value="${ p.revNo }" id="replyNo"></td>
				                  <td class="tableset-proImg">
				                  	<c:forEach items="${ aList }" var="a">
				                  		<c:if test="${a.attBno == p.proNo && a.attCategory == 4 && a.attFno == 1}">
						                  	<img alt="작품 사진" src="${ a.attRename }">
				                  		</c:if>
				                  	</c:forEach>
								  </td>
				                  <td class="tableset-author">${ p.proName }</td>
				                  <td class="tableset-order04">${ p.proWriter }</td>
				                  <td class="tableset-content">${ p.repContent }</td>
				                  <td class="tableset-order05">${ fn:split(p.repCreateDate, ' ')[0] }</td>
				                </tr>
			                </c:forEach>
			              </tbody>
			            </table>
			          </div>
			          <nav class="pagiset pagiset-line" id="replyPage">
						<c:if test="${ repPi.currentPage <= 1 }">
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
						<c:if test="${ repPi.currentPage > 1 }">
							<div class="pagiset-ctrl">
								<c:url var="goFirst" value="${ loc }">
									<c:param name="page" value="${ repPi.startPage }"></c:param>
									<c:param name="category" value="${ sr.category }"></c:param>
									<c:param name="keyword" value="${ sr.keyword }"></c:param>
									<c:param name="strDate" value="${ sr.strDate }"></c:param>
									<c:param name="endDate" value="${ sr.endDate }"></c:param>
									<c:param name="listType" value="${ listType }"/>
									<c:param name="selectedSort" value="${ sr.selectedSort }"></c:param>
								</c:url>
								<a class="pagiset-link pagiset-first" href="${ goFirst }">
									<span class="visually-hidden">처음</span>
								</a>
							</div>
							<div class="pagiset-ctrl">
								<c:url var="goBack" value="${ loc }">
									<c:param name="page" value="${ repPi.currentPage-1 }"></c:param>
									<c:param name="category" value="${ sr.category }"></c:param>
									<c:param name="keyword" value="${ sr.keyword }"></c:param>
									<c:param name="strDate" value="${ sr.strDate }"></c:param>
									<c:param name="endDate" value="${ sr.endDate }"></c:param>
									<c:param name="listType" value="${ listType }"/>
									<c:param name="selectedSort" value="${ sr.selectedSort }"></c:param>
								</c:url>
								<a class="pagiset-link pagiset-prev" href="${ goBack }"> 
									<span class="visually-hidden">이전</span>
								</a>
							</div>
						</c:if>
						<div class="pagiset-list">
							<c:forEach begin="${ repPi.startPage }" end="${ repPi.endPage }" var="p">
								<c:url var="goNum" value="${ loc }">
									<c:param name="page" value="${ p }"></c:param>
									<c:param name="category" value="${ sr.category }"></c:param>
									<c:param name="keyword" value="${ sr.keyword }"></c:param>
									<c:param name="strDate" value="${ sr.strDate }"></c:param>
									<c:param name="endDate" value="${ sr.endDate }"></c:param>
									<c:param name="listType" value="${ listType }"/>
									<c:param name="selectedSort" value="${ sr.selectedSort }"></c:param>
								</c:url>
								<c:choose>
									<c:when test="${p eq repPi.currentPage}">
										<a class="pagiset-link active-fill" href="${ goNum }">${ p }</a>
									</c:when>
									<c:otherwise>
										<a class="pagiset-link" href="${ goNum }">${ p }</a>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</div>
			
						<c:if test="${ repPi.currentPage >= repPi.maxPage }">
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
						<c:if test="${ repPi.currentPage < repPi.maxPage }">
							<div class="pagiset-ctrl">
								<c:url var="goNext" value="${ loc }">
									<c:param name="page" value="${ repPi.currentPage+1 }"></c:param>
									<c:param name="category" value="${ sr.category }"></c:param>
									<c:param name="keyword" value="${ sr.keyword }"></c:param>
									<c:param name="strDate" value="${ sr.strDate }"></c:param>
									<c:param name="endDate" value="${ sr.endDate }"></c:param>
									<c:param name="listType" value="${ listType }"/>
									<c:param name="selectedSort" value="${ sr.selectedSort }"></c:param>
								</c:url>
								<a class="pagiset-link pagiset-next" href="${ goNext }"> <span
									class="visually-hidden">다음</span>
								</a>
							</div>
							<div class="pagiset-ctrl">
								<c:url var="goList" value="${ loc }">
									<c:param name="page" value="${ repPi.maxPage }"></c:param>
									<c:param name="category" value="${ sr.category }"></c:param>
									<c:param name="keyword" value="${ sr.keyword }"></c:param>
									<c:param name="strDate" value="${ sr.strDate }"></c:param>
									<c:param name="endDate" value="${ sr.endDate }"></c:param>
									<c:param name="listType" value="${ listType }"/>
									<c:param name="selectedSort" value="${ sr.selectedSort }"></c:param>
								</c:url>
								<a class="pagiset-link pagiset-last" href="${ goList }"> 
									<span class="visually-hidden">마지막</span>
								</a>
							</div>
						</c:if>
					</nav>
		          </c:if>
		          <c:if test="${ empty pList }">
		          	<div class="EmptySearchResult">
						<h2>검색 결과가 없습니다.</h2>
						<p>정확한 검색어 인지 확인하시고 다시 검색해 주세요.</p>
					</div>
		          </c:if>
		          
				<input type="hidden" name="listType" value="${ listType }">
          	</form>
          </div>
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
					<input type="hidden" value="${review.memId}" id="memId"> 
					<input type="hidden" name="hasAttachment" value="${review.hasAttm}"> 
					<input type="hidden" name="page" value="${ pi.currentPage }">
					<input type="hidden" name="beforeURL" id="beforeURL">
					<div class="contents-inner">
					<div class="contents-container container-md">
					<div class="contents-left" style="margin: auto; margin-right: 25px; margin-left: 25px;">
						<c:if test="${ review.hasAttm == 'Y' }">
							<c:forEach items="${ aList }" var="a">
								<c:if test="${ a.attFno == 0 && a.attBno == review.revNo && a.attCategory == 1 }">
									<div class="contents-thumbnail selectImagDiv" id="selectImagDiv">
										<img class="contents-thumbimg" src="${ a.attRename }" alt="리뷰 썸네일">
									</div>
								</c:if>
							</c:forEach>
							<ul class="contents-thumblist reviewImgUl" id="reviewImgUl">
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
											<span class="badgeset-text">댓글 ${fn:length(replyList)}</span>
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
										<c:forEach items="${ replyList }" var="reply">
											<div class="selectReplyDiv" id="selectReplyDiv">
												<input type="hidden" id="repModifyDate" value="${ reply.repModifyDate }">
												<input type="hidden" id="repCreateDate" value="${ reply.repCreateDate }">
												<input type="hidden" id="repNo" value="${ reply.repNo }" name="repNo">
												<div class="contents-brand">
													<div class="profilePic">
														<img alt="프로필 사진" src="${ reply.memFileName }" class="profileImg" id="repFileName">
													</div>
													<h6 class="reviewDetailDivs" id="repNickName">${ reply.memNickName }</h6>
													<div class="reviewDetailDivs timeAgo" id="timeAgo"></div>
													<div class="newbadge" id="newbadge"></div>
													<c:if test="${loginUser.memId == reply.memId}">
														<div class="updateDeleteDiv">
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
													<c:if test="${ review.revNo != r.revNo && review.proNo == r.proNo && r.hasAttm == 'Y'}">
														<c:forEach items="${ aList }" var="a">
															<c:if test="${r.revNo == a.attBno && a.attFno == 0}">
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
	
  <jsp:include page="../common/footer.jsp"/>
  
  <script type="text/javascript">
	  const reviewList = document.getElementById('myPage-reviewListDiv');
	  const replyList = document.getElementById('myPage-replyListDiv');
	  const reviewListbutton = document.getElementById('reviewListbutton');
	  const replyListbutton = document.getElementById('replyListbutton');
	  
     /* document.getElementById('reviewListbutton').addEventListener('click', () => {
         reviewList.style.display = 'block';
         replyList.style.display = 'none';
     }); */
   
     /* document.getElementById('replyListbutton').addEventListener('click', () => {
         reviewList.style.display = 'none';
         replyList.style.display = 'block';
         let url = window.location.href;
		 url = "?page=1&listType=replyList";
		 window.history.pushState({}, "Title", url);
		 $("#replyTable").load(location.href + " #replyTable", function() {
			 	const revNos = [];
			 	const replyTableTr = document.getElementsByClassName('replyTableTr');
				for(const replyTr of replyTableTr){
					let revNo = replyTr.querySelector('#replyNo').value;
				    revNos.push(revNo);
				    replyTr.addEventListener('click', function(){
				    showModal(revNo);
				    	
					$("#reviewDetail").load(location.href + " #reviewDetail", function() {
						selectReviewImgUl();
					    loadReviewDetail();
					});
				});
			};
	    });
	 $("#replyPage").load(location.href + " #replyPage");
    }); */
     
     /* document.getElementById('reviewListbutton').addEventListener('click', () => {
         reviewList.style.display = 'block';
         replyList.style.display = 'none';
         let url = window.location.href;
		 url = "?page=1&listType=reviewList";
		 window.history.pushState({}, "Title", url);
		 $("#reviewTable").load(location.href + " #reviewTable", function(){
			const revNos = [];
			const reviewTableTr = document.getElementsByClassName('reviewTableTr');
			for(const reviewTr of reviewTableTr){
				let revNo = reviewTr.querySelector('#reviewNo').value;
			    revNos.push(revNo);
			    reviewTr.addEventListener('click', function(){
			    showModal(revNo);
			    
				$("#reviewDetail").load(location.href + " #reviewDetail", function() {
					selectReviewImgUl();
				    loadReviewDetail();
				});
			});
		};
	 });
	 $("#reviewPage").load(location.href + " #reviewPage");
    }); */
     
	const urlSearchParams = new URLSearchParams(window.location.search);
	const listType = urlSearchParams.get('listType');
	if (listType == 'reviewList') {
		reviewList.style.display = 'block';
        replyList.style.display = 'none';
        reviewListbutton.className = 'tabset-link active';
        replyListbutton.className = 'tabset-link';
	} else if(listType == 'replyList') {
		reviewList.style.display = 'none';
        replyList.style.display = 'block';
        reviewListbutton.className = 'tabset-link';
        replyListbutton.className = 'tabset-link active';
	}
	
  </script>
  
 <script type="text/javascript">
 const loadReviewDetail = () =>{
	    const getSysdate = () => new Date();
		const getTimeAgo = (repModifyDate) => {
		    const seconds = Math.floor((getSysdate() - repModifyDate) / 1000);
		    const interval = { '년': 31536000, '월': 2592000, '주': 604800, '일': 86400, '시간': 3600, '분': 60, '초': 1 };

		    for (let i in interval) {
		        const num = Math.floor(seconds / interval[i]);
		        if (num >= 1) {
		            return num + i + '전';
		        }
		    }
		    return '방금 전';
		};
		
		const repModifyDates = document.querySelectorAll('#repModifyDate');
		for (let i = 0; i < repModifyDates.length; i++) {
		    const repModifyDateValue = repModifyDates[i].value;
		    const repModifyDate = new Date(repModifyDateValue);

		    const timeAgoDiv = repModifyDates[i].closest('.selectReplyDiv').querySelector('.reviewDetailDivs.timeAgo');
		    timeAgoDiv.innerText = getTimeAgo(repModifyDate);
		}
		
		const newBadge = (repCreateDate) => {
		    const timeDifference = getSysdate() - repCreateDate;
		    const daysDifference = Math.floor(timeDifference / (1000 * 60 * 60 * 24));
		    return daysDifference <= 3 ? 'NEW' : '';
		};
		
		const repCreateDates = document.querySelectorAll('#repCreateDate');
		for (let i = 0; i < repCreateDates.length; i++) {
		    const repCreateDateValue = repCreateDates[i].value;
		    const repCreateDate = new Date(repCreateDateValue);

		    const newBadgeDiv = repCreateDates[i].closest('.selectReplyDiv').querySelector('.newbadge');
		    newBadgeDiv.innerText = newBadge(repCreateDate);
		}
	}
 
 const selectReviewImgUl = () =>{
 	const reviewImgUl = document.querySelector('#reviewImgUl');
	const selectImagDiv = document.querySelector('#selectImagDiv');
	
	console.log(selectImagDiv);
	const reviewImgs = reviewImgUl.querySelectorAll('img');
    for (let i = 0; i < reviewImgs.length; i++) {
        reviewImgs[i].onclick = function() {
            selectImagDiv.querySelector('img').src = this.src;
        };
    }
 }
 
 const selectedButsReview = document.querySelectorAll('#myPage-reviewListDiv .selectset-link');
 const revCategoryInputReview = document.getElementById('revCategory');
 const selectedCategory = "${sr.category}";

 for (let i = 0; i < selectedButsReview.length; i++) {
     const button = selectedButsReview[i];

     button.addEventListener('click', function () {
         revCategoryInputReview.value = this.value;

         for (let j = 0; j < selectedButsReview.length; j++) {
             selectedButsReview[j].classList.remove('on');
         }
         this.classList.add('on');
     });

     if (button.value === selectedCategory) {
         button.classList.add('on');
         document.getElementById('selectedCategorySpan').innerText = selectedCategory;
     }
 }

 const selectedButsReply = document.querySelectorAll('#myPage-replyListDiv .selectset-link');
 const revCategoryInputReply = document.getElementById('repCategory');
 for (let i = 0; i < selectedButsReply.length; i++) {
     const button = selectedButsReply[i];

     button.addEventListener('click', function () {
         revCategoryInputReply.value = this.value;
         for (let j = 0; j < selectedButsReply.length; j++) {
             selectedButsReply[j].classList.remove('on');
         }
         this.classList.add('on');
     });

     if (button.value === selectedCategory) {
         button.classList.add('on');
         document.getElementById('selectedRepCategorySpan').innerText = selectedCategory;
     }
 }
 
const keepListType = () =>{
	let keep = '${listType}';
	let tabs = document.querySelectorAll(".tabset-item a");
	if(keep == "reviewList"){
		tabs[0].classList.add("active");
	}else{
		tabs[1].classList.add("active");
	}
} 
 
window.onload = () =>{
	keepListType();
	
	const revCategory = document.getElementsByName('category');
	for(let i=0; i<revCategory.length; i++){
		revCategory[i].value = "전체";
	}
	
	const revNos = [];
	const reviewTableTr = document.getElementsByClassName('reviewTableTr');
	for(const reviewTr of reviewTableTr){
		let revNo = reviewTr.querySelector('#reviewNo').value;
	    revNos.push(revNo);
	    
	    reviewTr.addEventListener('click', function(){
	    	showModal(revNo);
	    	
			$("#reviewDetail").load(location.href + " #reviewDetail", function() {
				selectReviewImgUl();
			    loadReviewDetail();
			});
		});
	};
	
	const replyTableTr = document.getElementsByClassName('replyTableTr');
	for(const replyTr of replyTableTr){
		let revNo = replyTr.querySelector('#replyNo').value;
	    revNos.push(revNo);
	    
	    replyTr.addEventListener('click', function(){
	    	showModal(revNo);
			$("#reviewDetail").load(location.href + " #reviewDetail", function() {
				selectReviewImgUl();
			    loadReviewDetail();
			});
		});
	};
	
	document.getElementById("closeSelectRevMd").addEventListener('click', function () {
	    for (const revNo of revNos) {
	        closeModal(revNo);
	    }
	});
	
	let value = '${value}';
	let url = window.location.href;
	if(value != 1){
		if(url.includes("?revNo=")){
		   url = url.split("?revNo=")[0];
		}else if(url.includes("&revNo=")){
		   url = url.split("&revNo=")[0];
		}
	}else{
		url = url.split("&value=1")[0];
	}
	window.history.pushState({}, "Title", url);
	
}

//상세보기 모달
const showModal = (value) =>{
	let revNo = value;
	let url = window.location.href;
	url = !url.includes("?") ? "?revNo="+revNo : url += "&revNo="+revNo;
	window.history.pushState({}, "Title", url);
	
	$("#reviewDetail").load(location.href + " #reviewDetail");
	
	let modal = document.getElementById('myModal');
	modal.style.display = 'block';
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
   
   modal.style.display = 'none';
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

const delConfirmButton = () => {
	const delConfirmButton = document.getElementById('delConfirmButton');
	const isReview = delConfirmButton.getAttribute('data-isReview') == 'true';
    const repNo = delConfirmButton.getAttribute('data-repNo');
	
	if(isReview){
		let beforeURL = window.location.href;
	    document.getElementById('beforeURL').value = beforeURL;
		
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
	let beforeURL = window.location.href;
    document.getElementById('beforeURL').value = beforeURL;
    
	const revDetailForm = document.getElementById('reviewDetailForm');
	revDetailForm.action = 'goUpdateReview.rv';
	revDetailForm.submit();
}

const reviewReplyBut = () =>{
	if(replyDiv.style.display == 'none'){
		replyDiv.style.display = 'block';
		loadReviewDetail();
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
	const memId = document.getElementById('memId').value;
	
	if('${loginUser.memId}' != memId){
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
	} else{
		alert('작성하신 글은 [좋아요] 버튼을 누를 수 없습니다.');
		
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
 <script src="rs/myReviewList/js/setting.js"></script>
 <script src="rs/myReviewList/js/script.js"></script>
<script src="rs/reviewDetail/js/setting.js"></script>
<script src="rs/reviewDetail/js/script.js"></script>
</body>
</html>