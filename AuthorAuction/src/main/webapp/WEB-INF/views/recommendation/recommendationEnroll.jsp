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
  <title>그림 추천 문의 등록</title>
  <link rel="stylesheet" href="rs/writeReview/css/template.css">
  <link rel="stylesheet" href="rs/writeReview/css/style.css">
  <link rel="stylesheet" href="recommendation/css/setting.css">
  <link rel="stylesheet" href="recommendation/css/plugin.css">
  <link rel="stylesheet" href="recommendation/css/template.css">
  <link rel="stylesheet" href="recommendation/css/common.css">
  <link rel="stylesheet" href="recommendation/css/style.css">
<style>
.fileset-upload, .fileset-input{cursor:pointer;}
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
.inputset .content{width: 87%; margin-left: 12.5rem;}
.fileset .fileset-body{margin-bottom: 10px;}
</style>

</head>

<body>
 <jsp:include page="../common/header.jsp"/>
 
  <!-- [E]basic-N1 -->
  <main class="th-layout-main ">
    <!-- [S]basic-N24 -->
    <div class="basic-N24" data-bid="HD2cLwXMhgk">
      <div class="contents-inner">
        <div class="contents-container container-md">
         <form action="insertRecommendation.re" method="POST" enctype="multipart/form-data" id="recommendationForm">
         <input type="hidden" name="recStyle" id="style">
          <div class="form-group">
            <div class="textset">
              <h2 class="textset-tit">문의하기</h2>
            </div>
            <div class="inputset inputset-lg inputset-label">
              <a class="inputset-tit">제목<span>*</span></a>
              <input type="text" name="recTitle" class="inputset-input form-control" placeholder="제목을 입력해주세요." aria-label="내용" required="">
            </div>
            <div class="inputset inputset-lg inputset-label">
              <a class="inputset-tit">이름<span>*</span></a>
              	<a class="inputset-tit" style="text-align:left;">${loginUser.memName}</a>
            </div>
            <div class="inputset inputset-lg inputset-label">
              <a class="inputset-tit">그림스타일<span>*</span></a>
              <div class="selectset selectset-round selectset-lg">
                <button class="selectset-toggle btn" type="button">
                  <span>추상화</span>
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
                <h6 class="inputset-tit"> 문의내용<span>*</span>
                </h6>
                <textarea class="content" id="recContent" placeholder="문의 내용을 입력해주세요." name="recContent" required=""></textarea>
              </label>
            </div>
            <br>

			<div class="contents-group-bottom">
             	<div class="contents-date">
            	</div>
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

            <div class="form-btn" th-hoverbox="true">
              <button class="btnset" type="button" id="submitButton">글 등록</button>
              <button class="btnset" type="button" onclick='location.href="javascript:history.back();"' style="color: black; background-color: white; border: 1px solid black;">취소</button>
            </div>
           </form> 
          </div>
        </div>
      </div>
    </div>
    <!-- [E]basic-N24 -->
  </main>
  
<script>
	window.onload = () => {
	    // 사진 첨부창 스크립트
  		document.getElementById('addPicButton').addEventListener('click', () => {
  		  const newDiv = document.createElement('div');
  		  newDiv.className = 'fileset fileset-lg fileset-label';

  		  const newHTML = '<label><div class="fileset-body"><div class="fileset-group"><input type="file" class="fileset-input" name="file" accept="image/*"><button class="fileset-cancel"></button></div><span class="btnset btnset-line btnset-lg fileset-upload">첨부하기</span></div></label>';
  		  newDiv.innerHTML = newHTML;
  		  document.getElementById('addFileDiv').appendChild(newDiv);
		});
	    
	    // 글 등록
		/*
	    const form = document.getElementById('recommendationForm');
		document.getElementById('submitButton').addEventListener('click', () => {
		    form.submit();
		});
		*/
		const form = document.getElementById('recommendationForm');
		document.getElementById('submitButton').addEventListener('click', () => {
		    const files = document.getElementsByName('file');
		    let selectedFileCount = 0;
		    
		    for(const f of files){
		    	if(f.files && f.files.length > 0){
		    		selectedFileCount += 1;
		    	}
		    }
		    if(selectedFileCount < 1) {
		    	alert('사진은 반드시 첨부해주세요.');
		    } else {
				form.submit();
		    }
		});
		// 그림 스타일 선택
		const selectedButtons = document.querySelectorAll('.selectset-link');
		document.getElementById('style').value = '추상화';
		
		for(let i = 0; i < selectedButtons.length; i++){
			selectedButtons[i].addEventListener('click', function() {
				document.getElementById('style').value = this.value;
			});
		}
	}
	
</script>  
  
<jsp:include page="../common/footer.jsp"/>

  <!-- [E]basic-N4 -->
  <script src="../resources/js/setting.js"></script>
  <script src="../resources/js/plugin.js"></script>
  <script src="../resources/js/template.js"></script>
  <script src="../resources/js/common.js"></script>
  <script src="../resources/js/script.js"></script>
</body>
</html>
