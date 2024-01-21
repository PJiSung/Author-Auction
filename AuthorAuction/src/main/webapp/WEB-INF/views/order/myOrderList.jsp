<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<title>Insert title here</title>

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


.selectDateDiv{
	position: relative;
	left: 9.5%;
}

.selectDateDiv input{
	height: 56px;
	border: 1px solid var(--border-color);
	padding: 10px;
}

.cancelButton{
	border: 0;
	background-color: black;
	color: white;
	height: 33px;
	width: 67px;
}

.order-processDiv{
	border: 2px solid var(--border-color);
    border-radius: 0.6rem;
	margin: 5%;
	padding: 20px;
}

.order-processDiv table{
	margin: 0 auto;
	text-align: center;
	width: 100%;
	line-height: 30px;
	font-size: var(--fs-p2);
    color: black;
}

.order-processDiv table td{
	width: 25%;
}

.tableset-mobile{
	vertical-align : top;
}

.tableset-order04{
	overflow:hidden;
	white-space:nowrap;
	text-overflow:ellipsis;
}

.tableset-author{
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
            <h2 class="textset-tit">MY PAGE - ORDER</h2>
          </div>
          
          <div class="order-processDiv">
          	<table>
          		<tr>
          			<td>${ ordStatusCount[0] }</td>
          			<td>${ ordStatusCount[1] }</td>
          			<td>${ ordStatusCount[2] }</td>
          			<td>${ ordStatusCount[3] }</td>
          		</tr>
          		<tr>
          			<td>배송준비중</td>
          			<td>배송중</td>
          			<td>배송완료</td>
          			<td>취소</td>
          		</tr>
          	</table>
          </div>
          
          <div id="myPage-orderListDiv">
          	<form id="myOrderListForm" onsubmit="searchOrder()">
          	<input type="hidden" id="ordCategory" name="category">
          	<input type="hidden" name="page" value="${ pi.currentPage }">
          	<div class="contents-search">
	            <p class="contents-result"> 전체<span> ${ listCount }</span>개 </p>
	            <div class="selectDateDiv">
	            	<input type="date" name="strDate" value="${ s.strDate }">&nbsp;-&nbsp;
	            	<input type="date" name="endDate" value="${ s.endDate }">
	            </div>
	            <div class="contents-form">
	              <div class="selectset selectset-lg">
	                <button class="selectset-toggle btn" type="button">
	                  <span id="selectedCategorySpan">선택</span>
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
	                <button class="inputset-icon icon-right icon-search btn" type="button" aria-label="아이콘" onclick="searchOrder()"></button>
	                <input type="text" class="inputset-input form-control" placeholder="Serach" name="keyword" value="${ s.keyword }" onkeyup="enterKey(event)">
	              </div>
	            </div>
	          </div>
	          </form>
	          
	          <c:if test="${ !empty list }">
	          	<div class="tableset">
		            <table class="tableset-table table" style="table-layout:fixed; width: 100%">
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
		                  <th scope="col" style="width: 14%;">주문번호</th>
		                  <th scope="col" style="width: 7%;">사진</th>
		                  <th scope="col" style="width: 13%;">작품명</th>
		                  <th scope="col" style="width: 12%;">작가명</th>
		                  <th scope="col" style="width: 11.5%;">가격</th>
		                  <th scope="col" style="width: 8.5%;"></th>
		                  <th scope="col" style="width: 11%;">주문일</th>
		                  <th scope="col" style="width: 13%;">진행상황</th>
		                  <th scope="col" style="width: 10%;">주문취소</th>
		                </tr>
		              </thead>
		              <tbody>
		                <c:forEach items="${ list }" var="o">
	                		<input type="hidden" value="${ o.ordNo }" name="ordNo">
			                <tr class="orderTableTr" onclick="selectOrderDetail(event, this)">
			                  <td class="tableset-mobile">
			                  	${ o.ordNo }
			                  	<input type="hidden" value="${ o.proNo }" id="proNo">
			                  </td>
			                  <td class="tableset-proImg">
			                  	<c:forEach items="${ aList }" var="a">
	         						<c:if test="${a.attBno == o.proNo && a.attCategory == 4 && a.attFno == 1}">
	            						<img alt="상품" src="${ a.attRename }">
	         						</c:if>
	         					</c:forEach>
							  </td>
			                  <td class="tableset-author">${ o.proName }</td>
			                  <td class="tableset-order04">${ o.proWriter }</td>
			                  <td class="tableset-order05"><fmt:formatNumber value="${ o.proPrice }" pattern="#,###" /></td>
			                  <c:if test="${ o.ordAnother > 0 }">
				                  <td class="tableset">외 ${ o.ordAnother }개</td>
			                  </c:if>
			                  <c:if test="${ o.ordAnother == 0 }">
				                  <td class="tableset"></td>
			                  </c:if>
			                  <td class="tableset-order05">${ fn:split(o.ordDate, ' ')[0] }</td>
			                  <td class="tableset-progress">${ o.ordStatus }</td>
			                  <td class="tableset-cancel" onclick="notGoDetail(event)">
			                  	<input type="hidden" value="${ o.ordDate }" id="orderTableHidden">
			                  </td>
			                </tr>
		                </c:forEach>
		              </tbody>
		            </table>
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
								<c:param name="page" value="${ pi.startPage }"></c:param>
								<c:param name="cagetory" value="${ s.category }"></c:param>
								<c:param name="keyword" value="${ s.keyword }"></c:param>
								<c:param name="strDate" value="${ s.strDate }"></c:param>
								<c:param name="endDate" value="${ s.endDate }"></c:param>
							</c:url>
							<a class="pagiset-link pagiset-first" href="${ goFirst }">
								<span class="visually-hidden">처음</span>
							</a>
						</div>
						<div class="pagiset-ctrl">
							<c:url var="goBack" value="${ loc }">
								<c:param name="page" value="${ pi.currentPage-1 }"></c:param>
								<c:param name="cagetory" value="${ s.category }"></c:param>
								<c:param name="keyword" value="${ s.keyword }"></c:param>
								<c:param name="strDate" value="${ s.strDate }"></c:param>
								<c:param name="endDate" value="${ s.endDate }"></c:param>
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
								<c:param name="cagetory" value="${ s.category }"></c:param>
								<c:param name="keyword" value="${ s.keyword }"></c:param>
								<c:param name="strDate" value="${ s.strDate }"></c:param>
								<c:param name="endDate" value="${ s.endDate }"></c:param>
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
								<c:param name="cagetory" value="${ s.category }"></c:param>
								<c:param name="keyword" value="${ s.keyword }"></c:param>
								<c:param name="strDate" value="${ s.strDate }"></c:param>
								<c:param name="endDate" value="${ s.endDate }"></c:param>
							</c:url>
							<a class="pagiset-link pagiset-next" href="${ goNext }"> <span
								class="visually-hidden">다음</span>
							</a>
						</div>
						<div class="pagiset-ctrl">
							<c:url var="goList" value="${ loc }">
								<c:param name="page" value="${ pi.maxPage }"></c:param>
								<c:param name="cagetory" value="${ s.category }"></c:param>
								<c:param name="keyword" value="${ s.keyword }"></c:param>
								<c:param name="strDate" value="${ s.strDate }"></c:param>
								<c:param name="endDate" value="${ s.endDate }"></c:param>
							</c:url>
							<a class="pagiset-link pagiset-last" href="${ goList }"> 
								<span class="visually-hidden">마지막</span>
							</a>
						</div>
					</c:if>
				</nav>
	          </c:if>
	          <c:if test="${ empty list }">
	          	<div class="EmptySearchResult">
					<h2>검색 결과가 없습니다.</h2>
					<p>정확한 검색어 인지 확인하시고 다시 검색해 주세요.</p>
				</div>
	          </c:if>
	          
			
			
          </div>
        </div>
      </div>
    </div>
  </main>
  
  <div class="conModal">
		<div id="modalSet1" class="modalset">
			<div class="modal-header">
				<h6 class="modal-title">CANCEL</h6>
			</div>
			<div class="modal-body">
				<p>정말로 주문을 취소하시겠습니까?</p>
			</div>
			<div class="modal-footer">
				<a class="btnset btnset-confirm" id="canConfirmButton">삭제</a>
				<button type="button" class="btnset btnset-ghost modal-close" id="delCelButton" style="border: 1px solid;">취소</button>
			</div>
		</div>
		<div class="modalset-dim"></div>
	</div>
	
<script type="text/javascript">
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

const cancelOrder = () =>{
	showDelModal();
}

document.getElementById('canConfirmButton').addEventListener('click', ()=>{
	const form = document.getElementById('myOrderListForm');
	form.action = "cancelOrder.od";
	form.method = 'post';
	form.submit();
});

document.getElementById('delCelButton').addEventListener('click', () =>{
	closeDelModal();
});

const notGoDetail = (event) =>{
	 event.stopPropagation();
}

const selectOrderDetail = (event, tr) =>{
	event.stopPropagation();
	const ordNo = tr.querySelector('.tableset-mobile').innerText;

	location.href='selectOrderDetail.od?ordNo=' + ordNo +"&page=" + ${pi.currentPage};
}


const form = document.getElementById('myOrderListForm');
const ordCategoryInput = document.getElementById('ordCategory');
const selectedButs = document.querySelectorAll('.selectset-link');

const searchOrder = () =>{
	const selectedCategoryValue = document.getElementById('selectedCategorySpan').innerText;
	ordCategoryInput.value = selectedCategoryValue === "선택" ? "전체" : selectedCategoryValue;
	
	form.action = "searchOrderList.od";
	form.submit();
}
	


for (let i = 0; i < selectedButs.length; i++) {
    const button = selectedButs[i];

    button.addEventListener('click', function () {
        ordCategoryInput.value = this.value;

        for (let j = 0; j < selectedButs.length; j++) {
            selectedButs[j].classList.remove('on');
        }
        this.classList.add('on');
        document.getElementById('selectedCategorySpan').innerText = this.value;
    });

    if (button.value == "${s.category}") {
        button.classList.add('on');
        document.getElementById('selectedCategorySpan').innerText = "${s.category}";
    }
}

const enterKey = (event) => {
  if (event.keyCode == 13) {
	  searchOrder();
  }
}
  
window.onload = () =>{
 	const orderTableTr = document.getElementsByClassName('orderTableTr');

	for (const tr of orderTableTr) {
	    const ordDateVal = tr.querySelector('#orderTableHidden').value;
	    const ordStatus = tr.querySelector('.tableset-progress').innerText;
	    const ordDate = new Date(ordDateVal);
	    const sysdate = new Date();
	    
	    if (sysdate - ordDate <= 24 * 60 * 60 * 1000 && ordStatus == '배송준비중') {
	     tr.querySelector('.tableset-cancel').innerHTML = '<button class="cancelButton" type="button" onclick="cancelOrder()">취소</button>';
	    }
	}
}
  
  	
  
</script>
  
  <jsp:include page="../common/footer.jsp"/>
  <script src="rs/myReviewList/js/setting.js"></script>
  <script src="rs/myReviewList/js/script.js"></script>
</body>
</html>