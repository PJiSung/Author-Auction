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
<link rel="shortcut icon" type="image⁄x-icon" href="main/icons/logoImage.png">
<link rel="stylesheet" href="rs/myReviewList/css/setting.css">
<link rel="stylesheet" href="rs/myReviewList/css/template.css">
<link rel="stylesheet" href="rs/myReviewList/css/style.css">
<title>Insert title here</title>

<style type="text/css">

.tableset-author{
	overflow: hidden;
 	text-overflow: ellipsis;
 	white-space: nowrap;
}


.selectDateDiv input{
	height: 56px;
	border: 1px solid var(--border-color);
	padding: 10px;
}

.searchButton{
	border: 0;
	display: inline-block;
	background-color: black;
	color: white;
	height: 45px;
	width: 80px;
	float: right;
}

.search-select{
	border: 2px solid var(--border-color);
    border-radius: 0.6rem;
	margin: 5%;
	padding: 20px;
}

.search-select table{
	margin: 0 auto;
	width: 100%;
    color: black;
}

.search-select table td{
	padding: 10px;
}

.progressOpt{
	color: var(--text-color3);
	height: 30px;
	font-family: var(--ff);
    font-weight: 400;
    font-size: var(--fs-p3);
}

.selectset selectset-lg{
	width: 25%; 
}

.inputset inputset-lg{
	width: 50%; 
}

.search-select [type="radio"]:first-child{
	margin-left: 0px;
}

.search-select [type="radio"]{
	margin-left: 20px;
	margin-right: 5px;
}

.search-select [type="radio"]:checked{
	accent-color: black;
}

