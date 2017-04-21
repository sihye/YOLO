<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>test1</title>
<!-- ckeditor -->
<script src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>
<!-- Bootstrap -->
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/bootstrap-select.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/woocommerce-FlexSlider-0690ec2/flexslider.css"
	type="text/css">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<script
	src="${pageContext.request.contextPath}/jquery/jquery-3.1.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
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
body {
	padding-top: 100px;
}

#nav_top {
	background-color: #337ab7;
}

footer {
	background-color: #3a3a3a;
	text-align: center;
}

.text-center {
	text-decoration: none;
}

.footerText {
	color: #9a9a9a;
}

.dropdown {
	
}

#nav_top {
	margin-bottom: 0;
}

.flex-viewport {
	height: 550px;
	position: relative;
}

.img-circle {
	width: 40px;
	height: 40px;
	margin-top: 10px;
}

#login {
	clear: both;
}
</style>
</head>
<body>
	<!-- container-fluid 꽉차게 하는거 -->
	<div class="container">
		<!-- top nav 로고, 검색, 로그인 -->
		<nav class="navbar navbar-default navbar-fixed-top" role="navigation"
			id="nav_top">
			<!-- 모바일 화면에서 사이트 로고가 들어가는 부분과 모바일 상태에서 아이콘 처리하는 부분 -->
			<div class="navbar-header col-sm-1.5">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-ex1-collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="${pageContext.request.contextPath}/index.do"
					style="color: white; font-weight: bolder; font-size: 2EM;">YOLO
				</a>
			</div>
			<!-- 데스트탑에서 메뉴가 나오는 부분-->
			<div class="collapse navbar-collapse navbar-ex1-collapse col-sm-6">
				<form class="navbar-form navbar-left" role="search">
					<div class="input-group custom-search-form">
						<input type="text" class="form-control"
							placeholder="Class Search..."> <span
							class="input-group-btn">
							<button class="btn btn-default" type="button">
								<i class="fa fa-search" style="color: gray"></i>
							</button>
						</span>
					</div>
				</form>
			</div>
			<!-- 로그인부분 -->
			<!-- 로그인 전 -->
			<c:if test="${empty sessionScope.userid }">
				<div class="navbar-collapse collapse" id="navbar-collapse-content">
					<ul class="nav navbar-nav navbar-right"
						style="padding-right: 100px; color: white;">

						<li><a href="${pageContext.request.contextPath}/login/login.do" 
							style="color: white; font-weight: bolder; font-size: 1.3EM;">로그인</a></li>

						<li><a href="${pageContext.request.contextPath}/member/register.do"" style="color: white; 
						font-weight: bolder; font-size: 1.3EM;">회원 가입</a></li>


					</ul>
				</div>
	</div>
	</c:if>
	<!-- 로그인 후 -->
			<c:if test="${!empty sessionScope.userid }">
				<img src="${pageContext.request.contextPath}/img/0M0B0169.jpg"
					alt="마이프로필" class="img-circle">
				<div class="dropdown " id="login" style="width: 200px; margin: 0;padding-left: 30px">
					<a data-toggle="dropdown" href="#" style="color: white;"> ${sessionScope.userName} 님</a>
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
				</div>
			</c:if>
	</div>

	<!-- /.navbar-collapse -->
	</nav>
	</div>