<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../../inc/top.jsp" %>
<link rel="stylesheet" type="text/css" href='<c:url value="/css/mypage.css" />'>
	<div class="container" style="margin-top: 40px;">
		<div class="row">
			<div class="col-md-2">
				<ul class="nav nav-pills nav-stacked">
					<li><a href='<c:url value="/mypage/Favorite/FavoriteClass.do"/>'>나의관심</a></li>
					<li><a href='<c:url value="/mypage/MyClass/HostClass.do"/>'>나의클래스</a></li>
					<li><a href='<c:url value="/mypage/Mybbs/qnaboard.do"/>'>내가쓴글</a></li>				
					<li class="active"><a href='<c:url value="/mypage/message/messageSend.do"/>'>쪽지함</a></li>					
					<li><a href='<c:url value="/mypage/myedit/myedit.do"/>'>회원정보수정</a></li>
				</ul>
			</div>