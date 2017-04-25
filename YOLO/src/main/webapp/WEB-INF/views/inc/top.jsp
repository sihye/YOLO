<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta charset="utf-8">
		
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/sihye/reset.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/sihye/responsive.css">

	<script type="text/javascript" src="${pageContext.request.contextPath}/js/sihye/jquery.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/sihye/main.js"></script>
	<!-- ckeditor -->
	<script src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>
	<!-- Bootstrap -->
	<link href="${pageContext.request.contextPath}/css/bootstrap.min.css"
		rel="stylesheet">
	<link rel="stylesheet"
		href="${pageContext.request.contextPath}/woocommerce-FlexSlider-0690ec2/flexslider.css"
		type="text/css">
	<link rel="stylesheet"
		href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/woocommerce-FlexSlider-0690ec2/jquery.flexslider-min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('.flexslider').flexslider({
			animation : "slide"
		});

	})
</script>
<style type="text/css">
#SEARCHDIV{
	border: 1PX solid white;
}
</style>
<title>:: YOLO ::</title>
</head>
<body>
<section class="hero">
 <header>
	<div class="wrapper">
		<a href="${pageContext.request.contextPath}/index2.do" class="logo" style="font-size: 30px;">YOLO</a>
		
		<a href="#" class="hamburger"></a>	
		
			
		<nav>
		
		<ul>
			<!-- 상단 네비 -->
			
			<li><a href="#">About</a></li>
			<li><a href="#">Notice</a></li>
			<li><a href="#">Guide</a></li>
			<li><a href="#">Contact</a></li>
		</ul>
		
		<!-- 로그인 전 --> 
		<c:if test="${empty sessionScope.userid }">
			<a href="${pageContext.request.contextPath}/login/login.do"
				class="login_btn">Login</a>
			<a href="${pageContext.request.contextPath}/member/register.do"
				class="login_btn">Join</a>	
			
		</c:if> 
		<!-- 로그인 후 -->
		<c:if test="${!empty sessionScope.userid }">
			
			<a href="${pageContext.request.contextPath}/member/memberEdit.do"
				class="login_btn">회원탈퇴</a>
			<a class="dropdown">
			<a data-toggle="dropdown" href="#" style="color: white;" class="login_btn"> ${sessionScope.userName} 님</a>
					<ul class="dropdown-menu" role="menu">
						<li role="presentation"><a role="menuitem" tabindex="-1"
							href="${pageContext.request.contextPath}/mypage/Favorite/FavoriteClass.do">마이페이지</a></li>
						<li role="presentation"><a role="menuitem" tabindex="-1"
							href="#">쪽지함</a></li>
						<li role="presentation" class="divider"></li>
						<li role="presentation"><a role="menuitem" tabindex="-1" 
						href="${pageContext.request.contextPath}/login/logout.do">로그아웃</a></li>
						<li role="presentation"><a role="menuitem" tabindex="-1" 
						href="${pageContext.request.contextPath}/member/memberOut.do">회원탈퇴</a></li>
					</ul>
				</a>
		</c:if> 
		 </nav>
	</div>

</header><!--  end header section  -->
