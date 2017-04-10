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
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<link href="${pageContext.request.contextPath}/css/font-awesome.min.css" rel="stylesheet">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<script src="${pageContext.request.contextPath}/jquery/jquery-3.1.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<style type="text/css">
body {
	padding-top: 100px;
}

#nav_top {
	background-color: #5cd484;
}
</style>
</head>
<body>

	<!-- container-fluid 꽉차게 하는거 -->
	<div class="container">
		<nav class="navbar navbar-default navbar-fixed-top" role="navigation" id="nav_top">
			<!-- 모바일 화면에서 사이트 로고가 들어가는 부분과 모바일 상태에서 아이콘 처리하는 부분 -->
			<div class="navbar-header col-sm-1.5">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-ex1-collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#" style="color: white; font-weight: bolder; font-size: 2EM;">YOLO </a>
			</div>
			<!-- 데스트탑에서 메뉴가 나오는 부분-->
			
			<div class="collapse navbar-collapse navbar-ex1-collapse col-sm-6">
				<form class="navbar-form navbar-left" role="search">
					<div class="form-group">
						<input type="text" class="form-control" placeholder="Search">					
					</div>					
				</form>
				<a href="#" ><i class="fa fa-search" aria-hidden="true" style="color: white; font-size: 1.5em; padding-top: 12px;"></i></a>
			</div>
			
			<!-- /.navbar-collapse -->
		</nav>
		</div>
</body>
</html>