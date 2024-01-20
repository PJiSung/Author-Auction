<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="imagetoolbar" content="no">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="format-detection" content="telephone=no">
<link rel="stylesheet" href="rs/writeReview/css/setting.css">
<link rel="stylesheet" href="rs/writeReview/css/template.css">
<link rel="stylesheet" href="rs/writeReview/css/style.css">
<title>Insert title here</title>

<style type="text/css">

.reviewContent{
	height: 20rem;
    border-color: transparent;
    padding: 1.6rem 0;
    border-radius: 0;
    box-shadow: none;
    font-family: inherit;
    position: relative;
    width: 100%;
}

#addPicButton{
	border: 0;
 	background-color: transparent;
}

#addPicButton img{
	width: 30px;
	height: 30px;
	margin-left: 10px;
}

.fileset .fileset-body{
	margin-bottom: 10px;
}

.contents-btn #cancelButton{
	background-color: white;
	color: black;
	padding: 0 1.6rem;
	margin: 0;
	display: inline-flex;
    justify-content: center;
    align-items: center;
    min-width: 18rem;
    height: var(--ht-lg);
    font-size: var(--fs-p3);
    border-width: 1px;
    border-style: solid;
    border-color: var(--primary);
    border-radius: 0.6rem;
    font-weight: 500;
}

.contents-btn #cancelButton:hover, .contents-btn  #submitButton:hover{
	font-weight: 700;
	cursor: pointer;
}

.contents-btn #submitButton{
	background-color: black;
	color: white;
	padding: 0 1.6rem;
	margin: 0;
	display: inline-flex;
    justify-content: center;
    align-items: center;
    min-width: 18rem;
    height: var(--ht-lg);
    font-size: var(--fs-p3);
    border-width: 1px;
    border-style: solid;
    border-color: var(--primary);
    border-radius: 0.6rem;
    font-weight: 500;
}

.originPic .contents-container {
  display: flex;
  justify-content: space-between;
}

.originPic .contents-left {
  width: 100%;
}

.originPic .contents-thumbnail {
  width: 100%;
  height: 64rem;
  border-radius: 2rem;
  overflow: hidden;
}

.originPic .contents-thumblist {
  display: flex;
  align-items: center;
  margin-top: 2rem;
  margin-bottom: 2rem;
  overflow-x: auto;
}

.originPic .contents-thumbitem {
  flex-shrink: 0;
  width: 12rem;
  height: 12rem;
  border-radius: 1rem;
  overflow: hidden;
  cursor: pointer;
}

.originPic .contents-thumbitem+.contents-thumbitem {
  margin-left: 2rem;
}

.originPic .contents-thumbimg {
  width: 100%;
  height: 100%;
  object-fit: cover;
}

.originPic .contents-right {
  width: calc(50% - 10rem);
  margin-top: 4.2rem;
}

.originPic .contents-btn {
  width: 2.4rem;
  height: 2.4rem;
  border: 0;
  background-color: transparent;
}

.originPic .contents-btn img {
  width: 100%;
  height: 100%;
  object-fit: contain;
  vertical-align: top;
}

.originPic .contents-right-group {
  padding-bottom: 2rem;
}

.originPic .contents-right-group:first-child {
  border-bottom: 1px solid var(--line-color3);
}

.originPic .contents-right-group+.contents-right-group {
  padding-top: 2rem;
}

.originPic .contents-right-group+.contents-right-group+.contents-right-group {
  border-top: 1px solid var(--border-color);
}

