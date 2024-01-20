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
</style>
</head>
<body>

 <link rel="stylesheet" href="main/css/template.css">
	<script src="sunwoo/jquery/jquery-3.7.1.min.js"></script>


	<jsp:include page="../common/adminHeadSide.jsp" />

	<main>
		<div style="display: flex;">
			<div
				style="height: 150vh; width: 90%; display: flex; align-items: center; justify-content: center;">


				<div style="width: 70%; height: 90%;">
					<div style="height: 10%; display: flex; align-items: center; border-top: 1px solid black;">
						<h1>미술품 조회</h1>
					</div>
					<form action="artsadmin.ar" method="get">
						<div
							style="width: 80%; border: 1px solid black; margin: 0 auto; height: 30vh">

							<div style="display: flex; align-items: center; height: 20%;">
								<div
									style="display: flex; width: 15%; align-items: center; justify-content: center;">
									<h3>검색어</h3>
								</div>
								<div
									style="display: flex; width: 15%; align-items: center; justify-content: center;">
									<select name="condition">
										<option value="all">전체</option>
										<option value="proNo">작품번호</option>
										<option value="proName">작품명</option>
										<option value="proWriter">작가명</option>
										<option value="proMaterial">재료</option>
									</select>
								</div>
								<div
									style="display: flex; width: 70%; align-items: center; justify-content: center;">
									<input type="text" name="keyword" placeholder="검색어를 입력해주세요"
										style="width: 70%; text-align: center;">
								</div>
							</div>

							<div style="display: flex; align-items: center; height: 20%;">
								<div
									style="display: flex; width: 15%; align-items: center; justify-content: center;">
									<h3>등록일</h3>
								</div>
								<div
									style="display: flex; width: 40%; align-items: center; justify-content: center;">
									<input type="date" name="startDate" placeholder="시작일"
										style="width: 80%; text-align: center;">
								</div>
								<div
									style="display: flex; width: 5%; align-items: center; justify-content: center;">
									<h3>~</h3>
								</div>
								<div
									style="display: flex; width: 40%; align-items: center; justify-content: center;">
									<input type="date" name="endDate" placeholder="종료일"
										style="width: 80%; text-align: center;">
								</div>
							</div>
							<div style="display: flex; align-items: center; height: 20%;">
								<div
									style="display: flex; width: 15%; align-items: center; justify-content: center;">
									<h3>가격</h3>
								</div>
								<div
									style="display: flex; width: 40%; align-items: center; justify-content: center;">
									<input type="text" name="minPrice" class="searchinput"
										placeholder="최저가" style="width: 80%; text-align: center;">
								</div>
								<div
									style="display: flex; width: 5%; align-items: center; justify-content: center;">
									<h3>~</h3>
								</div>
								<div
									style="display: flex; width: 40%; align-items: center; justify-content: center;">
									<input type="text" name="maxPrice" class="searchinput"
										placeholder="최고가" style="width: 80%; text-align: center;">
								</div>
							</div>
							<div style="display: flex; align-items: center; height: 40%;">
								<div
									style="display: flex; width: 15%; align-items: center; justify-content: center;">
									<h3>크기</h3>
								</div>
								<div
									style="width: 40%; height: 100%; display: flex; align-items: center; justify-content: center; flex-direction: column;">
									<input type="text" name="minWidth" class="searchinput"
										placeholder="가로 최소" style="width: 80%; text-align: center;">
									<br> <input type="text" name="minHeight"
										class="searchinput" placeholder="세로 최소"
										style="width: 80%; text-align: center;">
								</div>
								<div
									style="display: flex; width: 5%; align-items: center; justify-content: center;">
									<h3>~</h3>
								</div>
								<div
									style="width: 40%; height: 100%; display: flex; align-items: center; justify-content: center; flex-direction: column;">
									<input type="text" name="maxWidth" class="searchinput"
										placeholder="가로 최대" style="width: 80%; text-align: center;">
									<br> <input type="text" name="maxHeight"
										class="searchinput" placeholder="세로 최대"
										style="width: 80%; text-align: center;">
								</div>
							</div>
						</div>
						<div
							style="display: flex; align-items: center; justify-content: center;">
							<button
								style="background-color: #444; color: white; border: none; width: 5%; margin-right: 1%;">검색</button>
							<button type="reset"
								style="background-color: #ddd; border: none; width: 5%; margin-left: 1%;">초기화</button>
						</div>
					</form>

					<div style="height: 60%;">
						<div
							style="display: flex; justify-content: center; align-items: center; height: 10%; border-top: 1px solid #999; width: 80%; margin: 0 auto; margin-top: 5%;">
							<h3>검색결과</h3>
						</div>
						<div
							style="display: flex; justify-content: right; align-items: center; height: 10%; border-top: 1px solid #999; width: 80%; margin: 0 auto;">
							총 &nbsp;<span style="font-weight: bold;">${plistsize}</span>&nbsp;
							검색결과
						</div>
						<c:if test="${plistsize eq 0}">
							<div
								style="display: flex; justify-content: center; align-items: center; height: 50%;" id = "noitemdiv">
								<h1>검색 결과 없음</h1>
							</div>
						</c:if>
						<c:if test="${plistsize != 0 }">

							<div
								style="display: flex; align-items: center; border-top: 1px solid #999;">
								<div
									style="width: 10%; display: flex; align-items: center; justify-content: center; font-weight: bold; font-size: 20px;">번호</div>
								<div
									style="width: 10%; display: flex; align-items: center; justify-content: center; font-weight: bold; font-size: 20px;">이미지</div>
								<div
									style="width: 10%; display: flex; align-items: center; justify-content: center; font-weight: bold; font-size: 20px;">작품명</div>
								<div
									style="width: 10%; display: flex; align-items: center; justify-content: center; font-weight: bold; font-size: 20px;">작가명</div>
								<div
									style="width: 10%; display: flex; align-items: center; justify-content: center; font-weight: bold; font-size: 20px;">재료</div>
								<div
									style="width: 10%; display: flex; align-items: center; justify-content: center; font-weight: bold; font-size: 20px;">가로</div>
								<div
									style="width: 10%; display: flex; align-items: center; justify-content: center; font-weight: bold; font-size: 20px;">세로</div>
								<div
									style="width: 10%; display: flex; align-items: center; justify-content: center; font-weight: bold; font-size: 20px;">등록일</div>
								<div
									style="width: 10%; display: flex; align-items: center; justify-content: center; font-weight: bold; font-size: 20px;">가격</div>
								<div
									style="width: 10%; display: flex; align-items: center; justify-content: center; font-weight: bold; font-size: 20px;">재고</div>
							</div>
							<c:forEach items="${plist}" var="p">
								<div style="height: 25%; display: flex; align-items: center; border-bottom:1px solid #aaa;" class="pldiv" onclick="fullinput(this)">
									<div
										style="width: 10%; height: 100%; display: flex; align-items: center; justify-content: center;" class = "fullindiv">
										${p.proNo}</div>
									<c:forEach items="${alist}" var="a">
										<c:if test="${a.attBno eq p.proNo }">
											<input type="hidden" value="${a.attRename}" class="attrename">
											<input type="hidden" value="${a.attNo}" class="attrid">
											<c:if test="${a.attFno eq 1}">
												<div
													style="width: 10%; height: 100%; display: flex; align-items: center; justify-content: center;">
													<img class="cardset-img"
														src="${a.attRename}"
														style="width: 90%; height: 90%;" alt="카드 이미지">
												</div>
											</c:if>
										</c:if>
									</c:forEach>
									
									<div
										style="width: 10%; height: 100%; display: flex; align-items: center; justify-content: center;" class = "fullindiv">
										${p.proName}</div>
									<div
										style="width: 10%; height: 100%; display: flex; align-items: center; justify-content: center;" class = "fullindiv">
										${p.proWriter}</div>
									<div
										style="width: 10%; height: 100%; display: flex; align-items: center; justify-content: center;" class = "fullindiv">
										${p.proMaterial}</div>
									<div
										style="width: 10%; height: 100%; display: flex; align-items: center; justify-content: center;" class = "fullindiv">
										${p.proWidth}</div>
									<div
										style="width: 10%; height: 100%; display: flex; align-items: center; justify-content: center;" class = "fullindiv">
										${p.proHeight}</div>
									<div
										style="width: 10%; height: 100%; display: flex; align-items: center; justify-content: center;" class = "fullindiv">
										${p.proDate}</div>
									<div
										style="width: 10%; height: 100%; display: flex; align-items: center; justify-content: center;"
										class="pprice fullindiv">${p.proPrice}</div>
									<div
										style="width: 10%; height: 100%; display: flex; align-items: center; justify-content: center;" class = "fullindiv">
										${p.proAmount}</div>
									<!-- 							 <div class="cursor" style = "background-color: black; color:white;  position:absolute; -->
									<!-- /* 								    top:0; */ -->
									<!-- /* 								    left: 0; */ -->
									<!-- /* 								    z-index: 9999; */ -->
									<!-- /* 								    width: 350px; */ -->
									<!-- /* 								    height: 100px; */ -->
									<!-- 								    transform:translate(-50%, -50%);"> -->
									<!-- 								 하하; -->
									<!--     						</div> -->

								</div>
							</c:forEach>
		<nav class="pagiset pagiset-line" style = "margin-bottom: 0%;">
                <div class="pagiset-ctrl">
                  <a class="pagiset-link pagiset-first" onclick = "paging('first')" style = "cursor:pointer">
                    <span class="visually-hidden">처음</span>
                  </a>
                </div>
                <div class="pagiset-ctrl">
                  <a class="pagiset-link pagiset-prev" onclick = "paging('forward')" style = "cursor:pointer">
                    <span class="visually-hidden">이전</span>
                  </a>
                </div>
                <div class="pagiset-list">
                  <c:forEach var = "page" begin = "${pi.startPage}" end ="${pi.endPage}" >
                  <a class= "pagiset-link ${pi.currentPage eq page ? 'active-fill' : ''}" onclick = "paging(${page})" style = "cursor:pointer">${page}</a>
                  </c:forEach>
                </div>
                <div class="pagiset-ctrl">
                  <a class="pagiset-link pagiset-next" onclick = "paging('next')" style = "cursor:pointer">
                    <span class="visually-hidden">다음</span>
                  </a>
                </div>
                <div class="pagiset-ctrl">
                  <a class="pagiset-link pagiset-last" onclick = "paging('last')" style = "cursor:pointer">
                    <span class="visually-hidden">마지막</span>
                  </a>
                </div>
              </nav>
             
						</c:if>
						<div style = " text-align:right; height: 25%;">
					<button style = "background-color:black; color:white; border:none; width: 15%; margin-top: 0px;" type = "button" onclick = "window.open('artsInsert.ar','미술품추가','width = 1000, height = 800, top = 100, left = 200, location = no, toolbars = no, status = no');">미술품 추가</button>
					</div>
					</div>
					
				</div>
			
			</div>
				 
		</div>
	

		<div class="sns_share"
			style="position: fixed; z-index: 9999; padding-top: 5vh; left: 0; top: 0; width: 100%; height: 100%; overflow: auto; background-color: rgba(0, 0, 0, 0.4); display: none;">

			<div
				style="width: 1200px; height: 700px; padding: 30px 30px; margin: 0 auto; border: 1px solid #777; background-color: #fff;" id = "mordalwrap">

				<span
					style="float: right; font-weight: bold; color: #777; font-size: 25px; cursor: pointer;"
					onclick="popadd('off')">&times;</span>
				<div
					style="display: flex; height: 5%; align-items: center; justify-content: center; ">
					<h1>상세조회</h1>
				</div>
			
				<div style="margin-top: 5%; display: flex; height: 80%;"
					id="infoalldiv">
					<span style="position: absolute; left: 15; top: 50%;" class="pandn"
						id="previous"><img src="/sunwoo/icons/prear.png"
						style="width: 10%; cursor: pointer;"></span> <span
						style="position: absolute; left: 47%; top: 50%;" class="pandn"
						id="next"><img src="/sunwoo/icons/nextar.png"
						style="width: 10%; cursor: pointer"> </span>
						
						<button id = "deleteimgbtn" onclick = "deleteimg()" type = "button" style = "position: absolute; top: 25%; height: 4%; left: 47%; width: 2.5%; font-size:24px;right:0px;bottom:0px;z-index:999;background-color:rgba(255,255,255,0.1);color:#f00; display: none;">
						X
						</button>
						
					<div
						style="width: 50%; display: flex; height: 100%; align-items: center; justify-content: center; flex-direction: column;">
						<span>작품번호</span><span style="margin-bottom: 1%;"><input
							type="text" class="infoproduct" style="text-align: center;"
							readonly></span> <span>작품명</span><span
							style="margin-bottom: 1%;"><input type="text"
							class="infoproduct" style="text-align: center;" readonly></span>
						<span>작가</span><span style="margin-bottom: 1%;"><input
							type="text" class="infoproduct" style="text-align: center;"
							readonly></span> <span>재료</span><span style="margin-bottom: 1%;"><input
							type="text" class="infoproduct" style="text-align: center;"
							readonly></span> <span>가로</span><span style="margin-bottom: 1%;"><input
							type="text" class="infoproduct numreq" style="text-align: center;"
							readonly></span> <span>세로</span><span style="margin-bottom: 1%;"><input
							type="text" class="infoproduct numreq" style="text-align: center;"
							readonly></span> <span>등록일</span><span
							style="margin-bottom: 1%;"><input type="text"
							class="infoproduct" style="text-align: center;" readonly></span>
						<span>가격</span><span style="margin-bottom: 1%;"><input
							type="text" class="infoproduct numreq" style="text-align: center;"
							readonly></span> <span>재고</span><span style="margin-bottom: 1%;"><input
							type="text" class="infoproduct numreq" style="text-align: center;"
							readonly></span>
					</div>
				</div>
				
				<div id='image_preview' style = "width: 100%; display:none;" >
							
							<input type='file' id='btnAtt' name = "files" required accept="image/*" multiple='multiple'>
							<div id='att_zone' 
							     data-placeholder='파일을 첨부 하려면 파일 선택 버튼을 클릭하거나 파일을 드래그앤드롭 하세요.
							      파일의 순서는 순차적으로 적용됩니다.'></div>
							      <label for="btnAtt" style = "width: 100%;">
							<div class="btn-upload" style = "width: 20%; height: 20%; margin: 0 auto; margin-top: 2.5%;">파일 업로드하기</div>
							</label>
						</div>	



				<div style= "margin-top: 2%; text-align:right; " id = "btndiv">
				<button type = "button" onclick ="goEdit(this)" style = "background-color:#eee; color: black; border: none; width: 7.5%;" id = "eeditbtn">수정</button>
				<button type = "button" onclick ="deleteArts()" style = "background-color:black; color: white; border: none; width: 7.5%;">삭제</button>
				</div>
			</div>

		</div>


	</main>


