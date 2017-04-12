<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="inc/top.jsp" %>
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
<%@ include file="inc/bottom.jsp" %>
</body>
</html>