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
#register:hover{
   background-color: white; /* Initial background color */
/*  transition: background-color 0.5s ease; /* Transition property for smooth color change */ */
	
}


</style>
</head>
<body>




	<jsp:include page="../common/header.jsp" />

	<main>
	<form action = "insertArts.ar" enctype="multipart/form-data" method="post" id = "insertForm">
		<div style="display: flex;">
			<div style="width: 10%; background-color: #444; text-align: center;">
				<h1>관리자 페이지</h1>
				<ul>
					<li style="background-color: white;">미술품 조회
					<li>
					<li>미술품 추가
					<li>
					<li>하
					<li>
				</ul>

			</div>
			<div
				style="height: 180vh; width: 90%; display: flex; align-items: center; justify-content: center;">


				<div style="width: 70%; height: 95%;">
					<div style="height: 5%; display: flex; align-items: center;">
						<h1>미술품 수정</h1>
					</div>
					
					<div style = "border-top:1px solid black; border-bottom:1px solid black; height: 80%;">
						<div style = "display:flex; align-items:center; width: 100%; height: 10%;">
							<div style = "display:flex; align-items:center; justify-content:center; width: 20%;"><h3>작품명</h3></div>
							<div style = "display:flex; align-items:center; justify-content:center; width: 35%; height: 100%;"><input type = "text"  style = "width: 100%; text-align:center; height: 25%;" class = "forminfo" name = "작품명"></div>
						</div>		
						<div style = " display:flex; align-items:center; width: 100%; height: 10%;">
							<div style = "display:flex; align-items:center; justify-content:center; width: 20%;"><h3>작가명</h3></div>
							<div style = "display:flex; align-items:center; justify-content:center; width: 35%; height: 100%;"><input type = "text"  style = "width: 100%; text-align:center; height: 25%;" class = "forminfo" name = "작가명"></div>
						</div>	
						<div style = "display:flex; align-items:center; width: 100%; height: 10%;">
							<div style = "display:flex; align-items:center; justify-content:center; width: 20%;"><h3>재료</h3></div>
							<div style = "display:flex; align-items:center; justify-content:center; width: 35%; height: 100%;"><input type = "text" style = "width: 100%; text-align:center; height: 25%;" class = "forminfo" name = "재료"></div>
						</div>	
						<div style = " display:flex; align-items:center; width: 100%; height: 10%;">
							<div style = "display:flex; align-items:center; justify-content:center; width: 20%;"><h3>가로(cm)</h3></div>
							<div style = "display:flex; align-items:center; justify-content:center; width: 35%; height: 100%;"><input type = "text"  style = "width: 100%; text-align:center; height: 25%;" class = "numreq forminfo" name = "가로"></div>
						</div>	
						<div style = "display:flex; align-items:center; width: 100%; height: 10%;">
							<div style = "display:flex; align-items:center; justify-content:center; width: 20%;"><h3>세로(cm)</h3></div>
							<div style = "display:flex; align-items:center; justify-content:center; width: 35%; height: 100%;"><input type = "text" style = "width: 100%; text-align:center; height: 25%;" class = "numreq forminfo" ></div>
						</div>	
						<div style = " display:flex; align-items:center; width: 100%; height: 10%;">
							<div style = "display:flex; align-items:center; justify-content:center; width: 20%;"><h3>가격</h3></div>
							<div style = "display:flex; align-items:center; justify-content:center; width: 35%; height: 100%;"><input type = "text" style = "width: 100%; text-align:center; height: 25%;" class = "numreq forminfo"></div>
						</div>	
						<div style = " display:flex; align-items:center; width: 100%; height: 10%;">
							<div style = "display:flex; align-items:center; justify-content:center; width: 20%;"><h3>재고</h3></div>
							<div style = "display:flex; align-items:center; justify-content:center; width: 35%; height: 100%;"><input type = "text"  style = "width: 100%; text-align:center; height: 25%;" class = "numreq forminfo"></div>
						</div>			
								<div style = " display:flex; align-items:center; width: 100%; height: 5%;">		
							<div style = "display:flex; align-items:center; justify-content:center; width: 20%;"><h3>작품사진</h3></div>
								</div>
						<div id='image_preview' style = "width: 100%;" >
							
							<input type='file' id='btnAtt' name = "files" required accept="image/*" multiple='multiple'>
							<div id='att_zone' 
							     data-placeholder='파일을 첨부 하려면 파일 선택 버튼을 클릭하거나 파일을 드래그앤드롭 하세요.
							      파일의 순서는 순차적으로 적용됩니다.'></div>
							      <label for="btnAtt" style = "width: 100%;">
							<div class="btn-upload" style = "width: 20%; height: 20%; margin: 0 auto; margin-top: 2.5%;">파일 업로드하기</div>
							</label>
						</div>		
							<h1>${product.proNo }</h1>
							<c:forEach items="${alist}" var = "a">
								<img class="cardset-img" src="/sunwoo/proimages/${a.attRename}" style="width: 90%; height: 90%;" alt="카드 이미지">
							</c:forEach>
				</div>
						<div style = " height: 10%; display:flex; align-items:center; justify-content:center;">
							<button type = "button" style = "border: none; background-color:black; color: white; width: 20%; height: 25%; text-align:center; margin-right: 1%;" id ="register">등록</button>
							<button type = "reset" onclick = "resetimg()" style = "border: none; background-color:#eee; color: black; width: 20%; height: 25%; text-align:center; margin-left: 1%;">초기화</button>
						</div>
			</div>
		
		</div>





	</form>


	</main>



	<jsp:include page="../common/footer.jsp" />
	<script src="sunwoo/jquery/jquery-3.7.1.min.js"></script>
	
	
	
	
	
	<script>
