<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="imagetoolbar" content="no">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="format-detection" content="telephone=no">
<link rel="stylesheet" href="rs/reviewDetail/css/setting.css">
<link rel="stylesheet" href="rs/reviewDetail/css/template.css">
<link rel="stylesheet" href="rs/reviewDetail/css/style.css?after">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

<style type="text/css">

.reviewDetail .reviewInfoTab {
   width: 100%;
}

.reviewDetail .reviewInfoTab .firTd {
   width: 50%;
}

.reviewDetail .reviewInfoTab .secTd {
   width: 50%;
   text-align: right;
}

.reviewDetail #proImgTd {
	height: 100px;
}

.reviewDetail .reviewInfoTab img{
   height: 100%;
   
}

.reviewDetail .contents-brand .profilePic {
	display: inline-block;
	width: 35px;
	height: 35px;
	border-radius: 70%;
	overflow: hidden;
	text-align: right;
}

.reviewDetail .contents-brand .profileImg {
	width: 100%;
	height: 100%;
	object-fit: cover;
}

.reviewDetail .reviewContentPre{
	padding: 8px;
	min-height: 150px;
	font-size: var(--fs-p2);
    font-weight: 400;
    font-family: var(--ff);
    font-size: var(--fs-p3);
}

.reviewDetail .reviewDetailDivs{
	margin-left: 10px;
	font-size: var(--fs-p2);
    font-weight: 400;
}

.reviewDetail .newbadge{
    background: red;
    width:2.8rem;
    text-align: center;
    line-height: 2.2rem;;
    font-size: 1rem;
    border-radius: 50%;
    color:white;
    margin-left: 10px;
}

.reviewDetail .updateDeleteDiv{
	margin-left: auto;
	font-size: 1.5rem;
	text-align: center;
	cursor: pointer;
}

.reviewDetail .updateButton{
	display: inline-block;
	width: 50px;
	height: auto;
	padding: 2px;
	background-color: white;
	color: black;
	margin-right: 0.5px;
	border: 1px solid black;
}

.reviewDetail .deleteButton{
	display: inline-block;
	width: 50px;
	height: auto;
	padding: 2px;
	background-color: black;
	color: white;
}

.reviewDetail .submitButton{
	float: right;
	font-size: 1.5rem;
	text-align: center;
	cursor: pointer;
	display: inline-block;
	width: 50px;
	height: auto;
	padding: 2px;
	background-color: black;
	color: white;
}

.reviewDetail #textareaId{
	height: 10rem;
    border-color: transparent;
    padding: 1.6rem 0;
    border-radius: 0;
    box-shadow: none;
    font-family: inherit;
    font-size: var(--fs-p4);
    font-weight: 400;
    width: 100%;
    resize: none;
}

.reviewDetail .reviewReplyBut{
	margin-left: auto;
	cursor: pointer;
}

.reviewDetail .badgeset-text{
	border-radius: 0.6rem;
	max-width: 20rem;
    padding: 0.6rem 1.2rem;
    font-size: var(--fs-p4);
    line-height: 1.8rem;
    color: var(--text-color3);
    border: 1px solid #e5e5e5;
}

