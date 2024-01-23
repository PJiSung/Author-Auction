<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>	    
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta http-equiv="imagetoolbar" content="no">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="format-detection" content="telephone=no">
  <title>위탁 문의 상세 | 침대</title>
  <link rel="stylesheet" href="consignment/css/setting.css">
  <link rel="stylesheet" href="consignment/css/plugin.css">
  <link rel="stylesheet" href="consignment/css/template.css">
  <link rel="stylesheet" href="consignment/css/common.css">
  <link rel="stylesheet" href="consignment/css/style.css">
<style> 
.fileset-upload, .fileset-input{cursor:pointer;}
#attmForm .contents-thumbimg:hover{
	filter: brightness(75%);
}

#attmForm .contents-thumbimg.dark {
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
#back {
    min-width: 10rem;
    float: right;
    border: 1px black solid;
    background-color: white;
    color: black;
    /* padding: 0 1.6rem; */
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
  height: 200px;
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
</head>


<body>
<jsp:include page="../common/header.jsp"/>
	<main class="th-layout-main ">
    <!-- [S]hooms-N58 -->
	<div class="hooms-N58" data-bid="eO2cM2h3g10" id="">
		<div class="contents-container container-md">
		  <div class="tabset tabset-solid">
		  </div>
		</div>
	</div>
    <!-- [E]hooms-N58 -->
    <!-- [S]hooms-N39 -->
	<div class="hooms-N39" data-bid="ka2cm2jQlm2" id="">
		<div class="contents-inner">
			<div class="contents-container container-md">
			  <div class="textset textset-h2">
			    <a class="textset-tit" style="font-size: 40px;">위탁 문의 내역(수정)</a>
			</div>
          
          	<form action="updateBoard.co" enctype="multipart/form-data" method="post" id="attmForm">
          	
          	<input type="hidden" name="memId" value="${ loginUser.memId }">
          	<input type="hidden" name="conNo" value="${ c.conNo }">
          	<input type="hidden" name="page" value="${ pi.currentPage }">
			<div class="dhead">
				<div>
				  <h2>위탁 정보 수정</h2>
				</div>
	            <div class="contents-form-middle">
					<div class="inputset inputset-lg inputset-label">
						<label>
							<span>
								<h6 class="inputset-tit"> 위탁자 이름 </h6>
							</span>
							<span>
								<input type="text" class="inputset-input form-control" style="border-color: lightgray; cursor: default;" value="${ m.memName }" name="memName" aria-label="내용" readonly>
							</span>
						</label>
			            <label>
							<h6 class="inputset-tit"> 주소 </h6>
							<input type="text" class="inputset-input form-control" style="border-color: lightgray; cursor: default;" value="${ fn:split(m.memAddress, '@')[0] } ${ fn:split(m.memAddress, '@')[1] } ${ fn:split(m.memAddress, '@')[2] }${ fn:split(m.memAddress, '@')[3] }" name="memAddress" aria-label="내용" required="" readonly>
			            </label>
	              	</div>
	              	<div class="inputset inputset-lg inputset-label">
		                <label>
							<h6 class="inputset-tit"> 연락처 </h6>
							<input type="tel" class="inputset-input form-control" style="border-color: lightgray; cursor: default;" value="${m.memPhone}" name="memPhone" aria-label="내용" readonly>
		                </label>
		                <label>
		                  	<h6 class="inputset-tit"> 이메일 </h6>
		                  	<input type="text" class="inputset-input form-control" style="border-color: lightgray; cursor: default;" value="${m.memEmail}"name="memEmail" aria-label="내용" readonly>
		                </label>
	              	</div>
	            </div>
	        </div>
	        <div class="dbody">
				<div class="inputset inputset-lg inputset-label">
					<label>
		                <div>
		                  <h2> 위탁작품 정보 </h2>
		        		</div>
			            <div class="body">
							<label style="margin-left: 15rem;">
								<a style="display:inline-block; width: 15%; text-align: center;">작가명</a>
			                    <input type="text" class="inputset-input form-control" value="${c.conAuthor}" name="conAuthor" aria-label="내용" required="" style="width: 70rem; display:inline-block">
			                    <br><br>
			                    <a style="display:inline-block; width: 15%; text-align: center;">작품명</a>
			                    <input type="text" class="inputset-input form-control" value="${c.conProduct}" name="conProduct" aria-label="내용" required="" style="width: 70rem; display:inline-block">
			                    <br><br>
			                    <a style=" display:inline-block; width: 15%; text-align: center;">작품의 크기(cm)</a>
			                    <input type="number" class="inputset-input form-control" value="${c.conWidth}" aria-label="내용" required="" name="conWidth" style="width: 34rem; display:inline-block"> X <input type="number" name="conHeight" class="inputset-input form-control" value="${c.conHeight}" aria-label="내용" required="" style="width: 34rem; display:inline-block">
			                    <br><br>
			                    <a style="display:inline-block; width: 15%; text-align: center;">제작연도</a>
			                    <input type=" number" class="inputset-input form-control" value="${c.conYear}" aria-label="내용" required="" name="conYear" style="width: 70rem; display:inline-block">
			                    <br><br>
			                    <a style=" display: inline-block; width: 15%; text-align: center;">희망가</a>
			                    <input type="number" class="inputset-input form-control" value="${c.conHope}" aria-label="내용" required="" name="conHope" style="width: 70rem; display: inline-block">
			                    <br><br>
			                    <div>
			                      <label style="display: inline-block; width: 15%; text-align: center;">출처 / 기타</label>
			                      <textarea name="conEtc" class="inputset-textarea" required="" style="display: inline-block; width: 60%; vertical-align: middle; resize: none;">${c.conEtc }</textarea>
			                    </div>
							</label>
						</div>
					</label>
	            </div>
			</div>
	        <div>
				<h2>작품 이미지</h2>
	        </div>
			<div class="dfoot" style="margin-bottom: 2rem;">
				<div class="inputset inputset-lg inputset-label">
					<label style="margin-left: 14rem;">
			    <div>
					<div class="fileset fileset-lg fileset-label">
						<label>
							<div class="fileset-body">
								<div class="fileset-group">
								 	<a style="display: inline-block; width: 15%; text-align: center;">앞면</a>
								 	<input type="file" class="fileset-input" name="file" style="width: 83%;" required accept="image/*">
									<button class="fileset-cancel"></button>
								</div>
							  	<span class="btnset btnset-line btnset-lg fileset-upload">파일 첨부하기</span>
							</div>
						</label>
					</div>
			        <br>
			        
			        <div class="fileset fileset-lg fileset-label">
						<label>
				            <div class="fileset-body">
								<div class="fileset-group">
									<a style="display: inline-block; width: 15%; text-align: center;">뒷면	</a>
									<input type="file" class="fileset-input" name="file" style="width: 83%;" required accept="image/*">
									<button class="fileset-cancel"></button>
								</div>
								<span class="btnset btnset-line btnset-lg fileset-upload">파일 첨부하기</span>
				            </div>
			          	</label>
			        </div>
			        <br>
			        
			        <div class="fileset fileset-lg fileset-label">
						<label>
							<div class="fileset-body">
								<div class="fileset-group">
									<a style="display: inline-block; width: 15%; text-align: center;">서명</a>
									<input type="file" class="fileset-input" style="width: 83%;" name="file" required accept="image/*">
									<button class="fileset-cancel"></button>
								</div>
							  	<span class="btnset btnset-line btnset-lg fileset-upload">파일 첨부하기</span>
							</div>
						</label>
			        </div>
			        <br>
          
					<div class="fileset fileset-lg fileset-label">
						<label>
							<div class="fileset-body">
								<div class="fileset-group">
									<a style="display: inline-block; width: 15%; text-align: center;">상세사진</a>
									<input type="file" class="fileset-input" style="width: 83%;" name="file" required accept="image/*">
									<button class="fileset-cancel"></button>
								</div>
							  	<span class="btnset btnset-line btnset-lg fileset-upload">파일 첨부하기</span>
							</div>
						</label>
					</div>
					<br>
	                  
	                 <!-- 여기가 이미지 뜨는 곳 -->
					<div class="originPic">
						<div class="contents-container container-md">
							<div class="contents-left">
								<ul class="contents-thumblist">
									<c:forEach items="${list}" var="a">
										<li class="contents-thumbitem" style="width: 20rem; height: 20rem;">
											<img style="width: 100%; height: 100%;" class="contents-thumbimg" src="${a.attRename}" id="delete-${ a.attRename }/${a.attFno}" alt="등록된 사진">
											<input type="hidden" name="deleteAttm" value="none">
										</li>
									</c:forEach>
								</ul>
							</div>
 						</div>
					</div>
	                
					<c:if test="${ loginUser.memIsAdmin == 'N' }">
						<c:if test="${ c.conAdmStatus == 'N' }">
							<div class="contents-sign">
								<button class="btnset modalset-btn" type="button" id="submitAttm" onclick="">수정완료</button>
								<button class="btnset modalset-btn" type="button" id="delete" onclick="showModal()">삭제</button>
							</div>
						</c:if>
					</c:if>
	                <c:if test="${ loginUser.memIsAdmin == 'Y' }">
						<div class="contents-sign">
							<button class="btnset modalset-btn" type="button" id="submitAttm" onclick="showModal2()">수정완료</button>
							<button class="btnset modalset-btn" type="button" id="delete" onclick="showModal()">삭제</button>
						</div>
	                </c:if>
	                
					<button class="btnset" onclick="location.href='list.co'" type="button" id="back">이전</button>
	                
	                
					<div id="myModal2" class="modal">
						<div class="modal-content">
							<span class="close" onclick="closeModal()">&times;</span>
						    <main class="th-layout-main ">
						    	<div class="bloomcity-N10" data-bid="DDLQevsBR2">
						    		<div class="content-container">
										<div class="form-wrap">	
											<div class="form-header">
												<h3 class="form-tit" style="text-align:center; font-size: 30px; margin-bottom: 2rem; margin-top: 2rem;">수정이 완료되었습니다.</h3>
											</div>
											<div class="form-body">
												<div class="btn-box" style="text-align: center;">
													<a class="btnset2 btnset-lg btnset-rect" href="javascript:void(0)" id="submitBtn" onclick="submitBtn2()" style="margin-top: 2rem; margin-right: 1rem;">네</a>
												</div>
											</div>
										</div>
									</div>
								</div>
							</main>
						</div>
					</div>
					
					<div id="myModal" class="modal">
						<div class="modal-content">
							<span class="close" onclick="closeModal()">&times;</span>
						    <main class="th-layout-main ">
						    	<div class="bloomcity-N10" data-bid="DDLQevsBR2">
						    		<div class="content-container">
										<div class="form-wrap">	
											<div class="form-header">
												<h3 class="form-tit" style="text-align:center; font-size: 30px; margin-bottom: 2rem; margin-top: 2rem;">그림추천 문의 삭제</h3>
											</div>
											<div class="form-body">
												<p style="text-align: center; font-size: 20px;">삭제하시겠습니까?</p>
												<div class="btn-box" style="text-align: center;">
													<a class="btnset2 btnset-lg btnset-rect" href="javascript:void(0)" id="submitBtn" onclick="submitBtn2()" style="margin-top: 2rem; margin-right: 1rem;">네</a>
													<a class="btnset2 btnset-lg btnset-rect" href="javascript:void(0)" id="cancelBtn" onclick="closeModal()" style=" margin-left: 1rem;">아니오</a>
												</div>
											</div>
										</div>
									</div>
								</div>
							</main>
						</div>
					</div>
					
					
	              	</label>
	              <a style="display: inline-block; width: 15%; text-align: center;"></a>
	            </div><a style="display: inline-block; width: 15%; text-align: center;">
	            </a>
	          </div>
	        </div>
	      </form>
      </div>
    </div>
    <!-- [E]hooms-N39 -->
  </main>
