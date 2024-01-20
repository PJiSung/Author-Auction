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

#detailview:hover{
transform: scale( 1.2 );


}

input[type="checkbox"] {
    width: 2rem;
    height: 2rem;
    border-radius: 50%;
    border: 1px solid #999;
    appearance: none;
    cursor: pointer;
    transition: background 0.2s;
  }
  
    input[type="checkbox"]:checked {
    background: black;
    border: none;
  }

</style>
	
</head>
<body>


	<jsp:include page="../common/header.jsp" />


    <div class="basic-N51" data-bid="FelqAJ2SO7" style = "min-height: 100vh;">
    

		<div id="l_order_header" style = "height: 50px !important; display:flex; align-items:center; border-top: 1px solid lightgray; border-bottom: 1px solid lightgray; box-shadow: 0 1px 2px 0 rgba(0, 0, 0, 0.06), 0 2px 12px 0 rgba(0, 0, 0, 0.03); z-index: 10; padding:3%;">
						<h1 class="c_order_header">장바구니</h1>
						<ul class="step" style = "padding: 1%; display:flex; position:absolute; right: 3%; border-radius: 25px; height: 4%; width: 20%; border: 1px solid #eee;">
							<!-- D : 활성페이지 active 클래스 추가 -->
							<li class="active" style = "color:#333; line-height:0%;float: left; word-spacing: 20px; margin-right: 5%; margin-left: 10%;"><i class="number" style = "color:red;">01장바구니</i></li>
							<li class="second" style = " line-height:0%; float: left; word-spacing: 20px; margin-right: 5%; margin-left: 5%;"><i class="number">02주문서</i></li>
							<li style = "line-height:0%; float: left; word-spacing: 20px; margin-right: 5%; margin-left: 5%;"><i class="number">03주문완료</i></li>
						</ul>
						
		</div>
		
		
		
		
		<div id  ="selectdiv" style = "width: 60vw; margin-left: 5vw; height: 6vh; display: flex; align-items: center; 	background-color: #fafafa;
 	border-top : 1px solid #eee;
 	border-bottom : 1px solid #eee;
 	margin-top: 2%;
 	font-size: 17px;
 	color: #333;">
				<div style = "width: 5%; height: 100%; display:flex; align-items: center;justify-content: center; " ><input type = "checkbox" id = "allcheck" style = "cursor:pointer;"></div>
				<div style = "width: 10%; height: 100%; display:flex; align-items: center;justify-content: center; " ><label for = "allcheck" style = "cursor:pointer;">전체선택</label></div>
				<div style = " width: 10%; height: 100%; display:flex; align-items: center;justify-content: center; border-left: 1px solid #ccc; margin-left: 1%; padding-left: 1%;" ><label for = "selectedcheck" style = "cursor:pointer;" onclick = "deletewishlist();">선택삭제</label></div>
		</div>
			
			
			
		<div style = "border-top: 1px solid #bbb; border-bottom: 1px solid #ccc; width: 60vw; margin-top: 5vh; margin-left: 5vw;">
		
		
				<c:if test = "${empty wlist}">
					<div style = "display:flex; align-items:center; justify-content:center; height: 50vh;"><h1>장바구니에 상품이 없습니다</h1></div>
				</c:if>
				
				<c:if test = "${!empty wlist}">
					<c:forEach items = "${wlist}" var = "w">
						<div style = "height: 30vh; line-height: 20vh; border-bottom: 1px solid #aaa; display: flex; align-items: center; ">	
							<div style ="width:5%; height: 100%; display:flex; align-items: center;justify-content: center;"><input type = "checkbox" class = "productcheck"><input type = "hidden" value = "${w.proNo}"></div>
							<div style ="width:30%; height: 100%; display:flex; align-items: center;justify-content: center;" >
							
							<c:forEach items = "${alist}" var = "a">
							<c:if test = "${a.attBno eq w.proNo}">
							<c:if test="${a.attFno eq 1}">
							<img src="${a.attRename}" style = "width: 100%; height: 90%; ">
							</c:if>
							</c:if>
							</c:forEach>
							</div>
							<div style ="width:30%; height: 100%; flex-direction: column; justify-content: center;" >
								<div style ="width:100%; height: 33.333%; display: flex; align-items: center;justify-content: center; word-break:break-all; color:black;  text-shadow: -1px -1px white, 1px 1px #aaa;" >${w.proName}</div>
								<div style ="width:100%; height: 33.333%; display: flex; align-items: center;justify-content: center; word-break:break-all; text-shadow: -1px -1px white, 1px 1px #aaa;" >${w.proWriter}</div>
								<div style ="width:100%; height: 33.333%; display: flex; align-items: center;justify-content: center; word-break:break-all;" >
								<div style = " display: flex; align-items: center;justify-content: center; height: 30%; width: 20%; box-shadow:  0 0 5px 5px #bbb; font-weight: 200; cursor:pointer; text-shadow: 1px 1px white, -1px -1px #aaa;" id = "detailview" onclick = "location.href = 'artsDetail.ar?proNo=${w.proNo}'">상세</div>
								</div>
							</div>
					    	<div class="contents-amount" style = "display: flex !important; justify-content: center !important; align-items: center !important; width: 15% !important; height: 100% !important;">
					    				<select name = "wisamount" style = "width: 80%; border: 1px solid black; height: 15%;" onchange="selectAmountChange(${w.proNo},this.value,${w.proPrice},this)">
					    					<c:forEach var="i" begin = "1" end = "${w.proAmount}">
					    						<c:choose>
					    							 <c:when test="${i eq w.wisAmount}">
					    							 	 <option value="${i}" style="text-align:center;" selected>${i}개</option>
					    							 </c:when>
					    							 <c:otherwise>
					    								<option value = "${i}" style = "text-align:center;">${i}개</option>
					    							</c:otherwise>
					    						</c:choose>
					    					</c:forEach>
					    				</select>
					    				
		             	    </div>
					   		<div class = "productprice"  style ="width:15%; height: 100%; display:flex; align-items: center;justify-content: center; word-break:break-all"><span class = "totalpp" style = "font-weight:bold; font-size: 17px;">${w.proPrice * w.wisAmount}</span><small>&nbsp;원</small></div>
					   		<div style ="width:5%; height: 100%; display:flex; align-items: center;justify-content: center;"><img src = "sunwoo/icons/ico_close_black.svg" style = "cursor:pointer;" onclick = "location.href = 'deletewis.ar?memId=${loginid}&proNo=${w.proNo}'"></div>
				  		</div>
				  </c:forEach>
				</c:if>
				
			  
		</div>
		
	</div>	
	
	  <div style = "background-color: #fafafa; position: fixed; top: 25vh; width: 25%; right: 5%; height: 50vh; z-index: 5;">
	  	<div style = " height: 85%;">
	  		<div style = "display:flex; align-items:center; height: 20%;">
	  			<h2 style ="margin-left: 10%; width:70%;">적립혜택</h2>
	  		</div>
	  		
	  		
	  		<div style = "display:flex; align-items:center; height: 7.5%;">
	  		 <div style = "width: 60%; padding-left: 10%; font-size: 23px;">포인트 적립</div>
	  		  <div><h2 id = "pointBonus">0</h2></div>
	  		 <div><small> p</small></div>
	  		 </div>
	  		 
	  		<div style = "padding-left: 10%; height: 10%; border-bottom: 1px dotted #666;"></div>
	  		<div style = "display:flex; align-items:center; height: 20%;">
	  			<h2 style ="margin-left: 10%;">결제 예정금액	</h2>
	  		</div>
	  		<div style = "display:flex; align-items:center;">
	  			 <div style = "width: 60%; padding-left: 10%; font-size: 22px;">상품금액</div>
	  			 <div><h3 id = "propribill">0</h3></div>
	  			 <div><small> 원</small></div>
	  		</div>
	  		<div style = "display:flex; align-items:center; height: 40%;">
	  			 <div style = "width: 60%; padding-left: 10%; color:red; font-size: 22px;">합계</div>
	  			 <div><h1 id = "totalbill" style = "color:red;">0</h1></div>
	  			 <div><small> 원</small></div>
	  		</div>
	  	</div>
	  
	  	<div style = "position:absolute; bottom: 0%; color: #fff; background-color:black; width: 100%; height: 15%; display: flex; align-items:center; justify-content:center; word-break:break-all; cursor:pointer;" onclick = "paymentar()" id = "gotopaybtn">
	  		<h2>총 ${wlistsize}개 주문하기</h2>
	  	</div>
	  </div>
	  
	  
	<jsp:include page="../common/footer.jsp" />	  	
	
  <script src="sunwoo/js/setting.js"></script>
  <script src="sunwoo/js/plugin.js"></script>
  <script src="sunwoo/js/template.js"></script>
  <script src="sunwoo/js/common.js"></script>
  <script src="sunwoo/js/script.js"></script>
  
  
  
  <script src = "sunwoo/jquery/jquery-3.7.1.min.js"></script>
  
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
  
  <script>
  
  	//전체선택 스크립트
 		 var checkboxes = document.getElementsByClassName('productcheck');
 		 var allcheck	=	document.getElementById('allcheck');
 		 
 		allcheck.addEventListener('change',function(){
 			
 		for(checkbox of checkboxes){
 			
 			if(this.checked == true){
 			checkbox.checked = true;
 			}else{
 				checkbox.checked = false;
 			}
 		}
 		 
 	 });
 	 
 	 for(checkbox of checkboxes){
 		 
 		 checkbox.addEventListener('change', function(){
 			
 			 if(this.checked == false){
 				 allcheck.checked = false;
 				 
 			 }else{
 				 var count = 0;
 				 for(checkbox of checkboxes){
 					 if(checkbox.checked == true){
 						 count++;
 					 }
 				 }
 				 
 				 if(count == checkboxes.length){
 					 
 					allcheck.checked = true;
 				 }
 				 
 				 
 			 }
 			 
 		 });
 		 
 	 }
  
  </script>
  
  
  <script>
  			//삭제 스크립트
  			
  	function deletewishlist(){
  				
  		 var products = document.getElementsByClassName('productcheck');		
  	     var checkedpronos = [];
  			for(product of products){
  				
  				if(product.checked == true){
  					checkedpronos.push(product.nextElementSibling.value);
  				}
  			}
  			if(checkedpronos.length >0){
  				location.href = "deletewishlist.ar?memId="+'${loginid}'+"&pronos="+checkedpronos;
  				}
  		}
  
  
  
  </script>
  
  
  
  
  
  
  <script>
  			//제품 수량 변경 스크립트
  function selectAmountChange(proNo,wisAmount,proPrice,data){
	  	
		  $.ajax({
			    url: 'updatewishamount.ar',
			    type: 'GET',
			    data: {
			    	memId: '${loginid}',
			    	proNo: proNo,
			    	wisAmount: wisAmount
			    },
			    success: function onData (msg) {
			        data.parentElement.nextElementSibling.children[0].innerText = (wisAmount*proPrice).toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");;
			    },
			    error: function onError (error) {
			        console.error(error);
			    }
			});
	  
  }
  </script>
  
  
  <script>
  	//천단위 콤마 스크립트
  	for(p of document.getElementsByClassName('productprice')){
  		
  		p.children[0].innerText = p.children[0].innerText.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
  		
  	}
	
  
  </script>  
  
  
  <script>
  
  	// 상품 합친 금액 스크립트
  function updateproTotalPrice(){	
  	var prototal=0;
  		
  		for(p of document.getElementsByClassName('productprice')){
  	  		
  			prototal = prototal + parseInt(p.children[0].innerText.replace(/,/g,""));
  	  		
  	  	}
  		
  		document.getElementById('propribill').innerText = prototal.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
  	}
  	
	
  setInterval(updateproTotalPrice, 100);
  
  
  //총 결제 금액 스크립트 
  
  
  function updateallTotalPrice(){	
  	var alltotal=0;
  		
  		for(p of document.getElementsByClassName('productprice')){
  	  		
  			alltotal = alltotal + parseInt(p.children[0].innerText.replace(/,/g,""));
  	  		
  	  	}
  		
  		document.getElementById('totalbill').innerText = alltotal.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
  	}
  	
	
  setInterval(updateallTotalPrice, 100);
  
  </script>
  
  
  <script>
  
  
  
  	//결제창으로 넘어가는 스크립트
  	function paymentar(){
  		
  		
  		if(${wlistsize} != 0){
  			location.href = 'payment.ar?';
  		}else{
  			 Swal.fire({
			      icon: 'warning',
			      title: '최소 1개 이상의 물건을 선택해주십시오'
			    });	
  			 
  		}
  	}
  	
  	
  	//장바구니 물건 없을 떄 결제 버튼 회색으로 만들기 스크립트
  	if(${wlistsize} == 0){
  	   var btn = document.getElementById('gotopaybtn');
  	 btn.style.backgroundColor = "#bbb";
  	 btn.style.cursor = 'not-allowed';
  	
  	}
  	
  
  </script>
  
  <script>
  
  	//포인트 업데이트 스크립트
  function updatePointPrice(){
	 var totalbill = parseInt(document.getElementById('totalbill').innerText.replace(/,/g,""));
	 var originalPoint = ${loginUser.graBonus}/100 * totalbill;
	 var newPoint = parseInt(Math.round((originalPoint/10)) * 10);
  	document.getElementById('pointBonus').innerText = newPoint.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");;
  	
  }
  	
		
		setInterval(updatePointPrice, 100);
  </script>
  
  
  
  
  
</body>
</html>