<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
	
	
	
	
	<script>

	$('.searchinput').on('input', function() {
	    var sanitizedValue = this.value.replace(/[^0-9]/g, ''); 
	    this.value = sanitizedValue;

	});
	
		//숫자만 들어가게끔 하는 스크립트
// 		$(".searchinput").keyup(function(e) {
			
			
// 			if(isNaN(this.value)   || this.value.trim() == "" ){
				
// 				Swal.fire({
// 				      icon: 'warning',
// 				      title: '숫자만 입력해주십시오'
// 				    });	
// 				this.value = "";
				
// 			}
// 		});
 	
</script>

	<script>

	//천 단위 쉼표 스크립트
			function tochun(){
			for(p of document.getElementsByClassName('pprice')){
			
			p.innerText = p.innerText.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
			
			}
			}
			tochun();
</script>


	<script>


// 	for(pl of document.getElementsByClassName('pldiv')){
					
// 					pl.addEventListener('mouseover',()=>{
						
// 						$(document).mousemove(function(e){
// 						    var mouseX = e.pageX;
// 						    var mouseY = e.pageY;

// 						    $('.cursor').css({
// 						        left: 15+ mouseX + "px",
// 						        top : mouseY + "px"
// 						    })
// 						})
						
						
// 					});
					
// 					pl.addEventListener('mouseover',()=>{
						
												
// 					});
					
					
					
