<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
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
<title>본인인증</title>
<link rel="stylesheet" href="member/css/setting.css">
<link rel="stylesheet" href="member/css/plugin.css">
<link rel="stylesheet" href="member/css/template.css">
<link rel="stylesheet" href="member/css/common.css">
<link rel="stylesheet" href="member/css/style.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.9-1/crypto-js.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<style>
.modal {
  display: none;
  position: fixed;
  z-index: 1;
  left: 0;
  top: 50%; /* 50%로 수정 */
  width: 100%;
  height: auto; /* height를 auto로 수정 */
  overflow: auto;
  background-color: rgb(0,0,0);
  background-color: rgba(0,0,0,0.4);
  transform: translateY(-50%); /* 화면 중앙에 맞추기 위한 추가 */
}

.modal-content {
  background-color: #fefefe;
  margin: 15% auto;
  padding: 20px;
  border: 1px solid #888;
  width: 40%;
}

.close {
  color: #aaa;
  float: right;
  font-size: 28px;
  font-weight: bold;
}

.close:hover,
.close:focus {
  color: black;
  text-decoration: none;
  cursor: pointer;
}
.form-header{
	margin-top:-60px;
}
.inputset:nth-child(3){
	display:none;
}
</style>
<script>
document.addEventListener("keypress", function(e) {
	if (e.keyCode == 13) {
		document.querySelector(".btn-box a").click();
	}
});

const showModal = () =>{
	let modal = document.getElementById('myModal');
	modal.style.display = 'block';
}

const closeModal = () =>{
	let modal = document.getElementById('myModal');
	modal.style.display = 'none';
}

authNum = 0;
const submitBtn = () =>{
	let name = document.getElementById("name");
	let phone = document.getElementById("phone");
	if(name.value != "" && phone.value != ""){
		alert("인증번호를 발송했습니다. 인증번호가 오지 않으면 입력하신 정보를 확인해 주세요.");
		document.querySelector('.inputset:nth-child(3)').style.display = 'block';
		$.ajax({
			url: "authentication",
			data: {phone : phone.value},
			success: (data) =>{
				authNum = data;
				console.log(authNum);
				let aBtn = document.querySelector(".btn-box a");
				aBtn.innerText = "확인";
				aBtn.onclick = checkNum;
			},
			error : data => console.log
		});
	}
}

const checkNum = () =>{
	let inputNum = document.getElementById("authNum"); 
	if(authNum == inputNum.value){
		let phone = document.getElementById("phone").value;
		alert("본인인증이 완료되었습니다.");
		location.href="agreement?phone="+encodeBase64(phone);
	}else{
		alert("인증번호가 일치하지않습니다");
		inputNum.focus();
	}
}

const encodeBase64 = (data) =>{
    return CryptoJS.enc.Base64.stringify(CryptoJS.enc.Utf8.parse(data));
}
</script>
</head>

<body>
	<main class="th-layout-main ">
		<!-- [S]bloomcity-N12 -->
		<div class="bloomcity-N12" data-bid="ZmlQEv0qfZ">
			<div class="content-container">
				<div class="container-md">
					<ul class="step-list">
						<li class="step active"><span class="step-num">1</span>
							<p>본인인증</p></li>
						<li class="step"><span class="step-num">2</span>
							<p>약관동의</p></li>
						<li class="step"><span class="step-num">3</span>
							<p>정보입력</p></li>
						<li class="step"><span class="step-num">4</span>
							<p>가입완료</p></li>
					</ul>
					<div class="textset">
						<h2 class="textset-tit">회원가입을 하시려면 휴대폰 본인 인증이 필요합니다.</h2>
						<p class="textset-desc">
							휴대폰 본인 인증은 회원 본인 명의의 휴대폰 번호를 통해서만 인증이 가능합니다. <br> 회원님의 개인정보와
							일치하지 않는 명의의 휴대폰 번호로는 본인 인증이 불가합니다
						</p>
						<a class="btnset2 btnset-rect" href="javascript:void(0)" onclick="showModal()">본인인증
							하기</a>
					</div>
				</div>
			</div>
		</div>
		<!-- [E]bloomcity-N12 -->
		<!-- [S]blank-AwLQfZpog0 -->
		<div class="blank-AwLQfZpog0" data-bid="AwLQfZpog0">
			<div class="container"></div>
		</div>
		
		<div id="myModal" class="modal">
		  <div class="modal-content">
		    <span class="close" onclick="closeModal()">&times;</span>
		    <main class="th-layout-main ">
				<div class="bloomcity-N10" data-bid="DDLQevsBR2">
					<div class="content-container">
						<div class="form-wrap">
							<div class="form-header">
								<h3 class="form-tit">본인인증</h3>
							</div>
							<div class="form-body">
								<div class="inputset inputset-line inputset-lg">
									<input type="text" class="inputset-input form-control"
										placeholder="이름" aria-label="Name" id="name">
								</div>
								<div class="inputset inputset-line inputset-lg">
									<input type="text" class="inputset-input form-control"
										placeholder="휴대폰 번호" aria-label="Phone" id="phone">
								</div>
								<div class="inputset inputset-line inputset-lg">
									<input type="text" class="inputset-input form-control"
										placeholder="인증번호" aria-label="AuthNumber" id="authNum">
								</div>
								<div class="btn-box">
									<a class="btnset2 btnset-lg btnset-rect" href="javascript:void(0)"
										onclick="submitBtn()">인증하기</a>
								</div>
							</div>
						</div>
					</div>
				</div>
		<!-- [E]bloomcity-N10 -->
			</main>
		  </div>
		</div>
		<!-- [E]blank-AwLQfZpog0 -->
	</main>
	<script src="member/js/setting.js"></script>
	<script src="member/js/plugin.js"></script>
	<script src="member/js/template.js"></script>
	<script src="member/js/common.js"></script>
	<script src="member/js/script.js"></script>
</body>