// 	$('.numreq').keyup(function(){
		
// 		if(isNaN(this.value) || this.value.trim() == ""){
// 			this.value = "";
// 		}
// 	});
	
	$('.numreq').on('input', function() {
	    var sanitizedValue = this.value.replace(/[^0-9]/g, ''); 
	    this.value = sanitizedValue;
	});
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
			      }
			      
			      
			      div.appendChild(img)
			      div.appendChild(btn)
			      return div
			    }
			  }
			)('att_zone', 'btnAtt')

	
	
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
	
	document.getElementById('register').addEventListener('click', ()=>{
		var count = true;
		for(fi of document.getElementsByClassName('forminfo')){
			
			if(fi.value.trim() == ''){
				alert('전부 입력하세요.');
				fi.focus();
				count = false;
				break;
			}
			
		}
		if( count == true && sel_files.length == 0){
			alert('사진 파일을 업로드하세요');
			count = false;
		}
		if(count){
		var formData = new FormData();
		
		formData.append("proName", document.getElementsByClassName('forminfo')[0].value.trim());
		formData.append("proWriter", document.getElementsByClassName('forminfo')[1].value.trim());
		formData.append("proMaterial", document.getElementsByClassName('forminfo')[2].value.trim());
		formData.append("proWidth", document.getElementsByClassName('forminfo')[3].value.trim());
		formData.append("proHeight", document.getElementsByClassName('forminfo')[4].value.trim());
		formData.append("proPrice", document.getElementsByClassName('forminfo')[5].value.trim());
		formData.append("proAmount", document.getElementsByClassName('forminfo')[6].value.trim());
	
	    for (sf of sel_files) {
	        formData.append("files", sf);

	    }
	    
	    $.ajax({
			url:'insertArts.ar',
			type:'post',
			data: formData,
			contentType:false,
			processData:false,
			success: (data) =>{
				alert(data);
				for(ff of document.getElementsByClassName('forminfo')){
					ff.value = "";
				}
				resetimg();
				
			},
			error: data => console.log(data)
				
		})
		
		}
		
		
	});
	
	
	
	</script>
	
	
	
	
	
	
	
	
</body>
</html>