<jsp:include page="../common/footer.jsp"/>  



	<script>
		// 글 삭제 모달
		const showModal = () => {
		    const modal = document.getElementById('myModal');
		    modal.style.display = 'block';
		};
		// 수정 모달
		const showModal2 = () => {
		    const modal = document.getElementById('myModal2');
		    modal.style.display = 'block';
		};
		const closeModal = () => {
			const modal = document.getElementById('myModal');
		    modal.style.display = 'none';
		};
		// 삭제완료
		const submitBtn = () =>{
			const attmForm = document.getElementById('attmForm');
			attmForm.action='delete.co';
			attmForm.submit();
		}
		// 수정완료
		const submitBtn2 = () =>{
			const attmForm = document.getElementById('attmForm');
			attmForm.action='delete.co';
			attmForm.submit();
		}
		window.onload = () => {
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
	                    nextHidden.value = this.id.split('-')[1];
                	}
           		});
        	} 
			// 아무데나 눌러도 이제 첨부창 안뜸
			const divimg = document.getElementsByClassName('contents-thumblist');
			for(const dAtt of divimg)
				dAtt.addEventListener('click', function(event){
				event.preventDefault();	
			})
			
			const deleteAttmInputs = document.querySelectorAll('input[name="deleteAttm"]');
			
			const img = document.querySelectorAll("img[class='contents-thumbimg']");
			const imgArr = [];
			
			for(const [index, selectImg] of img.entries()){
				selectImg.addEventListener('click',function(){
					if(imgArr[index] == null) {
						imgArr[index] =  selectImg.src;
					}else{
						imgArr[index] = "null";
					}
				})
			}
				
			let nonNoneCount = 0;
			document.getElementById('submitAttm').addEventListener('click', function(){

			const files = document.getElementsByClassName("fileset-group")[0];
			const exist = [];
			const multiFile = [];
			
			let formData = new FormData();
			for(let i = 0; i < 4; i++){
				if(document.getElementsByClassName("fileset-group")[i].querySelector(".fileset-input.active")){
					multiFile.push(document.getElementsByClassName("fileset-group")[i].querySelector(".fileset-input.active").files[0]);
					exist.push(i);
				}
			}
			for(let i=0 ; i<multiFile.length; i++){
				formData.append("files", multiFile[i]);
			}
			
			for(let i = 0; i<exist.length; i++){
				formData.append("exist", exist[i]);
			}
			
			for(let i = 0; i<imgArr.length; i++){
				formData.append("imgArr", imgArr[i]);
			}
			
			let conNo = document.getElementsByName("conNo")[0];
			formData.append("conNo", conNo.value);
					
				$.ajax({
					url:'updateConsignment.co',
					type:'post',
					data: formData,
					contentType:false,
					processData:false,
					success: (data) =>{
						console.log(data);
						if(data == "success"){
							console.log(data);
							
						}
					},
					error: data => console.log(data)
						
				})
				let form = document.getElementById("attmForm");
				form.submit();
				alert("성공");
		})
				
		const fileInputs = document.querySelectorAll('.fileset-group input[type="file"]');
		// 총 파일 개수 초기화
		let totalNewFileCount = 0;
		// 각 파일 입력란을 순회하면서 파일 개수 더하기
		fileInputs.forEach((input) => {
		  totalNewFileCount += input.files.length;
		});
				
		// 기존 이미지 삭제 버튼 이벤트
	    const deleteButtons = document.querySelectorAll('.deleteBtn');
	    for (const deleteButton of deleteButtons) {
	        deleteButton.addEventListener('click', function () {
	            alert('기존 이미지 삭제 버튼이 클릭되었습니다.');
	        });
	    }
	}
	</script>


	<script src="consignment/js/setting.js"></script>
	<script src="consignment/js/plugin.js"></script>
	<script src="consignment/js/template.js"></script>
	<script src="consignment/js/common.js"></script>
	<script src="consignment/js/script.js"></script>
</body>
</html>

