<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.7.0/chart.min.js"></script>
    <style>
       body {
           margin: 0;
           padding: 0;
           font-family: Arial, sans-serif;
           background: rgba(240, 240, 240, 1);
       }

       header {
           background-color: #f8f9fa;
           padding: 20px;
           text-align: center;
           border-bottom: 1px solid #dee2e6;
       }

       h1, h2 {
           color: black;
       }


       main {
           background-color: #ffffff;
           padding: 20px;
           margin-left: 300px;
       }

       section {
           margin-bottom: 20px;
       }

       #logGraph, #salesInfo, #reviewContent {
           height: 200px;
           border: 1px solid #dee2e6;
           padding: 10px;
       }

	   table tr{
	   	height:30px;
	   }

       table {
           width: 100%;
           border-collapse: collapse;
           height: 85%;
           margin-top: 10px;
       }

       table th, table td {
           border: 1px solid #dee2e6;
           padding: 10px;
           text-align: center;
           height:30px;
       }
       
       th{
       	 background: aliceBlue;
       }
       
       table td{
       	cursor:pointer;
       }
       
       #auctionTable img{
       	height:50px;
       	width:50px;
       }
       
       #auctionTable {
        margin-top: 20px;
	    }
	
	    #auctionTable img {
	        height: 50px;
	        width: 50px;
	    }
	
	    /* 최근 접속자수, 판매량 TOP 10, 신규 등록 문의글 테이블 스타일 */
	    table#loginTable, table#salesTable, table#inquiryTable {
	        margin-top: 20px;
	    }
	    
	    .modal {
	  position: absolute;
	  top: 0;
	  left: 0;
	
	  width: 100%;
	  height: 1450px;
	
	  display: none;
	
	  background-color: rgba(0, 0, 0, 0.4);
	}
	
	.modal.show {
	  display: block;
	}
	
	.modal_body {
	  position: absolute;
	  top: 50%;
	  left: 50%;
	  transform: translateX(-50%) translateY(-50%);
	  
	  width: 700px;
	  height: 700px;
	  padding: 150px 140px 150px 150px;
	  background-color: rgb(255, 255, 255);
	  border-radius: 10px;
	  box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15);
	  
	  display: flex;
	  flex-direction: row;
	  flex-wrap: wrap; 
	  align-items: flex-start;
	  
		  
	}
	
	.modal_body div{
		width:50%;
		margin-bottom: 15px;
		
	}
	
    
    #closeCover{
   		width:100%;
   		display: flex;
 		justify-content: flex-end;
    }
    
    .modalInput{
    	border: white;
    	cursor: default;
    	background: white;
    }
    
    #textBox{
    	resize:none;
    	border:white;
    	background: white;
    	overflow: hidden;
    	
    	
    }
    
    #pidDiv{
    	width:330px;
    	height:330px;
    	margin: 20px 0 20px 0;
    }
    
    #textBox{
    	margin-top: 10px;
    }
    </style>
