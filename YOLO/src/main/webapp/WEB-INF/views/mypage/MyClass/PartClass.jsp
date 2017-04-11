<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="mypageMyClasstop.jsp"%>
			<div class="col-md-10">
				<ul class="nav nav-tabs nav-justified">
					<li><a href='<c:url value="/mypage/MyClass/HostClass.do"/>'>주최클래스</a></li>
					<li class="active"><a href='<c:url value="/mypage/MyClass/PartClass.do"/>'>참여클래스</a></li>
					<li><a href='<c:url value="/mypage/MyClass/Payment.do"/>'>결제내역</a></li>
				</ul>
			</div>
<%@ include file="../mypagebottom.jsp"%>