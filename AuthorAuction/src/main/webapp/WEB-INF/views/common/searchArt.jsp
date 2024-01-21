<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta http-equiv="imagetoolbar" content="no">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="format-detection" content="telephone=no">
  <title>미술품검색</title>
  <link rel="stylesheet" href="recommendation/css/setting.css">
  <link rel="stylesheet" href="recommendation/css/plugin.css">
  <link rel="stylesheet" href="recommendation/css/template.css">
  <link rel="stylesheet" href="recommendation/css/common.css">
  <link rel="stylesheet" href="recommendation/css/style.css">
  <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<style>
.textset-tit{
	margin-top: 7rem;
}
.textset-desc{
	margin-bottom: 5rem;
}
.btnset{
	float: right;
	margin-bottom: 3rem;
}
.th-layout-main{
	min-height: 712px;
}
.searchDiv{
	width: 45%;
	margin: 0 auto;
}
.searchDiv #search-input{
	font-size: 25px;
	border: none;
	width: 93%;
	height: 50px;
	border-bottom: 2px solid gray;
}

.searchDiv #search-input:hover{
	outline: none;
	border-bottom: 2px solid black;
}

.searchDiv #search-input:focus{
	outline: none;
	border-bottom: 2px solid black;
}
.searchDiv button{
	background: white;
	border: none;
}
.totalCount .contents-result{
	font-size: 40px !important;
}
.modal {
  display: none;
  position: fixed;
  left: 50%;
  top: 50%;
  transform: translate(-50%, -50%);
  width: auto;
  height: auto;
  overflow: auto;
  background-color: rgba(0,0,0,0.4);
}

.modal-content {
  background-color: #fefefe;
  padding: 20px;
  border: 1px solid #888;
  width: auto;
  height: auto;
}

.close {
	position: absolute;
	right:5px;
	top:0;
	color: #aaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close:hover,
.close:focus {
  color: black;
  text-decoration: none;
  cursor: pointer;
}

.noResult{
	width:100%;
	text-align: center;
	line-height: 400px;
	font-size: 30px;
}
</style>
<script>
window.onload = () =>{
	detail();
	window.addEventListener('click', function(event) {
		  const modal = document.getElementById('myModal');
		  if (event.target != modal) {
		    modal.style.display = 'none';
		  }
	});
}

const closeModal = () =>{
	document.getElementById('myModal').style.display = 'none';
}

const detail = () =>{
	let divs = document.querySelectorAll(".contents-group a");
	for(let i=0; i<divs.length; i++){
		divs[i].addEventListener("click", function(){
			let modal = document.getElementById("myModal");
			event.stopPropagation();
			modal.children[0].children[1].innerHTML = this.children[0].innerHTML;
			modal.style.display = 'block';
		});
	}
}
</script>
</head>

<body>
<jsp:include page="../common/header.jsp"/>
  <!-- [E]basic-N3 -->
  <main class="th-layout-main ">
    <!-- [S]basic-N34 -->
    <div class="basic-N34" data-bid="VELQAVN9vs">
      <div class="contents-inner">
        <div class="contents-container container-md">
          <div class="textset">
            <div class="searchDiv">
            <br><br><br>
            	<form id="search-form" action="searchArts">
                  <input type="text" name="keyword" id="search-input" placeholder="작품명 또는 작가명" value="${ keyword }" oninput ="searchArts(this.value)">
                  <button><img alt="검색 버튼" src="main/icons/ico_seach_black.svg"></button>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="basic-N54" data-bid="mqLqAvmR0h" id="">
      <div class="contents-inner">
        <div class="contents-container container-md">
        <div id="totalCount">
            <p class="contents-result"><h2> 전체 <span>(${ total })</span></h2></p>
          </div>
          <div class="contents-group">
          <c:if test="${ !empty list }">
           <c:forEach items="${ list }" var="l">
            <a href="javascript:void(0);" class="cardset">
	            <figure class="cardset-figure"> 
	           		<img class="cardset-img" src="${ l.artImg }" alt="카드 이미지">
	            </figure>
	            <div class="cardset-body" style="margin-left: 15px;margin-top: 15px">
		            <h2 class="cardset-tit">${ l.writerName }</h2>
		            <h2 class="cardset-tit" style="margin-top: 3px;font-size: 20px;">${ l.artNameEn }</h2>
		            <p class="cardset-desc" style="margin-top: 10px;">${ l.materials }</p>
		            <p class="cardset-desc" style="margin-top: -1px;">${ l.standard } | ${ l.year }</p>
	            </div>
            </a>
           </c:forEach>
           </c:if>
           <c:if test="${ empty list }">
           <div class="noResult">
           	<h1>검색결과가 없습니다.</h1>
           	</div>
           </c:if>
          </div>
          <br><br><br>
          <c:if test="${ !empty list }">
			<nav class="pagiset pagiset-line" id="pagiset-list">
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
							<c:param name="page" value="1"></c:param>
							<c:param name="keyword" value="${ keyword }"></c:param>
						</c:url>
						<a class="pagiset-link pagiset-first" href="${ goFirst }"> <span
							class="visually-hidden">처음</span>
						</a>
					</div>
					<div class="pagiset-ctrl">
						<c:url var="goBack" value="${ loc }">
							<c:param name="page" value="${ pi.currentPage-1 }"></c:param>
							<c:param name="keyword" value="${ keyword }"></c:param>
						</c:url>
						<a class="pagiset-link pagiset-prev" href="${ goBack }"> <span
							class="visually-hidden">이전</span>
						</a>
					</div>
				</c:if>
				<div class="pagiset-list">
					<c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
						<c:url var="goNum" value="${ loc }">
							<c:param name="page" value="${ p }"></c:param>
							<c:param name="keyword" value="${ keyword }"></c:param>
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
							<c:param name="keyword" value="${ keyword }"></c:param>
						</c:url>
						<a class="pagiset-link pagiset-next" href="${ goNext }"> 
							<span class="visually-hidden">다음</span>
						</a>
					</div>
					<div class="pagiset-ctrl">
						<c:url var="goList" value="${ loc }">
							<c:param name="page" value="${ pi.maxPage }"></c:param>
							<c:param name="keyword" value="${ keyword }"></c:param>
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
    <br><br>
    <!-- [E]basic-N54 -->
  </main>
  
  <div id="myModal" class="modal">
  <div class="modal-content">
    <span class="close" onclick="closeModal()">&times;</span>
    <p></p>
  </div>
</div>

 <jsp:include page="../common/footer.jsp"/>
  
  <!-- [E]basic-N4 -->
  <script src="recommendation/js/setting.js"></script>
  <script src="recommendation/js/plugin.js"></script>
  <script src="recommendation/js/template.js"></script>
  <script src="recommendation/js/common.js"></script>
  <script src="recommendation/js/script.js"></script>
</body>