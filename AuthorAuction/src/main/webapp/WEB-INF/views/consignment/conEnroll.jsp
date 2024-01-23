<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>	    
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta http-equiv="imagetoolbar" content="no">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="format-detection" content="telephone=no">

  <title>위탁 문의 등록</title>
  <link rel="stylesheet" href="consignment/css/setting.css">
  <link rel="stylesheet" href="consignment/css/plugin.css">
  <link rel="stylesheet" href="consignment/css/template.css?ver=3">
  <link rel="stylesheet" href="consignment/css/common.css">
  <link rel="stylesheet" href="consignment/css/style.css">
<style>
.fileset-upload, .fileset-input{cursor:pointer;}
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
 .btnset2 {
  width: 20%;
  min-width: 3rem;
  border-radius: 0.6rem;
  height: 4rem;
  font-weight: 500;
  color: white;
  background-color: black;
  line-height: 4rem;
}
 .btnset2:hover{
  color:white;
}
</style>  
 </head>
 
<body>
<jsp:include page="../common/header.jsp"/>

  <main class="th-layout-main ">
    <!-- [S]hooms-N58 -->
    <div class="hooms-N58" data-bid="WGlQcEQ7wp" id="">
      <div class="contents-container container-md">
        <div class="tabset tabset-solid">
        </div>
      </div>
    </div>
    <!-- [E]hooms-N58 -->
    <!-- [S]hooms-N39 -->
    <form action="conInsert.co" method="post" enctype="multipart/form-data" id="attmForm" >
	    <div class="hooms-N39" data-bid="uqLqcFv4LT" id=""">
	      <div class="contents-inner">
	        <div class="contents-container container-md">
	          <div class="textset textset-h2">
	            <a class="textset-tit" style="font-size: 40px;">위탁 문의 등록</a>
	          </div>
	          <div class="dhead">
	            <div>
	              <h2>위탁인 정보</h2>
	            </div>
	            <div class="contents-form-middle">
	              <div class="inputset inputset-lg inputset-label">
	                <label>
	                  <span>
	                    <h6 class="inputset-tit"> 위탁자 이름 </h6>
	                  </span>
	                  <span>
	                    <input type="text" class="inputset-input form-control hover" style="border-color: lightgray; cursor: default;" id="hover" value="${ loginUser.memName }" name="memName" aria-label="내용" required="" readonly>
	                  </span>
	                </label>
	                <label>
	                  <h6 class="inputset-tit"> 주소 </h6>
	                  <input type="text" class="inputset-input form-control hover" style="border-color: lightgray; cursor: default;" id="hover" value="${ fn:split(loginUser.memAddress, '@')[0] } ${ fn:split(loginUser.memAddress, '@')[1] } ${ fn:split(loginUser.memAddress, '@')[2] }${ fn:split(loginUser.memAddress, '@')[3] }" name="memAddress" aria-label="내용" required="" readonly>
	                </label>
	              </div>
	              <div class="inputset inputset-lg inputset-label">
	                <label>
	                  <h6 class="inputset-tit"> 연락처 </h6>
	                  <input type="tel" class="inputset-input form-control hover" style="border-color: lightgray; cursor: default;" id="hover" value="${loginUser.memPhone}" name="memPhone" aria-label="내용" required="" readonly>
	                </label>
	                <label>
	                  <h6 class="inputset-tit"> 이메일 </h6>
	                  <input type="text" class="inputset-input form-control hover" style="border-color: lightgray; cursor: default;" id="hover" value="${loginUser.memEmail}"name="memEmail" aria-label="내용" required="" readonly>
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
	                    <input type="text" class="inputset-input form-control" aria-label="내용" required="" name="conAuthor" style="width: 70rem; display:inline-block" required>
	                    <br><br>
	                    <a style="display:inline-block; width: 15%; text-align: center;">작품명</a>
	                    <input type="text" class="inputset-input form-control" aria-label="내용" required="" name="conProduct" style="width: 70rem; display:inline-block" required>
	                    <br><br>
	                    <a style=" display:inline-block; width: 15%; text-align: center;">작품의 크기(cm)</a>
	                    <input type="number" class="inputset-input form-control" aria-label="내용" required="" name="conWidth" style="width: 34rem; display:inline-block" required> X <input type="number" name="conHeight" class="inputset-input form-control" aria-label="내용" required="" style="width: 34rem; display:inline-block" required>
	                    <br><br>
	                    <a style="display:inline-block; width: 15%; text-align: center;">제작연도</a>
	                    <input type=" number" class="inputset-input form-control" aria-label="내용" required="" name="conYear" style="width: 70rem; display:inline-block" required>
	                    <br><br>
	                    <a style=" display: inline-block; width: 15%; text-align: center;">희망가</a>
	                    <input type="number" class="inputset-input form-control" aria-label="내용" required="" name="conHope" style="width: 70rem; display: inline-block" required>
	                    <br><br>
	                    <div>
	                      <label style="display: inline-block; width: 15%; text-align: center;">출처 / 기타</label>
	                      <textarea name="conEtc" class="inputset-textarea" required="" style="display: inline-block; width: 60%; vertical-align: middle; resize: none;"></textarea>
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
	                        <div class="fileset-group" data-order="1">
	                          <a style="display: inline-block; width: 15%; text-align: center;">앞면</a>
	                          <input type="file" class="fileset-input" name="file" style="width: 83%;"  accept="image/*">
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
	                        <div class="fileset-group" data-order="2">
	                          <a style="display: inline-block; width: 15%; text-align: center;">뒷면	</a>
	                          <input type="file" class="fileset-input" name="file" style="width: 83%;"  accept="image/*">
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
	                        <div class="fileset-group" data-order="3">
	                          <a style="display: inline-block; width: 15%; text-align: center;">서명</a>
	                          <input type="file" class="fileset-input" name="file" style="width: 83%;" name="file"  accept="image/*">
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
	                        <div class="fileset-group" data-order="5">
	                          <a style="display: inline-block; width: 15%; text-align: center;">상세사진</a>
	                          <input type="file" class="fileset-input" name="file" style="width: 83%;" name="file"  accept="image/*">
	                          <button class="fileset-cancel"></button>
	                        </div>
	                        <span class="btnset btnset-line btnset-lg fileset-upload">파일 첨부하기</span>
	                      </div>
	                    </label>
	                  </div>
	                  <br>
	                  
	                </div>
	                
	                
	                <div class="contents-sign">
	                  <button type="button" class="btnset modalset-btn2" id="submitAttm" onclick="showModal()">등록하기</button>
	                </div>
	                
					<div id="myModal" class="modal">
					  <div class="modal-content">
					    <span class="close" onclick="closeModal()">&times;</span>
					    <main class="th-layout-main ">
							<div class="bloomcity-N10" data-bid="DDLQevsBR2">
								<div class="content-container">
									<div class="form-wrap">
										<div class="form-header">
											<h3 class="form-tit" style="text-align:center; font-size: 30px; margin-bottom: 2rem;">문의사항 등록</h3>
										</div>
										<div class="form-body">
											<p>성공적으로 문의를 등록했습니다. <br> 빠른 시간내로 답변을 드리도록 하겠습니다.</p>
											<div class="btn-box" style="text-align: center;">
												<a class="btnset2 btnset-lg btnset-rect" href="javascript:void(0)" id="submitBtn" onclick="submitBtn()" style="text-align: center; margin-top: 1rem; margin-bottom: 2rem;">확인</a>
											</div>
										</div>
									</div>
								</div>
							</div>
						</main>
					  </div>
					</div>	                
	              </label><a style="display: inline-block; width: 15%; text-align: center;">
	              </a>
	            </div><a style="display: inline-block; width: 15%; text-align: center;">
	            </a>
	          </div><a style="display: inline-block; width: 15%; text-align: center;">
	          </a>
	        </div><a style="display: inline-block; width: 15%; text-align: center;">
	        </a>
	      </div>
	    </div>
	   </form> 
    <!-- [E]hooms-N39 -->
  </main>
<jsp:include page="../common/footer.jsp"/>

<script>
	function showModal() {
	    var fileInputs = document.querySelectorAll('input[type="file"]');
	    var selectedFileCount = 0;

	    fileInputs.forEach(function (fileInput) {
	        if (fileInput.files.length > 0) {
	            selectedFileCount += fileInput.files.length;
	        }
	    });

	    if (selectedFileCount >= 4) {
	        document.getElementById("myModal").style.display = "block";
	        
	    } else {
	        alert("사진은 반드시 4개를 첨부해주세요.");
	    }
	}

	function closeModal() {
	    document.getElementById("myModal").style.display = "none";
	}
	const submitBtn = () =>{
		document.getElementById("attmForm").submit();
	}
</script>


  <!-- [E]basic-N4 -->
  <script src="consignment/js/setting.js"></script>
  <script src="consignment/js/plugin.js"></script>
  <script src="consignment/js/template.js"></script>
  <script src="consignment/js/common.js"></script>
  <script src="consignment/js/script.js"></script>
  </body>
</html>

