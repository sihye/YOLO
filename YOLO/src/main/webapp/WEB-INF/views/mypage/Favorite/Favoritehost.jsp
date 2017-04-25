<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="mypageFavoritetop.jsp"%>
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
				<th>전체</th>
			</tr>
			<tr>
				<td>
					<ul class="nav nav-pills">
						<li role="presentation" class="active" style="width: 19%"><a href="#">Home</a></li>
						<li role="presentation" style="width: 19%"><a href="#">Profile</a></li>	
					</ul>
				</td>
			</tr>
		</thead>
		<tbody>
		</tbody>
		<tfoot>
		</tfoot>
	</table>
</div>


<%@ include file="../mypagebottom.jsp"%>