<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Insert title here</title>
<!--   <link rel="stylesheet" href="css/setting.css"> -->
<!--   <link rel="stylesheet" href="css/plugin.css"> -->
<!--   <link rel="stylesheet" href="css/template.css"> -->
<!--   <link rel="stylesheet" href="css/common.css"> -->
  <link rel="stylesheet" href="sunwoo/css/style.css">
<!--   <link rel="stylesheet" href="css/wishlist.css"> -->
  
 <link rel="stylesheet" href="main/css/setting.css">
<link rel="stylesheet" href="main/css/plugin.css">
<link rel="stylesheet" href="main/css/template.css">
<link rel="stylesheet" href="main/css/common.css">
<link rel="stylesheet" href="main/css/main.css">
<link rel="stylesheet" href="main/css/style.css">
	
<style>

  html,body{
  	margin:0;
  	padding:0;
  }
  
	
 div{
 	margin: 0;
 	padding: 0;
  	display: block; 
 }

ul,li,ol{
	list-style: none;
}



input.check_btn{
  display:none;
  }

input.check_btn + label{
  cursor:pointer;
 }

input.check_btn + label > span{
  vertical-align: middle;
  padding-left: 5px;
 }

/* label:before에 체크하기 전 상태 CSS */
input.check_btn + label:before{
  content:"";
  display:inline-block;
  width:17px;
  height:17px;
  border:2px solid #888;
  border-radius: 4px;
  vertical-align:middle;
  }
  
/* label:before에 체크 된 상태 CSS */  
input.check_btn:checked + label:before{
  content:"";
  background-color:#F47C7C;
  border-color:#F47C7C;
  background-image: url('check_btn.png');
  background-repeat: no-repeat;
  background-position: 50%;
  }



