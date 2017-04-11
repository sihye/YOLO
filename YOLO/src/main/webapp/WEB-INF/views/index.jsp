<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>test1</title>

<!-- Bootstrap -->
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css"
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
	background-color: #5cd484;
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
				<a class="navbar-brand" href="#"
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
			<div class="col-md-5 col-md-offset-2"></div>
			<!-- 로그인부분 -->
			<div class="collapse navbar-collapse navbar-ex1-collapse col-sm-1"
				style="margin-right: 20px; margin-top: 13px; font-size: 1.05em; font-weight: bold; color: white;">
				<span>로그인</span>
			</div>
			<div class="collapse navbar-collapse navbar-ex1-collapse col-sm-1"
				style="margin-right: 20px; margin-top: 13px; font-size: 1.05em; font-weight: bold; color: white;">
				<span>회원가입</span>
			</div>
			<!-- /.navbar-collapse -->
		</nav>
	</div>

	<div class="flexslider">
		<ul class="slides">
			<li><img
				src="${pageContext.request.contextPath}/img/index2 (1).jpg" /></li>
			<li><img src="${pageContext.request.contextPath}/img/index1.jpg" /></li>
			<li><img
				src="${pageContext.request.contextPath}/img/0M0B0169.jpg" /></li>
		</ul>
	</div>
	<!-- 분류카테고리 -->
	<div class="container">
		<div class="row">
			<div class="col-md-3"></div>
			<div class="col-md-1 dropdown"></div>
			<div class="col-md-1 dropdown"></div>
			<div class="col-md-1 dropdown"></div>
			<div class="col-md-1 dropdown"></div>
			<div class="col-md-1 dropdown"></div>
			<div class="col-md-1 dropdown"></div>
			<div class="col-md-3"></div>
		</div>
	</div>
	<div class="container">
		<div class="col-md-2"></div>
		<div class="dropdown">
			<ul class="nav nav-pills">
				<li class="dropdown col-md-2"><a data-toggle="dropdown"
					href="#">라이프스타일<span class="caret"></span></a>
					<ul class="dropdown-menu" role="menu">
						<li><a role="menuitem" href="#">독서/글쓰기</a></li>
						<li><a role="menuitem" href="#">사진/영상</a></li>
						<li><a role="menuitem" href="#">요리/베이킹</a></li>
						<li><a role="menuitem" href="#">분리된 메뉴 </a></li>
					</ul></li>
				<li class="dropdown col-md-2"><a data-toggle="dropdown"
					href="#">어학<span class="caret"></span></a>
					<ul class="dropdown-menu" role="menu">
						<li><a role="menuitem" href="#">메뉴 1</a></li>
						<li><a role="menuitem" href="#">메뉴 2</a></li>
						<li><a role="menuitem" href="#">메뉴 3</a></li>
						<li><a role="menuitem" href="#">분리된 메뉴 </a></li>
					</ul></li>
				<li class="dropdown col-md-2"><a data-toggle="dropdown"
					href="#">뷰티<span class="caret"></span></a>
					<ul class="dropdown-menu" role="menu">
						<li><a role="menuitem" href="#">메뉴 1</a></li>
						<li><a role="menuitem" href="#">메뉴 2</a></li>
						<li><a role="menuitem" href="#">메뉴 3</a></li>
						<li><a role="menuitem" href="#">분리된 메뉴 </a></li>
					</ul></li>
				<li class="dropdown col-md-2"><a data-toggle="dropdown"
					href="#">여기클릭 <span class="caret"></span>
				</a>
					<ul class="dropdown-menu" role="menu">
						<li><a role="menuitem" href="#">메뉴 1</a></li>
						<li><a role="menuitem" href="#">메뉴 2</a></li>
						<li><a role="menuitem" href="#">메뉴 3</a></li>
						<li><a role="menuitem" href="#">분리된 메뉴 </a></li>
					</ul></li>
			</ul>
		</div>
		<div class="col-md-2"></div>
	</div>
	
	<div class="container">
	<!-- 게시판 반복~! -->
		<div class="row">
			<div class="col-sm-6 col-md-3">
				<div class="thumbnail">
					<img src="DSC_6305.jpg" alt="...">
					<div class="caption">
						<h3>제목</h3>
						<p>내용도 넣을 수 있다.</p>
						<p>
							<a href="#" class="btn btn-primary" role="button">Button</a> <a
								href="#" class="btn btn-default" role="button">Button</a>
						</p>
					</div>
				</div>
			</div>
		</div>
		
	</div>

	<!-- bottom -->
	<footer>
		<div>
			<div id="footer-menu">
				<a href="#" class="text-center">서비스 소개</a> <a href="#"
					class="text-center">뉴스</a> <a href="#" class="text-center">이용안내</a>
				<a href="#" class="text-center">개인정보 취급방침</a> <a href="#"
					class="text-center">이용약관</a>
			</div>

			<div>
				<a href="#" target="_blank"> <img
					src="http://moccozy.blob.core.windows.net/icon/icon_facebook.png"
					width="35" height="32" class="socialIcon m-sm" />
				</a> <a href="#" target="_blank"> <img
					src="http://moccozy.blob.core.windows.net/icon/icon_Instagram.png"
					width="35" height="35" class="socialIcon m-sm" />
				</a> <a href="#" target="_blank"> <img
					src="http://moccozy.blob.core.windows.net/icon/icon_blog.png"
					width="35" height="36" class="socialIcon m-sm" />
				</a>
			</div>

			<div class="footerText">
				회사명 : YOLO &nbsp;|&nbsp; 대표 : 최한교 &nbsp;|&nbsp; 개인정보책임자 : 조장원
				&nbsp;|&nbsp; 주소 : 경기도 성남시 중원구 둔촌대로 474, 3층 303호<br /> 사업자번호 :
				169-23-00157 &nbsp;|&nbsp; 통신판매업 : 제 2016-성남중원-0001 호 &nbsp;|&nbsp;
				고객센터 : 070-7122-9970, 010-2604-4584&nbsp;<br /> YOLO는 통신판매중개자이며
				통신판매의 당사자가 아닙니다. 따라서 YOLO는 상품·거래정보 및 거래에 대하여 책임을 지지 않습니다.
			</div>
		</div>
	</footer>
</body>
</html>