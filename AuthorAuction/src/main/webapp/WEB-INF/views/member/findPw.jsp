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
<title>비밀번호 찾기</title>
<link rel="stylesheet" href="member/css/setting.css">
<link rel="stylesheet" href="member/css/plugin.css">
<link rel="stylesheet" href="member/css/template.css">
<link rel="stylesheet" href="member/css/common.css">
<link rel="stylesheet" href="member/css/style.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<style>
#authDiv1, #authDiv2{
	display:none;
}
</style>
<script>
window.onload = () =>{
	document.getElementsByClassName("category")[0].style.display = "block";
	document.getElementsByClassName("category")[1].style.display = "none";
	checkRadio();
	category();
}

document.addEventListener("keypress", function(e) {
	if (e.keyCode == 13) {
		document.querySelector(".btn-box a").click();
	}
});
 
const resetFn = () =>{
	let aBtn = document.querySelector(".btn-box a");
	let inputs = document.querySelectorAll("input[type=text]");
	for(let i=0; i<inputs.length; i++){
		inputs[i].value = "";
	}
	document.getElementById("authDiv1").style.display = "none";
	document.getElementById("authDiv2").style.display = "none";
	aBtn.innerText = "인증";
	aBtn.onclick = submitBtn;
}

const checkRadio = () =>{
	let spans = document.querySelectorAll(".radio-group span");
	
	for(let i=0; i<spans.length; i++){
		spans[i].addEventListener("click", function(){
			resetFn();
			let radio = document.querySelectorAll("input[type=radio]")[i];
			radio.checked = true;
			if(radio.value == "email"){
				document.getElementsByClassName("category")[0].style.display = "block";
				document.getElementsByClassName("category")[1].style.display = "none";
			}else{
				document.getElementsByClassName("category")[0].style.display = "none";				
				document.getElementsByClassName("category")[1].style.display = "block";
			}
		});
	}
}

const category = () =>{
	let radios = document.querySelectorAll("input[type=radio]");
	for(let i=0; i<radios.length; i++){
		radios[i].addEventListener("change", function(){
			resetFn();
			if(radios[i].value == "email"){
				document.getElementsByClassName("category")[0].style.display = "block";
				document.getElementsByClassName("category")[1].style.display = "none";
			}else{
				document.getElementsByClassName("category")[0].style.display = "none";				
				document.getElementsByClassName("category")[1].style.display = "block";
			}
		});
	}
}

    authNum = 0;
    const submitBtn = () =>{
    	let divStatus = document.querySelectorAll(".category")[0].style.display;
    	if(divStatus == "block"){
    		let arr = [];
        	let id = document.getElementById("id1");
        	let email = document.getElementById("email");
        	arr[0] = id.value;
        	arr[1] = email.value;
        	if(id.value != "" && email.value != ""){
        		let aBtn = document.querySelector(".btn-box a");
        		alert("인증번호를 발송했습니다. 인증번호가 오지 않으면 입력하신 정보를 확인해 주세요.");
        		document.querySelector('#authDiv1').style.display = 'block';
        		aBtn.innerText = "확인";
	    	    $.ajax({
	    	        type : 'get',
	    	        url : 'findPwbyEmail',
	    	        data: {'arr':arr},
	    	        success : function (data) {
	    	        	if(data != 0){
	    	        		console.log(data);
        					authNum = data;
        					aBtn.onclick = checkNum1;
        				}else{
        					aBtn.onclick = null;
        				}
	    	        }         
	    		}); 
        	}
    	}else{
    		let arr = [];
        	let id = document.getElementById("id2");
        	let phone = document.getElementById("phone");
        	arr[0] = id.value;
        	arr[1] = phone.value;
        	if(id.value != "" && phone.value != ""){
        		let aBtn = document.querySelector(".btn-box a");
        		alert("인증번호를 발송했습니다. 인증번호가 오지 않으면 입력하신 정보를 확인해 주세요.");
        		document.querySelector('#authDiv2').style.display = 'block';
        		aBtn.innerText = "확인";
        		$.ajax({
        			url: "findPwbyPhone",
        			data: {'arr' : arr},
        			success: (data) =>{
        				if(data != 0){
        					authNum = data;
        					aBtn.onclick = checkNum2;
        				}else{
        					aBtn.onclick = null;
        				}
        			},
        			error : data => console.log
        		});
        	}
    	}
    }
    
    const checkNum1 = () =>{
    	let inputNum = document.getElementById("authNum1");
        let id = document.getElementById("id1");
        let email = document.getElementById("email");
        if(authNum == inputNum.value){
        	location.href = "updatePwView?memId="+id.value+"&memEmail="+email.value;
        }else{
        	alert("인증번호가 일치하지 않습니다");
        	inputNum.focus();
        }
    }
    
    const checkNum2 = () =>{
    	let inputNum = document.getElementById("authNum2");
        let id = document.getElementById("id2");
        let phone = document.getElementById("phone");
        if(authNum == inputNum.value){
        	location.href = "updatePwView?memId="+id.value+"&memPhone="+phone.value;
        }else{
        	alert("인증번호가 일치하지 않습니다");
        	inputNum.focus();
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
						<h3 class="form-tit">FIND PW</h3>
					</div>
					<div class="form-body">
						 <fieldset class="fieldset">
						 
				          <div class="radio-group">
				            <div class="checkset">
				              <input id="checkset-c-3-1" class="checkset-input input-round" type="radio" name="category" value="email" checked>
				              <label class="checkset-label" for="checkset-c-3-1"></label>
				              <span class="checkset-text">이메일</span>
				            </div>
				            <div class="checkset">
				              <input id="checkset-c-3-2" class="checkset-input input-round" type="radio" name="category" value="phone">
				              <label class="checkset-label" for="checkset-c-3-2"></label>
				              <span class="checkset-text">핸드폰</span>
				            </div>
				          </div>
				          
				        </fieldset>
				        
							<div class="category">
								<div class="inputset inputset-line inputset-lg">
									<input type="text" class="inputset-input form-control"
										placeholder="아이디" aria-label="Id" name="memId" id="id1">
								</div>
								<div class="inputset inputset-line inputset-lg">
									<input type="text" class="inputset-input form-control"
										placeholder="이메일" aria-label="Email" name="memEmail" id="email">
								</div>
								<div class="inputset inputset-line inputset-lg" id="authDiv1">
									<input type="text" class="inputset-input form-control"
										placeholder="인증번호" aria-label="AuthNumber" id="authNum1">
								</div>
							</div>
							<div class="category">
								<div class="inputset inputset-line inputset-lg">
									<input type="text" class="inputset-input form-control"
										placeholder="아이디" aria-label="Id" name="memId" id="id2">
								</div>
								<div class="inputset inputset-line inputset-lg">
									<input type="text" class="inputset-input form-control"
										placeholder="휴대폰 번호" aria-label="Phone" name="memPhone" id="phone">
								</div>
								<div class="inputset inputset-line inputset-lg" id="authDiv2">
									<input type="text" class="inputset-input form-control"
										placeholder="인증번호" aria-label="AuthNumber" id="authNum2">
								</div>
							</div>
							<div class="btn-box">
								<a class="btnset2 btnset-lg btnset-rect" href="javascript:void(0)"
									onclick="submitBtn()">인증</a>
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