.originPic .contents-brand {
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.originPic .contents-brand a {
  font-size: var(--fs-p3);
  line-height: var(--lh-p3);
  color: var(--text-color3);
}

.originPic .contents-brand-group {
  display: flex;
  align-items: center;
  gap: 1.6rem;
}

.originPic .contents-brand-group.like-on .btn-like-line {
  display: none;
}

.originPic .contents-brand-group.like-on .btn-like-fill {
  display: block;
}

.originPic .contents-brand .btn-like-fill {
  display: none;
}

.originPic .contents-right .textset {
  margin: 1.6rem 0 2rem 0;
}

.originPic .contents-right .textset-tit {
  font-size: var(--fs-h4);
  line-height: var(--lh-h4);
  font-weight: 500;
}

.originPic .contents-right .textset-desc {
  margin-top: 0.6rem;
}

.originPic .contents-badge-group {
  display: flex;
  flex-wrap: wrap;
  align-items: center;
  gap: 0.8rem;
  margin-bottom: 1.6rem;
}

.originPic .contents-price {
  font-size: var(--fs-h5);
  font-weight: 600;
}

.originPic .contents-price span {
  font-size: var(--fs-p2);
  font-weight: 500;
}

.originPic .contents-right-item {
  display: flex;
  justify-content: space-between;
  font-size: 1.4rem;
  line-height: 2rem;
  font-weight: 400;
}

.originPic .contents-right-item+.contents-right-item {
  margin-top: 0.8rem;
}

.originPic .contents-right-item strong {
  display: inline-block;
  width: 40%;
  color: var(--text-color3);
  font-weight: 400;
}

.originPic .contents-right-item span {
  display: inline-block;
  width: 60%;
  text-align: right;
}

.originPic .contents-amount {
  display: flex;
  align-items: center;
  justify-content: flex-end;
  gap: 1.6rem;
  width: 50%;
}

.originPic .contents-amount .contents-btn {
  width: 2.8rem;
  height: 2.8rem;
  border: 1px solid var(--border-color);
  border-radius: 50%;
}

.originPic .contents-amount .contents-btn:hover,
.originPic .contents-amount .contents-btn:active {
  border-color: var(--line-color3);
}

.originPic .contents-amount-num {
  font-size: 1.8rem;
}

.originPic .contents-total {
  display: flex;
  justify-content: space-between;
  margin-top: 2.4rem;
}

.originPic .contents-total strong {
  display: inline-block;
  width: 40%;
  font-size: var(--fs-p1);
  font-weight: 500;
}

.originPic .contents-total .contents-price {
  width: 60%;
  text-align: right;
}

.originPic .contents-btn-group {
  display: flex;
  align-items: center;
  margin-top: 2rem;
}

.originPic .contents-btn-group .btnset {
  min-width: auto;
  width: 50%;
}

.originPic .contents-thumbimg:hover{
	filter: brightness(75%);
}

.originPic .contents-thumbimg.dark {
    filter: brightness(40%);
}

.originPic h6{
	margin-top: 1.5rem;
	font-size: var(--fs-p2);
}

</style>
</head>
<body>
  <jsp:include page="../common/header.jsp"/>
  <main class="th-layout-main ">
    <div class="insertReview" data-bid="IdlQhr973C" id="">
      <div class="contents-inner">
        <div class="contents-container container-md">
        	<form action="updateReview.rv" method="post" enctype="multipart/form-data" id="updateReviewForm">
	          <input type="hidden" name="revNo" value="${ r.revNo }">
               <input type="hidden" name="page" value="${ page }">
               <input type="hidden" name="beforeURL" value="${beforeURL}">
	          <div class="textset textset-h2">
	            <h2 class="textset-tit">REVIEW 수정</h2>
	          </div>
	          <div class="contents-titgroup">
	            <div class="selectset selectset-lg">
	              <button class="selectset-toggle btn" type="button">
	                <span>${r.proName} | ${r.proWriter}</span>
	              </button>
	            </div>
	          </div>
	          <div class="contents-group">
	            <div class="contents-group-top">
	              <textarea class="reviewContent" name="revContent" placeholder="리뷰 내용을 입력해주세요." required>​${ r.revContent }</textarea>
	            </div>
	            <div class="contents-group-bottom">
	              <div class="contents-date">
	              </div>
	              <div class="contents-file">
	                <h3 class="h3">사진 첨부</h3>
	                <button id="addPicButton" type="button">
	                	<img class="icon-sm" src="rs/writeReview/icons/ico_plus_circle.svg" alt="아이콘">
	                </button>
	              </div>
	              <div class="originPic">
	              	<h6>선택하신 이미지는 삭제됩니다.</h6>
	              <div class="contents-container container-md">
				    <div class="contents-left">
				      <ul class="contents-thumblist">
				      	<c:forEach items="${ list }" var="a">
					        <li class="contents-thumbitem">
					        	<img class="contents-thumbimg" src="${ a.attRename }" id="delete-${ a.attRename }/${a.attFno}" alt="기존 리뷰 사진">
					        	<input type="hidden" name="deleteAttm" value="none">
					        </li>
				      	</c:forEach>
				      </ul>
				    </div>
				  </div>
	              </div>
	              
	              <div id="addFileDiv">
	                <div class="fileset fileset-lg fileset-label">
	                  <label>
	                    <div class="fileset-body">
	                      <div class="fileset-group">
	                        <input type="file" class="fileset-input" name="file" accept="image/*">
	                        <button class="fileset-cancel"></button>
	                      </div>
	                      <span class="btnset btnset-line btnset-lg fileset-upload">첨부하기</span>
	                    </div>
	                  </label>
	                </div>
	              </div>
	            </div>
	          </div>
	          <div class="contents-btn">
	            <div id="submitButton" class="modalset-btn">수정</div>
	            <div id="cancelButton" onclick="javascript:history.back();">취소</div>
	          </div>
        	</form>
        </div>
      </div>
    </div>
  </main>
  <jsp:include page="../common/footer.jsp"/>
  <script type="text/javascript">
  	window.onload = () =>{
  		document.getElementById('addPicButton').addEventListener('click', () => {
  		  const newDiv = document.createElement('div');
  		  newDiv.className = 'fileset fileset-lg fileset-label';

  		  const newHTML = '<label><div class="fileset-body"><div class="fileset-group"><input type="file" class="fileset-input" name="file" accept="image/*"><button class="fileset-cancel"></button></div><span class="btnset btnset-line btnset-lg fileset-upload">첨부하기</span></div></label>';
  		  newDiv.innerHTML = newHTML;
  		  document.getElementById('addFileDiv').appendChild(newDiv);
		});
  		
  		const delAttms = document.getElementsByClassName('contents-thumbimg');
  		for(const dAtt of delAttms) {
  			dAtt.addEventListener('click', function(){
               const nextHidden = this.nextElementSibling;
               if(this.classList.contains('dark')) {
                   this.classList.remove('dark');
                   nextHidden.value = none;
               } else {
                   this.classList.add('dark');
                   nextHidden.value = this.id.split('-')[1];
               }
            });
         }
  		
  	    const updateForm = document.getElementById("updateReviewForm");
  	  	document.getElementById("submitButton").addEventListener("click", () => {
  	  		updateForm.submit();
  	    });
	}
  	
  </script>
  
  <script src="rs/writeReview/js/setting.js"></script>
  <script src="rs/writeReview/js/script.js"></script>
</body>
</html>
