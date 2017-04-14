<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Continuous scrolling - fullPage.js</title>
<meta name="author" content="Matthew Howell" />
<meta name="description" content="fullPage continuous scrolling demo." />
<meta name="keywords"
	content="fullpage,jquery,demo,scroll,loop,continuous" />
<meta name="Resource-type" content="Document" />


<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/jquery.fullpage.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/examples.css" />


<!--[if IE]>
		<script type="text/javascript">
			 var console = { log: function() {} };d
		</script>
	<![endif]-->

<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.9.1/jquery-ui.min.js"></script>

<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/scrolloverflow.js"></script>

<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery.fullpage.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/examples.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/css/bootstrap.min.css"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">

<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

<script type="text/javascript">
	$(document).ready(
			function() {
				$('#fullpage').fullpage(
						{
							/* sectionsColor : [ '#1bbc9b', '#4BBFC3', '#7BAABE',
									'whitesmoke', '#ccddff' ], */
							anchors : [ 'firstPage', 'secondPage', '3rdPage',
									'4thpage', '444' ],
							menu : '#menu',
							continuousVertical : true
						});
			});
</script>
<style type="text/css">
#catesub {
	color: gray;
	border: 1px solid silver;
	margin-right: 20px;
	float: left;
	padding: 5px;
}
.panelpanel-defaultcol-sm-2{
	margin-right: 30px;
}
</style>

</head>
<body>

	<ul id="menu">
		<li data-menuanchor="firstPage" class="active"><a
			href="#firstPage">카테고리 설정</a></li>
		<li data-menuanchor="secondPage"><a href="#secondPage">기본설정</a></li>
		<li data-menuanchor="3rdPage"><a href="#3rdPage">부가정보</a></li>
		<li data-menuanchor="4thpage"><a href="#4thpage">부가정보444</a></li>
	</ul>

	<div id="fullpage">
		<!--기본설정  -->
		<div class="section " id="section0">
			<h4>클래스 기본정보를 입력해 주세요.</h4>
			<p>대표할 카테고리는 무엇인가요?</p>
			<div class="container">
				<div class="panel-group" id="accordion" role="tablist"
					aria-multiselectable="true">
					<div class="panel panel-default col-sm-2">
						<div class="panel-heading" role="tab" id="headingOne">
							<h4 class="panel-title">
								<a data-toggle="collapse" data-parent="#accordion"
									href="#collapseOne" aria-expanded="true"
									aria-controls="collapseOne"> 라이프스타일 </a>
							</h4>
						</div>
						<div id="collapseOne" class="panel-collapse collapse in"
							role="tabpanel" aria-labelledby="headingOne">
							<div class="panel-body">
								<div class="btn-group" data-toggle="buttons">
									<label class="btn btn-link "> <input type="checkbox"
										autocomplete="off"> # 독서/글쓰기
									</label> <label class="btn btn-link"> <input type="checkbox"
										autocomplete="off"> # 봉사활동
									</label> <label class="btn btn-link"> <input type="checkbox"
										autocomplete="off"> # 바리스타/바텐더
									</label> <label class="btn btn-link"> <input type="checkbox"
										autocomplete="off"> # 반려동물
									</label> <label class="btn btn-link"> <input type="checkbox"
										autocomplete="off"> # 사진/영상
									</label> <label class="btn btn-link"> <input type="checkbox"
										autocomplete="off"> # 요리/베이킹
									</label> <label class="btn btn-link"> 
									<input type="checkbox"
										autocomplete="off"> # 라이프스타일 기타
									</label>
								</div>
							</div>
						</div>
					</div>
					<div class="panel panel-default col-sm-2">
						<div class="panel-heading" role="tab" id="headingTwo">
							<h4 class="panel-title">
								<a class="collapsed" data-toggle="collapse"
									data-parent="#accordion" href="#collapseTwo"
									aria-expanded="false" aria-controls="collapseTwo">
									외국어</a>
							</h4>
						</div>
						<div id="collapseTwo" class="panel-collapse collapse"
							role="tabpanel" aria-labelledby="headingTwo">
							<div class="panel-body">
							<div class="btn-group" data-toggle="buttons">
									<label class="btn btn-link "> <input type="checkbox"
										autocomplete="off"> # 독서/글쓰기
									</label> <label class="btn btn-link"> <input type="checkbox"
										autocomplete="off"> # 봉사활동
									</label> <label class="btn btn-link"> <input type="checkbox"
										autocomplete="off"> # 바리스타/바텐더
									</label> <label class="btn btn-link"> <input type="checkbox"
										autocomplete="off"> # 반려동물
									</label> <label class="btn btn-link"> <input type="checkbox"
										autocomplete="off"> # 사진/영상
									</label> <label class="btn btn-link"> <input type="checkbox"
										autocomplete="off"> # 요리/베이킹
									</label> <label class="btn btn-link"> 
									<input type="checkbox"
										autocomplete="off"> # 라이프스타일 기타
									</label>
								</div>
							</div>
						</div>
					</div>
					<div class="panel panel-default col-sm-2">
						<div class="panel-heading" role="tab" id="headingThree">
							<h4 class="panel-title">
								<a class="collapsed" data-toggle="collapse"
									data-parent="#accordion" href="#collapseThree"
									aria-expanded="false" aria-controls="collapseThree">
									디자인/미술</a>
							</h4>
						</div>
						<div id="collapseThree" class="panel-collapse collapse"
							role="tabpanel" aria-labelledby="headingThree">
							<div class="panel-body">
							<div class="btn-group" data-toggle="buttons">
									<label class="btn btn-link "> <input type="checkbox"
										autocomplete="off"> # 독서/글쓰기
									</label> <label class="btn btn-link"> <input type="checkbox"
										autocomplete="off"> # 봉사활동
									</label> <label class="btn btn-link"> <input type="checkbox"
										autocomplete="off"> # 바리스타/바텐더
									</label> <label class="btn btn-link"> <input type="checkbox"
										autocomplete="off"> # 반려동물
									</label> <label class="btn btn-link"> <input type="checkbox"
										autocomplete="off"> # 사진/영상
									</label> <label class="btn btn-link"> <input type="checkbox"
										autocomplete="off"> # 요리/베이킹
									</label> <label class="btn btn-link"> 
									<input type="checkbox"
										autocomplete="off"> # 라이프스타일 기타
									</label>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="section" id="section1">
			<div class="intro">
				<h1>Around the world scrolling</h1>
				<p>Go to the first section and scroll up or to the last one and
					scroll down to see how it works.</p>
			</div>
		</div>
		<div class="section" id="section2">
			<div class="intro">
				<h1>Scroll Down</h1>
				<p>And it will animate down to the first section</p>
			</div>
		</div>
		<div class="section" id="section3">
			<div class="intro">
				<h1>Scroll Down4444</h1>
				<p>And it will animate down to the first section</p>
			</div>
		</div>
	</div>

</body>
</html>