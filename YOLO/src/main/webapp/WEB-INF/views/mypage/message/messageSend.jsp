<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="mypagemessagetop.jsp"%>
			<div class="col-md-10">
				<ul class="nav nav-tabs nav-justified">
					<li class="active"><a href='<c:url value="/mypage/message/messageSend.do"/>'>쪽지보내기</a></li>
					<li><a href='<c:url value="/mypage/message/messageCheck.do"/>'>쪽지확인하기</a></li>		
				</ul>
			</div>
<%@ include file="../mypagebottom.jsp"%>