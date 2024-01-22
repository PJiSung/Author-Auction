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
  <title>그림 추천 문의 상세조회</title>
  <link rel="stylesheet" href="rs/writeReview/css/template.css">
  <link rel="stylesheet" href="rs/writeReview/css/style.css">  
  <link rel="stylesheet" href="recommendation/css/setting.css">
  <link rel="stylesheet" href="recommendation/css/plugin.css">
  <link rel="stylesheet" href="recommendation/css/template.css">
  <link rel="stylesheet" href="recommendation/css/common.css">
  <link rel="stylesheet" href="recommendation/css/style.css">
<style>
.inputset .content{width: 87%; margin-left: 12.5rem;}
#recContent {width: 87%; margin-left: 12.5rem;}
#addPicButton{
   border: 0;
    background-color: transparent;
}

#addPicButton img{
   width: 30px;
   height: 30px;
   margin-left: 10px;
   margin-bottom: 20px;
}
#form .contents-thumbimg:hover{
	filter: brightness(75%);
}

#form .contents-thumbimg.dark {
    filter: brightness(40%);
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
.basic-N24[data-bid=QO2clwY04Et] .contents-container {
    padding: 3rem 1.6rem;
}
#textarea{
	height: 300px;
	
}
#form-btn {
    margin-top: 1rem;
    text-align: center;
    margin-bottom: 8rem;
}
.modal {
  display: none;
  position: fixed;
  z-index: 1;
  left: 0;
  top: 50%; /* 50%로 수정 */
  width: 100%;
  height: 100%; /* height를 auto로 수정 */
  overflow: auto;
  background-color: rgb(0,0,0);
  background-color: rgba(0,0,0,0.4);
  transform: translateY(-50%); /* 화면 중앙에 맞추기 위한 추가 */
}

