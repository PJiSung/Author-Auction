<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
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
  <title>Products</title>
  <link rel="stylesheet" href="sunwoo/css/setting.css">
  <link rel="stylesheet" href="sunwoo/css/plugin.css">
  <link rel="stylesheet" href="sunwoo/css/template.css">
  <link rel="stylesheet" href="sunwoo/css/common.css">
  <link rel="stylesheet" href="sunwoo/css/style.css">
  
  
  
	<link rel="stylesheet" href="sunwoo/rosacss/rosasetting.css">
 	<link rel="stylesheet" href="sunwoo/rosacss/rosaplugin.css">
	<link rel="stylesheet" href="sunwoo/rosacss/rosatemplate.css">
	<link rel="stylesheet" href="sunwoo/rosacss/rosacommon.css">
	<link rel="stylesheet" href="sunwoo/rosacss/rosamain.css">
	<link rel="stylesheet" href="sunwoo/rosacss/rosastyle.css">
	  
  
  
   <script src = "sunwoo/jquery/jquery-3.7.1.min.js"></script>

  
  
  <style>
  
  .ggray{
  
 box-shadow : 0 30px 30px #ddd;
  		
  
  }
  
  
  </style>
  
</head>

<body>

 	
<jsp:include page="../common/header.jsp" />



  <main class="th-layout-main ">
    <!-- [S]basic-N50 -->
    <div class="basic-N50" data-bid="cRLQaJFRwJ">
      <div class="contents-inner">
        <div class="contents-container container-md">
          <div class="textset">
            <h2 class="textset-tit">전체 상품</h2>
            <button class="contents-btn btn-filter" type="button">
              <img src="sunwoo/icons/ico_filter_black.svg" alt="모바일 필터 아이콘">
            </button>
            
                  
         <div class="contents-badge-group">
       	  <c:if test= "${keyword.keyword != null and keyword.keyword != ''}">
        	  <div class="badgeset badgeset-tag badgeset-round badgeset-line">
         	   <span class="badgeset-text" onclick = "deletecondition('keyword');" style = "cursor:pointer;">#${keyword.keyword } &nbsp; &times;</span>
         	 </div>
          </c:if>
            <c:if test= "${keyword.minPrice != 0}">
        	  <div class="badgeset badgeset-tag badgeset-round badgeset-line">
         	   <span class="badgeset-text" onclick = "deletecondition('minPrice');" style = "cursor:pointer">#최소 가격 : ${keyword.minPrice } &nbsp; &times;</span>
         	 </div>
          </c:if>
            <c:if test= "${keyword.maxPrice != 0}">
        	  <div class="badgeset badgeset-tag badgeset-round badgeset-line">
         	   <span class="badgeset-text" onclick = "deletecondition('maxPrice');" style = "cursor:pointer">#최대 가격 : ${keyword.maxPrice } &nbsp; &times;</span>
         	 </div>
       	   </c:if>
           <c:if test= "${materiallist != null}">
           	 <c:forEach items = "${materiallist}" var = "m" >
        	  <div class="badgeset badgeset-tag badgeset-round badgeset-line">
         	   <span class="badgeset-text" onclick = "deletecondition('${m}');" style = "cursor:pointer">#${m} &nbsp; &times;</span>
         	 </div>
         	 </c:forEach>
          </c:if>
           <c:if test= "${keyword.minHeight != 0}">
        	  <div class="badgeset badgeset-tag badgeset-round badgeset-line">
         	   <span class="badgeset-text" onclick = "deletecondition('minHeight');" style = "cursor:pointer">#최소 세로 : ${keyword.minHeight } &nbsp; &times;</span>
         	 </div>
       	   </c:if>
       	    <c:if test= "${keyword.maxHeight != 0}">
        	  <div class="badgeset badgeset-tag badgeset-round badgeset-line">
         	   <span class="badgeset-text" onclick = "deletecondition('maxHeight');" style = "cursor:pointer">#최대 세로 : ${keyword.maxHeight } &nbsp; &times;</span>
         	 </div>
       	   </c:if>
       	    <c:if test= "${keyword.minWidth != 0}">
        	  <div class="badgeset badgeset-tag badgeset-round badgeset-line">
         	   <span class="badgeset-text" onclick = "deletecondition('minWidth');" style = "cursor:pointer">#최소 가로 : ${keyword.minWidth } &nbsp; &times;</span>
         	 </div>
       	   </c:if>
       	    <c:if test= "${keyword.maxWidth != 0}">
        	  <div class="badgeset badgeset-tag badgeset-round badgeset-line">
         	   <span class="badgeset-text" onclick = "deletecondition('maxWidth');" style = "cursor:pointer">#최대 가로 : ${keyword.maxWidth } &nbsp; &times;</span>
         	 </div>
       	   </c:if>
        </div>
        
        
          </div>
          <div class="contents-body">
            <div class="contents-left">
              <div class="contents-filter-header">
                <strong>필터</strong>
                <button class="contents-btn btn-close">
                  <img src="sunwoo/icons/ico_close_black.svg" alt="닫기 아이콘">
                </button>
              </div>
              
        
              
              <div class="contents-filter-body">
                <div class="accordset accordset-plus">
                  <div class="accordset-item">
                    <div class="accordset-header">
                      <button class="accordset-button btn" type="button">작품명 및 작가명</button>
                    </div>
                    <div class="accordset-body">
                      <div class="accordset-content">
                        <div class="checkset" style = "flex-direction: column;">
                          <span class="checkset-text"></span>
                          <input type="text" style = "border: 1px solid #aaa; text-align:center; height: 40px;" placeholder = "작가명 또는 작품명" id = "keyword" class = "enterbtn">
                            <button style = "background-color:black; margin-top: 10%; border: none;  height: 40px; width: 40%; color: white;" id = "keybtn" onclick = "conditionfunc('keyword')">적용</button>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="accordset-item">
                    <div class="accordset-header">
                      <button class="accordset-button btn" type="button">가격</button>
                    </div>
                    <div class="accordset-body">
                      <div class="accordset-content">
                        <div class="radioset" style = "flex-direction: column;">
                          <span class="radioset-text"></span>
                          <input type="number" style = "border: 1px solid #aaa; text-align:center; height: 40px;" placeholder = "이상" id = "minPrice" class = "enterbtn">
                          <div style = "display:flex; align-items:center; justify-content:center; height: 40px; ">~</div>
                          <input type="number" style = "border: 1px solid #aaa; text-align:center; height: 40px;" placeholder = "이하" id = "maxPrice" class = "enterbtn">
                            <button style = "background-color:black; margin-top: 10%; border: none;  height: 40px; width: 40%; color: white;" onclick = "conditionfunc('keyword')">적용</button>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="accordset-item">
                    <div class="accordset-header">
                      <button class="accordset-button btn" type="button">재료</button>
                    </div>
                    <div class="accordset-body">
                      <div class="accordset-content">
                        <div class="checkset">
                          <input id="checkset-3-1" class="checkset-input input-round cccmaterial" type="checkbox" value="캔버스">
                          <label class="checkset-label" for="checkset-3-1"></label>
                          <span class="checkset-text">캔버스</span>
                        </div>
                        <div class="checkset">
                          <input id="checkset-3-2" class="checkset-input input-round cccmaterial" type="checkbox" value="종이">
                          <label class="checkset-label" for="checkset-3-2"></label>
                          <span class="checkset-text">종이</span>
                        </div>
                        <div class="checkset">
                          <input id="checkset-3-3" class="checkset-input input-round cccmaterial" type="checkbox" value="점토">
                          <label class="checkset-label" for="checkset-3-3"></label>
                          <span class="checkset-text">점토</span>
                        </div>
                        <div class="checkset">
                          <input id="checkset-3-4" class="checkset-input input-round cccmaterial" type="checkbox" value="나무">
                          <label class="checkset-label" for="checkset-3-4"></label>
                          <span class="checkset-text">나무</span>
                        </div>
                          <div class="checkset" style = "flex-direction:column;">
                           <span class="checkset-text"></span>
                          <input type="text" style = "border: 1px solid #aaa; text-align:center; height: 40px;" placeholder = "재료" id = "materialinput" class = "enterbtn">
                            <button style = "background-color:black; margin-top: 10%; border: none;  height: 40px; width: 40%; color: white;" onclick = "conditionfunc('keyword')">적용</button>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="accordset-item">
                    <div class="accordset-header">
                      <button class="accordset-button btn" type="button">크기</button>
                    </div>
                    <div class="accordset-body">
                      <div class="accordset-content">
                        <div class="checkset" style = "flex-direction: column;">
                          <span class="checkset-text"></span>
                          	<input type="number" style = "border: 1px solid #aaa; text-align:center; height: 40px;" placeholder = "최소 가로길이(cm)" class = "width enterbtn">
                          	<div style = "display:flex; align-items:center; justify-content:center; height: 40px; ">~</div>
                          <input type="number" style = "border: 1px solid #aaa; text-align:center; height: 40px;" placeholder = "최대 가로길이(cm)" class = "width enterbtn">
                          <div style = "display:flex; align-items:center; justify-content:center; height: 40px; "></div>
                          <input type="number" style = "border: 1px solid #aaa; text-align:center; height: 40px;" placeholder = "최소 세로길이(cm)" class = "height enterbtn">
                          <div style = "display:flex; align-items:center; justify-content:center; height: 40px; ">~</div>
                           <input type="number" style = "border: 1px solid #aaa; text-align:center; height: 40px;" placeholder = "최대 세로길이(cm)" class = "height enterbtn">
                          <button style = "background-color:black; margin-top: 10%; border: none;  height: 40px; width: 40%; color: white;" onclick = "conditionfunc('keyword')">적용</button>
                        </div>
                      </div>
                    </div>
                  </div>
