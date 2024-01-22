	<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="imagetoolbar" content="no">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="format-detection" content="telephone=no">
<title>관리자 위탁 내역</title>
<link rel="stylesheet" href="consignment/css/setting.css">
<link rel="stylesheet" href="consignment/css/plugin.css">
<link rel="stylesheet" href="consignment/css/template.css">
<link rel="stylesheet" href="consignment/css/common.css">
<link rel="stylesheet" href="consignment/css/style.css">

<link rel="stylesheet" href="main/css/setting.css">
<link rel="stylesheet" href="main/css/plugin.css">
<link rel="stylesheet" href="main/css/template.css">
<link rel="stylesheet" href="main/css/common.css">
<link rel="stylesheet" href="main/css/main.css">
<link rel="stylesheet" href="main/css/style.css">
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

<style type="text/css">
.tableset tr:hover{
   background: #dcdcdc;
   cursor: pointer;
}
table {
	width: 100%;
}

th {
	
}

button{
	color:white;
	background: black;
	border-radius: 3px;
}

td {
	text-align: center;
	height: 35px;
}

.modal {
	position: fixed;
	transform: translate(-50%, -50%);
	top: 50%;
	left: 50%;
	width: 100%;
	height: 100%;
	display: flex;
}

input[type="number"]::-webkit-outer-spin-button,
input[type="number"]::-webkit-inner-spin-button {
    -webkit-appearance: none;
    margin: 0;
}

.modal_content {
	box-shadow: 0 10px 20px rgba(0, 0, 0, 0.19), 0 6px 6px
		rgba(0, 0, 0, 0.23);
	background-color: white;
	padding: 50px 100px;
	text-align: center;
	top: 50%;
	left: 50%;
	transform: translateX(-50%);
	border-radius: 10px;
	position: relative;
	width: 50%;
}

.modal_overlay {
	background-color: rgba(0, 0, 0, 0.6);
	width: 100%;
	height: 100%;
	position: absolute;
}

#modal_h3 {
	margin: 0;
}

#closeAlertModal {
	background: black;
	color: white;
	float: right;
	border-radius: 5px;
	cursor: pointer;
}

.tabset .tabset-list {
	justify-content: flex-start;
}


element.style {
	gap: 1rem;
}

.contents-sort-sel {
	flex-wrap: wrap;
	width: 100%;
}

.contents-sort-sel {
	display: flex;
	align-items: center;
	gap: 2rem;
}

table {
	width: 100%;
}

table tr {
	width: 100%;
}
.admsearch{border: 1px solid lightgray; background-color: black; color: white; border-radius :0.6rem;} 
.admcancel{border: 1px solid lightgray; border-radius :0.6rem;}
.date-box{border-radius: 0.6rem; border: 1px solid lightgray;}
.con_startdate{border: 1px solid lightgray; height: 5rem; border-radius :0.6rem;}
.con_enddate{border: 1px solid lightgray; height: 5rem; border-radius :0.6rem;}
.inputText{border: 1px solid lightgray; height: 5rem; border-radius :0.6rem;}
</style>