</style>
</head>
<body>
  <jsp:include page="../common/adminHeadSide.jsp"/>
  <main class="th-layout-main ">
    <div class="myReview" data-bid="ftLQde19y6">
      <div class="contents-inner">
        <div class="contents-container container-md">
          <div class="textset textset-h2">
            <h2 class="textset-tit">MANAGER PAGE - ORDER</h2>
          </div>
          
          <div class="search-select">
          <form id="searchForm" onsubmit="searchOrder()">
          	<input type="hidden" name="category" id="ordCategory">
          	<input type="hidden" name="page" value="${ pi.currentPage }">
          	<table>
          		<tr>
          			<th>진행상태</th>
          			<td colspan="2">
		          		<div class="checkset-wrap">
							<div class="checkset" id="ordStaAllDiv">
						      <input id="chk-a-1" class="checkset-input input-fill" type="checkbox" value="전체" <c:if test="${fn:contains(s.ordStatus, '배송준비중') && fn:contains(s.ordStatus, '배송중') && fn:contains(s.ordStatus, '배송완료') && fn:contains(s.ordStatus, '주문취소')}">checked</c:if>>
						      <label class="checkset-label" for="chk-a-1"></label>
						      <span class="checkset-text">전체</span>
						    </div>
						    <div class="checkset">
						      <input id="chk-a-2" class="checkset-input input-fill" type="checkbox" value="배송준비중" name="ordStatus" ${fn:containsIgnoreCase(s.ordStatus, '배송준비중') ? 'checked' : ''}>
						      <label class="checkset-label" for="chk-a-2"></label>
						      <span class="checkset-text">배송준비중</span>
						    </div>
						    <div class="checkset">
						      <input id="chk-a-3" class="checkset-input input-fill" type="checkbox" value="배송중" name="ordStatus" ${fn:containsIgnoreCase(s.ordStatus, '배송중') ? 'checked' : ''}>
						      <label class="checkset-label" for="chk-a-3"></label>
						      <span class="checkset-text">배송중</span>
						    </div>
						    <div class="checkset">
						      <input id="chk-a-4" class="checkset-input input-fill" type="checkbox" value="배송완료" name="ordStatus" ${fn:containsIgnoreCase(s.ordStatus, '배송완료') ? 'checked' : ''}>
						      <label class="checkset-label" for="chk-a-4"></label>
						      <span class="checkset-text">배송완료</span>
						    </div>
						    <div class="checkset">
						      <input id="chk-a-5" class="checkset-input input-fill" type="checkbox" value="주문취소" name="ordStatus" ${fn:containsIgnoreCase(s.ordStatus, '주문취소') ? 'checked' : ''}>
						      <label class="checkset-label" for="chk-a-5"></label>
						      <span class="checkset-text">주문취소</span>
						    </div>
					  </div>
          			</td>
          		</tr>
          		<tr>
          			<th>기간</th>
          			<td colspan="2">
          				<div class="selectDateDiv">
				           	<input type="date" name="strDate" value="${ s.strDate }">&nbsp;-&nbsp;
				           	<input type="date" name="endDate" value="${ s.endDate }">
		        		</div>
          			</td>
          		</tr>
          		<tr>
          			<th>키워드</th>
          			<td>
	          			<div class="selectset selectset-lg" style="display: inline-block;">
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
		                    <button class="selectset-link btn" type="button" value="주문번호">
		                      <span>주문번호</span>
		                    </button>
		                  </li>
		                  <li class="selectset-item">
		                    <button class="selectset-link btn" type="button" value="아이디">
		                      <span>아이디</span>
		                    </button>
		                  </li>
		                </ul>
		              </div>
		              <div class="inputset inputset-lg" style="display: inline-block;">
		                <input type="text" class="inputset-input form-control" placeholder="Serach" name="keyword" value="${ s.keyword }" onkeyup="enterKey(event)">
		              </div>
       				</td>
	       			<td>
	       				<button class="searchButton" type="button" onclick="searchOrder()">검색</button>
	       			</td>
          		</tr>
          	</table>
          </form>
          </div>
          	
          <div id="manaPage-orderListDiv">
          	<div class="contents-search">
	            <p class="contents-result"> 주문수 
	            <span>
	            	<c:if test="${ !empty searchListCount }">${ searchListCount }</c:if>
	            	<c:if test="${ empty searchListCount }">${ listCount }</c:if>
	            	/ ${listCount}
	            </span>
	            </p>
	        </div>
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
	                  <th scope="col" style="width: 10%;">No.</th>
	                  <th scope="col" style="width: 20%;">주문번호</th>
	                  <th scope="col" style="width: 17%;">주문자 ID</th>
	                  <th scope="col" style="width: 17%;">주문일</th>
	                  <th scope="col" style="width: 21%;">가격</th>
	                  <th scope="col" style="width: 15%;">주문상태</th>
	                </tr>
	              </thead>
	              <tbody>
	              
	                <c:forEach items="${ list }" var="o" varStatus="loop">
		                <tr onclick="selectAdOrderDetail(event, this)">
		                  <td class="tableset-mobile">${(loop.index + 1) + (8 * (pi.currentPage - 1))}</td>
		                  <td class="tableset-author" id="ordNo">${ o.ordNo }</td>
		                  <td class="tableset-progress">${ o.memId }</td>
		                  <td class="tableset-order05">${ o.ordDate }</td>
		                  <td class="tableset-order05"><fmt:formatNumber value="${ o.ordSumPrice }" pattern="#,###" /></td>
		                  <td class="tableset-cancel" onclick="notGoDetail(event)">
		                  	<select name="ordStatus" class="progressOpt" onchange="changeOrdStatus(${o.ordNo}, this.value)">
		                  		<option value="배송준비중" <c:if test="${ o.ordStatus == '배송준비중' }">selected</c:if>>배송준비중</option>
		                  		<option value="배송중" <c:if test="${ o.ordStatus == '배송중' }">selected</c:if>>배송중</option>
		                  		<option value="배송완료" <c:if test="${ o.ordStatus == '배송완료' }">selected</c:if>>배송완료</option>
		                  		<option value="주문취소" <c:if test="${ o.ordStatus == '주문취소' }">selected</c:if>>주문취소</option>
		                  	</select>
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
							<c:param name="ordStatus" value="${ s.ordStatus }"></c:param>
							<c:param name="category" value="${ s.category }"></c:param>
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
							<c:param name="ordStatus" value="${ s.ordStatus }"></c:param>
							<c:param name="category" value="${ s.category }"></c:param>
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
							<c:param name="ordStatus" value="${ s.ordStatus }"></c:param>
							<c:param name="category" value="${ s.category }"></c:param>
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
							<c:param name="ordStatus" value="${ s.ordStatus }"></c:param>
							<c:param name="category" value="${ s.category }"></c:param>
							<c:param name="keyword" value="${ s.keyword }"></c:param>
							<c:param name="strDate" value="${ s.strDate }"></c:param>
							<c:param name="endDate" value="${ s.endDate }"></c:param>
						</c:url>
						<a class="pagiset-link pagiset-next" href="${ goNext }"> 
							<span class="visually-hidden">다음</span>
						</a>
					</div>
					<div class="pagiset-ctrl">
						<c:url var="goList" value="${ loc }">
							<c:param name="page" value="${ pi.maxPage }"></c:param>
							<c:param name="ordStatus" value="${ s.ordStatus }"></c:param>
							<c:param name="category" value="${ s.category }"></c:param>
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
          </div>
        </div>
      </div>
    </div>
  </main>
  
 <script type="text/javascript">
 