</style>


	
</head>
<body>
	<jsp:include page="../common/header.jsp" />



    <div class="basic-N51" data-bid="FelqAJ2SO7">
    

		<div id="l_order_header" style = "height: 50px !important; display:flex; align-items:center; border-top: 1px solid lightgray; border-bottom: 1px solid lightgray; box-shadow: 0 1px 2px 0 rgba(0, 0, 0, 0.06), 0 2px 12px 0 rgba(0, 0, 0, 0.03); z-index: 10; padding:3%;">
						<h1 class="c_order_header">포인트 충전</h1>
						
		</div>
		
		
		
		
		<div id  ="selectdiv" style = "width: 60vw;  height: 10vh; display: flex; align-items: center; justify-content:center; 	
 	font-size: 17px;
 	color: #333; border-bottom: 1px solid #aaa; margin: 0 auto; margin-top: 2%;" >
 	
 			<h2>Author 포인트</h2>

	</div>		
			
		<div style = " border-bottom: 1px solid #888; width: 60vw; margin-left: 5vw; height: 1600px; display:flex; margin: 0 auto; justify-content:center;">
				<div style = " margin-top: 2.5vh;">
					<div style = " height: 25vw; width: 100%;">
						<div style = "display:flex; align-items: center;  height: 15%; ">
								<h2>AUTHOR 포인트란?</h2>						
						</div>
						<div style = " display:flex; align-items: center;  height: 10%;  ">
							AUTHOR 포인트는 현금처럼 쓸 수 있는 결제 수단이에요.
							다양한 방식으로 충전하거나, 적립 받을 수 있어요.		
						</div>
						
						
						<div style = "display:flex; align-items: center;  height: 20%; ">
								<h2>충전 포인트</h2>						
						</div>
						<div style = " display:flex; align-items: center;  margin-left: 10%;">
						
						<ul>
							<li style="list-style: disc !important; ">아래 방식으로 직접 충전한 포인트에요.</li>
							<li style="list-style: disc !important; ">1원과 똑같이 1포인트가 충전돼요.</li>
							<li style="list-style: disc !important; ">결제 시 적립 포인트를 받아요.</li>
						</ul>	
						</div>
						
						
						
						<div style = "display:flex; align-items: center; color: #aaa; height: 15%;">
								충전 수단 종류						
						</div>
						<div style = "display:flex; align-items: center; margin-left: 7.5%;">
								<img src = "/sunwoo/images/paymethod.png">				
						</div>
						
						
							<div style = "display:flex; align-items: center;  height: 20%; ">
								<h2>적립 포인트</h2>						
						</div>
						
						<div style = " display:flex; align-items: center;  margin-left: 10%;">
						
						<ul>
							<li style="list-style: disc !important; ">카드/포인트결제를 통해 적립 받은 포인트에요 </li>
							<li style="list-style: disc !important; ">입찰,결제 시 사용할 수 있어요</li>
						</ul>	
						</div>
						
						
						
						
						<div style = "display:flex; align-items: center;  height: 20%; ">
								<h2>충전</h2>						
						</div>
						<div style = "display:flex; align-items: center; margin-left: 5%;">
								<img src = "/sunwoo/images/chargep.png">				
						</div>
						<div style = "display:flex; align-items: center; color: #aaa; height: 15%;">
								단, 최소 충전 금액은 1,000P에요.
						</div>
						
						
						<div style = "display:flex; align-items: center;  height: 20%; ">
								<h2>충전방법</h2>						
						</div>
							<div style = "border-top: 1px solid #aaa; border-bottom: 1px solid #aaa; display:flex; height: 10vh; align-items: center; margin-top: 2.5%;">
							<div style = "width: 50%; border-right: 1px solid #aaa; height: 100%; display:flex; align-items: center;">
								<input type = "radio" id="creditcard" style = "width: 40px;" name = "paymethod" class = "paymethod"><label for = "creditcard"><h4>신용카드</h4></label>
							</div>
							<div style = "width: 50%; height: 100%; display:flex; align-items: center;">
								<input type = "radio" id="mootongjang" style = "width: 40px;" name = "paymethod" class = "paymethod"><label for = "mootongjang"><h4>무통장 입금</h4></label>
							</div>
							
							
						</div>
						<div style = "display:flex; align-items: center;  height: 25%; ">
								<h2>충전금액</h2>						
						</div>
					
						
						<div style = "width: 80%;  display:flex; align-items: center;">
								<div>
									<input type = "radio" name = "chargeprice" id = "10000" class = "chargeprice" value = "10000"><label for = "10000">10,000<small>p</small></label>
								</div>
								<div style = "margin-left: 10%;">
									<input type = "radio" name = "chargeprice" id = "50000" class = "chargeprice" value = "50000"><label for = "50000">50,000<small>p</small></label>
								</div>
								<div style = "margin-left: 10%;">
									<input type = "radio" name = "chargeprice" id = "100000" class = "chargeprice" value = "100000"><label for = "100000">100,000<small>p</small></label>
								</div>
								<div style = "margin-left: 10%;">
									<input type = "radio" name = "chargeprice" id = "200000" class = "chargeprice" value = "200000"><label for = "200000">200,000<small>p</small></label>
								</div>
								<div style = "margin-left: 10%;">
									<input type = "radio" name = "chargeprice" id = "500000" class = "chargeprice" value = "500000"><label for = "500000">500,000<small>p</small></label>
								</div>
								<div style = "margin-left: 10%;">
									<input type = "radio" name = "chargeprice" id = "1000000" class = "chargeprice" value = "1000000"><label for = "1000000">1,000,000<small>p</small></label>
								</div>
								
							</div>
							<div style = "display:flex; margin-top: 5%;">
								<div style = "margin-right: 0px;  display:flex; align-items:center; justify-content:center;  color: #555; width: 33%; "><h5>직접 입력</h5></div>
								<div style = "margin-right: 0px;  display:flex; align-items:center; justify-content:center;  color: #aaa; width: 33%;"><input type = "text"  id = "pointinput"></div>
								<div style = "margin-right: 0px;  display:flex; align-items:center; justify-content:center;  color: #555; width: 33%;">기존 포인트: &nbsp; <p class = "popopo">${point}</p><small>&nbsp;p</small></div>
							</div> 
							<hr>
								<div style = "display:flex; height: 15%;">
								<div style = "margin-right: 0px;  display:flex; align-items:center; justify-content:center;  width: 50%; font-weight: bold;">충전 할 포인트: &nbsp;<p id = "finalpoint" class = "popopo">0</p><small>&nbsp;p</small></div>
								<div style = "margin-right: 0px;  display:flex; align-items:center; justify-content:center;   width: 50%; font-weight: bold;" >충전 후 포인트: &nbsp;<p id = "totalpoint" class = "popopo">0</p><small>&nbsp;p</small></div>
								</div>
						<div style = "display:flex; align-items: center; color: #aaa; height: 10%; justify-content:center;">
								결제 전, 최종 금액을 꼭 확인해주세요.
						</div>
						 
					</div>		
					
			</div>
			
	</div>	
				 <div class="contents-btn-group" style = "width: 50%; margin: 0 auto; margin-top: 2.5%; margin-bottom: 5%;">
             				 <button class="btnset btnset-line" type="button" onclick = "location.href='/'">홈으로 돌아가기</button>
            				 <button class="btnset" type="button" onclick = "directPay()">충전하기</button>
          		</div>
	
	
	
	
	

	
	<jsp:include page="../common/footer.jsp" />
	


	
  <script src="sunwoo/js/setting.js"></script>
  <script src="sunwoo/js/plugin.js"></script>
  <script src="sunwoo/js/template.js"></script>
  <script src="sunwoo/js/common.js"></script>
  <script src="sunwoo/js/script.js"></script>
  
  
  
 <script src="sunwoo/jquery/jquery-3.7.1.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>



  <script>
 	
  //결제 후 포인트 넣기 스크립트
  document.getElementById('totalpoint').innerText= ${point} + $('#pointinput').val()
  
	//천단위 콤마 스크립트
	function tochun(){
	for(p of document.getElementsByClassName('popopo')){
		
		p.innerText = p.innerText.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
		
	}
  }
  
  tochun();
  
  </script>
  
  
  
  <script>
  	//포인트 천단위로 입력시키기 스크립트
  	
