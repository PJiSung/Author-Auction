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
<title>로그인</title>
<link rel="stylesheet" href="member/css/setting.css">
<link rel="stylesheet" href="member/css/plugin.css">
<link rel="stylesheet" href="member/css/template.css">
<link rel="stylesheet" href="member/css/common.css">
<link rel="stylesheet" href="member/css/style.css">
<style>
.btnset2{
	cursor: pointer;
}
</style>
</head>
<script>
window.onload = () =>{
	const beforeURL = document.referrer; 
    document.getElementsByName('beforeURL')[0].value = beforeURL;  
}
const submitBtn = () =>{
	document.getElementById('loginForm').submit();
}

document.addEventListener("keypress", function(e) {
	if (e.keyCode == 13) {
		document.querySelector(".btn-box a").click();
	}
});
</script>
<body>
	<main class="th-layout-main ">
		<!-- [S]bloomcity-N10 -->
		<div class="bloomcity-N10" data-bid="DDLQevsBR2">
			<div class="content-container">
				<div class="form-wrap">
					<div class="form-header">
						<h3 class="form-tit">LOGIN</h3>
					</div>
					<div class="form-body">
						<form action="login" method="post" id="loginForm">
						<input type="hidden" name="beforeURL">
							<div class="inputset inputset-line inputset-lg">
								<input type="text" class="inputset-input form-control"
									placeholder="아이디" aria-label="ID" name="memId">
							</div>
							<div class="inputset inputset-line inputset-lg">
								<input type="password" class="inputset-input form-control"
									placeholder="비밀번호" aria-label="Password" name="memPwd">
							</div>
							<div class="errorText">
								<span><font color="red">${msg}</font></span>
							</div>
							<div class="btn-box">
								<a class="btnset2 btnset-lg btnset-rect"
									onclick="submitBtn()">로그인</a>
							</div>
							<ul class="contents-list d-flex justify-content-center">
								<li class="contents-item"><a href="authenticationView"
									class="contents-link">회원가입</a></li>
								<li class="contents-item"><a href="findIdView"
									class="contents-link">아이디 찾기</a></li>
								<li class="contents-item"><a href="findPwView"
									class="contents-link">비밀번호 찾기</a></li>
							</ul>
							
						</form>
					</div>
					
					<div class="form-footer">
						<div class="form-footer-tit">
							<span class="fw-500">SNS 계정으로 로그인</span>
						</div>
						<a class="btnset btnset-round contents-start-kakao" 
						href="https://kauth.kakao.com/oauth/authorize?client_id=dc1a5dc127d59d833c26f234e1fc06ae&redirect_uri=http://localhost/kakaoLogin&response_type=code&prompt=login"> 
						<img class="btn-icon" src="member/icons/icon_kakao_circle.svg" alt="카카오로그인">
						</a>
					</div>
				</div>
			</div>
		</div>
		<!-- [E]bloomcity-N10 -->
	</main>
	<script src="member/js/setting.js"></script>
	<script src="member/js/plugin.js"></script>
	<script src="member/js/template.js"></script>
	<script src="member/js/common.js"></script>
	<script src="member/js/script.js"></script>
</body>
