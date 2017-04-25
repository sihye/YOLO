<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="mypageFavoritetop.jsp"%>

<script type="text/javascript">
function delNoFunc(delNo) { 
	location.href='<c:url value="/mypage/Favorite/FollowDelete.do?flNo='+delNo+'" />';
}
</script>
<!-- 페이징 처리를 위한 form 태그 -->
<form name="frmPage" method="post"
	action='<c:url value="/mypage/Favorite/FavoriteClass.do" />'>
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
		<li class="active"><a
			href='<c:url value="/mypage/Favorite/Favoritehost.do"/>'>관심호스트</a></li>
		<li><a href='<c:url value="/mypage/Favorite/seeClass.do"/>'>최근
				본 클래스</a></li>
	</ul>
	<br>
	<h2>관심호스트</h2>
	<br>
	<table class="table table-bordered">
		<thead>
			<tr>
				<th>전체(${fn:length(alist)})</th>
			</tr>
			<tr>
				<td>
					<ul class="nav nav-pills" id="ul1">
						<c:set var="i" value="0" />
						<c:forEach var="alist" items="${alist }">
							<li role="presentation" style="width: 19.5%;">
							<a href="#">${alist.flWuserid }<button onclick="delNoFunc(${alist.flNo})"
										style="float: right;" id="btDelete"
										class="btn btn-primary btn-xs" type="button">삭제</button></a>
									
							</li>
							<c:set var="i" value="${i+1}" />
						</c:forEach>
					</ul>
				</td>
			</tr>
		</thead>
	</table>
	<h2>선택 호스트 클래스</h2>

	<br>
	<form method="post"
		action='<c:url value="/mypage/Favorite/FavoriteClass.do" />'>
		<table class="table table-hover">
			<thead>
				<tr>

					<th width="25%">클래스명</th>
					<th width="25%">장소</th>
					<th width="25%">가격</th>
					<th width="25%">결제방법</th>

				</tr>
			</thead>
			<tbody>
				<%-- <c:forEach var="map" items="${alist }">
				<tr>
					<td><a href='<c:url value="/class/claDetail.do?cNo=${map['C_NO'] }"/>'>${map["C_NAME"] }</a></td>
					<td>${map["C_PLACE"] }</td>
					<td>${map["C_PRICE"] }</td>
					<td>${map["C_PAYMENTWAY"] }</td>
					<td>${map["SC_REGDATE"] }</td>
				</tr>
				</c:forEach> --%>

			</tbody>
			<tfoot>

			</tfoot>
		</table>
	</form>
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

</div>


=======
			<div class="col-md-10">
				<ul class="nav nav-tabs nav-justified">
					<li><a href='<c:url value="/mypage/Favorite/FavoriteClass.do"/>'>관심클래스</a></li>
					<li class="active"><a href='<c:url value="/mypage/Favorite/Favoritehost.do"/>'>관심호스트</a></li>
					<li><a href='<c:url value="/mypage/Favorite/seeClass.do"/>'>최근 본 클래스</a></li>
				</ul>
			</div>
>>>>>>> branch 'master' of https://github.com/sihye/YOLO.git
<%@ include file="../mypagebottom.jsp"%>