// 	}
		
		
</script>


	<script>



var imglist = [];
var imgindex;
var attnolist =[];
var deletelist = [];
var thumimgNo;
var thumimgName;
var setthumlevel = 0;


//팝업 여는 함수
function popadd(condition){
		
		if(condition == 'on'){
			document.getElementsByClassName('sns_share')[0].style.display = "block";
			
		}else{
			document.getElementsByClassName('sns_share')[0].style.display = "none";
			
			 document.getElementById('infodiv').remove();
			 imglist =[];
			 imgindex =0;
			 plist = [];
			 attnolist =[];
			deletelist = [];
			resetimg();
			returnedit();
			 document.getElementsByClassName('pandn')[0].style.display = "none";
			 document.getElementsByClassName('pandn')[1].style.display = "block";
		}
		
	}
	
document.getElementsByClassName('pandn')[0].style.display = "none";
	
	
//캐러셀 
for(pl of document.getElementsByClassName('pldiv')){
	
	pl.addEventListener('click', function(){
		
		
		popadd('on');
		
		 var newDiv = document.createElement("div");
		 
		 newDiv.id = 'infodiv';
		 newDiv.style.diplay = 'flex';
		 newDiv.style.alignItems = 'center';
		 newDiv.style.justifyContent = 'center';
		 newDiv.style.width = '50%';
		 newDiv.style.height = '100%';
		 newDiv.style.overflow = 'hidden';
		 newDiv.style.justifyContent = 'center';
		 document.getElementById('infoalldiv').prepend(newDiv);
		
			for(att of this.querySelectorAll('.attrename')){
					console.log(att);
				   let img = new Image();
		           img.src = att.value;
		           img.style.width = "100%";
		           img.style.height = "100%";
		           img.id = 'cell';
		           img.setAttribute('onClick','setTumb1(this)');
		           
		           
		           imglist.push(img);
		           attnolist.push(att.nextElementSibling.value);
		          
		        	
			};
			
			 document.getElementById('infodiv').appendChild(imglist[0]);
			 imgindex=0;
			 if(imglist.length ==1){
				 document.getElementsByClassName('pandn')[1].style.display = "none";
			 }
			
										
	});	
	

}