//   	$("#pointinput").keyup(function(e) {
//   			var n = $(this).val(); 
//   			 n = Math.floor(n/10) * 10;
//   			 if(n>=10){
//   		     $(this).val(n);
//   			 }
// 		});
  
  </script>
  
  
  <script>
 	
		//포인트에 문자 못들어가게 막는 스크립트
// 		$("#pointinput").keyup(function(e) {
// 			var content = $(this).val();
// 			var regex = /[^0-9]/g;	
// 			$(this).val(content.replace(regex, ""));
// 		});
		
		
		//충전할 포인트 선택하면 칸에 자동으로 들어가는 스크립트
		$('input[name="chargeprice"]').change(function(){
			
			$('#pointinput').val($(this).val());
			
			document.getElementById('finalpoint').innerText = $('#pointinput').val();
			
			document.getElementById('totalpoint').innerText= ${point} + parseInt($('#pointinput').val());
			
			tochun();
			
	});
	
		
		
		
		
		//직접 포인트 입력하면 체크해제되는 스크립트
		$("#pointinput").keyup(function(e) {
				for(c of document.getElementsByClassName('chargeprice')){
					
					if(c.checked == true){
						c.checked = false;
					}
				}
				
				if(!isNaN(document.getElementById('pointinput').value) && !document.getElementById('pointinput').value.trim() == ""){
					
					
				document.getElementById('finalpoint').innerText = $('#pointinput').val();
				
				
				document.getElementById('totalpoint').innerText= ${point} + parseInt($('#pointinput').val());
				
				tochun();
				}else{
					document.getElementById('pointinput').value = "";
					document.getElementById('finalpoint').innerText = 0;
					document.getElementById('totalpoint').innerText= ${point};
					tochun();
					
				}
		});
		
		//직접 포인트 변경되면 체크해제되는 스크립트
		$("#pointinput").change(function(e) {
				for(c of document.getElementsByClassName('chargeprice')){
					
					if(c.checked == true){
						c.checked = false;
					}
				}	
				document.getElementById('finalpoint').innerText = $('#pointinput').val();
				
				document.getElementById('totalpoint').innerText= ${point} + parseInt($('#pointinput').val());
				
				tochun();
		});
		
		
		
		
  
  </script>




