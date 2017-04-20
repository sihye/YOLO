<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="mypagemessagetop.jsp"%>
			<div class="col-md-10">
				<ul class="nav nav-tabs nav-justified">
					<li><a href='<c:url value="/mypage/message/messageSend.do"/>'>쪽지보내기</a></li>
					<li class="active"><a href='<c:url value="/mypage/message/sendbox.do"/>'>보낸쪽지함</a></li>
					<li><a href='<c:url value="/mypage/message/getbox.do"/>'>받은쪽지함</a></li>
					
				</ul>
			</div>
<%@ include file="../mypagebottom.jsp"%>