for( pn of document.getElementsByClassName('pandn')){
	
	pn.addEventListener('click',function(){
			switch(this.id){
			
			case 'next': 
				if(imgindex<imglist.length-1){
					document.getElementById('cell').remove();
					imgindex = imgindex+1;
					 document.getElementById('infodiv').appendChild(imglist[imgindex]);
					 document.getElementsByClassName('pandn')[0].style.display = "block";
					 
					 if( thumimgNo == parseInt(attnolist[imgindex])){
						 document.getElementById('cell').parentElement.style.border = "5px dotted red";
						 
					 }else{
						 document.getElementById('cell').parentElement.style.border = "none";
					 }
					
					 
					 
					 if(imgindex == imglist.length-1){
						 this.style.display = "none";
						 
					 }else{
						 this.style.display = "block";
						  
					 }
				}
					
				break;
				
			case 'previous': 
				if(imgindex>0){
					document.getElementById('cell').remove();
					imgindex = imgindex-1;
					 document.getElementById('infodiv').appendChild(imglist[imgindex]);
					 document.getElementsByClassName('pandn')[1].style.display = "block"; 
					 
					 
					 
					 if( thumimgNo == parseInt(attnolist[imgindex])){
						 document.getElementById('cell').parentElement.style.border = "5px dotted red";
						 
					 }else{
						 document.getElementById('cell').parentElement.style.border = "none";
					 }
					 
					 
					 if(imgindex == 0){
						 this.style.display = "none";
					 }else{
						 this.style.display = "block";
						 
					 }
				}
				
				break;
				
			}
		
	});
	
}



