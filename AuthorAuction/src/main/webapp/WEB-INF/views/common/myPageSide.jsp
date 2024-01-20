<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
const openSidebar = () =>{
	document.getElementsByClassName("sideTop")[0].style.display = "block";
    document.getElementsByClassName("sideContent")[0].style.display = "block";
}

const closeSidebar = () =>{
	 document.getElementsByClassName("sideTop")[0].style.display = "none";
	 document.getElementsByClassName("sideContent")[0].style.display = "none";
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
    background: white;
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
						<td><img src="main/icons/logoImage.png"></td>
						<td onclick="location.href='myInfo'">회원정보</td>
					</tr>
					<tr>
						<td></td>
						<td onclick="location.href='myInfo?tab=1'">회원정보 수정</td>
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
						<td><img src="main/icons/logoImage.png"></td>
						<td onclick="location.href='myBidList.ac'">경매정보</td>
					</tr>
					<tr>
						<td></td>
						<td onclick="location.href='myBidList.ac'">나의경매</td>
					</tr>
					<tr>
						<td></td>
						<td onclick="location.href='myInterest.ac'">관심목록</td>
					</tr>
					
					<tr></tr>
					
					<tr class="mainTr">
						<td><img src="main/icons/logoImage.png"></td>
						<td onclick="location.href='myOrderList.od'">쇼핑정보</td>
					</tr>
					<tr>
						<td></td>
						<td onclick="location.href='myOrderList.od'">주문목록</td>
					</tr>
					
					<tr></tr>
					
					<tr class="mainTr">
						<td><img src="main/icons/logoImage.png"></td>
						<td onclick="location.href='myReviewList.rv'">나의 게시글</td>
					</tr>
					<tr>
						<td></td>
						<td onclick="location.href='myReviewList.rv'">리뷰</td>
					</tr>
					<tr>
						<td></td>
						<td onclick="location.href='myRecommendationList.re'">그림추천</td>
					</tr>
					<tr>
						<td></td>
						<td onclick="location.href='list.co'">위탁문의</td>
					</tr>
				</table>
			</div>
			<div class="sideSideIcon">
			
			
			</div>
		</div>
	</div>
</body>
</html>
