<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html> 
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta http-equiv="imagetoolbar" content="no">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="format-detection" content="telephone=no">
  <title>위탁 마이페이지 </title> 
  <link rel="stylesheet" href="consignment/css/setting.css">
  <link rel="stylesheet" href="consignment/css/plugin.css">
  <link rel="stylesheet" href="consignment/css/template.css">
  <link rel="stylesheet" href="consignment/css/common.css">
  <link rel="stylesheet" href="consignment/css/style.css">
<style>
.date-box{border-radius: 0.6rem; border: 1px solid lightgray;}
.con_startdate{border: 1px solid lightgray; height: 5rem; border-radius :0.6rem; cursor: pointer;}
.con_enddate{border: 1px solid lightgray; height: 5rem; border-radius :0.6rem; cursor: pointer;}
.search{border: 1px solid lightgray; background-color: black; color: white; border-radius :0.6rem;} 
.cancel{border: 1px solid lightgray; border-radius :0.6rem;}
.con_enroll{border-radius: 0.6rem; border: 1px solid black; height: 40px; background-color: black;}
.inputText{border: 1px solid lightgray; height: 5rem; border-radius :0.6rem;}
tr{cursor: pointer;}
</style>

<script>
	const consignmentDetail = (conNo) =>{												<!-- 상세보기로 이동 -->
		location.href="selectConsignment.co?conNo=" + conNo + "&page=" + ${pi.currentPage};
	}
</script>
</head>


