<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>	 
<!DOCTYPE html>
<html lang="UTF-8">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="imagetoolbar" content="no">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="format-detection" content="telephone=no">
<meta name="title" content="웹사이트">
<meta name="description" content="웹사이트입니다.">
<meta name="keywords" content="키워드,키워드,키워드">
<meta property="og:title" content="웹사이트">
<meta property="og:description" content="웹사이트입니다">
<meta property="og:image" content="https://웹사이트/images/opengraph.png">
<meta property="og:url" content="https://웹사이트">
<title>배송지 등록</title>
<link rel="stylesheet" href="member/css/setting.css">
<link rel="stylesheet" href="member/css/plugin.css">
<link rel="stylesheet" href="member/css/template.css">
<link rel="stylesheet" href="member/css/common.css">
<link rel="stylesheet" href="member/css/style.css">
<style>
.personal-rglq12YMbj{
	margin-bottom:-80px;
}
.form-tit{
	font-size: 35px !important;
}
input[type=text]::placeholder{
	font-size: 16px !important;	
}
legend{
	font-size: 18px !important;
	font-weight: bold !important;
}
</style>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
document.addEventListener("keypress", function(e) {
	if (e.keyCode == 13) {
		document.querySelector(".btn-box a").click();
	}
});

function sample6_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            var addr = '';
            var extraAddr = '';

            if (data.userSelectedType === 'R') {
                addr = data.roadAddress;
            } else {
                addr = data.jibunAddress;
            }

            if(data.userSelectedType === 'R'){
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                document.getElementById("sample6_extraAddress").value = extraAddr;
            
            } else {
                document.getElementById("sample6_extraAddress").value = '';
            }

            document.getElementById('sample6_postcode').value = data.zonecode;
            document.getElementById("sample6_address").value = addr;
            document.getElementById("sample6_detailAddress").focus();
        }
    }).open();
}

const checkCbox = () =>{
	let cbox = document.querySelector("input[type=checkbox]");
	if(cbox.checked){
		cbox.checked = false;
	}else{
		cbox.checked = true;
	}
}

const submitBtn = () =>{
	
	const form = document.getElementById('addressForm');
	if (!form.checkValidity()) {
	    alert('모든 필수 입력 필드를 작성해주세요.');
	    
	    const invalidFields = document.querySelectorAll('input:invalid');
	    invalidFields.forEach(field => {
	      field.style.borderBottom = '1px solid red';
	    });
		return;  
	}
	
	let address = "";
	let email = "";
	address += document.getElementById("sample6_postcode").value+"@";
	address += document.getElementById("sample6_address").value+"@";
	address += document.getElementById("sample6_detailAddress").value+"@";
	address += document.getElementById("sample6_extraAddress").value;
	document.getElementsByName("addAddress")[0].value = address;
	
	let checkDefault = document.querySelector("input[type=checkbox]:checked");
	if(checkDefault == null){
		document.getElementsByName("addDefault")[0].value = "N";
	}else{
		document.getElementsByName("addDefault")[0].value = "Y";
	}
  	document.getElementById('addressForm').submit();
}
</script>
</head>
<body>
<jsp:include page="../common/header.jsp"/>
	<main class="th-layout-main">
		<!-- [S]bloomcity-N14 -->
		<div class="bloomcity-N14" data-bid="VZLQg0O4tB">
			<div class="content-container">
				<div class="container-md">
					<div class="form-wrap">
						<div class="bloomcity-N10" data-bid="DDLQevsBR2">
							<div class="form-header">
								<h4 class="form-tit">배송지 수정</h4>
							</div>
						</div>
						<form action="updateAddress" method="post" id="addressForm">
						<input type="hidden" name="addNo" value="${ a.addNo }">
						<input type="hidden" name="memId" value="${ loginUser.memId }">
						<input type="hidden" name="addAddress">
						<input type="hidden" name="addDefault">
							<div class="form-body">
								<fieldset class="fieldset">
									<legend class="legend">배송지명 *</legend>
									<div class="input-group">
										<div class="inputset col inputset-line">
											<input type="text" class="inputset-input form-control" name="addName" value="${ a.addName }"
												placeholder="예)우리집"
												aria-label="예)우리집" required="required">
										</div>
									</div>
								</fieldset>
								<fieldset class="fieldset">
									<legend class="legend">받는사람 *</legend>
									<div class="input-group">
										<div class="inputset col inputset-line">
											<input type="text" class="inputset-input form-control" name="addRecipient" value="${ a.addRecipient }"
												placeholder="이름"
												aria-label="이름" required="required">
										</div>
									</div>
								</fieldset>
								<fieldset class="fieldset">
									<legend class="legend">주소 *</legend>
									<div class="input-group m-0">
										<div class="inputset inputset-line">
											<input type="text" class="inputset-input form-control" id="sample6_postcode" value="${ fn:split(a.addAddress, '@')[0] }"
												placeholder="우편번호" aria-label="우편번호" required="required" readonly="readonly">
										</div>
										<button
											class="id-check-btn btnset btnset-rect btnset-mono btnset-lg"
											type="button" onclick="sample6_execDaumPostcode()">우편번호 검색</button>
									</div>
									<div class="input-group">
										<div class="inputset col inputset-line">
											<input type="text" class="inputset-input form-control" value="${ fn:split(a.addAddress, '@')[1] }"
												placeholder="주소" aria-label="주소" id="sample6_address" required="required" readonly="readonly">
										</div>
									</div>
									<div class="input-group">
									<div class="inputset col inputset-line">
											<input type="text" class="inputset-input form-control" id="sample6_detailAddress" value="${ fn:split(a.addAddress, '@')[2] }"
												placeholder="상세주소" aria-label="상세주소" required="required">
										</div>
										<div class="inputset inputset-line">
											<input type="text" class="inputset-input form-control" id="sample6_extraAddress" value="${ fn:split(a.addAddress, '@')[3] }"
												placeholder="참고항목" aria-label="참고항목" readonly="readonly">
										</div>
									</div>
								</fieldset>
								<fieldset class="fieldset">
									<legend class="legend">연락처 *</legend>
									<div class="input-group">
										<div class="inputset col inputset-line">
											<input type="text" class="inputset-input form-control" name="addPhone" value="${ a.addPhone }"
												placeholder="휴대폰 번호" aria-label="휴대폰 번호" required="required">
										</div>
									</div>
								</fieldset>
								 <fieldset class="fieldset">
						            <div class="checkset">
						              <input id="checkset-a-1-2" class="checkset-input input-fill" type="checkbox" <c:if test="${ a.addDefault eq 'Y' }">checked</c:if> >
						              <label class="checkset-label" for="checkset-a-1-2"></label>
						              <span class="checkset-text" onclick="checkCbox()">기본 배송지로 설정</span>
						            </div>
						          </fieldset>
							 	  <div class="form-footer btn-box">
								      <a class="btnset btnset-mono btnset-lg btnset-rect" href="myInfo?tab=2">취소</a>
								      <a class="btnset2 btnset-lg btnset-rect" href="javascript:void(0)" onclick="submitBtn()">확인</a>
							      </div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<!-- [E]bloomcity-N14 -->
	<jsp:include page="../common/footer.jsp"/>
	</main>
	<!-- [E]bloomcity-N2 -->
	<script src="member/js/setting.js"></script>
	<script src="member/js/plugin.js"></script>
	<script src="member/js/template.js"></script>
	<script src="member/js/common.js"></script>
	<script src="member/js/script.js"></script>
</body>