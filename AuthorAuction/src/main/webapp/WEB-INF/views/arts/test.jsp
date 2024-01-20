<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
.pldiv:hover {
	background-color: #eee;
	cursor: pointer;
}



#att_zone{
	width: 100%;
	min-height: 200px;
	text-align:center;
	border:1px dotted black;
}
#att_zone:empty:before{
	content : attr(data-placeholder);
	color : #999;
	font-size:.9em;
}


.btn-upload {
  width: 150px;
  height: 30px;
  background: #fff;
  border: 1px solid rgb(77,77,77);
  border-radius: 10px;
  font-weight: 500;
  cursor: pointer;
  display: flex;
  align-items: center;
  justify-content: center;
  &:hover {
    background: rgb(77,77,77);
    color: #fff;
  }
}

#btnAtt {
	display:none;
}


.infoproduct{

	outline:none;

}
  #chart-container {
            height: 500px;
        }
</style>
</head>
<body>

 <link rel="stylesheet" href="main/css/template.css">
	<script src="sunwoo/jquery/jquery-3.7.1.min.js"></script>


	<jsp:include page="../common/adminHeadSide.jsp" />

	<main>
	
	<div style = "border: 1px solid red; text-align:center;">
	<h1>판매량 순위</h1>
	<br>
	
	<div style = "border: 1px solid red; display:flex; justify-content:center; flex-direction:column;">
				<div style = "display:flex; align-items:center; justify-content:center; font-weight: bold;">
					<div style = "width: 10%;">제품번호</div>
					<div style = "width: 10%;">제품명</div>
					<div style = "width: 10%;">작가명</div>
					<div style = "width: 10%;">가격</div>
					<div style = "width: 10%;">재고</div>
					<div style = "width: 10%;">판매수량</div>
				</div>
	
	
	</div>
	
	<div style = "overflow: scroll;">
		<c:forEach items = "${plist}" var = "p">
				<div style = "display:flex; align-items:center; justify-content:center; ">
					<div style = "width: 10%;">${p.proNo }</div>
					<div style = "width: 10%;">${p.proName }</div>
					<div style = "width: 10%;">${p.proWriter }</div>
					<div style = "width: 10%;">${p.proPrice }</div>
					<div style = "width: 10%;">${p.proAmount }</div>
					<c:forEach items = "${slist}" var = "s">
						<c:if test = "${s.proNo eq p.proNo }">
							<div style = "width: 10%;">${s.sellAmount }</div>
						</c:if>
					</c:forEach>
				</div>
		</c:forEach>
	
	
<!-- 	 <div id="chart-container"> -->
<%--         <canvas id="chart"></canvas> --%>
<!--     </div> -->


 <div id = "alarmSell" style = "position: fixed;
	z-index: 9999;
	padding-top: 25vh;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	overflow: auto;
	background-color: rgba(0, 0, 0, 0.4);">
	
	<div style = "width: 500px;
	height: 400px;
	padding: 30px 30px;
	margin: 0 auto;
	border: 1px solid #777;
	background-color: #fff;">
	
 	<span style = "float: right;
	font-weight: bold;
	color: #777;
	font-size: 25px;
	cursor: pointer;" onclick = "share('off')">&times;</span>
	
		작품번호 <p class = "infop"></p>번 
		<p class = "infop"></p>가 
		<p class = "infop"></p>에
		<p class = "infop"></p>개 팔렸습니다.
	
	
	
	
	
	</div>
</div>
	
	
	
	
	
	
	
	

	</div>
	</div>


	</main>


<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
	
	
	 <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

	<script>
	
	
	function sellStatic(){
		$.ajax({
			url: 'findStatic.ar',
			type: 'GET',
					
		success: (data) =>{
		    	
			var sellstatic = JSON.parse(data.sellstatic);
			var  attachment = JSON.parse(data.attachment);
  		  
  		 var proNo = sellstatic.proNo;
  		var ordDate = sellstatic.ordDate;
  		var sellAmount = sellstatic.sellAmount;
  		var proName = sellstatic.proName;
  		var	odtNum = sellstatic.odtNum;
		  				
  		console.log(sellstatic);
				document.getElementById('alarmSell').style.display = "block";
				
				document.getElementsByClassName('infop')[0].innerText = proNo;
				document.getElementsByClassName('infop')[1].innerText = proName;
				document.getElementsByClassName('infop')[2].innerText = proName;
				
				
				
				
				
				
				setTimeout(function() {
					document.getElementById('alarmSell').style.display = "none";
					}, 1000);
				
			},
		    error: function onError (error) {
		        console.error(error);
		    }
			
				
		});
	}
	
	setInterval(sellStatic, 3000);
	

	
	</script>
	
	<script>
		function close(){
			
			document.getElementById('alarmSell').style.display = "none";
			
				
		}
	
	
	
	</script>
	
	
	
	  <script>
//         document.addEventListener("DOMContentLoaded", function() {
//             var chartContainer = document.getElementById('chart-container');
//             var chartCanvas = document.getElementById('chart');
//             var ctx = chartCanvas.getContext('2d');
            
//             var chart = new Chart(ctx, {
//                 type: 'line',
//                 data: {
//                     labels: [],
//                     datasets: [{
//                         label: '실시간 판매',
//                         data: [],
//                         borderColor: 'blue',
//                         borderWidth: 1,
//                         fill: false
//                     }]
//                 },
//                 options: {
//                     responsive: true,
//                     maintainAspectRatio: false,
//                     scales: {
//                         x: {
//                             display: true,
//                             ticks: {
//                                 autoSkip: true,
//                                 maxTicksLimit: 10
//                             }
//                         },
//                         y: {
//                             display: true,
//                             suggestedMin: 0,
//                             suggestedMax: 100
//                         }
//                     }
//                 }
//             });

//             // 데이터 업데이트 함수
//             function updateData() {
            	
//             	  sellStatic();
            	
//             	var time = new Date().toLocaleTimeString('en-US', { hour12: false, hour: '2-digit', minute: '2-digit', second: '2-digit' });
// // 				var time = sellstatic.ordDate;
// 				console.log(proName);
//                 chart.data.labels.push(time);
//                 chart.data.datasets[0].data.push(proNo);
//                 chart.data.datasets[0].data.push(proName);
//                 chart.data.datasets[0].data.push(ordDate);
//                 chart.data.datasets[0].data.push(sellAmount);
//                 chart.update();
                

//                 // 일정 간격으로 데이터 업데이트
//                 setTimeout(updateData, 2000);
//             }

//             // 초기 데이터 업데이트
//             updateData();
//         });
    </script>
	
	


</body>
</html>