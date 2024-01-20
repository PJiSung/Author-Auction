<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="imagetoolbar" content="no">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="format-detection" content="telephone=no">
<link rel="shortcut icon" type="image⁄x-icon" href="main/icons/logoImage.png">
<link rel="stylesheet" href="rs/myOrderdetail/css/setting.css">
<link rel="stylesheet" href="rs/myOrderdetail/css/template.css">
<link rel="stylesheet" href="rs/myOrderdetail/css/style.css">
<title>Insert title here</title>

<style type="text/css">

.productInfo, .paymentInfo, .deliveryInfo, .userInfo{
	width: 100%;
}

.productInfo td, .deliveryInfo td, .userInfo td, .paymentInfo td{
	padding: 3px;
}

.productInfo .tdA{
	width: 10%;
}

.productInfo .tdB{
	width: 30%;
}

.productInfo .tdC{
	width: 10%;
}

.productInfo .tdD{
	width: 30%;
}

.productInfo .tdE{
	width: 20%;
}

.proPicDiv{
	margin: 0 auto;
	width: 110px;
	height: 110px;
}

.productInfo .tdE img{
	width: 100%; 
	height: 100%;
	overflow: hidden;
}

.productInfo{
	border: 0.5px solid #e5e5e5;
	border-radius: 40%;
	padding: 5px;
}


.userInfo input, .deliveryInfo input{
	width: 95%; 
}

.userInfo .tdA, .deliveryInfo .tdA{
	width: 15%;
}

.userInfo .tdB, .deliveryInfo .tdB{
	width: 85%;
}


.paymentInfo .tdA{
	width: 15%;
}

.paymentInfo .tdB{
	width: 20%;
}

.paymentInfo .tdC{
	width: 15%;
}

.paymentInfo .tdD{
	width: 20%;
}

.paymentInfo .tdE{
	width: 30%;
}

.orDetailTitle {
    font-size: 3.5rem;
    text-align: center;
    margin-top:50px; 
    margin-bottom:30px; 
}

.inputset-tit{
	text-align: center;
}

.orderDetailButton{
	text-align: center;
	margin-top: 80px; 
}

.orderDetailButton .btnset-lg, .btnset btnset-lg disabled{
	width: 150px;
	height: 30px;
}