.modal-content {
  border-radius: 0.6rem;
  background-color: #fefefe;
  margin: 15% auto;
  padding: 20px;
  border: 1px solid #888;
  width: 30%;
  height: 170px;
}
.close {
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
</style>


<script>
	window.onload = () => {
		// 답글 등록
		if(document.getElementById('enrollReply') != null){
			const form = document.getElementById('form');
			document.getElementById('enrollReply').addEventListener('click', (event) => {
				const files = document.getElementsByName('file');
				let selectedFileCount = 0;
				
				for(const f of files){
					if(f.files && f.files.length > 0){
						selectedFileCount += 1;
					}
				}
				if(selectedFileCount < 1){
					alert('사진을 반드시 첨부해주세요.');
					
				} else {
					form.action = 'insertReply.re';
					form.submit();
				}
			})		
		}
		// 답글 수정페이지로 이동
		if(document.getElementById('updateReply') != null){
			var replyForm2 = document.getElementById('replyForm2');
	 		var replyForm3 = document.getElementById('replyForm3');
			document.getElementById('updateReply').addEventListener('click', () =>{
		console.log(456456456)
				replyForm2.style.display = 'none';
				replyForm3.style.display = 'block';
			})
		};
		// 답글 수정완료 버튼 누를 때	
		if(document.getElementById('selectReply') != null){
			const form = document.getElementById('form');
			document.getElementById('selectReply').addEventListener('click', ()=>{
				
				const fileInputs = document.querySelectorAll('.fileset-input');
				let selectedFileCount = 0;
				fileInputs.forEach(fileInput => {
				    // 선택된 파일들 가져오기
				    const selectedFiles = fileInput.files;

				    // 파일이 선택되었는지 확인하고 개수 누적
				    selectedFileCount += selectedFiles.length;
				  });
				
				const imageTags = document.querySelectorAll('.contents-thumbitem.reply img.contents-thumbimg:not(.dark)').length;
				console.log(imageTags);
				
				if(selectedFileCount + imageTags == 0 ){
					alert('사진을 반드시 첨부해주세요.');
				} else if(selectedFileCount + imageTags > 1) {
					alert('사진은 1장만 첨부가능합니다.');
				} else {
					form.action = 'updateReply.re';
					form.submit();
				}
			})
		}
		// 등록된 이미지 클릭 방지
		const delAttms = document.getElementsByClassName('contents-thumbimg');
			for(const dAtt of delAttms) {
				dAtt.addEventListener('click', function(){
					const nextHidden = this.nextElementSibling;
					if(this.classList.contains('dark')) {
						this.classList.remove('dark');
		               	nextHidden.value = 'none';
					} else {
						this.classList.add('dark');
						console.log(this);
		                nextHidden.value = this.id.split('-')[1];
		            }
		       	});
		    }
	    // 사진 첨부창 스크립트
	    if(document.getElementById('addPicButton') != null){
	  		document.getElementById('addPicButton').addEventListener('click', () => {
				const newDiv = document.createElement('div');
	  		  	newDiv.className = 'fileset fileset-lg fileset-label';
	
	  		  	const newHTML = '<label><div class="fileset-body"><div class="fileset-group"><input type="file" class="fileset-input" name="file" accept="image/*"><button class="fileset-cancel"></button></div><span class="btnset btnset-line btnset-lg fileset-upload">첨부하기</span></div></label>';
	  		  	newDiv.innerHTML = newHTML;
	  		  	document.getElementById('addFileDiv').appendChild(newDiv);
		    })
		};
        
		// 그림 스타일 선택
		const selectedButtons = document.querySelectorAll('.selectset-link');
		document.getElementById('style').value = '추상화';
	
		for(let i = 0; i < selectedButtons.length; i++){
			selectedButtons[i].addEventListener('click', function() {
				document.getElementById('style').value = this.value;
			});
		}
		// 글 삭제
	/* 
		if(document.getElementById('deleteConfirm') != null){
			document.getElementById('deleteConfirm').addEventListener('click', () =>{
			const recommendationForm = document.getElementById('recommendationForm');										
				recommendationForm.action = 'deleteRecommendation.re';
				recommendationForm.submit();
	        });
		}
		 */
		
	}	
	const showModal = () => {
	    const modal = document.getElementById('myModal');
	    modal.style.display = 'block';
	  };
	const closeModal = () => {
		const modal = document.getElementById('myModal');
	    modal.style.display = 'none';
	};
	const submitBtn = () =>{
		const recommendationForm = document.getElementById('recommendationForm');
		recommendationForm.action='deleteRecommendation.re';
		recommendationForm.submit();
	}
</script>
</head>

<body>
<jsp:include page="../common/header.jsp"/>
  <!-- [E]basic-N1 -->
  <main class="th-layout-main ">
    <!-- [S]basic-N24 -->
    <div class="basic-N24" data-bid="QO2clwY04Et">
      <div class="contents-inner">
        <div class="contents-container container-md">
          <div class="form-group">
            <div class="textset">
              <h2 class="textset-tit">문의내역</h2>
            </div>
			   <form action="editRecommendation.re" method="post" id="recommendationForm">  
	            <input type="hidden" name="recNo" value="${ r.recNo }">
	            <input type="hidden" id="style" name="recStyle" value="${r.recStyle }">
	            <input name="recTitle" type="hidden" value="${ r.recTitle }">
	            <input type="hidden" name="recContent" value="${ r.recContent }">
	            <input type="hidden" name="recReply" value="${ r.recReply }">
	            <input type="hidden" name="memName" value="${ r.memName }">
	            <input type="hidden" name="memId" value="${ r.memId }">
	            <input type="hidden" name="beforeURL" value="${ beforeURL }">
	            
                
	            <div class="inputset inputset-lg inputset-label">
	              <a class="inputset-tit">제목</a>
	              <p id="recTitle">${r.recTitle}</p>
	            </div>
	            <div class="inputset inputset-lg inputset-label">
	              <a class="inputset-tit">이름</a>
	              <p name="memName" id="memName">${r.memName}</p>
	            </div>
	            <div class="inputset inputset-lg inputset-label">
	              <a class="inputset-tit">그림스타일</a>
	              <div class="selectset selectset-round selectset-lg">
	                <button class="selectset-toggle btn" type="button">
	                  <span>
	                  	<c:if test="${r.recStyle == '추상화'}">추상화</c:if>
	                  	<c:if test="${r.recStyle == '인물화'}">인물화</c:if>
	                  	<c:if test="${r.recStyle == '정물화'}">정물화</c:if>
	                  	<c:if test="${r.recStyle == '민화'}">민화</c:if>
	                  	<c:if test="${r.recStyle == '명화'}">명화</c:if>
	                  	<c:if test="${r.recStyle == '풍경화'}">풍경화</c:if>
	                  </span>
	                </button>
	                <ul class="selectset-list">
	                  <li class="selectset-item">
	                    <button class="selectset-link btn" type="button" value="추상화">
	                      <span>추상화</span>
	                    </button>
	                  </li>
	                  <li class="selectset-item">
	                    <button class="selectset-link btn" type="button" value="정물화">
	                      <span>정물화</span>
	                    </button>
	                  </li>
	                  <li class="selectset-item">
	                    <button class="selectset-link btn" type="button" value="인물화">
	                      <span>인물화</span>
	                    </button>
	                  </li>
	                  <li class="selectset-item">
	                    <button class="selectset-link btn" type="button" value="민화">
	                      <span>민화</span>
	                    </button>
	                  </li>
	                  <li class="selectset-item">
	                    <button class="selectset-link btn" type="button" value="명화">
	                      <span>명화</span>
	                    </button>
	                  </li>
	                  <li class="selectset-item">
	                    <button class="selectset-link btn" type="button" value="풍경화">
	                      <span>풍경화</span>
	                    </button>
	                  </li>
	                </ul>
	              </div>
	            </div>
				<div class="inputset inputset-lg inputset-label">
	              <label>
	                <h6 class="inputset-tit"">문의내용</h6>
		             <p required="" id="recContent" name="recContent">${r.recContent }</p>
	              </label>
	            </div>
	            <br>
	            
	            <!-- 여기가 이미지 뜨는 곳 -->
				<div class="originPic">
					<div class="contents-container container-md">
						<div class="contents-left">
							<ul class="contents-thumblist">
								<c:forEach items="${aList}" var="a">
									<c:if test="${a.attFno != '2'}">
										<li class="contents-thumbitem" style="width: 20rem; height: 20rem;">
											<img style="width: 100%; height: 100%;" class="contents-thumbimg" src="${a.attRename}" id="delete-${ a.attRename }/${a.attFno}" alt="등록된 사진">
										</li>
									</c:if>	
								</c:forEach>
							</ul>
						</div>
					</div>
				</div>
				<br><br>
				<c:if test="${loginUser.memId == r.memId}">
		            <div class="form-btn" id="form-btn">
		              <button class="btnset" type="submit" onclick="location.href='editRecommendation.re'" style="color: white;">수정</button> 
		              <button class="btnset" type="button" id="deleteConfirm" onclick="showModal()">삭제</button>
			       	</div>
				</c:if>
				
				<div id="myModal" class="modal">
					<div class="modal-content">
						<span class="close" onclick="closeModal()">&times;</span>
					    <main class="th-layout-main ">
					    	<div class="bloomcity-N10" data-bid="DDLQevsBR2">
					    		<div class="content-container">
									<div class="form-wrap">	
										<div class="form-header">
											<h3 class="form-tit" style="text-align:center; font-size: 30px; margin-bottom: 2rem;">그림추천 문의 삭제</h3>
										</div>
										<div class="form-body">
											<p style="text-align: center;">삭제하시겠습니까?</p>
											<div class="btn-box">
												<a class="btnset2 btnset-lg btnset-rect" href="javascript:void(0)" id="submitBtn" onclick="submitBtn()" style="float: right; margin-top: 1rem;">네</a>
												<a class="btnset2 btnset-lg btnset-rect" href="javascript:void(0)" id="cancelBtn" onclick="closeModal()">아니오</a>
											</div>
										</div>
									</div>
								</div>
							</div>
						</main>
					</div>
				</div>
			  </form>	
				
				
				
				<form action="insertReply.re" method="post" enctype="multipart/form-data" id="form">
				<c:if test="${ loginUser.memIsAdmin == 'Y' }">
				<input type="hidden" name="recNo" value="${r.recNo}">
				<input type="hidden" name="recTitle" value="${r.recTitle}">
				<input type="hidden" name="recContent" value="${r.recContent}">
				<input type="hidden" name="recStyle" value="${r.recStyle}">
				<input type="hidden" name="beforeURL" value="${beforeURL}">
	            <!-- 답글 없을때 -->
		            <c:if test="${r.recReply == null}">
		              <div class="rep replyForm1">
		          		<button class="btnset" id="enrollReply" type="button" style="background: white; color: black; min-width: 5rem; float: right;">등록</button>
			            <br><br>
			            <hr>
		
			            <div class="reply-form">
				            <div class="replyEnroll">
				              <div class="contents-group-bottom">
					             <textarea class="inputset-textarea textarea-keyup form-control" required="" id="textarea" name="recReply" style="resize: none; font-size: 16px;"></textarea>
				              </div>
				              <br>
			              	  <div class="contents-group-bottom">
					            <div class="contents-file">
					              <h3 class="h3" style="display:inline-block";>사진 첨부</h3>
					              <button id="addPicButton" type="button">
					                 <img class="icon-sm" src="rs/writeReview/icons/ico_plus_circle.svg" alt="아이콘">
					              </button>
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
						</div>
					  </div>		
					</c:if>		
				</c:if>	
				
				
				
				<!-- 답글 있을때 -->
					<c:if test="${r.recReply != null }">
						<!-- 답글 조회폼 -->
						<div class="replyForm2" id="replyForm2">
						<c:if test="${loginUser.memIsAdmin == 'Y'}">
							<button class="btnset" id="updateReply" type="button" style="background: white; color: black; min-width: 5rem; float: right;">수정</button>
				        </c:if>    
				            <br><br>
				            <hr>
				            
				            <div class="reply-form2">
					            <div class="replySelect">
					              <div class="contents-group-bottom">
						             <p name="recReply" value="${r.recReply }">${r.recReply}</p>
					              </div>
					              <br>
								</div>
					            
								<div class="originPic">
									<div class="contents-container container-md">
										<div class="contents-left">
											<ul class="contents-thumblist">
												<c:forEach items="${aList}" var="a">
													<c:if test="${a.attFno == '2'}">
														<li class="contents-thumbitem" style="width: 20rem; height: 20rem;">
															<img style="width: 100%; height: 100%;" class="contents-thumbimg" src="${a.attRename}" id="delete-${ a.attRename }/${a.attFno}" alt="등록된 사진">
														</li>
													</c:if>	
												</c:forEach>
											</ul>
										</div>
									</div>
								</div>	
							</div>
						</div>
						
						
						<!-- 답글 수정폼 -->
						<div class="replyForm3" id="replyForm3" style="display: none">
							<button class="btnset" id="selectReply" type="button" style="background: white; color: black; min-width: 5rem; float: right;">수정완료</button>
				            <br><br>
				            <hr>
				            
				            <div class="reply-form3">
					            <div class="replyUpdate">
					              <div class="contents-group-bottom">
						             <textarea class="inputset-textarea textarea-keyup form-control" required="" id="textarea" name="recReply" style="resize: none;">${r.recReply }</textarea>
					              </div>
					              <br>
				              	  <div class="contents-group-bottom">
						            <div class="contents-file">
						              <h3 class="h3" style="display:inline-block";>사진 첨부</h3>
						              <button id="addPicButton" type="button">
						                 <img class="icon-sm" src="rs/writeReview/icons/ico_plus_circle.svg" alt="아이콘">
						              </button>
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
					            
								<div class="originPic">
									<div class="contents-container container-md">
										<div class="contents-left">
											<ul class="contents-thumblist">
												<c:forEach items="${aList}" var="a">
												<c:if test="${a.attFno == '2'}">
													<li class="contents-thumbitem reply" style="width: 20rem; height: 20rem;">
														<img style="width: 100%; height: 100%;" class="contents-thumbimg " src="${a.attRename}" id="delete-${ a.attRename }/${a.attFno}" alt="등록된 사진">
														<input type="hidden" name="deleteReplyAttm" value="none">
													</li>
												</c:if>	
												</c:forEach>
											</ul>
										</div>
									</div>
								</div>	
							</div>
						  </div>
						</div>
					</c:if>				
				<br><br>
				<button class="btnset" type="button" style="margin-left: 990px; min-width: 8rem;"><a href="javascript:history.back();" style=" color: white;">이전</a></button>
			 </form>	
           </div>
         </div>
       </div>
  </main>
<jsp:include page="../common/footer.jsp"/>
    


  <!-- [E]basic-N4 -->
  <script src="recommendation/js/setting.js"></script>
  <script src="recommendation/js/plugin.js"></script>
  <script src="recommendation/js/template.js"></script>
  <script src="recommendation/js/common.js"></script>
  <script src="recommendation/js/script.js"></script>

</body>
</html>