<!--                   <div class="accordset-item"> -->
<!--                     <div class="accordset-header"> -->
<!--                       <button class="accordset-button btn" type="button">제작년도</button> -->
<!--                     </div> -->
<!--                     <div class="accordset-body"> -->
<!--                       <div class="accordset-content"> -->
<!--                         <div class="checkset"> -->
<!--                           <input id="checkset-5-1" class="checkset-input input-round" type="checkbox" value="" checked=""> -->
<!--                           <label class="checkset-label" for="checkset-5-1"></label> -->
<!--                           <span class="checkset-text">전체</span> -->
<!--                         </div> -->
<!--                         <div class="checkset"> -->
<!--                           <input id="checkset-5-2" class="checkset-input input-round" type="checkbox" value=""> -->
<!--                           <label class="checkset-label" for="checkset-5-2"></label> -->
<!--                           <span class="checkset-text">기초</span> -->
<!--                         </div> -->
<!--                         <div class="checkset"> -->
<!--                           <input id="checkset-5-3" class="checkset-input input-round" type="checkbox" value=""> -->
<!--                           <label class="checkset-label" for="checkset-5-3"></label> -->
<!--                           <span class="checkset-text">케어</span> -->
<!--                         </div> -->
<!--                       </div> -->
<!--                     </div> -->
<!--                   </div> -->
<!--                   <div class="accordset-item active"> -->
<!--                     <div class="accordset-header"> -->
<!--                       <button class="accordset-button btn" type="button">혜택</button> -->
<!--                     </div> -->
<!--                     <div class="accordset-body"> -->
<!--                       <div class="accordset-content"> -->
<!--                         <div class="checkset"> -->
<!--                           <input id="checkset-6-1" class="checkset-input input-round" type="checkbox" value="" checked=""> -->
<!--                           <label class="checkset-label" for="checkset-6-1"></label> -->
<!--                           <span class="checkset-text">무료배송</span> -->
<!--                         </div> -->
<!--                       </div> -->
<!--                     </div> -->
<!--                   </div> -->
                </div>
              </div>
              <div style = "display:flex; align-items:center; justify-content:center;">
             
               </div>
              <div class="contents-filter-footer">
                <span>필터초기화</span>
                <button class="contents-btn btn-refresh">
                  <img src="sunwoo/icons/ico_refresh_black.svg" alt="닫기 아이콘">
                </button>
              </div>
            </div>
            <div class="contents-right">
              <div class="contents-sort">
                <p class="contents-sort-total"> 총 <span>${plistsize}</span>개의 상품이 있습니다. </p>
                <div class="contents-sort-sel">
                  <div class="tabset tabset-text">
                    <ul class="tabset-list">
                      <li class="tabset-item">
                        <a class="tabset-link">
                          <span onclick = "priceorder('high')" style = "cursor:pointer;" id = "ordebyhighprice">높은가격순</span>
                        </a>
                      </li>
                      <li class="tabset-item">
                        <a class="tabset-link">
                          <span onclick = "priceorder('low')" style = "cursor:pointer;" id = "orderbylowprice">낮은가격순</span>
                        </a>
                      </li>
                    </ul>
                  </div>
                  <div class="selectset selectset-round selectset-sm">
                    <button class="selectset-toggle btn" type="button" id = "12btn">
                      <span id = "viewartsview">12개씩 보기</span>
                    </button>
                    <ul class="selectset-list">
                      <li class="selectset-item">
                        <button class="selectset-link btn" type="button" data-value="12개씩 보기" onclick = "viewarts(12)">
                          <span>12개씩 보기</span>
                        </button>
                      </li>
                      <li class="selectset-item">
                        <button class="selectset-link btn" type="button" data-value="30개씩 보기" onclick = "viewarts(30)">
                          <span>30개씩 보기</span>
                        </button>
                      </li>
                    </ul>
                  </div>
                </div>
              </div>
              
              
              
              
              
              <div class="contents-list">
              <c:if test="${plistsize == 0 }">
              	<div style = "display:flex; align-items:center; justify-content:center;  margin: 0 auto; height: 50vh;" id = "noitemdiv">
              	<h1>검색 결과가 없습니다.</h1>
              	</div>
              </c:if>
              <c:forEach items = "${plist}" var = "p">
              	<c:forEach items = "${alist}" var = "a">
              		<c:if test="${a.attBno eq p.proNo}">
              			<c:if test = "${a.attFno eq 1}">
			                <a href="artsDetail.ar?proNo=${p.proNo}" class="cardset cardset-shopping ggray">
			                  <figure class="cardset-figure">
			                    <img class="cardset-img imglist" src="${a.attRename}" alt="카드 이미지" >
			                  </figure>
			                  <div class="cardset-body">
			                    <span class="cardset-name">${p.proName}</span>
			                    <h2 class="cardset-tit"> ${p.proWriter} </h2>
			                    <p class="cardset-desc"><span>${p.proPrice}</span><small>원</small>
			                    </p>
			                  </div>
			                </a>
               		   </c:if>
                    </c:if>
               </c:forEach>
              </c:forEach>
