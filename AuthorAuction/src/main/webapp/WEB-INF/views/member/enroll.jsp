<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<title>회원가입</title>
<link rel="stylesheet" href="member/css/setting.css">
<link rel="stylesheet" href="member/css/plugin.css">
<link rel="stylesheet" href="member/css/template.css">
<link rel="stylesheet" href="member/css/common.css">
<link rel="stylesheet" href="member/css/style.css">
</head>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
window.onload = () =>{
	selectEmail();
	checkId();
	checkNickName();
	checkRePwd();
}

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
   
const submitBtn = () =>{
	const form = document.getElementById('enrollForm');
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
	document.getElementsByName("memAddress")[0].value = address;
  	
  	email += document.getElementById("frontEmail").value+"@";
  	email += document.getElementById("backEmail").value;
	document.getElementsByName("memEmail")[0].value = email;	    	
  	document.getElementById('enrollForm').submit();
}
   
const selectEmail = () =>{
	let btns = document.getElementsByClassName("selectset-link btn");
	for (let i = 0; i < btns.length; i++) {
		btns[i].addEventListener("click", function () {
			let spanElement = this.querySelector("span");
			document.getElementById("backEmail").value = spanElement.innerText;
	    });
	}
}
   
const checkId = () =>{
	document.getElementsByName('memId')[0].addEventListener('change', function(){
		$.ajax({
 		url: 'checkId',
 		data: {memId:this.value.trim()},
 		success: (data) =>{
 			if(data == 0){
 				this.style.borderBottomColor = '#8FFF8F';
 			} else {
 				this.style.borderBottomColor = 'red';
 			}
 		},
 		error: data => console.log(data)
 		});
	});
}
   
const checkNickName = () =>{
	document.getElementsByName('memNickName')[0].addEventListener('change', function(){
		$.ajax({
 		url: 'checkNickName',
 		data: {memNickName:this.value.trim()},
 		success: (data) =>{
 			if(data == 0){
 				this.style.borderBottomColor = '#8FFF8F';
 			} else {
 				this.style.borderBottomColor = 'red';
 			}
 		},
 		error: data => console.log(data)
 		});
	});
}
   
const checkRePwd = () =>{
	let rePwd = document.getElementById("reMemPwd");
	rePwd.addEventListener("change", function(){
	 	let memPwd = document.getElementsByName("memPwd")[0].value;
	 	if(memPwd == this.value){
	 		this.style.borderBottomColor = '#8FFF8F';
	 	}else{
	 		this.style.borderBottomColor = 'red';
	 	}
	});
}
	