</script>


<script>

		
	function fullinput(t){	
			
		var plist = [];
			
			plist.push(t.querySelectorAll('.fullindiv')[0].innerText);
			plist.push(t.querySelectorAll('.fullindiv')[1].innerText);
			plist.push(t.querySelectorAll('.fullindiv')[2].innerText);
			plist.push(t.querySelectorAll('.fullindiv')[3].innerText);
			plist.push(t.querySelectorAll('.fullindiv')[4].innerText);
			plist.push(t.querySelectorAll('.fullindiv')[5].innerText);
			plist.push(t.querySelectorAll('.fullindiv')[6].innerText);
			plist.push(t.querySelectorAll('.fullindiv')[7].innerText);
			plist.push(t.querySelectorAll('.fullindiv')[8].innerText);
			
			
			for(var i = 0; i< document.querySelectorAll('.infoproduct').length; i++){
				
				document.querySelectorAll('.infoproduct')[i].value = plist[i];				
			
			
			}
			
		}

</script>




<script>


function deleteArts(){
	
	var proNo = document.getElementsByClassName('infoproduct')[0].value;
	
	if(confirm('정말 삭제하시겠습니까?')){

	$.ajax({
	    url: 'deleteArts.ar',
	    type: 'GET',
	    data: {
	    	proNo: proNo
	    },
	    success: function onData (msg) {
	    	
	    	alert(msg);
	    	
	    	
	    },
	    error: function onError (error) {
	        console.error(error);
	    }
	});
	
	}
}


</script>