<body>
<jsp:include page="../common/header.jsp"/>
<jsp:include page="../common/myPageSide.jsp"/>
  <main class="th-layout-main ">
    <!-- [S]hooms-N48 -->
    <div class="hooms-N48" data-bid="tr2cLyIIXB5">
      <div class="contents-inner" style="padding: 6rem 2.4rem 10rem;">
        <div class="contents-container container-md">
          <div class="textset" style="text-align: center; margin-bottom: 1rem; margin-top: 1rem;">
            <a class="textset-tit" style="font-size: 50px; font-weight: 400; margin: 50px;">MY PAGE - CONSIGNMENT</a>
            
            <br><br>
            
			<div class="date-box">
 				<div class="date">
	              	<form action="searchList.co" class="listForm">
						<span><a>조회 기간</a></span>
						<span>
						  <input type="date" class="con_startdate" name="strDate">
						</span>
						~
						<span>
						  <input type="date" class="con_enddate" style="margin-left:20px;" name="endDat">
						</span>
						<span>
						  <a>검색어</a>
						  <select style="width: 5%; border-radius :0.6rem; border: 1px solid lightgray; height: 5rem; cursor: pointer;" name="select">
						    <option value="전체">전체</option>
						    <option value="작가명">작가명</option> 
						    <option value="작품명">작품명</option>
						  </select>
						  <input type="text" class="inputText" name="keyword" placeholder="작가명/작품명" aria-label="내용" style="width: 10%;">
						</span>
						<span><button type="submit" class="search">검색</button></span>
						<span><button type="reset" class="cancel">초기화</button></span>
	               	</form>
              	</div>
            </div>
            <br>
          </div>
          
          <div><button class="con_enroll" style="float: left;"><a href="conEnroll.co" style="color:white;">문의하기</a></button></div>
          
          <br>
          
          <div class="tableset">
            <table class="tableset-table table">
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
                  <th scope="col">작가명</th>
                  <th scope="col">작품명</th>
                  <th scope="col">작품의 크기</th>
                  <th scope="col">희망가</th>
                  <th scope="col">관리자 열람 여부</th>
                  <th scope="col">경매 등록 여부</th>
                </tr>
              </thead>
              <tbody>
              	<c:if test="${ !empty list }">
	              	<c:forEach items="${list}" var="c">
		                <tr onclick="consignmentDetail(this.id)" id="${c.conNo}">
		                  <td>${ c.conAuthor }</td>
		                  <td>${ c.conProduct }</td>
		                  <td>${ c.conWidth }*${ c.conHeight }cm</td>
		                  <td><fmt:formatNumber type="number" value="${ c.conHope }"/>원</td>
		                  
		                  <c:if test="${ c.conAdmStatus == 'Y' }">
			              	<td class="tableset-order05">Y</td>
			              </c:if>
			              <c:if test="${ c.conAdmStatus == 'N' }">
			              	<td class="tableset-order05">N</td>
			              </c:if>
		                  
		                  <c:if test="${c.conConStatus == 'Z' }">
		                  	<td class="tableset-order05">거절</td>
		                  </c:if>
		                  <c:if test="${c.conConStatus == 'Y' }">
		                  	<td class="tableset-order05">경매 등록 완료</td>
		                  </c:if>
		                  <c:if test="${c.conConStatus == 'N' }">
		                  	<td class="tableset-order05">답변 등록 중</td>
		                  </c:if>
		                </tr>
	              	</c:forEach>
	              </c:if>	  
	              
	              <c:if test="${ empty list }">
	              	<td colspan="8" style="height:300px; text-align:center"><h1>검색 결과가 없습니다.</h1></td>
	              </c:if>
              </tbody>
            </table>
          </div>
        </div>
        <br><br><br>
        <c:if test="${ !empty list }">
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
							<c:param name="select" value="${ sc.select }"></c:param>
							<c:param name="keyword" value="${ sc.keyword }"></c:param>
							<c:param name="strDate" value="${ sc.strDate }"></c:param>
							<c:param name="endDate" value="${ sc.endDat }"></c:param>
						</c:url>
						<a class="pagiset-link pagiset-first" href="${ goFirst }"> <span
							class="visually-hidden">처음</span>
						</a>
					</div>
					<div class="pagiset-ctrl">
						<c:url var="goBack" value="${ loc }">
							<c:param name="page" value="${ pi.currentPage-1 }"></c:param>
							<c:param name="select" value="${ sc.select }"></c:param>
							<c:param name="keyword" value="${ sc.keyword }"></c:param>
							<c:param name="strDate" value="${ sc.strDate }"></c:param>
							<c:param name="endDate" value="${ sc.endDat }"></c:param>
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
							<c:param name="select" value="${ sc.select }"></c:param>
							<c:param name="keyword" value="${ sc.keyword }"></c:param>
							<c:param name="strDate" value="${ sc.strDate }"></c:param>
							<c:param name="endDate" value="${ sc.endDat }"></c:param>
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
							<c:param name="select" value="${ sc.select }"></c:param>
							<c:param name="keyword" value="${ sc.keyword }"></c:param>
							<c:param name="strDate" value="${ sc.strDate }"></c:param>
							<c:param name="endDate" value="${ sc.endDat }"></c:param>
						</c:url>
						<a class="pagiset-link pagiset-next" href="${ goNext }"> <span
							class="visually-hidden">다음</span>
						</a>
					</div>
					<div class="pagiset-ctrl">
						<c:url var="goList" value="${ loc }">
							<c:param name="page" value="${ pi.maxPage }"></c:param>
							<c:param name="select" value="${ sc.select }"></c:param>
							<c:param name="keyword" value="${ sc.keyword }"></c:param>
							<c:param name="strDate" value="${ sc.strDate }"></c:param>
							<c:param name="endDate" value="${ sc.endDat }"></c:param>
						</c:url>
						<a class="pagiset-link pagiset-last" href="${ goList }"> <span
							class="visually-hidden">마지막</span>
						</a>
					</div>
				</c:if>
			</nav>
		</c:if>	     
      </div>
    </div>
    <!-- [E]hooms-N48 -->
  </main>
<jsp:include page="../common/footer.jsp"/>  

  <script src="consignment/js/setting.js"></script>
  <script src="consignment/js/plugin.js"></script>
  <script src="consignment/js/template.js"></script>
  <script src="consignment/js/common.js"></script>
  <script src="consignment/js/script.js"></script>
</body>
</html>
