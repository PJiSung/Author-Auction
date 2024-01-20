<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta http-equiv="imagetoolbar" content="no">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="format-detection" content="telephone=no">
  <title>그림 추천 마이페이지</title>
  <link rel="stylesheet" href="consignment/css/setting.css">
  <link rel="stylesheet" href="consignment/css/plugin.css">
  <link rel="stylesheet" href="consignment/css/template.css">
  <link rel="stylesheet" href="consignment/css/common.css">
  <link rel="stylesheet" href="consignment/css/style.css">
<style>
.recommendationEnroll > a{   
	width: 80px;
    height: auto;
    text-align: center;
    font-size: 1.5rem;
    padding: 2px;
    background-color: black;
    color: white;
    float: right;
    cursor: pointer;}
.tableset tr:hover{
   background: #dcdcdc;
   cursor: pointer;
}
.tableset .tableset-table td .badgeset {
    margin: 0 auto;
    padding: 3px;
}
.badgeset {
    display: inline-block;
    position: relative;
    min-width: 1.6rem;
    min-height: 1.6rem;
    font-weight: 400;
}
.date-box{border-radius: 0.6rem; border: 1px solid lightgray;}
.rec_startdate{border: 1px solid lightgray; height: 5rem; border-radius :0.6rem;}
.rec_enddate{border: 1px solid lightgray; height: 5rem; border-radius :0.6rem;}
.search{border: 1px solid lightgray; background-color: black; color: white; border-radius :0.6rem;} 
.cancel{border: 1px solid lightgray; border-radius :0.6rem;}
.recommendationEnroll>a:hover{color: white;}
.recommendationEnroll{border-radius: 0.6rem; border: 1px solid black; height: 40px; background-color: black;}
</style>

</head>

<body>
<jsp:include page="../common/header.jsp"/>
  <main class="th-layout-main ">
    <!-- [S]hooms-N48 -->
    <div class="hooms-N48" data-bid="kTLqC36ddS" style="min-height: 800px;">
      <div class="contents-inner">
        <div class="contents-container container-md">
          <div class="textset">
            <a class="textset-tit">마이페이지(추천 문의 내역)</a>
            <br><br>
            <div class="date-box">
              <div class="date">
               <form action="myRecommendationList.re" class="listFom">
                <span><a>조회 기간</a></span>
                <span>
                  <input type="date" class="rec_startdate" name="strDate">
                </span>
                <span>~</span>
                <span>
                  <input type="date" class="rec_enddate" name="endDate">
                </span>
                <span><button type="submit" class="search">검색</button></span>
                <span><button type="reset" class="cancel">초기화</button></span>
               </form>
              </div>
            </div>
            <br><br>
          </div>
          
          <div><button class="recommendationEnroll"><a href="recommendationEnroll.re">문의하기</a></button></div>
          
          <div class="tableset" id="tableset">
            <table class="tableset-table table" >
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
                  <th scope="col">제목</th>
                  <th scope="col">신청일자</th>
                  <th scope="col">답변</th>
                </tr>
              </thead>
              <tbody id="tbody">

               <c:forEach items="${rList}" var="r"> 
                <tr onclick="recommendationDetail(this.id)" id="${r.recNo}">
                  <td class="tableset-mobile" onclick="javascript:event.stopPropagation();">
                    <input type="hidden" value="${r.recNo }" name="recNo" id="recNo">
                    <input id="${ r.recNo }" value="${ r.recNo }" class="checkset-input input-fill" type="checkbox" name="check" onclick="check1()">
                  </td>
                  <td class="tableset-tit tableset-order02" style="text-align: center;">
                    <a href="javascript:void(0)">
                      <span>${ r.recTitle }</span>
                    </a>
                  </td>
                  <td class="tableset-order05">${r.recCreateDate }</td>
                  <td class="tableset-order01">
                  <c:if test="${r.recReply == null }">
                    <div class="badgeset" style="font-size:1.4rem; background-color: white; color: black; border: 2px solid black;">대기</div>
                  </c:if>
                  <c:if test="${r.recReply != null }">  
                    <div class="badgeset" style="font-size:1.4rem;">답변완료</div>
                  </c:if>  
                  </td>
                </tr>
               </c:forEach> 
               
              </tbody>
            </table>
            <input class="btnset btnset-lg" value="선택삭제" type="button" id="deleteBtn" name="deleteBtn" onclick="minus()" style="float:right;">
          </div>
        </div>
        <br><br><br>
     
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
						<c:param name="strDate" value="${ strDate }"></c:param>
						<c:param name="endDate" value="${ endDate }"></c:param>
					</c:url>
					<a class="pagiset-link pagiset-first" href="${ goFirst }"> <span
						class="visually-hidden">처음</span>
					</a>
				</div>
				<div class="pagiset-ctrl">
					<c:url var="goBack" value="${ loc }">
						<c:param name="page" value="${ pi.currentPage-1 }"></c:param>
						<c:param name="page" value="${ pi.startPage }"></c:param>
						<c:param name="strDate" value="${ strDate }"></c:param>
						<c:param name="endDate" value="${ endDate }"></c:param>
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
						<c:param name="strDate" value="${ strDate }"></c:param>
						<c:param name="endDate" value="${ endDate }"></c:param>
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
						<c:param name="strDate" value="${ strDate }"></c:param>
						<c:param name="endDate" value="${ endDate }"></c:param>
					</c:url>
					<a class="pagiset-link pagiset-next" href="${ goNext }"> <span
						class="visually-hidden">다음</span>
					</a>
				</div>
				<div class="pagiset-ctrl">
					<c:url var="goList" value="${ loc }">
						<c:param name="page" value="${ pi.maxPage }"></c:param>
						<c:param name="strDate" value="${ strDate }"></c:param>
						<c:param name="endDate" value="${ endDate }"></c:param>
					</c:url>
					<a class="pagiset-link pagiset-last" href="${ goList }"> <span
						class="visually-hidden">마지막</span>
					</a>
				</div>
			</c:if>
		</nav>
     
      </div>
    </div>
    <!-- [E]hooms-N48 -->
  </main>
<jsp:include page="../common/footer.jsp"/>  

<script>
	<!-- 상세보기로 이동 -->
	const recommendationDetail = (recNo) =>{									
		location.href="selectRecommendation.re?recNo=" + recNo + "&page=" + ${pi.currentPage} + "&beforeURL=2";
	}
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
	       console.log(deleteIds);
	    if(deleteIds.length != 0){
	        $.ajax({
	        	url: 'checkDelete.re',
	        	type: 'post',
	        	data: {deleteIds: deleteIds},
	        	success: (data) =>{
	        		console.log(data)
	        		if(data == "success"){
		        		$("#tableset").load(location.href + " #tableset");			
	        		}
	        	},
	        	error: data => console.log(data)
	        });
	    }
	    
	}
</script>

  <script src="consignment/js/setting.js"></script>
  <script src="consignment/js/plugin.js"></script>
  <script src="consignment/js/template.js"></script>
  <script src="consignment/js/common.js"></script>
  <script src="consignment/js/script.js"></script>
</body>
</html>