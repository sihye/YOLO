<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="mypageFavoritetop.jsp"%>

<script type="text/javascript">
function delNoFunc(delNo) { 
	if(delNo==undefined){
		alert("삭제할 호스트 선택해주세요");
		return;
	}
	if (confirm("선택한 호스트 삭제하시겠습니까?") == true){    //확인
		location.href='<c:url value="/mypage/Favorite/FollowDelete.do?flNo='+delNo+'&viewName=mypage" />';
    }else{   //취소
        return;
    }
}
function pageFunc(curPage){
	document.frmPage.currentPage.value=curPage;
	frmPage.submit();
}

</script>
<!-- 페이징 처리를 위한 form 태그 -->
<form name="frmPage" method="post"
	action='<c:url value="/mypage/Favorite/Favoritehost.do?flNo=${param.flNo }&flUserid=${param.flUserid }"/>'>
	<input type="hidden" name="currentPage">
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
				<th>전체(${fn:length(alist)})
					<button onclick="delNoFunc(${param.flNo})" style="float: right;"
						id="btDelete" class="btn btn-primary btn-xs" type="button">삭제</button>
				</th>
			</tr>
			<tr>
				<td>
					<ul class="nav nav-pills" id="ul1">
						<c:if test="${empty alist}">
								<p>등록된 호스트가 없습니다</p>
						</c:if>
						<c:set var="i" value="0" />
						<c:forEach var="alist" items="${alist }">		
							<li id="li${i }" role="presentation" style="width: 19.5%;">	
							 	 <a href='<c:url value="/mypage/Favorite/Favoritehost.do?flNo=${alist.flNo }
									&flUserid=${alist.flUserid }"/>'>${alist.flUserid }
								</a>
							</li>
							<c:set var="i" value="${i+1}" />
						</c:forEach>					
					</ul>
				</td>
			</tr>
		</thead>
	</table>
	<c:if test="${empty classList}">
		<h2>선택 호스트 클래스(${param.flUserid })</h2>
	<br>	
		<p>등록된 클래스가 없습니다</p>
	</c:if>
	
	<c:if test="${!empty classList}">
	<h2>선택 호스트 클래스(${param.flUserid })</h2>
	<br>
	<form method="post"
		action='<c:url value="/mypage/Favorite/Favoritehost.do" />'>
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
				<c:forEach var="map" items="${classList }">
				<tr>
					<td><a href='<c:url value="/class/claDetail.do?cNo=${map['C_NO'] }"/>'>${map["C_NAME"] }</a></td>
					<td>${map["C_PLACE"] }</td>
					<td>${map["C_PRICE"] }</td>
					<td>${map["C_PAYMENTWAY"] }</td>
				</tr>
				</c:forEach>

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
	</c:if>
</div>
<%@ include file="../mypagebottom.jsp"%>