<!--                 <a href="javascript:void(0);" class="cardset cardset-shopping"> -->
<!--                   <figure class="cardset-figure"> -->
<!--                     <img class="cardset-img" src="images/img_basic_N42_2.png" alt="카드 이미지"> -->
<!--                   </figure> -->
<!--                   <div class="cardset-body"> -->
<!--                     <span class="cardset-name">템하피부</span> -->
<!--                     <h2 class="cardset-tit"> 시카블라스트 리페어 크림 </h2> -->
<!--                     <p class="cardset-desc">12,000<small>원</small> -->
<!--                     </p> -->
<!--                   </div> -->
<!--                 </a> -->
<!--                 <a href="javascript:void(0);" class="cardset cardset-shopping"> -->
<!--                   <figure class="cardset-figure"> -->
<!--                     <img class="cardset-img" src="images/img_basic_N42_3.png" alt="카드 이미지"> -->
<!--                   </figure> -->
<!--                   <div class="cardset-body"> -->
<!--                     <span class="cardset-name">템하피부</span> -->
<!--                     <h2 class="cardset-tit"> 딥 클린징 포밍 크림 </h2> -->
<!--                     <p class="cardset-desc">20,000<small>원</small> -->
<!--                     </p> -->
<!--                   </div> -->
<!--                 </a> -->
<!--                 <a href="javascript:void(0);" class="cardset cardset-shopping"> -->
<!--                   <figure class="cardset-figure"> -->
<!--                     <img class="cardset-img" src="images/img_basic_N42_1.png" alt="카드 이미지"> -->
<!--                   </figure> -->
<!--                   <div class="cardset-body"> -->
<!--                     <span class="cardset-name">템하피부</span> -->
<!--                     <h2 class="cardset-tit"> 민감 피부 마스크 시트(피부진정) </h2> -->
<!--                     <p class="cardset-desc">32,000<small>원</small> -->
<!--                     </p> -->
<!--                   </div> -->
<!--                 </a> -->
<!--                 <a href="javascript:void(0);" class="cardset cardset-shopping"> -->
<!--                   <figure class="cardset-figure"> -->
<!--                     <img class="cardset-img" src="images/img_basic_N42_2.png" alt="카드 이미지"> -->
<!--                   </figure> -->
<!--                   <div class="cardset-body"> -->
<!--                     <span class="cardset-name">템하피부</span> -->
<!--                     <h2 class="cardset-tit"> 시카블라스트 리페어 크림 </h2> -->
<!--                     <p class="cardset-desc">12,000<small>원</small> -->
<!--                     </p> -->
<!--                   </div> -->
<!--                 </a> -->
<!--                 <a href="javascript:void(0);" class="cardset cardset-shopping"> -->
<!--                   <figure class="cardset-figure"> -->
<!--                     <img class="cardset-img" src="images/img_basic_N42_3.png" alt="카드 이미지"> -->
<!--                   </figure> -->
<!--                   <div class="cardset-body"> -->
<!--                     <span class="cardset-name">템하피부</span> -->
<!--                     <h2 class="cardset-tit"> 딥 클린징 포밍 크림 </h2> -->
<!--                     <p class="cardset-desc">20,000<small>원</small> -->
<!--                     </p> -->
<!--                   </div> -->
<!--                 </a> -->
<!--                 <a href="javascript:void(0);" class="cardset cardset-shopping"> -->
<!--                   <figure class="cardset-figure"> -->
<!--                     <img class="cardset-img" src="images/img_basic_N42_1.png" alt="카드 이미지"> -->
<!--                   </figure> -->
<!--                   <div class="cardset-body"> -->
<!--                     <span class="cardset-name">템하피부</span> -->
<!--                     <h2 class="cardset-tit"> 민감 피부 마스크 시트(피부진정) </h2> -->
<!--                     <p class="cardset-desc">32,000<small>원</small> -->
<!--                     </p> -->
<!--                   </div> -->
<!--                 </a> -->
<!--                 <a href="javascript:void(0);" class="cardset cardset-shopping"> -->
<!--                   <figure class="cardset-figure"> -->
<!--                     <img class="cardset-img" src="images/img_basic_N42_2.png" alt="카드 이미지"> -->
<!--                   </figure> -->
<!--                   <div class="cardset-body"> -->
<!--                     <span class="cardset-name">템하피부</span> -->
<!--                     <h2 class="cardset-tit"> 시카블라스트 리페어 크림 </h2> -->
<!--                     <p class="cardset-desc">12,000<small>원</small> -->
<!--                     </p> -->
<!--                   </div> -->
<!--                 </a> -->
<!--                 <a href="javascript:void(0);" class="cardset cardset-shopping"> -->
<!--                   <figure class="cardset-figure"> -->
<!--                     <img class="cardset-img" src="images/img_basic_N42_3.png" alt="카드 이미지"> -->
<!--                   </figure> -->
<!--                   <div class="cardset-body"> -->
<!--                     <span class="cardset-name">템하피부</span> -->
<!--                     <h2 class="cardset-tit"> 딥 클린징 포밍 크림 </h2> -->
<!--                     <p class="cardset-desc">20,000<small>원</small> -->
<!--                     </p> -->
<!--                   </div> -->
<!--                 </a> -->
              </div>
              
              
              <nav class="pagiset pagiset-line">
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
            </div>
          </div>
        </div>
      </div>
      <div class="contents-dim"></div>
    </div>
    <!-- [E]basic-N50 -->
  </main>

  
