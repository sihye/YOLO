<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="inc/top.jsp"%>

<style>

.mainImg{
	background-image: url("<c:url value='/img/K.jpg'/>"); 
	background-repeat: no-repeat;
	height: 350px;
	background-size: 100%;
}

.mainImg1{
	background-image: url("<c:url value='/img/mug.jpg'/>");
	background-repeat: no-repeat;
	height: 400px;
	background-size: 100%;
}
.about1{
	padding-left: 26%;
}

</style>

<div class="mainImg">
	
	<!-- 헤더 위에 기본정보 -->
	<div id="onHeader" style="padding-top: 7%;">
				<span style="color: white; font-size: 60px; padding-left: 40%;">찾아오시는 길</span>
	</div>

</div>

<div class="contact"style="padding-left: 29%">
	<br>
	<img src="${pageContext.request.contextPath}/img/contact.jpg">
</div>

<%@ include file="inc/bottom.jsp"%>