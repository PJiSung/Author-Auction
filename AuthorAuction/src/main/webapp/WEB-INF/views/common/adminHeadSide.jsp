<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#menuIcon{
     	display:none;
     }
     
     #menuIcon + label{
     	display:block;
     	width:60px;
     	height:50px;
     	position:fixed;
     	left:0;
     	top:clac(15%-25px);
     	cursor:pointer;
     }
     
     #menuIcon + label span{
     	display:block;
     	position:absolute;
     	width:100%;
     	height:5px;
     	border-radius:30px;
     	background:#000;
     	transition:all .0.5s;
     }
     
     #menuIcon + label span:nth-child(1){
     	top:0;
     }
     
     #menuIcon + label span:nth-child(2){
     	top:50%;
     	transform:translateY(-50%);
     }
     
     #menuIcon + label span:nth-child(3){
     	bottom:0;
     }
     
     #menuIcon:checked + label {
     	z-index:2;
     	left:230px;
     }
     
     #menuIcon:checked + label span{
     	background:#fff;
     }
     
     #menuIcon:checked + label span:nth-child(1){
     	top:50%;
     	transform:translateY(-50%) rotate(45deg);
     }
     
     #menuIcon:checked + label span:nth-child(2){
     	opacity:0;
     }
     
     #menuIcon:checked + label span:nth-child(3){
     	bottom:50%;
     	transform:translateY(50%) rotate(-45deg);
     }
     
     .sideBar{
     	width:300px;
     	height:100%;
     	background:black;
     	position:fixed;
     	top:0;
     	left:-300px;
     	z-index: 1;
     	transition:all .5s;
     	color:white;
     }
     
     #menuIcon:checked + label + div{
     	left:0;
     }
     	
     .sideBtn{
     	width:100%;
     	font-size: xx-large;
     	font-weight: 1000;
     	margin-left:5%;
     	cursor:pointer;
     }
     
     #adminHeader{
         display:flex;
         justify-content: center;
         font-size: xxx-large;
         align-items: center;
         height:180px;
         color:white;
         background:black;
         cursor:pointer;
     }
</style>
<script>

</script>
</head>
<body>
	<div style="text-align:center; height:200px;">
		<div id="adminHeader" onclick="location.href='adminMain.adac'">경매 관리인 페이지</div>
	</div>
    <div style="display:flex; height:90%; width:85%; margin:auto;">
        <aside style="width:15%;">
            <input type="checkbox" id="menuIcon">
            <label for="menuIcon">
            	<span></span>
            	<span></span>
            	<span></span>
            </label>
            <div class="sideBar">
            	<ul type="circle">
            		<li><div class="sideBtn" style="margin-top:100%;" onclick="location.href='/'">Auction 메인</div></li>
            		<li><div class="sideBtn" style="margin-top:10%;" onclick="location.href='memberList.adme'">회원 관리</div></li>
            		<li><div class="sideBtn" style="margin-top:10%;" onclick="location.href='adminInquiry.adac'">경매 관리</div></li>
            		<li><div class="sideBtn" style="margin-top:10%;" onclick="location.href='artsadmin.ar'">미술품 관리</div></li>
            		<li><div class="sideBtn" style="margin-top:10%;" onclick="location.href='searchList.adco'">위탁 관리</div></li>
            		<li><div class="sideBtn" style="margin-top:10%;" onclick="location.href='admOrderList.adod'">주문 관리</div></li>
            	</ul>
            </div>
        </aside>
    </div>
</body>
</html>