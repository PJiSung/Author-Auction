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
<title>아이디찾기</title>
<link rel="stylesheet" href="member/css/setting.css">
<link rel="stylesheet" href="member/css/plugin.css">
<link rel="stylesheet" href="member/css/template.css">
<link rel="stylesheet" href="member/css/common.css">
<link rel="stylesheet" href="member/css/style.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<style>
	.id{
		float: left;
	}
	.date{
		float: right;
	}
</style>
</head>
<body>
	<main class="th-layout-main ">
		<!-- [S]bloomcity-N10 -->
		<div class="bloomcity-N10" data-bid="DDLQevsBR2">
			<div class="content-container">
				<div class="form-wrap">
					<div class="form-header">
						<h3 class="form-tit">FIND ID</h3>
					</div>
					<div class="form-body">
						<p>고객님의 정보와 일치하는 아이디입니다.</p>
							<div class="category">
								<div class="inputset inputset-line inputset-lg">
									<h2><span class="id">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${m.memId}</span><span class="date">가입 : ${m.memDate}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></h2>
								</div>
							</div>
							<br>
							<div class="btn-box">
								<a class="btnset2 btnset-lg btnset-rect" href="loginView">로그인</a>
							</div>
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