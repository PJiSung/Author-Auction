<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


	<link rel="stylesheet" href="sunwoo/rosacss/rosasetting.css">
 	<link rel="stylesheet" href="sunwoo/rosacss/rosaplugin.css">
	<link rel="stylesheet" href="sunwoo/rosacss/rosatemplate.css">
	<link rel="stylesheet" href="sunwoo/rosacss/rosacommon.css">
	<link rel="stylesheet" href="sunwoo/rosacss/rosamain.css">
	<link rel="stylesheet" href="sunwoo/rosacss/rosastyle.css">
	
	
	
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




</style>

</head>
<body>

	<jsp:include page="../common/header.jsp" />
  


  <div class="basic-N51" data-bid="FelqAJ2SO7">
    

		<div id="l_order_header" style = "height: 50px !important; display:flex; align-items:center; border-top: 1px solid lightgray; border-bottom: 1px solid lightgray; box-shadow: 0 1px 2px 0 rgba(0, 0, 0, 0.06), 0 2px 12px 0 rgba(0, 0, 0, 0.03); z-index: 10; padding:3%;">
						<h1 class="c_order_header">주문완료</h1>
						<ul class="step" style = "padding: 1%; display:flex; position:absolute; right: 3%; border-radius: 25px; height: 4%; width: 20%; border: 1px solid #eee;">
							<!-- D : 활성페이지 active 클래스 추가 -->
							<li class="active" style = "color:#333; line-height:0%;float: left; word-spacing: 20px; margin-right: 5%; margin-left: 10%;"><i class="number" >01장바구니</i></li>
							<li class="second" style = " line-height:0%; float: left; word-spacing: 20px; margin-right: 5%; margin-left: 5%;"><i class="number" >02주문서</i></li>
							<li style = "line-height:0%; float: left; word-spacing: 20px; margin-right: 5%; margin-left: 5%;"><i class="number" style = "color:red;">03주문완료</i></li>
						</ul>
						
		</div>
		
		
		
		

			<div style = "width: 50%; text-align:center; border-bottom: 1px solid #888; border-top: 1px solid #888; padding-bottom: 1%; padding-top: 1%; margin: 0 auto; margin-top: 5% "><h2>주문 번호: ${orderNo}</h2></div>
			<div style = "width: 50%; border-bottom: 1px solid #888; margin: 0 auto; height: 60vh; ">
				<div style = "display:flex; height: 15%; align-items:center; width: 60%; border-bottom: 1px solid #aaa; margin: 0 auto;">
					<div style = "display:flex; align-items:center; height: 100%; width: 30%; justify-content: center;"><h4>구매자</h4></div>
					<div style = "display:flex; align-items:center; height: 100%; width: 70%; justify-content: center;">${loginUser.memName}</div>
				</div>
				<div style = "display:flex; height: 15%; align-items:center; width: 60%; border-bottom: 1px solid #aaa; margin: 0 auto;">
					<div style = "display:flex; align-items:center; height: 100%; width: 30%; justify-content: center;"><h4>받는이</h4></div>
					<div style = "display:flex; align-items:center; height: 100%; width: 70%; justify-content: center;">${receiver}</div>
				</div>
				<div style = "display:flex; height: 15%; align-items:center; width: 60%;  margin: 0 auto;">
					<div style = "display:flex; align-items:center; height: 100%; width: 30%; justify-content: center;"><h4>배송 주소</h4></div>
					<div style = "display:flex; align-items:center; height: 100%; width: 70%; justify-content: center;">${address}</div>
				</div>
				<div style = "border-top: 1px solid #aaa; height: 55%; display:flex; align-items:center;">
					<div style = "height: 100%; width: 40%; display:flex; align-items: center; justify-content: center;">
						<div style = " height: 95%; width: 90%;" id = "qrcode">
							<input id="text" type="text" value="http://${serverip}/" style="width:100%" />
						</div>
					</div>
					<div style = "height: 100%; width: 40%;  text-align: right; display:flex; flex-direction: column; justify-content:center;">
								<div style = "height:20%;"><h3>총 상품가격 :</h3></div>		
								<div style = "height:20%;"><h3>적립 포인트 :</h3></div>		
								<div style = "height:20%;"><h3>사용 포인트 :</h3></div>		
								<div style = "height:20%;"><h1>총 결제금액 :</h1></div>
					
					</div>
					<div style = "height: 100%; width: 20%;  text-align: right; display:flex; flex-direction: column; align-items:center; justify-content:center;">
								<div style = "height:20%;">${OrdSumPrice}원</div>		
								<div style = "height:20%;">${pointBonus}<small>p</small></div>		
								<div style = "height:20%;">${ordPoPrice}<small>p</small></div>		
								<div style = "height:20%;"><h4>${OrdSumPrice}원</h4></div>		
					</div>
				
				</div>
				
			
			
			</div>
				<div style = "background-color: black; color: white; display:flex; align-items: center; justify-content:center; width: 10%; height: 5vh; font-size: 20px; font-weight: bold; margin: 0 auto; cursor:pointer; margin-top: 2%; margin-bottom: 5%;" onclick = "location.href = '/'">홈으로 돌아가기</div>


<jsp:include page="../common/footer.jsp" />
  <script src = "sunwoo/jquery/jquery-3.7.1.min.js"></script>
<script type="text/javascript" src="sunwoo/jquery/qrcode.js"></script>



 <script type="text/javascript">
  var qrcode = new QRCode(document.getElementById("qrcode"), {
      width : 100,
      height : 100,
      useSVG: true
  });

  function makeCode () {		
      var elText = document.getElementById("text");

      if (!elText.value) {
          alert("Input a text");
          elText.focus();
          return;
      }

      qrcode.makeCode(elText.value);
  }

  makeCode();

  $("#text").
      on("blur", function () {
          makeCode();
      }).
      on("keydown", function (e) {
          if (e.keyCode == 13) {
              makeCode();
          }
      });
    </script>

</body>
</html>