<script>



	function goEdit(t){
		t.innerText = "수정완료";
		document.getElementById('deleteimgbtn').style.display = "block";
		
		alert('수정 모드로 변경되었습니다');
		t.setAttribute('onClick','doneEdit()');
		
		document.getElementById('mordalwrap').style.height = "1000px";
		document.getElementById('mordalwrap').style.width = "1500px";
		document.getElementById('infoalldiv').style.height = "60%";
		document.getElementById('image_preview').style.display = "block";
		
		document.getElementsByClassName('infoproduct')[1].readOnly = false;
		document.getElementsByClassName('infoproduct')[2].readOnly = false;
		document.getElementsByClassName('infoproduct')[3].readOnly = false;
		document.getElementsByClassName('infoproduct')[4].readOnly = false;
		document.getElementsByClassName('infoproduct')[5].readOnly = false;
		document.getElementsByClassName('infoproduct')[7].readOnly = false;
		document.getElementsByClassName('infoproduct')[8].readOnly = false;
		
		document.getElementsByClassName('infoproduct')[7].value = document.getElementsByClassName('infoproduct')[7].value.replace(/,/g,"");
		
		document.getElementById('btndiv').style.marginTop = "-2%";
		
		
		
		
		document.getElementsByClassName('infoproduct')[1].style.outline  = "1px solid red";
		document.getElementsByClassName('infoproduct')[2].style.outline  = "1px solid red";
		document.getElementsByClassName('infoproduct')[3].style.outline  = "1px solid red";
		document.getElementsByClassName('infoproduct')[4].style.outline  = "1px solid red";
		document.getElementsByClassName('infoproduct')[5].style.outline  = "1px solid red";
		document.getElementsByClassName('infoproduct')[7].style.outline  = "1px solid red";
		document.getElementsByClassName('infoproduct')[8].style.outline  = "1px solid red";
		document.getElementsByClassName('infoproduct')[1].focus();
		
	}
	
	function returnedit(){
		
		document.getElementById('eeditbtn').innerText = "수정";
		document.getElementById('deleteimgbtn').style.display = "none";
		
		document.getElementById('eeditbtn').setAttribute('onClick','goEdit(this)');
		
		document.getElementById('mordalwrap').style.height = "700px";
		document.getElementById('mordalwrap').style.width = "1200px";
		document.getElementById('infoalldiv').style.height = "80%";
		document.getElementById('image_preview').style.display = "none";
		
		document.getElementsByClassName('infoproduct')[1].readOnly = true;
		document.getElementsByClassName('infoproduct')[2].readOnly = true;
		document.getElementsByClassName('infoproduct')[3].readOnly = true;
		document.getElementsByClassName('infoproduct')[4].readOnly = true;
		document.getElementsByClassName('infoproduct')[5].readOnly = true;
		document.getElementsByClassName('infoproduct')[7].readOnly = true;
		document.getElementsByClassName('infoproduct')[8].readOnly = true;
		
		document.getElementsByClassName('infoproduct')[7].value = document.getElementsByClassName('infoproduct')[7].value.replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
		
		document.getElementsByClassName('infoproduct')[1].style.outline  = "none";
		document.getElementsByClassName('infoproduct')[2].style.outline  = "none";
		document.getElementsByClassName('infoproduct')[3].style.outline  = "none";
		document.getElementsByClassName('infoproduct')[4].style.outline  = "none";
		document.getElementsByClassName('infoproduct')[5].style.outline  = "none";
		document.getElementsByClassName('infoproduct')[7].style.outline  = "none";
		document.getElementsByClassName('infoproduct')[8].style.outline  = "none";
		
		 thumimgNo = 0;
		 thumimgName = "";
		 setthumlevel = 0;
		
		
		
	}
	
	

	
	function deleteimg(){
		
// 		console.log(attnolist[imgindex]);
// 		console.log(imgindex);
// 		console.log(imglist);
		if(imglist.length == 1){
			alert('최소 1장의 사진이 필요합니다.')
		}else{
			
			
			if(thumimgNo == attnolist[imgindex]){
				
				thumimgNo = 0;
				setthumlevel = 0;
				document.getElementById('cell').parentElement.style.border = "none";
				
			}
			
			
			deletelist.push(attnolist[imgindex]);
			imglist.splice(imgindex,1);
			attnolist.splice(imgindex,1);
			
			document.getElementById('cell').remove();
			
			if(imgindex == imglist.length){
				imgindex = imgindex-1;
				document.getElementById('infodiv').appendChild(imglist[imgindex]);
				
				document.getElementsByClassName('pandn')[1].style.display = "none";
				
			}else{
				document.getElementById('infodiv').appendChild(imglist[imgindex]);
				
				if(imgindex == imglist.length-1){
					document.getElementsByClassName('pandn')[1].style.display = "none";
				}
				
			}
			
			if(imglist.length ==1){
				document.getElementsByClassName('pandn')[0].style.display = "none";
				document.getElementsByClassName('pandn')[1].style.display = "none";
			}
		
		}
		
		
		
		
			
	}
	
	


</script>


<script>

var sel_files = [];


