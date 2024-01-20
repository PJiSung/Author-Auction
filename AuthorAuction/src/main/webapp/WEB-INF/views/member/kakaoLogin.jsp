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
.th-layout-main{
	margin-top: 50px;
}
.tab1, .tab2{
	display: none;
	width: 350px;
	text-align: center;
	margin: 0 auto;
}
.tab1 h2, .tab2 h2{
	line-height: 35px;
	font-weight: 500;
}
.tab1 .id{
	margin-top: 20px;
	margin-bottom: -20px;
	padding: 18px;
	border: 1px solid black;
	border-radius: 5px;
	font-weight: bold;
	font-size: 20px;
	line-height: 20px;
}
.tab1 img{
	margin-top: -5px;
}
.btn-box a{
	border-radius: 5px !important;
	background: #FFE812;
	height: 50px !important;
	line-height: 45px !important;
	color: black;
	cursor: pointer;
	border-color: #FFE812;
}
.btn-box a:hover {
    background: #FFD700;
    border-color: #FFD700;
    color: black;
}
.tab2 .btn-box{
	margin-top: 15px;
}
</style>
<script>
window.onload = () =>{
	let exist = "${id}";
	if(exist != ""){
		document.getElementsByClassName("tab1")[0].style.display="block";
	}else{
		document.getElementsByClassName("tab2")[0].style.display="block";
	}
}

const submitBtn = () =>{
	location.href="kakaoEnroll";
}
</script>
</head>
<body>
	<main class="th-layout-main ">
		<!-- [S]bloomcity-N10 -->
		<div class="bloomcity-N10" data-bid="DDLQevsBR2">
			<div class="content-container">
				<div class="form-wrap">
					<div class="form-body">
						<div class="tab1"><!-- 다른 계정 있을때 -->
							<h2>이미 가입된 아이디가 있습니다.</h2>
							<h2><font color="#FFE812">카카오</font> 계정을 연결해 주세요.</h2>
							<div class="id">
								<img src="main/icons/logoImage.png" height="20px" width="20px">&nbsp;${ id }
							</div>
							<div class="btn-box">
								<a class="btnset2 btnset-lg btnset-rect" onclick="submitBtn()"><img src="member/images/kakaoLogo.png" width="34px" height="35px">&nbsp;카카오 계정 연결하기</a>
							</div>
						</div>
						<div class="tab2"><!-- 다른 계정 없을때 -->
							<h2>가입된 아이디가 없습니다.</h2>
							<h2><font color="#FFE812">카카오</font> 계정을 연결해 주세요.</h2>
							<div class="btn-box">
								<a class="btnset2 btnset-lg btnset-rect" onclick="submitBtn()"><img src="member/images/kakaoLogo.png" width="34px" height="35px">&nbsp;카카오 계정 연결하기</a>
							</div>
					    </div>
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