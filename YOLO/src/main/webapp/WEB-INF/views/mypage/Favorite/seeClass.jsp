<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="mypageFavoritetop.jsp"%>
			<div class="col-md-10">
				<ul class="nav nav-tabs nav-justified">
					<li><a href='<c:url value="/mypage/Favorite/FavoriteClass.do"/>'>관심클래스</a></li>
					<li><a href='<c:url value="/mypage/Favorite/Favoritehost.do"/>'>관심호스트</a></li>
					<li class="active"><a href='<c:url value="/mypage/Favorite/seeClass.do"/>'>최근 본 클래스</a></li>
				</ul>
			</div>
<%@ include file="../mypagebottom.jsp"%>