<script>

	//전부 체크 됐는지 확인하는 스크립트
	function directPay(){
		
		var count = 0;
		var pcount = 0;
		
		for(p of document.getElementsByClassName("paymethod")){
			
			
			if(p.checked == true){
				
				count++;
			}
				
			
		}
		
		if(count ==0){
			
			 Swal.fire({
			      icon: 'warning',
			      title: '결제 수단을 선택해주세요',
			    });	
			 
		}
		
		
		if(count >0 && document.getElementById('pointinput').value ==''){
			
			
			
			 Swal.fire({
			      icon: 'warning',
			      title: '충전할 포인트를 입력해주세요',
			    });	
		}else{
			pcount++;
		} 
		
		if(count>0 && pcount>0){
			
			if(document.getElementById('pointinput').value >= 1000){
				requestpay();
			}else{
				 Swal.fire({
				      icon: 'warning',
				      title: '1000원 이상부터 충전 가능합니다'
				    });	
			}
		}
		
		
	}



</script>





<!-- jQuery -->

<!-- iamport.payment.js -->
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>

  
 <script>
 	
 	//결제 스크립트

 IMP.init("imp41106724"); // 예시 : imp00000000
 
 
 function requestpay(){
	 
	 //물건가격 
	 
	 
	 const amount = parseInt(document.getElementById('pointinput').value);

	 const ordernum = Math.floor(Math.random()*1000000000*new Date().getMilliseconds());
	 
	 
	 
 IMP.request_pay({
	    pg : 'html5_inicis',
	    pay_method : 'card',
	    merchant_uid: ordernum, // 상점에서 관리하는 주문 번호
	    name : '주문명:결제테스트',
	    amount : amount,
	    buyer_email : '${loginUser.memEmail}'
	    
	}, function(rsp) {
		
	    if (rsp.success) {
	    	
// 	    	location.href = "pointpayresult.ar?amount="+amount+"&imp_uid="+rsp.imp_uid;
	    	
			  
	    	
			    $.ajax({
				    url: 'pointpayresult.ar',
				    type: 'GET',
				    data: {
				    	amount: amount,
				    	imp_uid: rsp.imp_uid
				    },
				    success: function onData (result) {
				    	
				    	  Swal.fire({
						      icon: 'success',
						      title: ''+result + ' 포인트가 충전되었습니다.',
						    });	
				    	  
				    },
				    error: function onError (error) {
				        console.error(error);
				    }
				});
			    
			    
			    
	    	
// 	        결제 성공 시: 결제 승인 또는 가상계좌 발급에 성공한 경우
// 	        jQuery로 HTTP 요청
// 	        jQuery.ajax({
// 	          url: "insertorder.ar", 
// 	          method: "POST",
// 	          headers: { "Content-Type": "application/json" },
// 	          data: {
// 	            imp_uid: rsp.imp_uid,            // 결제 고유번호
// 	            merchant_uid: rsp.merchant_uid   // 주문번호
// 	          }
// 	        }).done(function (data) {
// 	          // 가맹점 서버 결제 API 성공시 로직
// 	        })
	      } else {
	        alert("결제에 실패하였습니다. " + rsp.error_msg);
	      }

	});
 }
</script>



<script>

$('#pointinput').on('input', function() {
    var sanitizedValue = this.value.replace(/[^0-9]/g, ''); 
    this.value = sanitizedValue;

});


</script>

 
  
  
  
</body>
</html>