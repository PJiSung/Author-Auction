<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	table{
		width:100%;
		
	}

	th{
	padding: 0 0 0 5%;
	
	}
	td{
	text-align: center;
	height:35px;
	}
	
	
	/* 알럿 모달 */	
	.modal{
		position:fixed;
		transform: translate(-50%, -50%);
		top:50%;
		left:50%;
		width:100%;
		height:100%;
		display:flex;
	}
	
	.modal_content{
		box-shadow: 0 10px 20px rgba(0,0,0,0.19), 0 6px 6px rgba(0,0,0,0.23);
		background-color:white;
		padding: 50px 100px;
		text-align:center;
		top:50%;
		left:50%;
		transform: translateX(-50%);
		border-radius:10px;
		position:relative;
		width:50%;
	}
	
	.modal_overlay{
		background-color: rgba(0,0,0,0.6);
		width:100%;
		height:100%;
		position:absolute;
	}
	
	#modal_h3{
		margin:0;
	}
	
	#closeAlertModal{
		background:black;
		color:white;
		float:right;
		border-radius: 5px;
		cursor:pointer;
	}
	
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
    <div id="content-allOver-cover" style="width: 70%; height: 70%; margin:auto;">
        <div id="forWidthAndHeight" style="width: 70%; height: 100%; margin: auto; background-color: pink; margin-top: 1%; display:table;">
        	<form action="insertAuction.adac" method="post">
	            <div style="margin-left: 5%;">경매 등록 페이지</div>
	            <div id="workNamePlace" style="margin-left: 5%; width: 100%;">작품명 <input type="text" readonly style="width: 80%;" name="conProduct" value="${ consignment.conAuthor }"></div>
	            <div id="artistNamePlace" style="margin-left: 5%; width: 100%;">작가명 <input type="text" readonly style="width: 80%;" name="conAuthor" value="${ consignment.conProduct }"></div>
	            <div id="startMoney" style="margin-left: 5%; width: 100%;">시작가 <input type="number" style="width: 80%;" name="aucStartPrice" value="${ consignment.conHope }"></div>
	            <div id="startDate" style="margin-left: 5%; width: 40%; display: inline-block;">
	            	경매 시작일 <input type="text" name="aucStartDate" style="width:50%" readonly><button type="button" style="position: absolute;" class="openCalender" id="startDateCalendar">달력</button>
	            	
	            	<div id="startCalendar" style="border:1px black solid; background:white; width:30%; position:absolute;">
	            		<div style="text-align: center;">
	            			<div style="float:left; width: 8%; display:inline-block;"><button id="previous" type="button" style="width:100%; background:white; border:0;">&lt;</button></div>
	            			<span id="yearPlace"></span>년 <span id="monthPlace"></span>월
	            			<div style="float:right; width: 8%; display:inline-block;"><button id="next" type="button" style="width:100%; background:white; border:0;">&gt;</button></div>
	            		</div>
	            		<table>
	            			<thead>
	            				<tr>
			            			<th>월</th>
			            			<th>화</th>
			            			<th>수</th>
			            			<th>목</th>
			            			<th>금</th>
			            			<th>토</th>
			            			<th>일</th>
	            				</tr>
	            			</thead>
	            			<tbody class="tb_body"></tbody>
	            		</table>
	            		<div style="text-align: right;">
	            			<button type="button" id="selectStart">선택</button> <button type="button" id="closeStart">닫기</button>
	            		</div>
	            	</div>
	            </div>
	            <div id="endDate" style="width: 40%; float: right; margin-right:5%;">
	            	경매 종료일<input type="text" name="aucFinishDate" style="width:50%;" readonly><button type="button" class="openCalender" style="position:absolute;" id="endDateCalendar">달력</button>
	            	
	            	<div id="endCalendar" style="border:1px black solid; background:white; width:30%; position:absolute;">
	            		<div style="text-align: center;">
	            			<div style="float:left; width: 8%; display:inline-block;"><button id="previousEnd" type="button" style="width:100%; background:white; border:0;">&lt;</button></div>
	            			<span id="yearPlaceEnd"></span>년 <span id="monthPlaceEnd"></span>월
	            			<div style="float:right; width: 8%; display:inline-block;"><button id="nextEnd" type="button" style="width:100%; background:white; border:0;">&gt;</button></div>
	            		</div>
	            		<table>
	            			<thead>
	            				<tr>
			            			<th>월</th>
			            			<th>화</th>
			            			<th>수</th>
			            			<th>목</th>
			            			<th>금</th>
			            			<th>토</th>
			            			<th>일</th>
	            				</tr>
	            			</thead>
	            			<tbody class="tb_body"></tbody>
	            		</table>
	            		<div style="text-align: right;">
	            			<button type="button" id="selectEnd">선택</button> <button type="button" id="closeEnd">닫기</button>
	            		</div>
	            	</div>
	            </div>
	            <div style="margin-left: 5%; width: 40%; display: inline-block;">제작 년도<input type="number" name="conYear" value="${ consignment.conYear }"></div>
	            <div style="width: 100%;">
	            	<div style="margin-left: 5%; width: 40%; display:inline-block;">가로길이<input type="number" name="conWidth" value="${ consignment.conWidth }"></div>
	            	<div style="margin-left: 5%; width: 40%; display:inline-block;">세로길이<input type="number" name="conHeight" value="${ consignment.conHeight }"></div>
	            </div>
	            <div id="explainPlace" style="margin-left: 5%;">
	                <span>작품 설명</span><br>
	                <textarea style="width: 91%; resize: none;" name="conEtc">${ consignment.conEtc }</textarea>
	            </div>
	            <div style="margin-left: 5%; width: 100%;">
	            	<div style="width:25%; display:inline-block; margin-right: 3.125%;">대표 사진<br><img src="image/치즈 냥이.jpg" style="width:100%; height:100%;"></div>
	            	<div style="width:25%; display:inline-block; margin-right: 3.125%; margin-left: 3.125%;">전면 사진<br><img src="image/치즈 냥이.jpg" style="width:100%; height:100%;"></div>
	            	<div style="width:25%; display:inline-block; margin-left: 3.125%;">후면 사진<br><img src="image/치즈 냥이.jpg" style="width:100%; height:100%;"></div>
	            </div>
	            <div style="width: 100%; text-align: right;">
	            	<button style=" margin-right: 8%;">등록</button>
	            </div>
	            <input type="hidden" name="aucNo" value="${ consignment.conNo }">
            </form>
        </div>
    </div>
  	<jsp:include page="../common/footer.jsp"/>
  	<div class="modal" style="justify-content: center; align-items: center;">
  		<div class="modal_overlay"></div>
  		<div class="modal_content">
  			<h5 id="modal_h3">경매 종료일이 경매 시작일보다 이전일 수 없습니다</h5>
  			<button id="closeAlertModal"> 닫기 </button>
  		</div>
  	</div>
  	
  	
  	
  	<script>
    	window.onload = () =>{
    		const startCalendar = document.getElementById("startCalendar");
    		const startDateCalendar = document.getElementById("startDateCalendar");
    		const endCalendar = document.getElementById("endCalendar");
    		const endDateCalendar = document.getElementById("endDateCalendar");
    		const closeStart = document.getElementById("closeStart");
    		const closeEnd = document.getElementById("closeEnd");
    		const yearPlace = document.getElementById("yearPlace");
    		const monthPlace = document.getElementById("monthPlace");
    		const previous = document.getElementById("previous");
    		const next = document.getElementById("next");
    		const selectStartBtn = document.getElementById("selectStart");
    		const selectEndBtn = document.getElementById("selectEnd");
    		const dateInput = document.querySelectorAll('input');
    		const monthPlaceEnd = document.getElementById("monthPlaceEnd");
    		const yearPlaceEnd = document.getElementById("yearPlaceEnd");
    		const previousEnd = document.getElementById("previousEnd");
    		const nextEnd = document.getElementById("nextEnd");
    		const span = document.querySelectorAll('span')
    		const modal = document.querySelector(".modal");
    		const closeAlertModal = document.getElementById("closeAlertModal");
    		
    		console.log(new Date() > new Date('2024-01-01 23:59:59'));
    		closeAlertModal.addEventListener('click',function(){
    			modal.style.display = 'none';
    		})
    		
    		modal.style.display = 'none';
    		
    		startCalendar.style.display = 'none';
    		endCalendar.style.display = 'none';
    		
    		
    		//달력 닫기버튼에 닫힘 효과 부여
			
			closeStart.addEventListener('click', function(){
				startCalendar.style.display = 'none';
			});
			
			closeEnd.addEventListener('click', function(){
				endCalendar.style.display = 'none';
			});
			
			
			//처음 달력에 년,월 대입
			const year = new Date().getFullYear();
			const month = new Date().getMonth() +1;
			
			yearPlace.innerText = year;
			yearPlaceEnd.innerText = year;
			
			//10월 이하에는 0을 붙여서 넣어줌
			if(parseInt(month) < 10){
				monthPlace.innerText = "0" + month;
				monthPlaceEnd.innerText = "0" + month;
			}else{
				monthPlace.innerText = month;
				monthPlaceEnd.innerText = month;
			}
			
			
			
			//이전 이후 버튼으로 월 이동
			previous.addEventListener('click',function(){
				if(parseInt(monthPlace.innerText) > 10){
					monthPlace.innerText = parseInt(monthPlace.innerText) - 1;
				}else{
					monthPlace.innerText = "0" + (parseInt(monthPlace.innerText) - 1);
				}
				
				if(parseInt(monthPlace.innerText) == 0) {
					yearPlace.innerText = parseInt(yearPlace.innerText) - 1;
					monthPlace.innerText = 12;
				}
				changeYearMonth(document.getElementById("yearPlace").innerText, document.getElementById("monthPlace").innerText);
			})
			
			
			next.addEventListener('click',function(){
				if(parseInt(monthPlace.innerText) >= 9){
					monthPlace.innerText = parseInt(monthPlace.innerText) + 1;
				}else{
					monthPlace.innerText = "0" + (parseInt(monthPlace.innerText) + 1);
				}
				
				if(parseInt(monthPlace.innerText) == 13) {
					yearPlace.innerText = parseInt(yearPlace.innerText) + 1;
					monthPlace.innerText = '01';
				}
				changeYearMonth(document.getElementById("yearPlace").innerText, document.getElementById("monthPlace").innerText);
			})
			
			
			previousEnd.addEventListener('click',function(){
				if(parseInt(monthPlaceEnd.innerText) > 10){
					monthPlaceEnd.innerText = parseInt(monthPlaceEnd.innerText) - 1;
				}else{
					monthPlaceEnd.innerText = "0" + (parseInt(monthPlaceEnd.innerText) -1)
				}
				
				if(parseInt(monthPlaceEnd.innerText) == 0) {
					yearPlaceEnd.innerText = parseInt(yearPlaceEnd.innerText) - 1;
					monthPlaceEnd.innerText = 12;
				}
				changeYearMonth(document.getElementById("yearPlaceEnd").innerText, document.getElementById("monthPlaceEnd").innerText);
			})
			
			
			nextEnd.addEventListener('click',function(){
				if(parseInt(monthPlaceEnd.innerText) >= 9){
					monthPlaceEnd.innerText = parseInt(monthPlaceEnd.innerText) + 1;
				}else{
					monthPlaceEnd.innerText = "0" + (parseInt(monthPlaceEnd.innerText) + 1);
				}
				
				if(parseInt(monthPlaceEnd.innerText) == 13) {
					yearPlaceEnd.innerText = parseInt(yearPlaceEnd.innerText) + 1;
					monthPlaceEnd.innerText = '01';
				}
				changeYearMonth(document.getElementById("yearPlaceEnd").innerText, document.getElementById("monthPlaceEnd").innerText);
			})
			changeYearMonth(document.getElementById("yearPlace").innerText, document.getElementById("monthPlace").innerText);
			changeYearMonth(document.getElementById("yearPlaceEnd").innerText, document.getElementById("monthPlaceEnd").innerText);
			
			
			//달력 열때 이벤트 부여
			startDateCalendar.addEventListener('click', openStartCalendar);
			endDateCalendar.addEventListener('click', openEndCalendar);

			//1개의 달력이 열리면 다른 달력이 닫히게 부여와 동시에 td들에 이벤트부여
		    function openStartCalendar() {
		        startCalendar.style.display = 'block';
		        endCalendar.style.display = 'none';
		        document.getElementsByClassName("tb_body")[0].addEventListener('click', chooseStartDay);
		    }
		    
		    function openEndCalendar(){
		    	endCalendar.style.display = 'block';
		    	startCalendar.style.display = 'none';
		    	document.getElementsByClassName("tb_body")[1].addEventListener('click', chooseEndDay);
		    }
		
    
		    //td들에 이벤트부여 선택 td 색 변경 + 
	    	function chooseStartDay (event) {
	    		if (event.target.tagName === 'TD') {
	 	            const targetDay = event.target;
	 	            const allTds = document.querySelectorAll('.tb_body td');
	
	 	            allTds.forEach(td => {
	 	                if (td != targetDay) {
	 	                    td.style.background = 'white';
	 	                    td.style.color = 'black';
	 	                }
	 	            });
	
	 	            if (targetDay.innerText != '') {
	 	                targetDay.style.background = 'black';
	 	                targetDay.style.color = 'white';
	 	                selectStart(targetDay.innerText);
	 	            }
	 	        }
			}
	    	
	    	function chooseEndDay (event) {
	    		if (event.target.tagName === 'TD') {
			        const targetDay = event.target;
			        const allTds = document.querySelectorAll('.tb_body td');
	
			        allTds.forEach(td => {
			            if (td != targetDay) {
			                td.style.background = 'white';
			                td.style.color = 'black';
			            }
			        });
	
			        if (targetDay.innerText != '') {
			            targetDay.style.background = 'black';
			            targetDay.style.color = 'white';
			            selectEnd(targetDay.innerText);
			        }
			    }
	    	}
    	}
    	
    	function selectStart(targetDay) {
    		if(parseInt(targetDay) < 10){
    			targetDay = "0" + targetDay;
    		}
    		const datePlace = document.querySelectorAll('span'); 
    		const dateInput = document.querySelectorAll('input');
    		const startCalendar = document.getElementById("startCalendar");
    		const selectStartBtn = document.getElementById("selectStart");
    		const modal = document.querySelector(".modal");
		 	const modalContent = document.getElementById("modal_h3");
    		
		 	function selectStartBtnEvent() {
		        if (dateInput[5].value != '') {
		            if (new Date(dateInput[5].value + " 23:59:59") > new Date(datePlace[29].innerText + "-" + datePlace[30].innerText + "-" + targetDay + " 00:00:00") && new Date(datePlace[29].innerText + "-" + datePlace[30].innerText + "-" + targetDay + " 00:00:00") > new Date()) {
		            	switch(true){
		            	case parseInt(datePlace[30].innerText) < 10 :
		            		dateInput[4].value = datePlace[29].innerText + "-" + datePlace[30].innerText + "-" + targetDay;
		            		break;
		            	default:
		            		dateInput[4].value = datePlace[29].innerText + "-" + datePlace[30].innerText + "-" + targetDay;
		            		break;
		            	}
		                startCalendar.style.display = 'none';
		            }else if(new Date() == new Date(datePlace[29].innerText + "-" + datePlace[30].innerText + "-" + targetDay)){
		            	modalContent.innerText = '금일은 시작일로 지정하실 수 없습니다';
		                modal.style.display = 'block';
		            }else{
		            	modalContent.innerText = '시작일을 종료일보다 후일로 설정할 수 없습니다';
		                modal.style.display = 'block';
		            }
		        }else if (new Date(datePlace[29].innerText + "-" + datePlace[30].innerText + "-" + targetDay + "T00:00:00") < new Date()) {
		        	modalContent.innerText = '시작일을 금일보다 이전으로 설정할 수 없습니다';
	                modal.style.display = 'block';
		        }else if(new Date() == new Date(datePlace[29].innerText + "-" + datePlace[30].innerText + "-" + targetDay)){
		        	modalContent.innerText = '금일은 시작일로 지정하실 수 없습니다';
	                modal.style.display = 'block';
		        }else {
		        	switch(true){
	            	case parseInt(datePlace[30].innerText) < 10 :
	            		dateInput[4].value = datePlace[29].innerText + "-" + datePlace[30].innerText + "-" + targetDay;
	            		break;
	            	default:
	            		dateInput[4].value = datePlace[29].innerText + "-" + datePlace[30].innerText + "-" + targetDay;
	            		break;
	            	}
		        	startCalendar.style.display = 'none';
		    	}
				selectStartBtn.removeEventListener('click', selectStartBtnEvent);
			}
    		selectStartBtn.addEventListener('click', selectStartBtnEvent); 
    	}
    	
    	function selectEnd(targetDay){
    		if(parseInt(targetDay) < 10){
    			targetDay = "0" + targetDay;
    		}
    		const datePlace = document.querySelectorAll('span');
    		const dateInput = document.querySelectorAll('input');
    		const endCalendar = document.getElementById("endCalendar");
    		const selectEndBtn = document.getElementById("selectEnd");
    		const modal = document.querySelector(".modal");
		 	const modalContent = document.getElementById("modal_h3");
    		// 종료일 조건만 맞춰주면 된다
    		//0.시작일 종료일 같을때를 위해 00시 00분 00초 / 23시 59분 59초로 시간값 넣어서 비교 
    		//1.최소 종료일은 다음날(내일 시작 / 내일 끝도 가능하게 만들기 위해서)
    		//2.비어있을때는 상관없음 다만 시작일이 채워져있으면 비교하기
    		
		 	function selectEndBtnEvent(){
    			if(dateInput[4].value != ''){
		    		if(new Date(dateInput[4].value + " 00:00:00") < new Date(datePlace[31].innerText + "-" + datePlace[32].innerText + "-" + targetDay + " 23:59:59")){
						dateInput[5].value = datePlace[31].innerText + "-" + datePlace[32].innerText + "-" + targetDay;
						endCalendar.style.display = 'none';
					}else if(areDatesEqual(new Date(), new Date(datePlace[31].innerText + "-" + datePlace[32].innerText + "-" + targetDay))){
	    				modalContent.innerText = '금일은 종료일로 지정하실 수 없습니다';
			            modal.style.display = 'block';
	    			}else{
						modalContent.innerText = '경매 종료일을 경매시작일보다 전으로 설정할 수 없습니다';
		                modal.style.display = 'block';
					}
    			}else{
    				if(areDatesEqual(new Date(), new Date(datePlace[31].innerText + "-" + datePlace[32].innerText + "-" + targetDay))){
    					modalContent.innerText = '금일은 종료일로 지정하실 수 없습니다';
		            	modal.style.display = 'block';
    				}else{
    					dateInput[5].value = datePlace[31].innerText + "-" + datePlace[32].innerText + "-" + targetDay;
						endCalendar.style.display = 'none';
    				}
    			}
    			selectEndBtn.removeEventListener('click', selectEndBtnEvent);
    		}
    		selectEndBtn.addEventListener('click', selectEndBtnEvent);
    	}
    	
    	
    	function areDatesEqual(currentDate, selectDate) {
    	    return (
    	    		currentDate.getDate() === selectDate.getDate() &&
    	    		currentDate.getMonth() === selectDate.getMonth() &&
    	    		currentDate.getFullYear() === selectDate.getFullYear()
    	    );
    	}
    	
    	/* 달력 */
    	function checkLeapYear(selectYear){
			if(selectYear%400 == 0){
				return true;
			}else if(selectYear%100 == 0){
				return false;
			}else if(selectYear%4 == 0){
				return true;
			}else{
				return false;
			}
		}
		
		function getFirstDay(selectYear, selectMonth){
			if(selectMonth < 10){
				selectMonth = "0" + selectMonth;	
			}
			
			return (new Date(selectYear+ "-" + selectMonth + "-01").getDay());
		}
		
		
		function changeYearMonth(selectYear, selectMonth){
			let month_day = [31,28,31,30,31,30,31,31,30,31,30,31];
			if(selectMonth == 2){
				if(checkLeapYear(selectYear)) {
					month_day[1] = 29;
				}
			}
			
			let first_day_of_week = getFirstDay(selectYear, selectMonth);
			let arr_calendar = [];
		
			for(let i =0; i< first_day_of_week; i++){
				arr_calendar.push("");
			}
			
			for(let i = 1; i <= month_day[selectMonth-1]; i++){
				arr_calendar.push(String(i))
			}
			
			let remain_day = 7 - (arr_calendar.length%7);
			
			if(remain_day < 7) {
				for(let i =0; i < remain_day; i++){
					arr_calendar.push("");
				}
			}
			
			renderCalendar(arr_calendar);
		}
		
		function renderCalendar(data) {
			let h = [];
			for(let i = 0; i < data.length; i++){
				if(i == 0) {
					 h.push('<tr>');
				}else if(i%7 == 0){
					h.push('</tr>');
					h.push('<tr>');
				}
				h.push('<td>' + data[i] + '</td>');
			}
			
			h.push('</tr>');
			
			document.getElementsByClassName("tb_body")[0].innerHTML = h.join("");
			document.getElementsByClassName("tb_body")[1].innerHTML = h.join("");
		}
    </script>
</body>
</html>