.finalPrice{
	text-align: center;
	font-size: 2rem;
}
</style>
</head>
<body>
  <jsp:include page="../common/header.jsp"/>
  <main class="th-layout-main ">
    <div class="myOrderDetail-a" data-bid="QHlQFySZSW" id="">
      <div class="contents-inner">
        <div class="contents-container container-md">
          <div class="textset">
            <h2 class="orDetailTitle">주문 정보</h2>
          </div>
          <div class="contents-form">
            <div class="contents-form-top">
              <div class="inputset inputset-lg inputset-label">
                <table class="userInfo">
            		<tr>
            			<td class="tdA"><h6 class="inputset-tit"> 주문번호 </h6></td>
            			<td class="tdB"><input type="text" class="inputset-input form-control" value="${ o.ORD_NO }" readonly="readonly"></td>
            		</tr>
            		<tr>
            			<td><h6 class="inputset-tit"> 주문일자 </h6></td>
            			<td><input type="text" class="inputset-input form-control" value="${ fn:split(o.ORD_DATE, '.')[0] }" readonly="readonly"></td>
            		</tr>
            		<tr>
            			<td><h6 class="inputset-tit"> 주문자명 </h6></td>
            			<td><input type="text" class="inputset-input form-control" value="${ o.MEM_NAME }" readonly="readonly"></td>
            		</tr>
            		<tr>
            			<td><h6 class="inputset-tit"> 연락처 </h6></td>
            			<td><input type="text" class="inputset-input form-control" value="${ o.MEM_PHONE }" readonly="readonly"></td>
            		</tr>
            		<tr>
            			<td><h6 class="inputset-tit"> 주문상태 </h6></td>
            			<td><input type="text" class="inputset-input form-control" value="${ o.ORD_STATUS }" readonly="readonly"></td>
            		</tr>
            	</table>
              </div>
            </div>
          </div>
        </div>
        <div class="contents-container container-md">
          <div class="textset">
            <h2 class="orDetailTitle">상품 정보</h2>
          </div>
          <div class="contents-form">
            <div class="contents-form-top">
            	<c:forEach items="${ list }" var="p">
	              <div class="inputset inputset-lg inputset-label">
	              	<table class="productInfo">
	              		<tr>
	              			<td class="tdA">
	              				<h6 class="inputset-tit">작품명</h6>
	              			</td>
	              			<td class="tdB">
	              				<input type="text" class="inputset-input form-control" value="${ p.PRO_NAME }" readonly="readonly">
	              			</td>
	              			<td class="tdC">
	              				<h6 class="inputset-tit">가격</h6>
	              			</td>
	              			<td class="tdD">
	              				<input type="text" class="inputset-input form-control price" value="${ p.PRO_PRICE }" readonly="readonly">
	              			</td>
	              			<td class="tdE" rowspan="2">
	              				<div class="proPicDiv">
	              					<c:forEach items="${ aList }" var="a">
	              						<c:if test="${a.attBno == p.PRO_NO && a.attCategory == 4 && a.attFno == 1}">
				              				<img alt="작품사진" src="${ a.attRename }">
	              						</c:if>
	              					</c:forEach>
	              				</div>
	              			</td>
	              		</tr>
	              		<tr>
	              			<td>
	              				<h6 class="inputset-tit">작가명</h6>
	              			</td>
	              			<td>
	              				<input type="text" class="inputset-input form-control" aria-label="내용" value="${ p.PRO_WRITER }" readonly="readonly">
	              			</td>
	              			<td>
	              				<h6 class="inputset-tit">수량</h6>
	              			</td>
	              			<td>
	              				<input type="text" class="inputset-input form-control num" aria-label="내용" value="${ p.ODT_NUM }" readonly="readonly">
	              			</td>
	              		</tr>
	              	</table>
	              </div>
            	</c:forEach>
              <div>
              </div>
            </div>
          </div>
        </div>
        <div class="contents-container container-md">
          <div class="textset">
            <h2 class="orDetailTitle">배송 정보</h2>
          </div>
          <div class="contents-form">
            <div class="contents-form-top">
              <div class="inputset inputset-lg inputset-label">
              	<table class="deliveryInfo">
              		<tr>
              			<td class="tdA">
              				<h6 class="inputset-tit">수령자명 </h6>
              			</td>
              			<td class="tdB">
              				<input type="text" class="inputset-input form-control" value="${ o.ADD_RECIPIENT }" readonly="readonly">
              			</td>
              		</tr>
              		<tr>
              			<td>
              				<h6 class="inputset-tit">연락처</h6>
              			</td>
              			<td>
              				<input type="text" class="inputset-input form-control" value="${ o.ADD_PHONE }" readonly="readonly">
              			</td>
              		</tr>
              		<tr>
              			<td rowspan="2" valign="top" style="padding-top: 1.6%;">
              				<h6 class="inputset-tit">배송지</h6>
              			</td>
              			<td>
              				<input type="text" class="inputset-input form-control" value="${fn:split(o.ADD_ADDRESS, '@')[0]}" readonly="readonly" disabled="">
              			</td>
              		</tr>
              		<tr>
              			<td>
              				<input type="text" class="inputset-input form-control" value="${fn:substringAfter(o.ADD_ADDRESS, '@')}" readonly="readonly">
              			</td>
              		</tr>
              		<tr>
              			<td>
              				<h6 class="inputset-tit">배송 시 요청사항</h6>
              			</td>
              			<td>
              				<c:if test="${ o.ORD_MESSAGE != 'none' }">
	              				<input type="text" class="inputset-input form-control" value="${ o.ORD_MESSAGE }" readonly="readonly">
              				</c:if>
              				<c:if test="${ o.ORD_MESSAGE == 'none' }">
              					<input type="text" class="inputset-input form-control" value="" readonly="readonly">
              				</c:if>
              			</td>
              		</tr>
              	</table>
              </div>
            </div>
          </div>
        </div>
          
        <div class="contents-container container-md">
           <div class="textset">
             <h2 class="orDetailTitle">결제 정보</h2>
           </div>
           <div class="contents-form">
             <div class="contents-form-top">
               <div class="inputset inputset-lg inputset-label">
               	<table class="paymentInfo">
               		<tr>
               			<td class="tdA">
               				<h6 class="inputset-tit">상품 금액</h6>
               			</td>
               			<td class="tdB">
               				<input type="text" class="inputset-input form-control" id="totalProductPrice" value="" readonly="readonly">
               			</td>
               			<td class="tdC">
               				<h6 class="inputset-tit">포인트 결제 금액</h6>
               			</td>
               			<td class="tdD">
               				<input type="text" class="inputset-input form-control" value="${ o.ORD_PO_PRICE }" readonly="readonly">
               			</td>
               			<td class="tdE">
               				<h6 class="finalPrice">최종 결제 금액</h6>
               			</td>
               		</tr>
               		<tr>
               			<td>
               				<h6 class="inputset-tit">배송비</h6>
               			</td>
               			<td>
               				<input type="text" class="inputset-input form-control" readonly="readonly" id="deliveryFree">
               			</td>
               			<td>
               				<h6 class="inputset-tit">카드 결제 금액</h6>
               			</td>
               			<td>
               				<input type="text" class="inputset-input form-control" value="${ o.ORD_CA_PRICE }" readonly="readonly">
               			</td>
               			<td>
               				<h6 class="finalPrice" id="finalPrice" >${ o.ORD_SUM_PRICE }<small>원</small></h6>
               			</td>
               		</tr>
               	</table>
               </div>
             </div>
           </div>
         </div>
         <div class="orderDetailButton">
          <a href="javascript:history.back();" class="btnset btnset-lg">이전</a>
        </div>
      </div>
     </div>
  </main>
  
<script type="text/javascript">
  window.onload = () =>{
  	const productPrices = document.getElementsByClassName('inputset-input form-control price');
  	const productNums = document.getElementsByClassName('inputset-input form-control num');
  	
  	let totalProductPrice = 0;
  	for(i = 0; i < productPrices.length; i++){
  		
  		const productPrice = productPrices[i].value;
  		const productNum = productNums[i].value;
  		
  		productTotal = productPrice * productNum;
  		totalProductPrice += productTotal;
  	}
  	document.getElementById('totalProductPrice').value = totalProductPrice;
  	
  	const finalPrice = document.getElementById('finalPrice').innerText.replace(/[^0-9]/g, '');
  	document.getElementById('deliveryFree').value = (finalPrice - totalProductPrice);
  	
  }
</script>
  
  <jsp:include page="../common/footer.jsp"/>
  <script src="rs/myOrderdetail/js/setting.js"></script>
  <script src="rs/myOrderdetail/js/script.js"></script>
</body>
</html>
