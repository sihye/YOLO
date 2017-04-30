<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="mypageMyClasstop.jsp"%>
<script>

function pageFunc(curPage){
	document.frmPage.currentPage.value=curPage;
	frmPage.submit();
}
</script>
<!-- 페이징 처리를 위한 form 태그 -->
<form name="frmPage" method="post"
	action='<c:url value="/mypage/MyClass/PartClass.do" />'>
	<input type="hidden" name="currentPage"> <input type="hidden"
		name="searchCondition" value="${param.searchCondition }"> <input
		type="hidden" name="searchKeyword" value="${param.searchKeyword}">
	<input type="hidden" name="searchStartDate"
		value="${param.searchStartDate}"> <input type="hidden"
		name="searchEndDate" value="${param.searchEndDate}">
</form>
<div class="col-md-10">
	<ul class="nav nav-tabs nav-justified">
		<li><a href='<c:url value="/mypage/MyClass/HostClass.do"/>'>주최클래스</a></li>
		<li class="active"><a
			href='<c:url value="/mypage/MyClass/PartClass.do"/>'>참여클래스</a></li>
		<li><a href='<c:url value="/mypage/MyClass/Payment.do"/>'>결제내역</a></li>
	</ul>
	<br>
	<h2>클래스 신청 내역</h2>

	<br>
	<form method="post"
		action='<c:url value="/mypage/Favorite/FavoriteClass.do" />'>
		<table class="table table-hover">
			<thead>
				<tr>

					<th width="20%">클래스명</th>
					<th width="20%">호스트</th>
					<th width="20%">결제방법</th>
					<th width="20%">등록일</th>
					<th width="20%">상태</th>

				</tr>
			</thead>
			<tbody>
				<c:forEach var="map" items="${alist }">
					<tr>
						<td><a
							href='<c:url value="/class/claDetail.do?cNo=${map['C_NO'] }"/>'>${map["C_NAME"] }</a></td>
						<td>${map["M_USERID"] }</td>
						<td>${map["PM_PAYMENTWAY"] }</td>
						<td>${map["PM_PAYMENTDATE"] }</td>					
						<c:if test="${map['PM_COMPLETECHECK'] =='N'}">
							<td>신청중</td>
						</c:if>
						<c:if test="${map['PM_COMPLETECHECK'] =='Y'}">
							<td>참여중</td>
						</c:if>
										
					</tr>
				</c:forEach>

			</tbody>
			<tfoot>
			</tfoot>
		</table>
	</form>
	<hr />
</div>
<div class="divPage" style="text-align: center">
	<!-- 페이지 번호 추가 -->
	<!-- 이전 블럭으로 이동 ◀-->
	<nav>
		<ul class="pagination">

			<c:if test="${pagingInfo.firstPage>1 }">
				<li><a href="#" aria-label="Previous"
					onclick="pageFunc(${pagingInfo.firstPage-1})"> <span
						aria-hidden="true">&laquo;</span></a></li>
			</c:if>

			<c:forEach var="i" begin="${pagingInfo.firstPage }"
				end="${pagingInfo.lastPage }">
				<c:if test="${i==pagingInfo.currentPage }">
					<li class="active"><a href="#"> ${i}<span class="sr-only">${i }</span></a></li>
				</c:if>
				<c:if test="${i!=pagingInfo.currentPage }">
					<li><a href="#" onclick="pageFunc(${i})">${i}</a></li>
				</c:if>
			</c:forEach>

			<!-- 다음 블럭으로 이동 ▶-->
			<c:if test="${pagingInfo.lastPage < pagingInfo.totalPage}">
				<li><a href="#" aria-label="Previous"
					onclick="pageFunc(${pagingInfo.lastPage+1})"> <span
						aria-hidden="true">&raquo;</span></a></li>
			</c:if>

			<!--  페이지 번호 끝 -->
		</ul>
	</nav>
</div>
<%@ include file="../mypagebottom.jsp"%>