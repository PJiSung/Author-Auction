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
<title>약관동의</title>
<link rel="stylesheet" href="member/css/setting.css">
<link rel="stylesheet" href="member/css/plugin.css">
<link rel="stylesheet" href="member/css/template.css">
<link rel="stylesheet" href="member/css/common.css">
<link rel="stylesheet" href="member/css/style.css">
<style>
 .modal {
  display: none;
  position: fixed;
  z-index: 1 !important;
  left: 0;
  top: 0;
  width: 100%;
  height: 100%;
  overflow: auto;
  background-color: rgba(0, 0, 0, 0.4); 
}

.modal-content {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  background-color: #fefefe;
  padding: 20px;
  border: 1px solid #888;
  width: 100%; 
  max-width: 550px; 
}

.close {
  color: #aaa;
  float: right;
  font-size: 16px;
  font-weight: bold;
  border: none;
  background: white;
}

.close:hover,
.close:focus {
  color: black;
  text-decoration: none;
  cursor: pointer;
}

.del{
	margin-left : 20px;
	margin-right : 20px;
	color:#FF9999;
}
.del:hover, .del:focus{
	color: red;
	text-decoration: none;
	cursor: pointer;
}
.checkset .checkset-input.input-round + .checkset-label::before {
	font-size: 3.6rem !important;
}
.form-tit{
	font-size: 32px !important;
}
.form-desc, .checkset-desc, .accordset-content, .form-footer a{
	font-size: 18px !important;
}
.checkset-text, .accordset-button{
	font-size : 20px !important;
}
.accordset-header{
	padding-top: 15px !important;
	padding-bottom: 15px !important;
}
.accordset-button{
	padding-top: 3px !important;
	padding-left: 22px !important;
} 
</style>
<script>
window.onload = () =>{
	checkAllSpan();
}

const checkAll = () =>{
	const cboxs = document.querySelectorAll("input[type=checkbox]");
	for(let i=1; i<cboxs.length; i++){
		cboxs[i].checked = cboxs[0].checked;
	}
}

const checkAllSpan = () =>{
	let span = document.querySelector(".form-all-check span");
	span.addEventListener("click", function(){
		let radio = document.querySelectorAll("input[type=checkbox]")[0];
		if(radio.checked){
			radio.check = false;
		}else if(!radio.checked){
			radio.check = true;
		}
		checkAll();
	});
}

const checkSelect = () =>{
	const checkAllcBox = document.querySelectorAll("input[type=checkbox]")[0];
	const cboxs = document.querySelectorAll("input[name='agree']");
	const checkCboxs = document.querySelectorAll("input[name='agree']:checked");
	if(cboxs.length == checkCboxs.length){
		checkAllcBox.checked = true;
	}else{
		checkAllcBox.checked = false;
	}
};

const checkAgree = () =>{
	const cboxs = document.querySelectorAll("input[name='agree']");
	if(cboxs[0].checked && cboxs[1].checked){
		document.getElementById("myModal").style.display = "block";
		//location.href="deleteMember";
	}else{
		alert("서비스를 이용하시려면 약관에 동의하셔야 합니다.")
	}
}

const closeModal = () =>{
	document.getElementById("myModal").style.display = "none";
}
</script>
</head>
<jsp:include page="../common/header.jsp"/>
<body>
<br><br><br>
	<main class="th-layout-main">
		<!-- [S]bloomcity-N13 -->
		<div class="bloomcity-N13" data-bid="mQLqev6Dpn" id="bloomcity-N13">
			<div class="content-container">
				<div class="container-md">
					<div class="form-wrap">
						<form>
							<div class="form-header">
								<h3 class="form-tit">회원탈퇴 약관동의</h3>
								<div class="form-desc">
									계정을 삭제하시기 전에 아래의 유의 사항을 반드시 읽으신 후 서비스 약관 동의 여부를 결정하여 동의합니다에
									체크하여주시기 바랍니다.
								</div>
							</div>
							<div class="form-body">
								<div class="form-all-check">
									<div class="checkset">
										<input id="checkset-all" class="checkset-input input-round"
											type="checkbox" onclick="checkAll()"> <label
											class="checkset-label" for="checkset-all"></label> <span
											class="checkset-text">전체동의</span>
									</div>
									<p class="checkset-desc">
										<span class="br">아래 동의 항목을 개별 확인 후 각 항목마다 개별적으로 동의하실 수
											있습니다.</span> 전체 동의 시 체크되는 동의 항목에는 선택 동의 항목도 포함되어 있습니다.
									</p>
								</div>
								<div class="accordset accordset-arrow">
									<div class="accordset-item">
										<div class="accordset-header">
											<div class="checkset">
												<input id="checkset-c-3-2"
													class="checkset-input input-round" type="checkbox" name="agree" onclick="checkSelect()">
												<label class="checkset-label" for="checkset-c-3-2"></label>
											</div>
											<button class="accordset-button btn" type="button">(필수)
												탈퇴 시 개인정보 복구 불가 동의</button>
										</div>
										<div class="accordset-body">
											<div class="accordset-content">
												어서옥션 계정을 탈퇴하시면 어서옥션 계정으로 가입한 모든 서비스에서 동시에 탈퇴 처리되어,<br>
												더 이상 어서옥션 계정을 이용하여 제휴 서비스에 로그인할 수 없습니다.
											</div>
										</div>
									</div>
									<div class="accordset-item">
										<div class="accordset-header">
											<div class="checkset">
												<input id="checkset-c-3-3"
													class="checkset-input input-round" type="checkbox" name="agree" onclick="checkSelect()">
												<label class="checkset-label" for="checkset-c-3-3"></label>
											</div>
											<button class="accordset-button btn" type="button">(필수)
												데이터 영구 삭제 동의</button>
										</div>
										<div class="accordset-body">
											<div class="accordset-content">탈퇴 즉시 개인정보가 삭제되면, 어떠한 방법으로도 복원할 수 없습니다.<br>
												(다만, 전자상거래 서비스 등의 거래내역은 전자상거래 등에서의 소비자보호에 관한 법률에 의거하여 보호됩니다.)</div>
										</div>
									</div>
								</div>
							</div>
							<div class="form-footer btn-box">
								<a class="btnset btnset-mono btnset-lg btnset-rect"
									href="myInfo">취소</a> <a
									class="btnset2 btnset-lg btnset-rect" href="javascript:void(0)" onclick="checkAgree()">계정 삭제</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		
		<!-- [E]bloomcity-N13 -->
	</main>
		<div id="myModal" class="modal">
		  <div class="modal-content">
		    <h3>계정 삭제</h3><br>
		    <p>계정 삭제 시 유의 사항을 모두 확인하였으며, 계정을 정말 삭제하시겠습니까?</p><br>
		    <input type="button" class="close del" value="삭제" onclick="location.href='deleteMember'"><input type="button" class="close can" value="취소" onclick="closeModal()">
		  </div>
		</div>
		<jsp:include page="../common/footer.jsp"/>
	<script src="member/js/setting.js"></script>
	<script src="member/js/plugin.js"></script>
	<script src="member/js/template.js"></script>
	<script src="member/js/common.js"></script>
	<script src="member/js/script.js"></script>
</body>