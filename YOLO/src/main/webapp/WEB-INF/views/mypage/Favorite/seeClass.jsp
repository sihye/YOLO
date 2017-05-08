<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="mypageFavoritetop.jsp"%>
<script type="text/javascript">
function delNoFunc(delNo) { 
	if (confirm("선택한 클래스 삭제하시겠습니까?") == true){    //확인
		location.href='<c:url value="/mypage/Favorite/seeClassdeleteNo.do?cNo='+delNo+'" />';
    }else{   //취소
        return;
    }
}
function delFunc() { 
	if (confirm("모든 최근 본 클래스가 삭제됩니다. 정말 삭제하시겠습니까?") == true){    //확인
		location.href='<c:url value="/mypage/Favorite/seeClassdelete.do" />';
    }else{   //취소
        return;
    }
	
} 

</script>
<div class="col-md-10">
	<ul class="nav nav-tabs nav-justified">
		<li><a href='<c:url value="/mypage/Favorite/FavoriteClass.do"/>'>관심클래스</a></li>
		<li><a href='<c:url value="/mypage/Favorite/Favoritehost.do"/>'>관심호스트</a></li>
		<li class="active"><a
			href='<c:url value="/mypage/Favorite/seeClass.do"/>'>최근 본 클래스</a></li>
	</ul>
	<br>
	<h2>최근 본 클래스</h2>
	<br>
	<form method="post">
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
						<td><a href='<c:url value="/class/claDetail.do?cNo=${vo.cNo }"/>'>${vo.cName }</a></td>
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
<%@ include file="../mypagebottom.jsp"%>