<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script>
$(document).ready(function(){
	checkUrl();
});
const openSidebar = () =>{
	document.getElementsByClassName("sideTop")[0].style.display = "block";
    document.getElementsByClassName("sideContent")[0].style.display = "block";
    document.getElementsByClassName("sideSideIcon")[0].style.display = "none";
}

const closeSidebar = () =>{
	 document.getElementsByClassName("sideTop")[0].style.display = "none";
	 document.getElementsByClassName("sideContent")[0].style.display = "none";
	 document.getElementsByClassName("sideSideIcon")[0].style.display = "block";
}

const checkUrl = () =>{
	let url = window.location.href;
	let onclicks = document.querySelectorAll(".sideContent tr td:last-child");
	let menu = url.split("//")[1].split("/")[1];
	for(let i=0; i<onclicks.length; i++){
		if(menu == "myInfo"){
			if(tab=="2"){
				onclicks[2].style.color = "white";
			}else if(tab=="3"){
				onclicks[3].style.color = "white";
			}else{
				onclicks[1].style.color = "white";
			}
		}else{
			if(onclicks[i].id == menu){
				onclicks[i].style.color = "white";
			}
		}			
	}
}
</script>
<style>
.sideTop, .sideContent{
	display:none;
}

.sidebar {
    height: 100%;
    width: 225px;
    position: fixed;
    z-index: 99999;
    top: 0;
    left: -170px;
    background-color: #111;
    overflow-x: hidden;
    transition: 0.5s;
    padding-top: 20px;
    color: gray;
}

.sidebar img {
    width: 20px;
    height: 20px;
    margin-left: 10px;
}

.sidebar:hover {
    left: 0;
}

.sideTop {
    margin-top: 20px;
    width: 100%;
    height: 95px;
}

.sideTop h2 {
    font-size: 27px;
}

.sideTop h2,
.sideTop p {
    color: white;
    text-align: center;
    margin: 0;
}

.sideTop p {
    line-height: 25px;
    margin-right: 72px;
}

.sideContent {
    padding-left: 15px;
}

.sideContent table {
    width: 90%;
    font-size: 18px;
    height: 570px;
}

.sideContent table tr {
    min-height: 30px;
    cursor: pointer;
}

.sideContent tr.mainTr td {
    margin-bottom: 20px;
}

.sideContent table tr:hover {
    background: #444;
    color: #ddd;
}

.sideContent table tr td:first-child {
    width: 28%;
}
.sideContent table .mainTr {
	height: 40px;
}
.sideContent table tr:not(.mainTr) {
    font-size: 16px;
    height: 40px;
}
.sideSideIcon img{
	width: 30px;
	height: 30px;
}
.sideSideIcon .member{
	position: absolute;
	top: 142px;
	left: 172px;
}
.sideSideIcon .auction{
	position: absolute;
	top: 342px;
	left: 172px;
}
.sideSideIcon .shopping{
	position: absolute;
	top: 502px;
	left: 172px;
}
.sideSideIcon .board{
	position: absolute;
	top: 622px;
	left: 172px;
}
</style>
</head>
<body>
	<div class="myPageContainer">
		<div class="sidebar" onmouseover="openSidebar()" onmouseout="closeSidebar()">
			<div class="sideTop">
				<h2>A_Auction</h2>
				<p>MyPage</p>
			</div>
			<div class="sideContent">
				<table>
					<tr class="mainTr">
						<td><img src="main/icons/user.png"></td>
						<td onclick="location.href='myInfo'">회원정보</td>
					</tr>
					<tr>
						<td></td>
						<td onclick="location.href='myInfo'">회원정보 수정</td>
					</tr>
					<tr>
						<td></td>
						<td onclick="location.href='myInfo?tab=2'">배송지 수정</td>
					</tr>
					<tr>
						<td></td>
						<td onclick="location.href='myInfo?tab=3'">비밀번호 변경</td>
					</tr>
					
					<tr></tr>
					
					<tr class="mainTr">
						<td><img src="main/icons/auction.png"></td>
						<td onclick="location.href='myBidList.ac'">경매정보</td>
					</tr>
					<tr>
						<td></td>
						<td id="myBidList.ac" onclick="location.href='myBidList.ac'">나의경매</td>
					</tr>
					<tr>
						<td></td>
						<td id="myInterest.ac" onclick="location.href='myInterest.ac'">관심목록</td>
					</tr>
					
					<tr></tr>
					
					<tr class="mainTr">
						<td><img src="main/icons/shopping-cart.png"></td>
						<td onclick="location.href='myOrderList.od'">쇼핑정보</td>
					</tr>
					<tr>
						<td></td>
						<td id="myOrderList.od" onclick="location.href='myOrderList.od'">주문목록</td>
					</tr>
					
					<tr></tr>
					
					<tr class="mainTr">
						<td><img src="main/icons/billboard.png"></td>
						<td onclick="location.href='myReviewList.rv'">나의 게시글</td>
					</tr>
					<tr>
						<td></td>
						<td id="myReviewList.rv" onclick="location.href='myReviewList.rv'">리뷰</td>
					</tr>
					<tr>
						<td></td>
						<td id="myRecommendationList.re" onclick="location.href='myRecommendationList.re'">그림추천</td>
					</tr>
					<tr>
						<td></td>
						<td id="list.co" onclick="location.href='list.co'">위탁문의</td>
					</tr>
				</table>
			</div>
			<div class="sideSideIcon">
				<div class="logo">
					<img src="main/icons/logoImage.png">
				</div>
				<div class="member">
					<img src="main/icons/user.png">
				</div>
				<div class="auction">
					<img src="main/icons/auction.png">
				</div>
				<div class="shopping">
					<img src="main/icons/shopping-cart.png">
				</div>
				<div class="board">
					<img src="main/icons/billboard.png">
				</div>
			</div>
		</div>
	</div>
</body>
</html>