( /* att_zone : 이미지들이 들어갈 위치 id, btn : file tag id */
		  imageView = function imageView(att_zone, btn){

		    var attZone = document.getElementById(att_zone);
		    var btnAtt = document.getElementById(btn)
		   
		    
		    // 이미지와 체크 박스를 감싸고 있는 div 속성
		    var div_style = 'display:inline-block;position:relative;'
		                  + 'width:150px;height:120px;margin:5px;border:1px solid black;z-index:1';
		    // 미리보기 이미지 속성
		    var img_style = 'width:100%;height:100%;z-index:none';
		    // 이미지안에 표시되는 체크박스의 속성
		    var chk_style = 'width:30px;height:30px;position:absolute;font-size:24px;'
		                  + 'right:0px;bottom:0px;z-index:999;background-color:rgba(255,255,255,0.1);color:#f00';
		  
		    btnAtt.onchange = function(e){
		      var files = e.target.files;
		      var fileArr = Array.prototype.slice.call(files)
		      for(f of fileArr){
		        imageLoader(f);
		      }
		    }  
		    
		  
		    // 탐색기에서 드래그앤 드롭 사용
		    attZone.addEventListener('dragenter', function(e){
		      e.preventDefault();
		      e.stopPropagation();
		    }, false)
		    
		    attZone.addEventListener('dragover', function(e){
		      e.preventDefault();
		      e.stopPropagation();
		      
		    }, false)
		  
		    attZone.addEventListener('drop', function(e){
		      var files = {};
		      e.preventDefault();
		      e.stopPropagation();
		      var dt = e.dataTransfer;
		      files = dt.files;
		      for(f of files){
		        imageLoader(f);
		      }
		      
		    }, false)
		    

		    
		    /*첨부된 이미지들을 배열에 넣고 미리보기 */
		    imageLoader = function(file){
		      sel_files.push(file);
		      var reader = new FileReader();
		      reader.onload = function(ee){
		        let img = document.createElement('img')
		        img.setAttribute('style', img_style)
		        img.src = ee.target.result;
		        img.setAttribute('onClick','setTumb2(this)');
		        img.className = 'hidori';
		        
		    
		        attZone.appendChild(makeDiv(img, file));
		      }
		     
		     
		       
		      reader.readAsDataURL(file);
		    }
		    
		    /*첨부된 파일이 있는 경우 checkbox와 함께 attZone에 추가할 div를 만들어 반환 */
		    makeDiv = function(img, file){
		      var div = document.createElement('div')
		      div.setAttribute('style', div_style)
		      div.setAttribute('class', 'imgdivc');
		      
		      var btn = document.createElement('input')
		      btn.setAttribute('type', 'button')
		      btn.setAttribute('value', 'x')
		      btn.setAttribute('delFile', file.name);
		      btn.setAttribute('style', chk_style);
		      btn.setAttribute('class', 'inbtnc');
		      btn.onclick = function(ev){
		        var ele = ev.srcElement;	
		        var delFile = ele.getAttribute('delFile');
		        
		        
		        
		        for(var i=0 ;i<sel_files.length; i++){
		          if(delFile== sel_files[i].name){
		            sel_files.splice(i, 1);      
		          }
		        }
		        
		        dt = new DataTransfer();
		        for(f in sel_files) {
		          var file = sel_files[f];
		          dt.items.add(file);
		        }
		        btnAtt.files = dt.files;
		     
		    
		        var p = ele.parentNode;
		        attZone.removeChild(p)
		        
		       if(thumimgName == delFile){
		    	   
		  			 thumimgName = "";
		  			 setthumlevel = 0;
		  			 
		       }
		        
		        
		      }
		      
		      
		      
		      div.appendChild(img)
		      div.appendChild(btn)
	
		   
		      return div
		    }
		  }
		)('att_zone', 'btnAtt')





</script>



<script>
			//썸네일 설정 스크립트
			function setTumb1(t){
				
				if(t.parentElement.style.border != "5px dotted red" && document.getElementById('deleteimgbtn').style.display == "block"){
			
				t.parentElement.style.border = "5px dotted red";
				setthumlevel = 1;
				thumimgNo = parseInt(attnolist[imgindex]);
				for(hid of document.getElementsByClassName('hidori')){
					
					hid.style.border = "none";
					
				}
					
				}else{
					setthumlevel = 0;
					thumimgNo = 0;
					t.parentElement.style.border = "none";
				
				}
				
			}
			
			function setTumb2(t){
				
				if(t.style.border != "5px dotted red"){
					for(hid of document.getElementsByClassName('hidori')){
						
						hid.style.border = "none";
						
					}
					t.style.border = "5px dotted red";
					setthumlevel = 2;
					thumimgName = t.nextElementSibling.getAttribute('delFile');
					document.getElementById('cell').parentElement.style.border = "none";
				}else{
					setthumlevel = 0;
					thumimgName = '';
					t.style.border = "none";
				
				}
				
			}
			
			
		
		
		

	
	//수정 완료 스크립트
	function doneEdit(){
		
		
		
		var count = true;
		for(fi of document.getElementsByClassName('infoproduct')){
			
			if(fi.value.trim() == ''){
				alert('빈 값을 넣을 수 없습니다.');
				fi.focus();
				count = false;
				break;
			}
			
		}

		if(count){
		var formData = new FormData();
		
		formData.append("proNo", document.getElementsByClassName('infoproduct')[0].value.trim());
		formData.append("proName", document.getElementsByClassName('infoproduct')[1].value.trim());
		formData.append("proWriter", document.getElementsByClassName('infoproduct')[2].value.trim());
		formData.append("proMaterial", document.getElementsByClassName('infoproduct')[3].value.trim());
		formData.append("proWidth", parseInt(document.getElementsByClassName('infoproduct')[4].value.trim()));
		formData.append("proHeight", parseInt(document.getElementsByClassName('infoproduct')[5].value.trim()));
		formData.append("proPrice", parseInt(document.getElementsByClassName('infoproduct')[7].value.trim().replace(/,/g,"")));
		formData.append("proAmount", parseInt(document.getElementsByClassName('infoproduct')[8].value.trim()));
		formData.append("length", imglist.length);
		
		formData.append("setthumlevel", setthumlevel);
		switch(setthumlevel){
		
		case 1:formData.append("thumimgNo", thumimgNo); break;
			
		case 2: formData.append("thumimgName", thumimgName); break;
		
		}
		
		
		
		
		
		
	    for (attNo of deletelist) {
	        formData.append("attNos", parseInt(attNo));

	    }
	    for (sf of sel_files) {
	        formData.append("files", sf);

	    }
		
		
		
		 $.ajax({
				url:'editArts.ar',
				type:'post',
				data: formData,
				contentType:false,
				processData:false,
				success: (data) =>{
					alert(data);
					
				},
				error: data => console.log(data)
					
			});
		
	}

	}

