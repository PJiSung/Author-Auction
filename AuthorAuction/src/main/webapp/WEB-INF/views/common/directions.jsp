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
<link rel="stylesheet" href="main/css/diSetting.css">
<link rel="stylesheet" href="main/css/diStyle.css">
<link rel="stylesheet" href="main/css/diCommon.css">
<title>Insert title here</title>
</head>
<style type="text/css">
.container-md{
	padding-top: 50px;
	padding-bottom: 150px;
}

</style>

<body>
  <jsp:include page="../common/header.jsp"/>
  <main class="th-layout-main ">
    <!-- [S]directions -->
    <div class="basic-N38" data-bid="xRLr7CqFK8" id="">
      <div class="contents-inner">
        <div class="contents-container container-md">
          <div class="textset">
            <h2 class="textset-tit">오시는길</h2>
          </div>
          <!-- * 카카오맵 - 지도퍼가기 -->
          <!-- 1. 지도 노드 -->
          <div id="daumRoughmapContainer1704867435818" class="root_daum_roughmap root_daum_roughmap_landing"></div>
          <!--
        	2. 설치 스크립트
          * 지도 퍼가기 서비스를 2개 이상 넣을 경우, 설치 스크립트는 하나만 삽입합니다.
      -->
          <script charset="UTF-8" class="daum_roughmap_loader_script" src="https://ssl.daumcdn.net/dmaps/map_js_init/roughmapLoader.js"></script>

          <!-- 3. 실행 스크립트 -->
          <script charset="UTF-8">
            new daum.roughmap.Lander({
              "timestamp": "1704867435818",
              "key": "2hmsw",
            }).render();
          </script>
          <ul class="contents-list">
            <li class="contents-item">
              <div class="contents-ico">
                <figure class="contents-figure">
                  <img src="main/icons/ico_location_black.svg" alt="주소 아이콘">
                </figure> 주소
              </div>
              <p class="contents-desc"> 서울특별시 서울 중구 남대문로 120 1~17층(남대문로1가, 그레이츠 청계) <br> 120, Namdaemun-ro, Jung-gu, Seoul, Republic of Korea </p>
            </li>
            <li class="contents-item">
              <div class="contents-ico">
                <figure class="contents-figure">
                  <img src="main/icons/ico_mail_black.svg" alt="이메일 아이콘">
                </figure> 이메일
              </div>
              <p class="contents-desc">art@aauction.co.kr</p>
            </li>
            <li class="contents-item">
              <div class="contents-ico">
                <figure class="contents-figure">
                  <img src="main/icons/ico_call_black.svg" alt="전화번호 아이콘">
                </figure> 전화번호
              </div>
              <p class="contents-desc"> 070-1004-1004</p>
            </li>
          </ul>
        </div>
      </div>
    </div>
  <jsp:include page="../common/footer.jsp"/>
  
  <script src="main/js/diSetting.js"></script>
</body>
</html>