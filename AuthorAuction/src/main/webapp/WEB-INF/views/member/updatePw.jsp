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
<title>비밀번호 변경</title>
<link rel="stylesheet" href="member/css/setting.css">
<link rel="stylesheet" href="member/css/plugin.css">
<link rel="stylesheet" href="member/css/template.css">
<link rel="stylesheet" href="member/css/common.css">
<link rel="stylesheet" href="member/css/style.css">
<script>
window.onload = () =>{
	checkRePwd();
}

document.addEventListener("keypress", function(e) {
	if (e.keyCode == 13) {
		document.querySelector(".btn-box a").click();
	}
});
 
checkPwd = false;
const checkRePwd = () =>{
	let rePwd = document.getElementById("reNewPw");
	rePwd.addEventListener("change", function(){
    	let memPwd = document.getElementById("newPw");
    	if(memPwd.value == this.value){
    		this.style.borderBottomColor = '#8FFF8F';
    		checkPwd = true;
    	}else{
    		this.style.borderBottomColor = 'red';
    		checkPwd = false;
    	}
	});
}

const submitBtn = () =>{
	let memPwd = document.getElementById("newPw");
	if(checkPwd == true){
		alert("비밀번호 변경이 완료되었습니다.")
		document.getElementById("updatePwForm").submit();
	}else{
		alert("비밀번호를 확인해 주세요.");
	}
}
</script>
</head>
<body>
	<main class="th-layout-main ">
		<!-- [S]bloomcity-N10 -->
		<div class="bloomcity-N10" data-bid="DDLQevsBR2">
			<div class="content-container">
				<div class="form-wrap">
					<div class="form-header">
						<h3 class="form-tit">CHANGE PW</h3>
					</div>
					<div class="form-body">
				        <form action="updatePw" method="post" id="updatePwForm">
				        	<input type="hidden" name="memId" value="${id}">
							<div class="category">
								<div class="inputset inputset-line inputset-lg">
									<input type="password" class="inputset-input form-control"
										placeholder="새 비밀번호" aria-label="Pwd" name="memPwd" id="newPw">
								</div>
								<div class="inputset inputset-line inputset-lg">
									<input type="password" class="inputset-input form-control"
										placeholder="새 비밀번호 확인" aria-label="reNewPw" id="reNewPw">
								</div>
							</div>
							<div class="btn-box">
								<a class="btnset2 btnset-lg btnset-rect" href="javascript:void(0)"
									onclick="submitBtn()">확인</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		
	</main>
	<script src="member/js/setting.js"></script>
	<script src="member/js/plugin.js"></script>
	<script src="member/js/template.js"></script>
	<script src="member/js/common.js"></script>
	<script src="member/js/script.js"></script>
</body>