</script>


<script>

//이미지 초기화 스크립트
	function resetimg(){
		
	while(document.getElementsByClassName('imgdivc').length != 0){
			
		for (ic of document.getElementsByClassName('inbtnc')){
			
			ic.click();
			
			
		}
	}
		
}
</script>





<script>
	     //문자 못들어가게끔 막는 스크립트
	$('.numreq').on('input', function() {
	    var sanitizedValue = this.value.replace(/[^0-9]/g, ''); 
	    this.value = sanitizedValue;
	});
	</script>
	
	
	
	
	
	<script>
	
	//url 재수정 스크립트
	  function removeURLParameters(url, parametersToRemove) {
		  var urlObject = new URL(url);
		  var params = new URLSearchParams(urlObject.search);

		  parametersToRemove.forEach(function (param) {
		    params.delete(param);
		  });

		  urlObject.search = params.toString();

		  return urlObject.href;
		}
	
	//페이징 스크립트
	function paging(data){
 		
		
  		var URLSearch = new URLSearchParams(location.search);
  		
  		var originalURL = window.location.href;
	  	var parametersToRemove = ["page"];
	  	var modifiedURL = removeURLParameters(originalURL, parametersToRemove);
	  					
	  	
 		switch(data){
 		
 		case 'first':
 			
 			if(document.getElementById('noitemdiv') == null && ${pi.currentPage != 1}){
 			if(URLSearch.size == 0){
 				location.href = modifiedURL + "?page="+${pi.startPage}; break;
 			}else if( URLSearch.size == 1 && URLSearch.get('page')){
 				location.href = modifiedURL + "?page="+${pi.startPage}; break;
 			}else{
 				location.href = modifiedURL + "&page="+${pi.startPage}; break;
 			}
 			}
 			
 			break;
 		case 'forward':
 			
 			
 			if(document.getElementById('noitemdiv') == null && ${pi.currentPage != 1}){
 			
 			if(URLSearch.size == 0){
 				location.href = modifiedURL + "?page="+${pi.currentPage-1}; break;
 			}else if( URLSearch.size == 1 && URLSearch.get('page')){
 				location.href = modifiedURL + "?page="+${pi.currentPage-1}; break;
 			}else{
 				location.href = modifiedURL + "&page="+${pi.currentPage-1}; break;
 			}
 			}
 			
 			break;
 		case 'next':
 			
 			if(document.getElementById('noitemdiv') == null && ${pi.currentPage != pi.maxPage}){
 			if(URLSearch.size == 0){
 				location.href = modifiedURL + "?page="+${pi.currentPage+1}; break;
 			}else if( URLSearch.size == 1 && URLSearch.get('page')){
 				location.href = modifiedURL + "?page="+${pi.currentPage+1}; break;
 			}else{
 				location.href = modifiedURL + "&page="+${pi.currentPage+1}; break;
 			}
 			
 			}
 			break;
 		case 'last':	
 			if(document.getElementById('noitemdiv') == null && ${pi.currentPage != pi.maxPage}){
 			if(URLSearch.size == 0){
 				location.href = modifiedURL + "?page="+${pi.maxPage}; break;
 			}else if( URLSearch.size == 1 && URLSearch.get('page')){
 				location.href = modifiedURL + "?page="+${pi.maxPage}; break;
 			}else{
 				location.href = modifiedURL + "&page="+${pi.maxPage}; break;
 			}
 			}
 			break;
 		
 		default:
 			
 			if(URLSearch.size == 0){
 				location.href = modifiedURL + "?page="+data; break;
 			}else if( URLSearch.size == 1 && URLSearch.get('page')){
 				location.href = modifiedURL + "?page="+data; break;
 			}else{
 				location.href = modifiedURL + "&page="+data; break;
 			}
 			break;
 			
 		
 		}
 		
 		
 		
 	}
	
	
	</script>
	
	
	
	


</body>
</html>