<script type="text/javascript">
	$(document).ready(function() {
    // 승인여부 수락/거절 상태일 때 승인여부 제외하고 상세내용으로 이동
	    const $tbody = $("#tbody");
	    const $tds = $tbody.find('td');
	
	    $tds.on('mouseover', function() {
	        const $currentTd = $(this);
	
	        if ($currentTd.parent().children().eq(8).find("div").length === 2) {
	            for (let i = 1; i < 8; i++) {
	                $currentTd.parent().children().eq(i).on('click', function() {
	                    location.href = "selectUser.adco?conNo=" + $currentTd.parent().children().eq(0).find("input").val() + "&page=" + ${pi.currentPage};
	                });
	            }
	        } else {
	            $currentTd.parent().children().on('click', function() {
	            	for (let i = 1; i < $currentTd.parent().children().length-1; i++) {
		                $currentTd.parent().children().eq(i).on('click', function() {
	                		location.href = "selectUser.adco?conNo=" + $currentTd.parent().children().eq(0).find("input").val() + "&page=" + ${pi.currentPage};
	            });
	        }
	    });
	}
	    })
	});
	
	/* 경매 등록 모달 스크립트  */
	
	window.onload = () =>{
		start();
	}
	
	function start() {
		keepSort();
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
   		const enrollModal = document.getElementsByClassName("modal_overlay")[0];
   		const closeAuctionModal = document.getElementById("closeAuctionModal");
   		const insertAuctionBtn = document.getElementById("insertAuctionBtn");
   		const modalContent = document.getElementById("modal_h3"); 
   		const ajaxConHope = document.getElementById("ajaxConHope");
   		const ajaxConYear = document.getElementById("ajaxConYear");
   		const ajaxConWidth = document.getElementById("ajaxConWidth");
   		const ajaxConHeight = document.getElementById("ajaxConHeight");
   		
   		
   		insertAuctionBtn.addEventListener('click',function(){
   			let checkInt = false;
   			if(parseInt(ajaxConHope.value) != ajaxConHope.value){
   				console.log(ajaxConHope.value);
   				checkInt = true;
   				ajaxConHope.value = '';
   			}
   			
			if(parseInt(ajaxConYear.value) != ajaxConYear.value){
				console.log(ajaxConYear.value);
				checkInt = true;		
				ajaxConYear.value = '';
				
			}
			
			if(parseInt(ajaxConWidth.value) != ajaxConWidth.value){
				console.log(ajaxConWidth.value);
				checkInt = true;
				ajaxConWidth.value = '';
			}
			
			if(parseInt(ajaxConHeight.value) != ajaxConHeight.value){
				console.log(ajaxConHeight.value);
				checkInt = true;
				ajaxConHeight.value = '';
			}
			
   			if(checkInt){
   				modalContent.innerText = '숫자를 입력해주세요';
   				modal.style.display = 'block';
   			}else if(document.querySelector('input[name="aucStartDate"]').value == '' || document.querySelector('input[name="aucFinishDate"]').value == ''){
   				modalContent.innerText = '달력에서 날짜를 선택해주세요';
   				modal.style.display = 'block';
   			}else{
   				$.ajax({
   					url: 'updateConConStatus.adco',
   					type:'post',
   					data:{conNo:document.querySelector('input[name="aucNo"]').value, value:'Y'},
   					success: (data) =>{
   						if(data == 'success'){
   							console.log(data)
   						} else {
   							
   						}
   					},
   					error: (data) => console.log(data)
   				})
   				$.ajax({
   					url:'insertAuction.adac',
   					type:'post',
   					data:{aucNo:document.querySelector('input[name="aucNo"]').value, aucStartPrice:ajaxConHope.value,
   						  aucStartDate:document.querySelector('input[name="aucStartDate"]').value, aucFinishDate:document.querySelector('input[name="aucFinishDate"]').value,
   						  conWidth:ajaxConWidth.value, conHeight:ajaxConHeight.value,conYear:ajaxConYear.value,conEtc:ajaxConEtc.value},
   					success: (data) =>{
   						if(data == 'success'){
   							document.querySelector('input[name="aucStartDate"]').value = '';
	   	                    document.querySelector('input[name="aucFinishDate"]').value = '';
	   	                    enrollModal.style.display = 'none';
	   	                    alert('경매 등록에 성공하였습니다')
	   	                    $("#tableset").load(location.href + " #tableset");
   						}else{
   							document.querySelector('input[name="aucStartDate"]').value = '';
   		                    document.querySelector('input[name="aucFinishDate"]').value = '';
   		                    enrollModal.style.display = 'none';
   		                 	alert('경매 등록에 실패하였습니다')
   						}
   					},
   					error: (data) => console.log(data)
   				})
   			}
   		})
   		
   		closeAuctionModal.addEventListener('click',function(){
   			document.querySelector('input[name="aucStartDate"]').value = '';
			document.querySelector('input[name="aucFinishDate"]').value = '';
   			enrollModal.style.display = 'none';
   			$("#tableset").load(location.href + " #tableset");	
    		$("#totalCount").load(location.href + " #totalCount");
    		$("#pagiset-list").load(location.href + " #pagiset-list");
   			
   		})
   		
   		closeAlertModal.addEventListener('click',function(){
   			modal.style.display = 'none';
   		})
   		
   		
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
	
   
	    //선택 td 색 변경
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
   	}/// 여기가 윈도우onload끝
   	
   	
   	function selectStart(targetDay) {
   		if(parseInt(targetDay) < 10){
   			targetDay = "0" + targetDay;
   		}
   		const datePlace = document.querySelectorAll('span');
   		document.querySelectorAll("input")[5]
   		const startDateInput = document.querySelectorAll('input')[5];
   		const finishDateInput = document.querySelectorAll('input')[6];
   		const startCalendar = document.getElementById("startCalendar");
   		const selectStartBtn = document.getElementById("selectStart");
   		const modal = document.querySelector(".modal");
	 	const modalContent = document.getElementById("modal_h3");
   		
	 	function selectStartBtnEvent() {
	        if (finishDateInput.value != '') {
	            if (new Date(finishDateInput.value + " 23:59:59") > new Date(document.getElementById("yearPlace").innerText + "-" + document.getElementById("monthPlace").innerText + "-" + targetDay + " 00:00:00") && new Date(document.getElementById("yearPlace").innerText + "-" + document.getElementById("monthPlace").innerText + "-" + targetDay + " 00:00:00") > new Date()) {
	            	switch(true){
	            	case parseInt(document.getElementById("monthPlace").innerText) < 10 :
	            		startDateInput.value = document.getElementById("yearPlace").innerText + "-" + document.getElementById("monthPlace").innerText + "-" + targetDay;
	            		break;
	            	default:
	            		startDateInput.value = document.getElementById("yearPlace").innerText + "-" + document.getElementById("monthPlace").innerText + "-" + targetDay;
	            		break;
	            	}
	                startCalendar.style.display = 'none';
	            }else if(areDatesEqual(new Date(), new Date(document.getElementById("yearPlaceEnd").innerText + "-" + document.getElementById("monthPlaceEnd").innerText + "-" + targetDay))){
	            	modalContent.innerText = '금일은 시작일로 지정하실 수 없습니다';
	                modal.style.display = 'block';
	            }else{
	            	modalContent.innerText = '시작일을 종료일보다 후일로 설정할 수 없습니다';
	                modal.style.display = 'block';
	            }
	        }else if (new Date(document.getElementById("yearPlace").innerText + "-" + document.getElementById("monthPlace").innerText + "-" + targetDay + "T00:00:00") < new Date()) {
	        	modalContent.innerText = '시작일을 금일보다 이전으로 설정할 수 없습니다';
                modal.style.display = 'block';
	        }else if(areDatesEqual(new Date(), new Date(document.getElementById("yearPlaceEnd").innerText + "-" + document.getElementById("monthPlaceEnd").innerText + "-" + targetDay))){
	        	modalContent.innerText = '금일은 시작일로 지정하실 수 없습니다';
                modal.style.display = 'block';
	        }else {
	        	switch(true){
            	case parseInt(datePlace[30].innerText) < 10 :
            		startDateInput.value = document.getElementById("yearPlace").innerText + "-" + document.getElementById("monthPlace").innerText + "-" + targetDay;
            		break;
            	default:
            		startDateInput.value = document.getElementById("yearPlace").innerText + "-" + document.getElementById("monthPlace").innerText + "-" + targetDay;
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
   		const startDateInput = document.querySelectorAll('input')[5];
   		const finishDateInput = document.querySelectorAll('input')[6];
   		const endCalendar = document.getElementById("endCalendar");
   		const selectEndBtn = document.getElementById("selectEnd");
   		const modal = document.querySelector(".modal");
	 	const modalContent = document.getElementById("modal_h3");
   		
	 	function selectEndBtnEvent(){
   			if(startDateInput.value != ''){
	    		if(new Date(startDateInput.value + " 00:00:00") < new Date(document.getElementById("yearPlaceEnd").innerText + "-" + document.getElementById("monthPlaceEnd").innerText + "-" + targetDay + " 23:59:59")){
	    			finishDateInput.value = document.getElementById("yearPlaceEnd").innerText + "-" + document.getElementById("monthPlaceEnd").innerText + "-" + targetDay;
					endCalendar.style.display = 'none';
				}else if(areDatesEqual(new Date(), new Date(document.getElementById("yearPlaceEnd").innerText + "-" + document.getElementById("monthPlaceEnd").innerText + "-" + targetDay))){
    				modalContent.innerText = '금일은 종료일로 지정하실 수 없습니다';
		            modal.style.display = 'block';
    			}else{
					modalContent.innerText = '경매 종료일을 경매시작일보다 전으로 설정할 수 없습니다';
	                modal.style.display = 'block';
				}
   			}else{
   				if(areDatesEqual(new Date(), new Date(document.getElementById("yearPlaceEnd").innerText + "-" + document.getElementById("monthPlaceEnd").innerText + "-" + targetDay))){
   					modalContent.innerText = '금일은 종료일로 지정하실 수 없습니다';
	            	modal.style.display = 'block';
   				}else{
   					finishDateInput.value = document.getElementById("yearPlaceEnd").innerText + "-" + document.getElementById("monthPlaceEnd").innerText + "-" + targetDay;
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
	/*  */
	/*  */
	/*  */
	
    <!-- 전체선택 / 해제 -->
	conNo =[];
	<!-- 체크박스 선택 -->
	const check1 = () =>{
		const checkboxes = document.querySelectorAll('input[name="check"]');       // 전체 체크박스들
        const checked = document.querySelectorAll('input[name="check"]:checked')   // 선택된 체크박스
        const checkAll = document.querySelector('input[name="checkAll"]');         // 전체선택 박스
        
       	for(i=0; i < checked.length; i++){
          
       	}
       
       	if(checkboxes.length == checked.length){                           // 체크박스 전체개수 = 선택된 체크박스
       		checkAll.checked = true;
       	} else {
			checkAll.checked = false;
       	}
	}
   	<!-- 전체 선택 -->
  	const checkAll1 = () =>{
    	const checkboxes = document.querySelectorAll("input[type=checkbox]");
     	for(let i=1; i<checkboxes.length; i++){
       		checkboxes[i].checked = checkboxes[0].checked;                     // 배열 갯수만큼 체크된 체크박스 = 전체선택 박스
        }
    } 
  	<!-- 선택 삭제 -->
  	const minus = () =>{
    	const checkboxes = document.querySelectorAll("input[name='check']:checked");
        const deleteIds = [];
     
        for(i=0; i<checkboxes.length; i++){
           deleteIds[i] = checkboxes[i].id;
        }
        if(deleteIds.length != 0){
	        $.ajax({
	        	url: 'checkDelete.adco',
	        	type: 'post',
	        	data: {deleteIds: deleteIds},
	        	success: (data) =>{
	        		console.log(data)
	        		if(data == "success"){
		        		$("#tableset").load(location.href + " #tableset");	
		        		$("#totalCount").load(location.href + " #totalCount");
		        		$("#pagiset-list").load(location.href + " #pagiset-list");
		        		// 테이블 div / 띄어쓰기 꼭 넣고, url이랑 data변경하고, id로 해야함(★로사 알려줘야함★)
	        		}
	        	},
	        	error: data => console.log(data)
	        });
        }
        
  	}
	<!-- 거절 alert창	-->
	const closeEnroll = (conNo) =>{
		alert('경매 등록이 거절되었습니다.');
		
		$.ajax ({
			url: 'updateConConStatus.adco',
			type: 'post',
			data: {conNo: /*document.getElementById('conNo').value*/conNo, value: 'Z'},
			success: (data) =>{
				console.log(data)
				if(data === "success"){
					$("#tableset").load(location.href + " #tableset");
				}
			},
			error: (data) => console.log(data)
		})
	} 
	<!-- 검색 / 정렬 -->
	const sort = (value) =>{
		
		let status = document.getElementsByName("status")[0];
		status.value = value;
		
		let url = window.location.href;
		if(url.includes("status") && url.includes("select")){						// 조건 검색 진행 후 정렬할 때
			let preStatus = url.split("&status=")[1];
			url = url.split("&status="+preStatus)[0] + "&status="+value;
		} else if(url.includes("status") && !url.includes("select")) {				// 조건 정렬만 진행했을 때
			url = url.replace(url.split("adco?")[1], "status="+value);
		} else if(!url.includes("?")){												// 조건 검색, 정렬 둘 다 한적 없을 때	
			url = "?status=" + value;
		}
		let page = '${pi.currentPage}'
		url = url.replace("?page="+page, "?page=1");
		window.history.pushState({}, "Title", url);
		
		$("#tableset").load(location.href + " #tableset");
		$("#totalCount").load(location.href + " #totalCount");
		$("#pagiset-list").load(location.href + " #pagiset-list");
		
	}
	<!-- 정렬 탭 누를 때 -->
	const keepSort = () =>{
		let sorts = document.querySelectorAll(".tabset-item div");
		let currentSort = "${status}";
		
		if(currentSort == ""){
			sorts[0].classList.add("active");
			sorts[1].classList.remove("active");
			sorts[2].classList.remove("active");
		} else if(currentSort == 'Y'){
			sorts[1].classList.add("active");
			sorts[0].classList.remove("active");
			sorts[2].classList.remove("active");
		} else {
			sorts[2].classList.add("active");
			sorts[0].classList.remove("active");
			sorts[1].classList.remove("active");
		}
		
	}
	
	
	
	
	
	
	
	const openEnrollModal = (data) =>{
		
    	const $enrollModal = $(".modal_overlay").eq(0);
    	const ajaxConProduct = document.getElementById("ajaxConProduct");
    	const ajaxConAuthor = document.getElementById("ajaxConAuthor");
    	const ajaxConHope = document.getElementById("ajaxConHope");
    	const ajaxConWidth = document.getElementById("ajaxConWidth");
    	const ajaxConHeight = document.getElementById("ajaxConHeight");
    	const ajaxConYear = document.getElementById("ajaxConYear");
    	const ajaxConEtc = document.getElementById("ajaxConEtc");
    	const ajaxConNo = document.querySelector('input[name="aucNo"]');
    	const ajaxPicturePlace = document.querySelectorAll("img[class='pictures']");
    	$.ajax({
    	  url:'getConsignmentInfo.adac',
    	  type:'post',
    	  data:{conNo:data.parentElement.parentElement.parentElement.children[0].children[0].value},
    	  success: (data) =>{
    		  console.log(data);
    		  const ajaxConsignment = JSON.parse(data.consignment);
    		  const ajaxAttachmentList = JSON.parse(data.attachmentList);
    		  ajaxConProduct.value = ajaxConsignment.conProduct;
    		  ajaxConAuthor.value = ajaxConsignment.conAuthor;
    		  ajaxConHope.value = ajaxConsignment.conHope;
    		  ajaxConYear.value = ajaxConsignment.conYear;
    		  ajaxConWidth.value = ajaxConsignment.conWidth;
    		  ajaxConHeight.value = ajaxConsignment.conHeight;
    		  ajaxConEtc.value = ajaxConsignment.conEtc;
    		  ajaxConNo.value = ajaxConsignment.conNo;
    		  ajaxPicturePlace[0].src = ajaxAttachmentList[0].attRename;
    		  ajaxPicturePlace[1].src = ajaxAttachmentList[1].attRename;
    		  ajaxPicturePlace[2].src = ajaxAttachmentList[2].attRename;
    	  },
    	  error: (data) => console.log(data)
    	})
  	    $enrollModal.css('display','block');
      }
</script>
</head>

<body>
	<jsp:include page="../common/adminHeadSide.jsp"/>
	<!-- 경매 등록 모달 -->
	<!--  -->
	<div class="modal_overlay" style="display: block; z-index: 1; height: 150%;">
		<div id="content-allOver-cover" style="width: 100%; height: 100%; position: fixed; z-index: 1; left:17.5%; top:5%;">
			<div id="forWidthAndHeight" style="width: 65%; height: 80%; background-color: white; display: table;">
				<form action="insertAuction.adac" method="post" id="auctionForm">
					<div style="text-align: center; color:white; background: black; padding: 10px 0 10px 0;">경매 등록 페이지</div>
					<div style="display:flex; text-align:center; margin: 2.5% 0 1.25% 5%;">
						<div id="workNamePlace" style="margin-left: 3%; width: 44%;">
							작품명 <input type="text" readonly style="width: 50%;" name="conProduct" id="ajaxConProduct" required>
						</div>
						<div id="artistNamePlace" style="margin-right: 5%; width: 44%;">
							작가명 <input type="text" readonly style="width: 50%;" name="conAuthor" id="ajaxConAuthor" required>
						</div>
					</div>
					
					<div style="display:flex; text-align:center; margin: 1.25% 0 1.25% 5%;">
						<div id="startMoney" style="margin-left: 3%; width: 44%;">
							시작가 <input type="number" style="width: 50%;" name="aucStartPrice" id="ajaxConHope" required>
						</div>
						
						<div style="margin-right: 2%; width: 44%; display: inline-block;">
							제작 년도<input type="number" style="width: 48%;"  name="conYear" id="ajaxConYear">
						</div>
					</div>
					
					<div style="display:flex; text-align:center; margin: 1.25% 0 1.25% 7.5%; width:100%;">
						<div id="startDate" style="width: 40%;">
							시작일 <input type="text" name="aucStartDate" style="width: 40%;" readonly required>
							<button type="button" style="position: absolute;"  class="openCalender" id="startDateCalendar">달력</button>
	
							<div id="startCalendar"	style="border: 1px black solid; background: white; width: 30%; position: absolute;">
								<div style="text-align: center;">
									<div style="float: left; width: 8%; display: inline-block;">
										<button id="previous" type="button" style="width: 100%; background: white; border: 0; !important">&lt;</button>
									</div>
									<span id="yearPlace"></span>년 <span id="monthPlace"></span>월
									<div style="float: right; width: 8%; display: inline-block;">
										<button id="next" type="button" style="width: 100%; background: white; border: 0;">&gt;</button>
									</div>
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
									<button type="button" id="selectStart">선택</button>
									<button type="button" id="closeStart">닫기</button>
								</div>
							</div>
						</div>
						<div id="endDate" style="width: 40%; margin-left:1.5%;">
							종료일  <input type="text" name="aucFinishDate" style="width: 42%;"	readonly required>
							<button type="button" class="openCalender" style="position: absolute;" id="endDateCalendar">달력</button>
	
							<div id="endCalendar" style="border: 1px black solid; background: white; width: 30%; position: absolute;">
								<div style="text-align: center;">
									<div style="float: left; width: 8%; display: inline-block;">
										<button id="previousEnd" type="button" style="width: 100%; background: white; border: 0;">&lt;</button>
									</div>
									<span id="yearPlaceEnd"></span>년 <span id="monthPlaceEnd"></span>월
									<div style="float: right; width: 8%; display: inline-block;">
										<button id="nextEnd" type="button" style="width: 100%; background: white; border: 0;">&gt;</button>
									</div>
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
									<button type="button" id="selectEnd">선택</button>
									<button type="button" id="closeEnd">닫기</button>
								</div>
							</div>
						</div>
					</div>
					
					<div style="display:flex; text-align:left; margin: 1.25% 0 1.25% 16.5%;">
						<div style="width: 40%;">
							가로길이<input type="number" name="conWidth" id="ajaxConWidth" required style="width:65%;">
						</div>
						<div style="width: 40%; margin-left:9%;">
							세로길이<input type="number" name="conHeight" id="ajaxConHeight" required style="width:65%";>
						</div>
					</div>
						
						<div id="explainPlace" style="margin: 1.25% 0 1.25% 16.5%; width:74%;">
							<span>작품 설명</span><br>
							<textarea style="width: 91%; resize: none;" name="conEtc" id="ajaxConEtc" rows="8" required></textarea>
						</div>
					
					<div style="display:flex; text-align:center; align-items: center; justify-content: center;">
						<div style="width: 100%;">
							<div style="width: 25%; display: inline-block;">
								대표 사진<br>
								<span id="presentPic"><img class="pictures" src="" style="width: 250px; height: 250px;"></span>
							</div>
							<div style="width: 25%; display: inline-block;">
								전면 사진<br>
								<span id="firstPic"><img class="pictures" src="" style="width: 250px; height: 250px;"></span>
							</div>
							<div style="width: 25%; display: inline-block;">
								후면 사진<br>
								<span id="secondPic"><img class="pictures" src="" style="width: 250px; height: 250px;"></span>
							</div>
						</div>
						<br>
						<div>
						</div>
					</div>
					<div style="width: 20%; float: right; margin: 2% 0 2% 50%;">
						<button type="button" id="insertAuctionBtn">등록</button>
						<button type="button" id="closeAuctionModal" style="margin-right: 8%;">취소</button>
					</div>
				</div>
				
				<input type="hidden" name="aucNo">
			</form>
		</div>
	</div>

	<div class="modal" name="alertModal" style="display: none; justify-content: center; align-items: center; z-index: 2;">
		<div class="modal_overlay"></div>
		<div class="modal_content">
			<h5 id="modal_h3">경매 종료일이 경매 시작일보다 이전일 수 없습니다</h5>
			<button id="closeAlertModal">닫기</button>
		</div>
	</div>
	<!--  -->
	<!--  -->


	<main class="th-layout-main">
		<div class="hooms-N48" data-bid="no2CLZNtZF5"  style="min-height: 800px;">
			<div class="contents-inner" style="padding: 1rem 2.4rem 10rem;">
				<div class="contents-container container-md">
					<div class="textset" style="text-align: center;">
						<a class="textset-tit" style="font-size: 50px; margin: 50px;">ADMIN - CONSIGNMENT</a> <br>
						<br>
						<div class="date-box">
							<div class="date">
								<form action="searchList.adco" class="searchForm">
									<span><a>조회 기간</a></span> 
									<span> 
										<input type="date" class="con_startdate" name="strDate">
									</span>
									 ~ 
									<span> 
										<input type="date" class="con_enddate" name="endDat" style="margin-left: 20px;">
									</span> 
									<span> 
										<a>검색어</a> 
										<select style="width: 5%; border-radius :0.6rem; border: 1px solid lightgray; height: 5rem;" name="select">
											<option value="전체">전체</option>
											<option value="작가명">작가명</option>
											<option value="작품명">작품명</option>
									</select> 
										<input type="text" class="inputText" value="" placeholder="작가명/작품명" name="keyword" aria-label="내용" style="width: 10%;">
									</span> 
									<span><button type="submit" class="admsearch">검색</button></span>
									<span><button type="reset" class="admcancel">초기화</button></span>
									<input type="hidden" name="status" value="${status}">
								</form>
							</div>
						</div>
						<br>
						<br>
					</div>
					
					
					<div class="contents-search">
		          		<div id="totalCount" >
		            		<p class="contents-result"> 전체<span> ${ total }</span>개</p>
                		</div>
		            	<div class="contents-form">
							<div class="contents-sort-sel" >
								<div class="tabset tabset-text">
									<ul class="tabset-list" style="float: right; margin-bottom: 1rem;">
										<li class="tabset-item">
											<div class="tabset-link active" onclick="sort('')"> 
												<span>전체</span>
											</div>
										</li>
										<li class="tabset-item">
											<div class="tabset-link" onclick="sort('Y')"> 
												<span>등록된 문의</span>
											</div>
										</li>
										<li class="tabset-item">
											<div class="tabset-link" onclick="sort('N')"> 
												<span>삭제된 문의</span>
											</div>
										</li>
									</ul>
								</div>					
							</div>
						</div>
					</div>
					
				 
					<form action="list.adco" method="post" class="listForm">
						<div class="tableset" id="tableset">
							<table class="tableset-table table">
								<colgroup>
									<col>
									<col>
									<col>
									<col>
									<col>
									<col>
									<col>
								</colgroup>
								<thead class="thead-light thead-border-top">
									<tr>
										<th scope="col"><input id="checkset-b-1-1" class="checkset-input input-fill" type="checkbox" id="checkAll" name="checkAll" onclick="checkAll1()"></th>
										<th scope="col">회원아이디</th>
										<th scope="col">작가명</th>
										<th scope="col">작품명</th>
										<th scope="col">크기</th>
										<th scope="col">희망가</th>
										<!-- 
										<th scope="col">삭제여부</th>
										 -->
										<th scope="col">열람</th>
										<th scope="col">승인</th>
									</tr>
								</thead>
								<tbody id="tbody">
								
								
								<c:if test="${ !empty cList }">
									<c:forEach items="${cList}" var="c">
										<tr>
											<td class="tableset-mobile" onclick="javascript:event.stopPropagation();">
												<input type="hidden" value="${ c.conNo }" name="conNo" id="conNo"> 
												<input id="${c.conNo}" value="${ c.conNo }" class="checkset-input input-fill" type="checkbox" name="check" onclick="check1()">
											</td>
											<td class="tableset-tit tableset-order02" style="text-align: center;">
												<a href="javascript:void(0)"> 
													<span>${c.memId}</span> 
												</a>
											</td>
											<td class="tableset-order05">${ c.conAuthor }</td>
											<td class="tableset-order05">${ c.conProduct }</td>
											<td class="tableset-order05">${ c.conWidth }*${ c.conHeight }cm</td>
											<td><fmt:formatNumber type="number" value="${ c.conHope }" />원</td>

											<c:if test="${ c.conAdmStatus == 'N'}">
												<td class="tableset-order05">N</td>
											</c:if>
									
											<c:if test="${ c.conAdmStatus == 'Y'}">
												<td class="tableset-order05">Y</td>
											</c:if>

											<td class="tableset-order01"">
												<c:if test="${c.conConStatus == 'N'}">
													<c:if test="${c.conDelStatus == 'Y' }">
														<div class="badgeset badgeset-active" style="width: 45%; display: inline-block;">
															<intput type="button" onclick="openEnrollModal(this);">수락
														</div>
														<div class="badgeset" style="width:45%; display: inline-block; background: gray;" id="closeEnroll" onclick="closeEnroll(${c.conNo})">거절</div>
													</c:if>	
													<c:if test="${c.conDelStatus == 'N'}">삭제</c:if>
												</c:if> 
												<c:if test="${c.conConStatus == 'Y'}">
													<c:forEach items="${ aList }" var="a">
														<c:set var="now" value="<%=new java.util.Date()%>" />
														<fmt:formatDate var="nowDate" value="${now}"
															pattern="yyyy-MM-dd HH:mm:ss" />
														<fmt:formatDate var="startDate"
															value="${a.AUC_START_DATE}" pattern="yyyy-MM-dd HH:mm:ss" />
														<fmt:formatDate var="endDate" value="${a.AUC_FINISH_DATE}"
															pattern="yyyy-MM-dd HH:mm:ss" />
														<c:if test="${ a.AUC_CNO == c.conNo}">
															<c:if test="${ startDate > nowDate}">
														  	  경매 진행 예정	 
														  	</c:if>
															<c:if test="${ startDate < nowDate && endDate > nowDate}">
														  	  경매 진행중	
														  	</c:if>
															<c:if test="${ startDate < nowDate && endDate < nowDate}">
														  	  종료된 경매	
														  	</c:if>
														</c:if>
													</c:forEach>
												</c:if> 
												<c:if test="${c.conConStatus == 'Z'}">거절</c:if>	
											</td>
										</tr>
									</c:forEach>
								</c:if>
								
								<c:if test="${ empty cList }">
									<tr>
				              			<td colspan="8" style="height:300px; text-align:center"><h1>검색 결과가 없습니다.</h1></td>
				              		</tr>
								</c:if>
								
								
								</tbody>
							</table>
							
							<c:if test="${ !empty cList }">
								<input class="btnset btnset-lg" value="선택 삭제" type="button" id="deleteBtn();" name="deleteBtn" onclick="minus()" style="float:right;">
							</c:if>
						</div>
					</form>
				</div>

				<br>
				<br>
				<br>
				<c:if test="${ !empty cList }">
					<nav class="pagiset pagiset-line" id="pagiset-list">
						<c:if test="${ pi.currentPage <= 1 }">
							<div class="pagiset-ctrl">
								<a class="pagiset-link pagiset-first"> <span
									class="visually-hidden">처음</span>
								</a>
							</div>
							<div class="pagiset-ctrl">
								<a class="pagiset-link pagiset-prev"> <span
									class="visually-hidden">이전</span>
								</a>
							</div>
						</c:if>
						<c:if test="${ pi.currentPage > 1 }">
							<div class="pagiset-ctrl">
								<c:url var="goFirst" value="${ loc }">
									<c:param name="page" value="${ pi.startPage }"></c:param>
									<c:param name="select" value="${ sc.select }"></c:param>
									<c:param name="keyword" value="${ sc.keyword }"></c:param>
									<c:param name="strDate" value="${ sc.strDate }"></c:param>
									<c:param name="endDat" value="${ sc.endDat }"></c:param>
									<c:param name="status" value="${ sc.status }"></c:param>
								</c:url>
								<a class="pagiset-link pagiset-first" href="${ goFirst }"> <span
									class="visually-hidden">처음</span>
								</a>
							</div>
							<div class="pagiset-ctrl">
								<c:url var="goBack" value="${ loc }">
									<c:param name="page" value="${ pi.currentPage-1 }"></c:param>
									<c:param name="select" value="${ sc.select }"></c:param>
									<c:param name="keyword" value="${ sc.keyword }"></c:param>
									<c:param name="strDate" value="${ sc.strDate }"></c:param>
									<c:param name="endDat" value="${ sc.endDat }"></c:param>
									<c:param name="status" value="${ sc.status }"></c:param>
								</c:url>
								<a class="pagiset-link pagiset-prev" href="${ goBack }"> <span
									class="visually-hidden">이전</span>
								</a>
							</div>
						</c:if>
						<div class="pagiset-list">
							<c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
								<c:url var="goNum" value="${ loc }">
									<c:param name="page" value="${ p }"></c:param>
									<c:param name="select" value="${ sc.select }"></c:param>
									<c:param name="keyword" value="${ sc.keyword }"></c:param>
									<c:param name="strDate" value="${ sc.strDate }"></c:param>
									<c:param name="endDat" value="${ sc.endDat }"></c:param>
									<c:param name="status" value="${ sc.status }"></c:param>
								</c:url>
								<c:choose>
									<c:when test="${p eq pi.currentPage}">
										<a class="pagiset-link active-fill" href="${ goNum }">${ p }</a>
									</c:when>
									<c:otherwise>
										<a class="pagiset-link" href="${ goNum }">${ p }</a>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</div>
	
						<c:if test="${ pi.currentPage >= pi.maxPage }">
							<div class="pagiset-ctrl">
								<a class="pagiset-link pagiset-next"> <span
									class="visually-hidden">다음</span>
								</a>
							</div>
							<div class="pagiset-ctrl">
								<a class="pagiset-link pagiset-last"> <span
									class="visually-hidden">마지막</span>
								</a>
							</div>
						</c:if>
						<c:if test="${ pi.currentPage < pi.maxPage }">
							<div class="pagiset-ctrl">
								<c:url var="goNext" value="${ loc }">
									<c:param name="page" value="${ pi.currentPage+1 }"></c:param>
									<c:param name="select" value="${ sc.select }"></c:param>
									<c:param name="keyword" value="${ sc.keyword }"></c:param>
									<c:param name="strDate" value="${ sc.strDate }"></c:param>
									<c:param name="endDat" value="${ sc.endDat }"></c:param>
									<c:param name="status" value="${ sc.status }"></c:param>
								</c:url>
								<a class="pagiset-link pagiset-next" href="${ goNext }"> <span
									class="visually-hidden">다음</span>
								</a>
							</div>
							<div class="pagiset-ctrl">
								<c:url var="goList" value="${ loc }">
									<c:param name="page" value="${ pi.maxPage }"></c:param>
									<c:param name="select" value="${ sc.select }"></c:param>
									<c:param name="keyword" value="${ sc.keyword }"></c:param>
									<c:param name="strDate" value="${ sc.strDate }"></c:param>
									<c:param name="endDat" value="${ sc.endDat }"></c:param>
									<c:param name="status" value="${ sc.status }"></c:param>
								</c:url>
								<a class="pagiset-link pagiset-last" href="${ goList }"> <span
									class="visually-hidden">마지막</span>
								</a>
							</div>
						</c:if>
					</nav>
				</c:if>	
			</div>
		</div>

	</main>

	<script src="consignment/js/setting.js"></script>
	<script src="consignment/js/plugin.js"></script>
	<script src="consignment/js/template.js?ver=1"></script>
	<script src="consignment/js/common.js"></script>
	<script src="consignment/js/script.js"></script>
</body>
</html>