</style>
</head>
<body>
  <jsp:include page="../common/header.jsp"/>
  <main class="th-layout-main ">
    <div class="reviewDetail" data-bid="qWlQHt9Vh1">
      <div class="contents-inner">
        <div class="contents-container container-md">
          <div class="contents-left" style="margin: auto; margin-right: 25px; margin-left: 25px;">
            <div class="contents-thumbnail">
              <img class="contents-thumbimg" src="main/mainPic/auction4.png" alt="썸네일이미지">
            </div>
            <ul class="contents-thumblist">
              <li class="contents-thumbitem">
                <img class="contents-thumbimg" src="main/mainPic/auction1.png" alt="썸네일이미지">
              </li>
              <li class="contents-thumbitem">
                <img class="contents-thumbimg" src="main/mainPic/auction2.png" alt="썸네일이미지">
              </li>
              <li class="contents-thumbitem">
                <img class="contents-thumbimg" src="main/mainPic/auction3.png" alt="썸네일이미지">
              </li>
              <li class="contents-thumbitem">
                <img class="contents-thumbimg" src="main/mainPic/auction4.png" alt="썸네일이미지">
              </li>
              <li class="contents-thumbitem">
                <img class="contents-thumbimg" src="main/mainPic/auction1.png" alt="썸네일이미지">
              </li>
            </ul>
          </div>
          <div class="contents-right">
            <div class="contents-right-group">
              <table class="reviewInfoTab">
                <tbody>
                	<tr>
                		<td class="firTd"><h4 class="p1 fw-500">내 주량은 5000CC</h4></td>
                		<td class="secTd">조회수 12</td>
                	</tr>
                	<tr>
                		<td><h4 class="p1 fw-500">김가현</h4></td>
                		<td class="secTd">2024.01.01</td>
                	</tr>
                  <tr>
                    <td id="proImgTd" colspan="2">
                    	<img src="main/mainPic/product2.png" alt="작품사진">
                    </td>
                  </tr>
                </tbody>
              </table>
            </div>
            <div class="contents-right-group">
              <div class="contents-brand">
                <div class="profilePic">
					<img src="${ r.memFileName }" alt="프로필 사진"class="profileImg">
				</div>
                <h6 class="reviewDetailDivs">떡볶이 좋아</h6>
                <div class="updateDeleteDiv">
                  <div class="updateButton"> 수정 </div>
                  <div class="deleteButton"> 삭제 </div>
                </div>
              </div>
              <div>
                <pre class="reviewContentPre">완죤 이뻐용 하나 더 살래용</pre>
              </div>
              <div class="contents-badge-group">
                <div class="contents-brand">
                  <div class="contents-brand-group">
                    <button class="contents-btn btn-like-line">
                      <img src="rs/reviewDetail/icons/ico_like_black_line.svg" alt="하트 라인 아이콘">
                    </button>
                    <button class="contents-btn btn-like-fill">
                      <img src="rs/reviewDetail/icons/ico_like_black_fill.svg" alt="하트 채워진 아이콘">
                    </button>
                  </div>
                </div>
                <div>좋아요 10</div>
                <div class="reviewReplyBut">
                  <span class="badgeset-text">댓글 1</span>
                </div>
              </div>
            </div>
            <div class="contents-right-group" id="replyDiv">
              <div>
                <div class="writeReplyDiv">
                    <h4 class="p1 fw-500" style="display: inline-block;">댓글 작성</h4>
                    <div class="submitButton">등록</div>
                    <textarea class="inputset-textarea form-control" id="textareaId" placeholder="내용을 입력해주세요."></textarea>
                </div>
              </div>
              <div class="contents-brand">
                <div class="profilePic">
					<img src="${ r.memFileName }" alt="프로필 사진" class="profileImg">
				</div>
                <h6 class="reviewDetailDivs">떡볶이 좋아</h6>
                <div class="reviewDetailDivs">3일전</div>
                <div class="newbadge">NEW</div>
                <div class="updateDeleteDiv" >
                  <div class="updateButton"> 수정 </div>
                  <div class="deleteButton"> 삭제 </div>
                </div>
              </div>
              <div>
                <p class="p2">이뿌네용 저도 살래용</p>
              </div>
            </div>
            <div class="contents-right-group">
              <ul class="contents-right-list">
                <li class="contents-right-item">
                  <strong>이 작품의 다른 리뷰</strong>
                  <div class="contents-amount">
                    <button class="contents-btn btn-minus" type="button">
                      <img class="icon-md" src="rs/reviewDetail/icons/ico_chevron_left_black.svg" alt="아이콘">
                    </button>
                    <button class="contents-btn btn-plus" type="button">
                      <img class="icon-md" src="rs/reviewDetail/icons/ico_chevron_right_black.svg" alt="아이콘">
                    </button>
                  </div>
                </li>
                <li>
                  <ul class="contents-thumblist">
                    <li class="contents-thumbitem">
                      <img class="contents-thumbimg" src="main/mainPic/auction4.png" alt="썸네일이미지">
                    </li>
                    <li class="contents-thumbitem">
                      <img class="contents-thumbimg" src="main/mainPic/auction3.png" alt="썸네일이미지">
                    </li>
                    <li class="contents-thumbitem">
                      <img class="contents-thumbimg" src="main/mainPic/auction1.png" alt="썸네일이미지">
                    </li>
                    <li class="contents-thumbitem">
                      <img class="contents-thumbimg" src="main/mainPic/auction2.png" alt="썸네일이미지">
                    </li>
                  </ul>
                </li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
  <jsp:include page="../common/footer.jsp"/>
  </main>
  
  <script type="text/javascript">
  
  </script>
  
  <script src="rs/reviewDetail/js/setting.js"></script>
  <script src="rs/reviewDetail/js/script.js"></script>
</body>
</html>