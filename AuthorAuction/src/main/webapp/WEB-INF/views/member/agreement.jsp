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
<script>
window.onload = () =>{
	checkAllSpan();
	subCheckAllSpan();
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

const subCheckAll = () =>{
	const checkAllcBox = document.querySelectorAll("input[type=checkbox]")[3];
	const cboxs = document.querySelectorAll("input[name='subCbox']");
	for(let i=0; i<cboxs.length; i++){
		cboxs[i].checked = checkAllcBox.checked;
	}
}

const subCheckSelect = () =>{
	const checkAllcBox = document.querySelectorAll("input[type=checkbox]")[3];
	const cboxs = document.querySelectorAll("input[name='subCbox']");
	const checkCboxs = document.querySelectorAll("input[name='subCbox']:checked");
	if(cboxs.length == checkCboxs.length){
		checkAllcBox.checked = true;
		checkSelect();
	}else{
		checkAllcBox.checked = false;
		checkSelect();
	}
};

const subCheckAllSpan = () =>{
	let spans = document.querySelectorAll(".radio-group span");
	for(let i=0; i<spans.length; i++){
		spans[i].addEventListener("click", function(){
			let radio = document.querySelectorAll(".radio-group input[type=checkbox]")[i];
			if(radio.checked){
				radio.checked = false;
			}else if(!radio.checked){
				radio.checked = true;
			}
			subCheckSelect();
		});
	}
}

const checkFalse = () =>{
	const checkAllcBox = document.querySelectorAll("input[type=checkbox]")[0];
	checkAllcBox.checked = false;
	checkAll();
}

const checkAgree = () =>{
	const cboxs = document.querySelectorAll("input[name='agree']");
	if(cboxs[0].checked && cboxs[1].checked){
		location.href="enroll?phone=${phone}";
	}else{
		alert("서비스를 이용하시려면 약관에 동의하셔야 합니다.")
	}
}
	
</script>
</head>

<body>
	<main class="th-layout-main ">
		<!-- [S]bloomcity-N13 -->
		<div class="bloomcity-N13" data-bid="mQLqev6Dpn" id="">
			<div class="content-container">
				<div class="container-md">
					<ul class="step-list">
						<li class="step"><span class="step-num">1</span>
							<p>본인인증</p></li>
						<li class="step active"><span class="step-num">2</span>
							<p>약관동의</p></li>
						<li class="step"><span class="step-num">3</span>
							<p>정보입력</p></li>
						<li class="step"><span class="step-num">4</span>
							<p>가입완료</p></li>
					</ul>
					<div class="form-wrap">
						<form>
							<div class="form-header">
								<h3 class="form-tit">회원가입 약관동의</h3>
								<div class="form-desc">
									어서옥션을 체계적으로 이용하기 위해 회원 정보 관리를 위하여 아래와 같이 개인정보를 수집 및 이용동의를 제공하고자
									합니다. <br> 아래의 내용을 반드시 읽으신 후 서비스 약관 동의 여부를 결정하여 동의합니다에
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
												개인정보수집 및 이용에 대한 동의</button>
										</div>
										<div class="accordset-body">
											<div class="accordset-content">
												(1) 회사는 최초 회원 가입시 원활한 고객상담, 서비스 제공을 위해 아래와 같은 최소한의 개인정보를
												필수항목으로 수집하고 있습니다. <br>(2) 서비스 이용 과정이나 사업처리 과정에서 아래와 같은
												정보들이 추가로 수집 될 수 있습니다.​<br>
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
												이용약관</button>
										</div>
										<div class="accordset-body">
											<div class="accordset-content">회사가 각각의 경우에 관계법령에 따라 다음의
												목적을 위하여 개인정보를 처리합니다. 처리하고 있는 개인정보는 다음의 목적 이외의 용도로는 이용되지 않으며,
												이용 목적이 변경되는 경우에는 「개인정보 보호법」 제18조에 따라 별도의 동의를 받는 등 필요한 조치를 이행
												합니다.</div>
										</div>
									</div>
									<div class="accordset-item">
										<div class="accordset-header">
											<div class="checkset">
												<input id="checkset-c-3-4"
													class="checkset-input input-round" type="checkbox" name="agree" onclick="subCheckAll();checkSelect()">
												<label class="checkset-label" for="checkset-c-3-4"></label>
											</div>
											<button class="accordset-button btn" type="button">(선택)
												마케팅 활용 및 광고성정보 수신을 위한 개인정보 이용 동의</button>
										</div>
										<div class="accordset-body bt-0">
											<div class="accordset-content column">
												<p class="accodset-desc">
													<span class="br">어서옥션을 체계적으로 이용하기 위해 회원 정보 관리를 위하여
														아래와 같이 개인정보를 수집 및 이용동의를 제공하고자 합니다.</span> 아래의 내용을 반드시 읽으신 후 서비스
													약관 동의 여부를 결정하여 동의합니다에 체크하여주시기 바랍니다.
												</p>
												<div class="radio-group">
													<div class="checkset">
														<input id="checkset-sms-1"
															class="checkset-input input-round" type="checkbox" name="subCbox" onclick="subCheckSelect()"> <label class="checkset-label"
															for="checkset-sms-1"></label> <span class="checkset-text">SMS
															수신동의</span>
													</div>
													<div class="checkset">
														<input id="checkset-sms-2"
															class="checkset-input input-round" type="checkbox" name="subCbox" onclick="subCheckSelect()"> <label class="checkset-label"
															for="checkset-sms-2"></label> <span class="checkset-text">전화
															수신동의</span>
													</div>
													<div class="checkset">
														<input id="checkset-sms-3"
															class="checkset-input input-round" type="checkbox" name="subCbox" onclick="subCheckSelect()"> <label class="checkset-label"
															for="checkset-sms-3"></label> <span class="checkset-text">E-mail
															수신동의</span>
													</div>
												</div>
												<div class="tableset tableset-divider">
													<div class="tableset-inner">
														<table class="tableset-table table pc-table">
															<colgroup>
																<col class="col-4">
																<col class="col-4">
																<col class="col-4">
															</colgroup>
															<thead class="thead-border-top">
																<tr>
																	<th scope="col">수집 및 이용목적</th>
																	<th scope="col">수집 항목</th>
																	<th scope="col">보유기간</th>
																</tr>
															</thead>
															<tbody>
																<tr>
																	<td>이메일, 휴대폰번호, 주소</td>
																	<td>행사 및 상품정보 안내 / 마케팅 활동</td>
																	<td>회원가입 신청 시점부터 1년간 이용실적 없을 경우</td>
																</tr>
															</tbody>
														</table>
														<table class="tableset-table table mobile-table">
															<colgroup>
																<col>
																<col>
															</colgroup>
															<tbody>
																<tr>
																	<th scope="row">수집 및 이용목적</th>
																	<td>이메일, 휴대폰번호, 주소</td>
																</tr>
																<tr>
																	<th scope="row">수집 항목</th>
																	<td>행사 및 상품정보 안내 / 마케팅 활동</td>
																</tr>
																<tr>
																	<th scope="row">보유기간</th>
																	<td>회원가입 신청 시점부터 1년간 이용실적 없을 경우</td>
																</tr>
															</tbody>
														</table>
													</div>
													<small class="small"> 위 개인정보 수집 및 이용에 대한 동의를 거부할 수
														있으나 동의 거부 시 할인 및 이벤트 정보 안내 등의 서비스가 제한됩니다. </small>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="form-footer btn-box">
								<a class="btnset btnset-mono btnset-lg btnset-rect"
									href="javascript:void(0)" onclick="checkFalse();">동의하지 않습니다.</a> <a
									class="btnset2 btnset-lg btnset-rect" href="javascript:void(0)" onclick="checkAgree()">약관에
									동의합니다.</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<!-- [E]bloomcity-N13 -->
	</main>
	<script src="member/js/setting.js"></script>
	<script src="member/js/plugin.js"></script>
	<script src="member/js/template.js"></script>
	<script src="member/js/common.js"></script>
	<script src="member/js/script.js"></script>
</body>