<!--   <script src="sunwoo/js/setting.js"></script> -->
<!--   <script src="sunwoo/js/plugin.js"></script> -->
<!--   <script src="sunwoo/js/template.js"></script> -->
<!--   <script src="sunwoo/js/common.js"></script> -->
<!--   <script src="sunwoo/js/script.js"></script> -->
  
  <jsp:include page="../common/footer.jsp" />
  
 <script>
 	//가격 천단위 콤마 붙이기 스크립트
 	var prices = document.getElementsByClassName('cardset-desc');
 	
 	for(p of prices){
 			
			p.children[0].innerText = p.children[0].innerText.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ","); 	
 	}
 	
 </script>
 
 <script>
 	//검색 가격,가로세로 숫자만 들어가도록하는 스크립트
 	
		$("#minPrice").keyup(function(e) {
			var content = $(this).val();
			var regex = /[^0-9]/g;	
			$(this).val(content.replace(regex, ""));
		});
		
 	
		$(".width").keyup(function(e) {
			var content = $(this).val();
			var regex = /[^0-9]/g;	
			$(this).val(content.replace(regex, ""));
		});
		
		
		$(".height").keyup(function(e) {
			var content = $(this).val();
			var regex = /[^0-9]/g;	
			$(this).val(content.replace(regex, ""));
		});
		
 	
 	
		$("#maxPrice").keyup(function(e) {
			var content = $(this).val();
			var regex = /[^0-9]/g;	
			$(this).val(content.replace(regex, ""));
		});
		
 
 </script>
  
  
  <script>
  	function conditionfunc(kind){
  		
  			var keyword = document.getElementById('keyword').value.trim();
  			var maxPrice = document.getElementById('maxPrice').value.trim() == '' ? 0 : document.getElementById('maxPrice').value.trim();
  			var minPrice = document.getElementById('minPrice').value.trim() == '' ? 0 : document.getElementById('minPrice').value.trim();
  			var minWidth = document.getElementsByClassName('width')[0].value.trim() == '' ? 0 : document.getElementsByClassName('width')[0].value.trim()
  			var maxWidth = document.getElementsByClassName('width')[1].value.trim() == '' ? 0 : document.getElementsByClassName('width')[1].value.trim()
  			var minHeight = document.getElementsByClassName('height')[0].value.trim() == '' ? 0 : document.getElementsByClassName('height')[0].value.trim()
  			var maxHeight = document.getElementsByClassName('height')[1].value.trim() == '' ? 0 : document.getElementsByClassName('height')[1].value.trim()
  			var mclist = [];
  			console.log(minHeight);
  			for(mc of document.getElementsByClassName('cccmaterial')){
  				if(mc.checked == true){
  					mclist.push(mc.value);
  				}
  			}
  				if(document.getElementById('materialinput').value.trim() != ''){
  				mclist.push(document.getElementById('materialinput').value.trim());
  				}
  				
  				if(mclist.length !=0){
  					location.href = "artslist.ar?keyword="+keyword+"&minPrice="+minPrice+"&maxPrice="+maxPrice+"&materiallist="+mclist+"&minHeight="+minHeight+"&maxHeight="+maxHeight+"&minWidth="+minWidth+"&maxWidth="+maxWidth;
  				}else{
  					location.href = "artslist.ar?keyword="+keyword+"&minPrice="+minPrice+"&maxPrice="+maxPrice+"&minHeight="+minHeight+"&maxHeight="+maxHeight+"&minWidth="+minWidth+"&maxWidth="+maxWidth;
  				}
  	}  	
  
  
  </script>
  
  
  <script>
  
  		//검색 조건 삭제 스크립트
  	function deletecondition(condition){
  		var URLSearch = new URLSearchParams(location.search);
  	
  		var keyword = URLSearch.get('keyword');
  		var minPrice = URLSearch.get('minPrice');
  		var maxPrice = URLSearch.get('maxPrice');
  		if(URLSearch.get('materiallist') != null){
  			var materiallist=	URLSearch.get('materiallist').split(',');
  		}
  		var minHeight= URLSearch.get('minHeight');
  		var maxHeight=  URLSearch.get('maxHeight');
  		var minWidth=  URLSearch.get('minWidth');
  		var maxWidth=  URLSearch.get('maxWidth');
  		
  		if(materiallist != null){
  		var newmateriallist =  materiallist.filter(function (item) {
  		  return item != condition;
  		});
  		}
  		
  		
  		if(condition != 'keyword' && condition != 'minPrice' && condition != 'maxPrice' &&condition != 'minHeight' &&condition != 'maxHeight' &&condition != 'minWidth' &&condition != 'maxWidth'){
  			
  			if(newmateriallist.length != 0){
  			location.href = "artslist.ar?keyword="+keyword+"&minPrice="+minPrice+"&maxPrice="+maxPrice+"&materiallist="+newmateriallist+"&minHeight="+minHeight+"&maxHeight="+maxHeight+"&minWidth="+minWidth+"&maxWidth="+maxWidth;
  			}else{
  				location.href = "artslist.ar?keyword="+keyword+"&minPrice="+minPrice+"&maxPrice="+maxPrice+"&minHeight="+minHeight+"&maxHeight="+maxHeight+"&minWidth="+minWidth+"&maxWidth="+maxWidth;
  			}
  		}
  		
  		
  		switch(condition){
  		
  			
  			case 'keyword':
  				if(materiallist !=null){
  				location.href = "artslist.ar?keyword=&minPrice="+minPrice+"&maxPrice="+maxPrice+"&materiallist="+materiallist+"&minHeight="+minHeight+"&maxHeight="+maxHeight+"&minWidth="+minWidth+"&maxWidth="+maxWidth;
  				}else{
  					location.href = "artslist.ar?keyword=&minPrice="+minPrice+"&maxPrice="+maxPrice+"&minHeight="+minHeight+"&maxHeight="+maxHeight+"&minWidth="+minWidth+"&maxWidth="+maxWidth;
  				}
  			break;
  			
  			
  			
  			case 'minPrice':
  				if(materiallist !=null){
  				location.href = "artslist.ar?keyword="+keyword+"&minPrice=0&maxPrice="+maxPrice+"&materiallist="+materiallist+"&minHeight="+minHeight+"&maxHeight="+maxHeight+"&minWidth="+minWidth+"&maxWidth="+maxWidth;
  				}else{
  					location.href = "artslist.ar?keyword="+keyword+"&minPrice=0&maxPrice="+maxPrice+"&minHeight="+minHeight+"&maxHeight="+maxHeight+"&minWidth="+minWidth+"&maxWidth="+maxWidth;
  				}
  			break;
  			
  			
  			
  			
  			case 'maxPrice':
  				if(materiallist !=null){
  				location.href = "artslist.ar?keyword="+keyword+"&minPrice="+minPrice+"&maxPrice=0&materiallist="+materiallist+"&minHeight="+minHeight+"&maxHeight="+maxHeight+"&minWidth="+minWidth+"&maxWidth="+maxWidth;
  				}else{
  					location.href = "artslist.ar?keyword="+keyword+"&minPrice="+minPrice+"&maxPrice=0&minHeight="+minHeight+"&maxHeight="+maxHeight+"&minWidth="+minWidth+"&maxWidth="+maxWidth;
  				}
  			break;
  			
  			
  			
  			case 'minHeight':
  				if(materiallist !=null){
  				location.href = "artslist.ar?keyword="+keyword+"&minPrice="+minPrice+"&maxPrice="+maxPrice+"&materiallist="+materiallist+"&minHeight=0&maxHeight="+maxHeight+"&minWidth="+minWidth+"&maxWidth="+maxWidth;
  				}else{
  					location.href = "artslist.ar?keyword="+keyword+"&minPrice="+minPrice+"&maxPrice="+maxPrice+"&minHeight=0&maxHeight="+maxHeight+"&minWidth="+minWidth+"&maxWidth="+maxWidth;
  				}
  			break;
  			
  			case 'maxHeight':
  				if(materiallist !=null){
  				location.href = "artslist.ar?keyword="+keyword+"&minPrice="+minPrice+"&maxPrice="+maxPrice+"&materiallist="+materiallist+"&minHeight="+minHeight+"&maxHeight=0&minWidth="+minWidth+"&maxWidth="+maxWidth;
  				}else{
  					location.href = "artslist.ar?keyword="+keyword+"&minPrice="+minPrice+"&maxPrice="+maxPrice+"&minHeight=+"+minHeight+"&maxHeight=0&minWidth="+minWidth+"&maxWidth="+maxWidth;
  				}
  			break;
  			
  			case 'minWidth':
  				if(materiallist !=null){
  				location.href = "artslist.ar?keyword="+keyword+"&minPrice="+minPrice+"&maxPrice="+maxPrice+"&materiallist="+materiallist+"&minHeight="+minHeight+"&maxHeight="+maxHeight+"&minWidth=0&maxWidth="+maxWidth;
  				}else{
  					location.href = "artslist.ar?keyword="+keyword+"&minPrice="+minPrice+"&maxPrice="+maxPrice+"&minHeight=+"+minHeight+"&maxHeight="+maxHeight+"&minWidth=0&maxWidth="+maxWidth;
  				}
  			break;
  			
  			
  			case 'maxWidth':
  				if(materiallist !=null){
  				location.href = "artslist.ar?keyword="+keyword+"&minPrice="+minPrice+"&maxPrice="+maxPrice+"&materiallist="+materiallist+"&minHeight="+minHeight+"&maxHeight="+maxHeight+"&minWidth="+minWidth+"&maxWidth=0";
  				}else{
  					location.href = "artslist.ar?keyword="+keyword+"&minPrice="+minPrice+"&maxPrice="+maxPrice+"&minHeight=+"+minHeight+"&maxHeight="+maxHeight+"&minWidth="+minWidth+"&maxWidth=0";
  				}
  			break;
  			
  		 
  		}

  		 
  	}
  		
  
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
  
  
  		
  		
  
  	function priceorder(condition){
  		
  		var url = window.location.href;
		
  		var URLSearch = new URLSearchParams(location.search);
  		
  		
  		if(URLSearch.size == 0){
			  			
  			switch(condition){
  			
  			case 'high' : location.href = url + "?order=high"; break;
  			case 'low' : location.href = url + "?order=low"; break;
  			}
  			
  		}
  		else if(URLSearch.get('order') == null){
  			
  			switch(condition){
  			case 'high' : location.href = url+ "&order=high"; break;
  			case 'low' : location.href = url+ "&order=low"; break;
  			}
  			
  		}else{
  			
  			switch(URLSearch.get('order')){
  			
  			case 'high': 
  				
  				if(condition == 'low'){
  				var originalURL = window.location.href;
  		  		var parametersToRemove = ["order"];
  		  		var modifiedURL = removeURLParameters(originalURL, parametersToRemove);
  		  		
  		  		if(URLSearch.size == 1){
  				location.href = modifiedURL+"?order=low";
  				break;
  				}else{
  					location.href = modifiedURL+"&order=low"; break;
  				}
  				
  				
  				} break;		
  				
  				
  			case 'low' :
  				
  				if(condition == 'high'){
  	  				var originalURL = window.location.href;
  	  		  		var parametersToRemove = ["order"];
  	  		  		var modifiedURL = removeURLParameters(originalURL, parametersToRemove);
  	  				
  	  		  		if(URLSearch.size == 1){
  	  		  		location.href = modifiedURL+"?order=high"; break;
  	  		  		}else{
  	  		  		location.href = modifiedURL+"&order=high"; break;
  	  		  		}
  	  				} break;		
  			
  			}
  			
  		}
  		
  	}
  	
  
  </script>
  
  <script>
  	
  		if(${order == "high"}){
  			
  			document.getElementById('ordebyhighprice').style.color = 'black';
  		}
  	
  		if(${order == "low"}){
  			
  			document.getElementById('orderbylowprice').style.color = 'black';
  		}
  </script>
  
  
  <script>
  
  function removeURLParameters(url, parametersToRemove) {
		  var urlObject = new URL(url);
		  var params = new URLSearchParams(urlObject.search);

		  parametersToRemove.forEach(function (param) {
		    params.delete(param);
		  });

		  urlObject.search = params.toString();

		  return urlObject.href;
		}
  
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
  
  
  <script>
  
  
  function removeURLParameters(url, parametersToRemove) {
	  var urlObject = new URL(url);
	  var params = new URLSearchParams(urlObject.search);

	  parametersToRemove.forEach(function (param) {
	    params.delete(param);
	  });

	  urlObject.search = params.toString();

	  return urlObject.href;
	}
  
  
  
  
  	function viewarts(data){
  	
  		var URLSearch = new URLSearchParams(location.search);
  		
  		var originalURL = window.location.href;
  		var parametersToRemove = ["viewarts"];
	  	var modifiedURL = removeURLParameters(originalURL, parametersToRemove);
  		
	
  		switch(data){
  		
  		case 12:  
  			
  			if(URLSearch.size == 0){
 				location.href = modifiedURL + "?viewarts=12"; break;
 			}else if( URLSearch.size == 1 && URLSearch.get('viewarts')){
 				location.href = modifiedURL + "?viewarts=12"; break;
 			}else{
 				location.href = modifiedURL + "&viewarts=12"; break;
 			}
 			break;
  		
  		
  		
  		case 30: 
  			
  			if(URLSearch.size == 0){
 				location.href = modifiedURL + "?viewarts=30"; break;
 			}else if( URLSearch.size == 1 && URLSearch.get('viewarts')){
 				location.href = modifiedURL + "?viewarts=30"; break;
 			}else{
 				location.href = modifiedURL + "&viewarts=30"; break;
 			}
  			
  			
  			
  			
  			
  			
  			
  			break;
  		}
  	}
  
  
  </script>
  
  <script>
  
var URLSearch = new URLSearchParams(location.search);
  		
	
  		
  			
 			if(URLSearch.get('viewarts') == 12){
 				document.getElementById('viewartsview').innerText = "12개씩 보기";
 			}
 			else if(URLSearch.get('viewarts') == 30){
 				
 				document.getElementById('viewartsview').innerText = "30개씩 보기"
 			}
  
  
  
  </script>
  
  
  <script>
  	//엔터만 눌러도 적용되게끔
  	
  	
    $(".enterbtn").keyup(function(event) {
        if (event.which === 13) {
        	conditionfunc('keyword');
        }
    });
  
  
  
  </script>
  
  
  


</body>
</html>