const searchForm = document.getElementById('searchForm');
const ordCategoryInput = document.getElementById('ordCategory');
const selectedButs = document.querySelectorAll('.selectset-link');
const keywordInput = document.querySelector('input[name="keyword"]');
const searchButton = document.querySelector('.searchButton');

const searchOrder = () => {
	const selectedCategoryValue = document.getElementById('selectedCategorySpan').innerText;
    ordCategoryInput.value = selectedCategoryValue === "선택" ? "전체" : selectedCategoryValue;
	
	searchForm.action = 'searchOrder.adod';
	searchForm.submit();	
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

const notGoDetail = (event) =>{
	event.stopPropagation();
}
 
 const changeOrdStatus = (ordNo, ordStatus) =>{
	 $.ajax({
		 url: "updateOrderStatus.adod",
		 data:{ordNo: ordNo, ordStatus: ordStatus},
		 success: (data) =>{
			 console.log(data);
		 },
		 error: data => console.log(data)
	 })
 }
 
 const selectAdOrderDetail = (event, tr) =>{
	 event.stopPropagation();
	 const ordNo = tr.children[1].innerText;
	 location.href='selectAdmOrderDetail.adod?ordNo=' + ordNo + "&page=" + ${pi.currentPage};
 }
 
window.onload = () =>{
	const ordStas = document.querySelectorAll('input[name="ordStatus"]');
	const ordStaDiv = document.querySelectorAll('.checkset');
	const selectAll = document.querySelector('#chk-a-1');  
	const ordStaSpan = document.querySelector('.checkset-text');  
	
    for(o of ordStaDiv){
    	o.addEventListener('click', () =>{
    		const selectSta = document.querySelectorAll('input[name="ordStatus"]:checked')
		   	if(ordStas.length == selectSta.length){
		   		selectAll.checked = true;
		   	} else {
		   		selectAll.checked = false;
		   	}
    	})
    }
    
    selectAll.addEventListener('click', () => {
        for (const o of ordStas) {
            o.checked = selectAll.checked;
        }
    });
    
    ordStaSpan.addEventListener('click', () => {
        for (const o of ordStas) {
            o.checked = selectAll.checked;
        }
    });

    
 }
 
</script>
  
  <jsp:include page="../common/footer.jsp"/>
  <script src="rs/myReviewList/js/setting.js"></script>
  <script src="rs/myReviewList/js/script.js"></script>
</body>
</html>