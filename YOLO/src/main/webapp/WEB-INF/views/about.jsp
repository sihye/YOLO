<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="inc/top.jsp"%>

<style>

.mainImg{
	background-image: url("<c:url value='/img/mug_obj.jpg'/>");
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
	padding-left: 29%;
}

</style>

<!-- 헤더 이미지 -->
<div class="mainImg">
	
	<!-- 헤더 위에 기본정보 -->
	<div id="onHeader" style="padding-top: 5%;">
				
				<h1 style="color: white; font-size: 50px; padding-left: 37%; letter-spacing:1px;">You Only Live Once!!</h1><br>
				<span style="color: white; font-size: 50px; padding-left: 38%;">YOLO를 소개합니다</span>
		
	</div>

</div>

<br>
<div class="about1">
	<span style="font-size: 30px; padding-left: 130px">YOLO는 여러분의 취미와 스터디를 위한</span><br>
	<span style="font-size: 30px; padding-left: 200px">원데이 클래스 사이트 입니다.</span><br><br>
	<span style="font-size: 28px;">원데이 클래스,YOLO와 함께!</span><br>
	<img src="${pageContext.request.contextPath}/img/about.jpg">
</div>

<div>
	<img src="${pageContext.request.contextPath}/img/20170502_184646.png" width="2000" height="400">
</div>

<div class="mainImg1">
	
	<!-- 헤더 위에 기본정보 -->
	<div id="onHeader">
				
				<h1 style="color: white; font-size: 40px; padding-left: 35%; padding-top: 8%;">Hobby & Study 컨넥팅 서비스</h1><br><br><br>
				<span style="color: white; font-size: 20px; padding-left: 35%; padding-top: 30%">모든 클래스를 한 곳에 모아서 찾아 볼 수 있는 서비스입니다.</span><br>
				<span style="color: white; font-size: 20px; padding-left: 28%; padding-top: 17%">자기개발에서 취미, 취업, 외국어, 전문지식까지 그 어떤 스터디도 YOLO에서 함께하세요.</span>
	</div>

</div>

	<%@ include file="inc/bottom.jsp"%>