<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="mypageFavoritetop.jsp"%>
<script type="text/javascript">
function delNoFunc(delNo) { 
	location.href='<c:url value="/mypage/Favorite/seeClassdeleteNo.do?cNo='+delNo+'" />';
}
function delFunc() { 
	location.href='<c:url value="/mypage/Favorite/seeClassdelete.do" />';
} 
function pageFunc(curPage){
	document.frmPage.currentPage.value=curPage;
	frmPage.submit();
}

</script>
<!-- 페이징 처리를 위한 form 태그 -->
<form name="frmPage" method="post"
	action='<c:url value="/mypage/Favorite/seeClass.do" />'>
	<input type="hidden" name="currentPage"> <input type="hidden"
		name="searchCondition" value="${param.searchCondition }"> <input
		type="hidden" name="searchKeyword" value="${param.searchKeyword}">
	<input type="hidden" name="searchStartDate"
		value="${param.searchStartDate}"> <input type="hidden"
		name="searchEndDate" value="${param.searchEndDate}">
</form>
<div class="col-md-10">
	<ul class="nav nav-tabs nav-justified">
		<li><a href='<c:url value="/mypage/Favorite/FavoriteClass.do"/>'>관심클래스</a></li>
		<li><a href='<c:url value="/mypage/Favorite/Favoritehost.do"/>'>관심호스트</a></li>
		<li class="active"><a
			href='<c:url value="/mypage/Favorite/seeClass.do"/>'>최근 본 클래스</a></li>
	</ul>
	<br> <br>
	<h2>최근 본 클래스</h2>

	<br>
	<form method="post"
		action='<c:url value="/mypage/Favorite/FavoriteClass.do" />'>
		<table class="table table-hover">
			<thead>
				<tr>

					<th width="20%">클래스명</th>
					<th width="20%">장소</th>
					<th width="20%">가격</th>
					<th width="20%">결제방법</th>
					<th width="20%">호스트</th>

				</tr>
			</thead>
			<tbody>
				<c:forEach var="vo" items="${alist }">
					<tr>
						<td>${vo.cName }</td>
						<td>${vo.cPlace }</td>
						<td>${vo.cPrice }</td>
						<td>${vo.cPaymentway }</td>
						<td>${vo.mUserid }</td>
						<td><button id="del" class="btn btn-primary" type="button"
								onclick="delNoFunc(${vo.cNo})">삭제</button></td>
					</tr>
				</c:forEach>

			</tbody>
			<tfoot>
				<tr>
					<td colspan="6" style="text-align: center">
						<button id="alldel" class="btn btn-primary" type="button"
							onclick="delFunc()">최근 본 상품 비우기</button>
					</td>
				</tr>
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