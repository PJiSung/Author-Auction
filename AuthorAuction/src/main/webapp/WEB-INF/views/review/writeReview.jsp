<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="imagetoolbar" content="no">
<meta name="viewport" content="width=device-widt<%@ page language="java" contentType="text/html; charset=UTF-8"
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


</style>
</head>
<body>
  <jsp:include page="../common/header.jsp"/>
  <main class="th-layout-main ">
    <div class="insertReview" data-bid="IdlQhr973C" id="">
      <div class="contents-inner">
        <div class="contents-container container-md">
        	<form action="insertReview.rv" method="post" enctype="multipart/form-data" id="writeReviewForm">
	          <div class="textset textset-h2">
	            <h2 class="textset-tit">REVIEW 등록</h2>
	          </div>
	          <div class="contents-titgroup">
	          	<input type="hidden" name="proNo" id="selectedPro">
	            <div class="selectset selectset-lg">
	              <button class="selectset-toggle btn" type="button">
	                <span>상품 선택</span>
	              </button>
	              <ul class="selectset-list">
	              	<c:forEach items="${list}" var="p">
		                <li class="selectset-item">
		                  <button class="selectset-link btn" type="button" value="${p.PRO_NO}">
		                    <span>${p.PRO_NAME} | ${p.PRO_WRITER}</span>
		                  </button>
		                </li>
	              	</c:forEach>
	              </ul>
	            </div>
	          </div>
	          <div class="contents-group">
	            <div class="contents-group-top">
	              <textarea class="reviewContent" name="revContent" placeholder="리뷰 내용을 입력해주세요." required>​</textarea>
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
	            <div id="submitButton" class="modalset-btn">등록</div>
	            <div id="cancelButton" onclick='location.href="javascript:history.back();"'>취소</div>
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
  		
  		const selectedButs = document.querySelectorAll('.selectset-link');
  		for(let i = 0; i < selectedButs.length; i++){
  			selectedButs[i].addEventListener('click', function() {
  				document.getElementById('selectedPro').value = this.value;
  			});
  		}
  		
  	    const writeForm = document.getElementById("writeReviewForm");
  	  	document.getElementById("submitButton").addEventListener("click", () => {
  	  		writeForm.submit();
  	    });
  	  	

		
	}
  	
  </script>
  
  <script src="rs/writeReview/js/setting.js"></script>
  <script src="rs/writeReview/js/script.js"></script>
</body>
</html>h, initial-scale=1.0">
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


</style>
</head>
<body>
  <jsp:include page="../common/header.jsp"/>
  <main class="th-layout-main ">
    <div class="insertReview" data-bid="IdlQhr973C" id="">
      <div class="contents-inner">
        <div class="contents-container container-md">
        	<form action="insertReview.rv" method="post" enctype="multipart/form-data" id="writeReviewForm">
	          <div class="textset textset-h2">
	            <h2 class="textset-tit">REVIEW 등록</h2>
	          </div>
	          <div class="contents-titgroup">
	          	<input type="hidden" name="proNo" id="selectedPro">
	            <div class="selectset selectset-lg">
	              <button class="selectset-toggle btn" type="button">
	                <span>상품 선택</span>
	              </button>
	              <ul class="selectset-list">
	              	<c:forEach items="${list}" var="p">
		                <li class="selectset-item">
		                  <button class="selectset-link btn" type="button" value="${p.PRO_NO}">
		                    <span>${p.PRO_NAME} | ${p.PRO_WRITER}</span>
		                  </button>
		                </li>
	              	</c:forEach>
	              </ul>
	            </div>
	          </div>
	          <div class="contents-group">
	            <div class="contents-group-top">
	              <textarea class="reviewContent" name="revContent" placeholder="리뷰 내용을 입력해주세요." required>​</textarea>
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
	            <div id="submitButton" class="modalset-btn">등록</div>
	            <div id="cancelButton" onclick='location.href="javascript:history.back();"'>취소</div>
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
  		
  		const selectedButs = document.querySelectorAll('.selectset-link');
  		for(let i = 0; i < selectedButs.length; i++){
  			selectedButs[i].addEventListener('click', function() {
  				document.getElementById('selectedPro').value = this.value;
  			});
  		}
  		
  	    const writeForm = document.getElementById("writeReviewForm");
  	  	document.getElementById("submitButton").addEventListener("click", () => {
  	  		writeForm.submit();
  	    });
  	  	

		
	}
  	
  </script>
  
  <script src="rs/writeReview/js/setting.js"></script>
  <script src="rs/writeReview/js/script.js"></script>
</body>
</html>