</head>
<body>
	<jsp:include page="../common/adminHeadSide.jsp"></jsp:include>
        <main style="width:70%; ">
            <div style="display:flex; flex-direction:column; height:100%;">
                    <section style="width:100%; margin-right:0.5%; height:50%;">
	                    <h2>최근 접속자수</h2>
	                    <div style="height:100%;">
	                        <canvas id="line-chart" height="140"></canvas>
	                    </div>
                    </section>
                    <section style="width:100%; margin-left:0.5%;">
                        <h2>입찰 TOP 5</h2>
                        <table id="auctionTable">
                            <tr>
                                <th>경매 번호</th>
                                <th>작품 사진</th>
                                <th>작품명</th>
                                <th>작가명</th>
                                <th>경매 시작일</th>
                                <th>경매 종료일</th>
                                <th>입찰금액</th>
                            </tr>
                            <c:forEach items="${ aList }" var="topAuc">
                            	<tr onclick="moveAuction('${topAuc.aucNo}', '${ topAuc.aucStartPrice }','${ topAuc.aucFinishPrice }','${ topAuc.aucStartDate }','${ topAuc.aucFinishDate }','${ topAuc.aucMemId}','${ topAuc.conAuthor }','${ topAuc.conProduct }','${ topAuc.conWidth }','${ topAuc.conHeight }','${ topAuc.conYear }','${ topAuc.conEtc }','${ topAuc.attRename }');">
                            		<td>${ topAuc.aucNo }</td>
	                                <td><img src="${ topAuc.attRename }"/></td>
	                                <td>${ topAuc.conProduct }</td>
	                                <td>${ topAuc.conAuthor }</td>
	                                <td>${ fn:split(topAuc.aucStartDate, " ")[0] }</td>
	                                <td>${ fn:split(topAuc.aucFinishDate, " ")[0] }</td>
	                                <td><fmt:formatNumber value="${ topAuc.aucFinishPrice }"/> 원</td>
                            	</tr>
                            </c:forEach>
                        </table>
                    </section>
                <div style="height:50%;">
                	<section style="width:100%; margin-left:0.5%;">
                        <h2>신규 등록 문의글</h2>
                        <table>
                            <tr>
                                <th>문의 번호</th>
                                <th>신청 아이디</th>
                                <th>작품명</th>
                                <th>작가명</th>
                                <th>희망가</th>
                            </tr>
                            <c:forEach items="${ cList }" var="consignment">
                            	<tr>
                            		<td>${ consignment.conNo }</td>
	                                <td>${ consignment.memId }</td>
	                                <td>${ consignment.conProduct }</td>
	                                <td>${ consignment.conAuthor }</td>
	                                <td><fmt:formatNumber value="${ consignment.conHope }"/> 원</td>
                            	</tr>
                            </c:forEach>
                          </table>
                    </section>
                    <section style="width:100%; margin-right:0.5%;">
                        <h2>판매량 TOP 10</h2>
						<table>
                            <tr>
                                <th>작품 번호</th>
                                <th>작품명</th>
                                <th>작가명</th>
                                <th>가격</th>
                                <th>재고</th>
                            </tr>
                            <c:forEach items="${ pList }" var="product">
                            	<tr onclick="moveToProduct(${ product.proNo })">
                            		<td>${ product.proNo }</td>
	                                <td>${ product.proName }</td>
	                                <td>${ product.proWriter }</td>
	                                <td><fmt:formatNumber value="${ product.proPrice }"/> 원</td>
	                                <td>${ product.proAmount }</td>
                            	</tr>
                            </c:forEach>
                          </table>
                    </section>
                </div>
            </div>
        </main>
        
        <div class="modal">
		      <div class="modal_body">
		      	<div>경매 번호</div>
		      	<div>작품명</div>
		      	<div><input type="text" disabled  class="modalInput"></div>
		      	<div><input type="text" disabled  class="modalInput"></div>
		      	<div>작가명</div>
		      	<div>경매 시작가</div>
		      	<div><input type="text" disabled  class="modalInput"></div>
		      	<div><input type="text" disabled  class="modalInput"></div>
		      	<div>최고 입찰금</div>
		      	<div>현재 입찰자 아이디</div>
		      	<div><input type="text" disabled  class="modalInput"></div>
		      	<div><input type="text" disabled  class="modalInput"></div>
		      	<div>시작일</div>
		      	<div>종료일</div>
		      	<div><input type="text" disabled  class="modalInput"></div>
		      	<div><input type="text" disabled  class="modalInput"></div>
		      	<div>가로</div>
		      	<div>세로</div>
		      	<div><input type="text" disabled  class="modalInput"></div>
		      	<div><input type="text" disabled  class="modalInput"></div>
		      	<div>사진<br><img id="pidDiv"/></div>
		      	<div>
		      		작품설명<br>
		      		<textarea disabled rows="25" cols="50" id="textBox">
		      		</textarea></div>
		      	<div id="closeCover">
		      		<button id="modalClose">닫기</button>
		      	</div>
		      </div>
		</div>
		    
    <script type="text/javascript">
	    window.onload = () =>{
	    	const modalClose = document.querySelector("button[id='modalClose']");
	    	console.log(modalClose.parentElement.parentElement)
	    	modalClose.addEventListener('click',function(){
    			modalClose.parentElement.parentElement.parentElement.style.display = 'none';
    		})
	    }
		
    
    	moveToProduct = (data) =>{
    		location.href = 'artsDetail.ar?proNo=' + data;
    		modal.style.display = 'block';
    	}
    
    
    	moveAuction = (aucNo, startPrice, lastPrice, startDate, finishDate, memId, author, product, width, height, year, explain, pic) =>{
    		const modal = document.querySelector('.modal');
    		let a = [];
    		a.push(aucNo)
    		a.push(product)
    		a.push(author)
    		a.push(startPrice)
    		a.push(lastPrice)
    		a.push(memId)
    		a.push(startDate)
    		a.push(finishDate)
    		a.push(width)
    		a.push(height)
    		
    		console.log(document.querySelectorAll("input[class='modalInput']"));
    		
    		for(const [index, inputs] of document.querySelectorAll("input[class='modalInput']").entries()){
    			inputs.value = a[index];
    		}
    		
    		document.querySelector("img[id='pidDiv']").setAttribute("src", pic);
    		document.querySelector("textarea[id='textBox']").value = explain;
    		modal.style.display = 'block';
    	}
    
    	
    
    	const loginUsers = '${loginUsers}';
    	const forGraph = loginUsers.split(",")
    	const today = new Date();
        const chart = document.getElementById("line-chart")
        chart.style.height = '100px';
        
        let logYear = today.getFullYear().toString().substring(2);
		
		let logMonth = (today.getMonth() + 1).toString();
		let logDate = today.getDate();
		
		if(logMonth.length == 1){
			logMonth = "0" + logMonth; 
		}
		
    	let a = 0;
    	let b = 0;
    	let c = 0;
    	let d = 0;
    	let e = 0;
    	let f = 0;
    	let g = 0;
    	
    	const labels = [];
        const datas = [];
         
    	
    	for(let i = 0; i < forGraph.length; i++){
	    		switch(true){
	    		case forGraph[i].includes(logYear + "-" + logMonth + "-" + ((logDate - 6).toString().length == 1 ? ("0" + (logDate - 6).toString()) : (logDate - 6).toString())): 
	    			a++;
	    			break;
	    		case forGraph[i].includes(logYear + "-" + logMonth + "-" + ((logDate - 5).toString().length == 1 ? ("0" + (logDate - 5).toString()) : (logDate - 5).toString())): 
	    			b++;
	    			break;
	    		case forGraph[i].includes(logYear + "-" + logMonth + "-" + ((logDate - 4).toString().length == 1 ? ("0" + (logDate - 4).toString()): (logDate - 4).toString())):
	    			c++;
	    			break;
	    		case forGraph[i].includes(logYear + "-" + logMonth + "-" + ((logDate - 3).toString().length == 1 ? ("0" + (logDate - 3).toString()) : (logDate - 3).toString())):
	    			d++;
	    			break;
	    		case forGraph[i].includes(logYear + "-" + logMonth + "-" + ((logDate - 2).toString().length == 1 ? ("0" + (logDate - 2).toString()) : (logDate - 2).toString())):
	    			e++;
	    			break;
	    		case forGraph[i].includes(logYear + "-" + logMonth + "-" + ((logDate - 1).toString().length == 1 ? ("0" + (logDate - 1).toString()) : (logDate - 1).toString())):
	    			f++;
	    			break;
	    		case forGraph[i].includes(logYear + "-" + logMonth + "-" + ((logDate).toString().length == 1 ? ("0" + (logDate).toString()) : (logDate).toString())):
	    			g++;
	    			break;
	    		}
	    	}
    	
    	datas.push(a, b, c, d, e, f, g);
        
        let weekAgo = new Date(today.getFullYear(), today.getMonth(), today.getDate() - 6);
        
        function formatDate(date) {
        	  let year = date.getFullYear();
        	  let month = date.getMonth() + 1;
        	  let day = date.getDate();

        	  // 날짜가 한 자리일 경우 앞에 0 붙이기
        	  month = month < 10 ? '0' + month : month;
        	  day = day < 10 ? '0' + day : day;

        	  return year + '-' + month + '-' + day;
        	}
        
        for (let i = 0; i <= 6; i++) {
        	let currentDate = new Date(weekAgo);
      	    currentDate.setDate(weekAgo.getDate() + i);
      	    labels.push(formatDate(currentDate));
      	}
        
        const lineChart = new Chart(chart, {
            type: 'line',
            data: {
                labels: labels,
                datasets: [
                    {
                        label: '최근 일주일 접속자 수',
                        data: datas,
                        borderColor: 'rgba(0, 128, 128, 1)',
                        borderWidth: 2,
                        backgroundColor: 'rgba(0, 128, 128, 1)'
                    }
                ]
            },
            options: {
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });
    </script>
</body>
</html>