</script>
<body>
	<main class="th-layout-main">
		<!-- [S]bloomcity-N14 -->
		<div class="bloomcity-N14" data-bid="VZLQg0O4tB">
			<div class="content-container">
				<div class="container-md">
					<ul class="step-list">
						<li class="step"><span class="step-num">1</span>
							<p>본인인증</p></li>
						<li class="step"><span class="step-num">2</span>
							<p>약관동의</p></li>
						<li class="step active"><span class="step-num">3</span>
							<p>정보입력</p></li>
						<li class="step"><span class="step-num">4</span>
							<p>가입완료</p></li>
					</ul>
					<div class="form-wrap">
						<form action="insertMember" method="post" id="enrollForm">
						<input type="hidden" name="memPhone" value="${phone}">
						<input type="hidden" name="memAddress">
						<input type="hidden" name="memEmail">
							<div class="form-body">
								<fieldset class="fieldset">
									<legend class="legend">ID *</legend>
									<div class="input-group">
										<div class="inputset col inputset-line">
											<input type="text" class="inputset-input form-control" name="memId"
												placeholder="영문/숫자 조합으로 3 - 12자리로만 입력해주세요."
												aria-label="영문/숫자 조합으로 3 - 12자리로만 입력해주세요.">
										</div>
									</div>
								</fieldset>
								<fieldset class="fieldset">
									<legend class="legend">PASSWORD *</legend>
									<div class="input-group">
										<div class="inputset col inputset-line">
											<input type="password" class="inputset-input form-control" name="memPwd"
												placeholder="영문/숫자/특수문자를 사용하여, 8 - 12자리로만 입력해주세요."
												aria-label="영문/숫자/특수문자 8 - 12자리">
										</div>
									</div>
								</fieldset>
								<fieldset class="fieldset">
									<legend class="legend">CONFIRM PASSWORD *</legend>
									<div class="input-group">
										<div class="inputset col inputset-line">
											<input type="password" class="inputset-input form-control" id="reMemPwd"
												placeholder="영문/숫자/특수문자를 사용하여, 8 - 12자리로 다시한번 입력해주세요."
												aria-label="영문/숫자/특수문자 8 - 12자리 다시한번 입력">
										</div>
									</div>
									<p class="description">특수문자를 포함하여 입력해주세요.</p>
								</fieldset>
								<fieldset class="fieldset">
									<legend class="legend">NAME *</legend>
									<div class="input-group">
										<div class="inputset col inputset-line">
											<input type="text" class="inputset-input form-control" name="memName"
												placeholder="이름을 입력해주세요." aria-label="이름">
										</div>
									</div>
								</fieldset>
								<fieldset class="fieldset">
									<legend class="legend">NICKNAME *</legend>
									<div class="input-group">
										<div class="inputset col inputset-line">
											<input type="text" class="inputset-input form-control" name="memNickName"
												placeholder="닉네임을 입력해주세요." aria-label="닉네임">
										</div>
									</div>
								</fieldset>
								<fieldset class="fieldset">
									<legend class="legend">ADDRESS *</legend>
									<div class="input-group m-0">
										<div class="inputset inputset-line">
											<input type="text" class="inputset-input form-control" id="sample6_postcode"
												placeholder="우편번호" aria-label="우편번호">
										</div>
										<button
											class="id-check-btn btnset btnset-rect btnset-mono btnset-lg"
											type="button" onclick="sample6_execDaumPostcode()">우편번호 검색</button>
									</div>
									<div class="input-group">
										<div class="inputset col inputset-line">
											<input type="text" class="inputset-input form-control"
												placeholder="주소" aria-label="주소" id="sample6_address">
										</div>
									</div>
									<div class="input-group">
									<div class="inputset col inputset-line">
											<input type="text" class="inputset-input form-control" id="sample6_detailAddress" 
												placeholder="상세주소" aria-label="상세주소">
										</div>
										<div class="inputset inputset-line">
											<input type="text" class="inputset-input form-control" id="sample6_extraAddress"
												placeholder="참고항목" aria-label="참고항목">
										</div>
									</div>
								</fieldset>
								<fieldset class="fieldset">
									<legend class="legend">E-MALE *</legend>
									<div class="input-group">
										<div class="inputset col-3 inputset-line">
											<input type="text" class="inputset-input form-control" id="frontEmail"
												aria-label="내용">
										</div>
										<span>&nbsp;&nbsp;&nbsp;<font size="5px">@</font>&nbsp;&nbsp;&nbsp;</span>
										<div class="inputset col-3 inputset-line">
											<input type="text" class="inputset-input form-control"
												aria-label="내용" id="backEmail">
										</div>
										<div class="selectset selectset-line selectset-custom">
											<button class="selectset-toggle btn" type="button">
												&nbsp;&nbsp;&nbsp;<span>직접입력</span>
											</button>
											<ul class="selectset-list">
												<li class="selectset-item">
													<button class="selectset-link btn" type="button"
														data-value="템플릿2">
														<span>naver.com</span>
													</button>
												</li>
												<li class="selectset-item">
													<button class="selectset-link btn" type="button"
														data-value="템플릿1">
														<span>gmail.com</span>
													</button>
												</li>
											</ul>
										</div>
									</div>
								</fieldset>
							</div>
							<div class="form-footer btn-box">
								<a class="btnset btnset-mono btnset-lg btnset-rect"
									href="javascript:void(0)">취소</a> <a
									class="btnset2 btnset-lg btnset-rect" onclick="submitBtn()">확인</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<!-- [E]bloomcity-N14 -->
	</main>
	<!-- [E]bloomcity-N2 -->
	<script src="member/js/setting.js"></script>
	<script src="member/js/plugin.js"></script>
	<script src="member/js/template.js"></script>
	<script src="member/js/common.js"></script>
	<script src="member/js/script.js"></script>
</body>