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
	<span style="font-size: 28px;">원데이 클래스,YOLO와 함께!</span><br>
	<img src="${pageContext.request.contextPath}/img/about1.jpg">
</div>



	<%@ include file="inc/bottom.jsp"%>