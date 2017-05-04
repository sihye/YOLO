<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="inc/top.jsp"%>

<style>

.mainImg{
	background-image: url("<c:url value='/img/about3.jpg'/>");
	background-repeat: no-repeat;
	height: 500px;
	background-size: 100%;
}

.mainImg1{
	background-image: url("<c:url value='/img/about2.jpg'/>");
	background-repeat: no-repeat;
	height: 500px;
	background-size: 100%;
}
.about1{
	padding-left: 24%;
}

</style>

<!-- 헤더 이미지 -->
<div class="mainImg">
	
	<!-- 헤더 위에 기본정보 -->
	<div id="onHeader" style="padding-top: 7%;">
				
				<h1 style="color: white; font-size: 80px; padding-left: 28%; ">You Only Live Once!!</h1><br>
				<span style="color: white; font-size: 80px; padding-left: 28%;">YOLO를 소개합니다</span>
		
	</div>

</div>

<br>
<div class="about1">
	<span style="font-size: 36px; padding-left: 80px">YOLO는 여러분의 취미와 스터디를 위한</span><br>
	<span style="font-size: 36px; padding-left: 160px">원데이 클래스 사이트 입니다.</span><br><br>
	<span style="font-size: 28px;">추천 원데이 클래스</span><br>
	<img src="${pageContext.request.contextPath}/img/a2.jpg">
</div>

<div>
	<img src="${pageContext.request.contextPath}/img/20170502_184646.png" width="2000" height="400">
</div>

<div class="mainImg1">
	
	<!-- 헤더 위에 기본정보 -->
	<div id="onHeader">
				
				<h1 style="color: white; font-size: 40px; padding-left: 35%; padding-top: 8%;">Hobby & Study 컨넥팅 서비스</h1><br><br><br>
				<span style="color: white; font-size: 20px; padding-left: 35%; padding-top: 30%">모든 클래스를 한 곳에 모아서 찾아 볼 수 있는 서비스입니다.</span><br>
				<span style="color: white; font-size: 20px; padding-left: 30%; padding-top: 20%">자기개발에서 취미, 취업, 외국어, 전문지식까지 그 어떤 스터디도 YOLO에서 함께하세요.</span>
	</div>

</div>

	<%@ include file="inc/bottom.jsp"%>