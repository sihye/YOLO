<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>관리자 메인</title>
<!-- Bootstrap Core CSS -->
<!--     <link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet"> -->
<link
	href="<c:url value='../startbootstrap-sb-admin-2-gh-pages/vendor/bootstrap/css/bootstrap.min.css'/>"
	rel="stylesheet">


<!-- MetisMenu CSS -->
<!--   <link href="../vendor/metisMenu/metisMenu.min.css" rel="stylesheet"> -->
<link
	href="<c:url value='../startbootstrap-sb-admin-2-gh-pages/vendor/metisMenu/metisMenu.min.css'/>"
	rel="stylesheet">

<!-- Custom CSS -->
<!--  <link href="../dist/css/sb-admin-2.css" rel="stylesheet"> -->
<link
	href="<c:url value='../startbootstrap-sb-admin-2-gh-pages/dist/css/sb-admin-2.css'/>"
	rel="stylesheet">



<!-- Custom Fonts -->
<!--   <link href="../vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"> -->
<link
	href="<c:url value='../startbootstrap-sb-admin-2-gh-pages/vendor/font-awesome/css/font-awesome.min.css'/>"
	rel="stylesheet" type="text/css">
	 
	<!-- jQuery -->
		<!--   <script src="../vendor/jquery/jquery.min.js"></script> -->
		<script type="text/javascript" src="<c:url value='/jquery/jquery-3.1.1.min.js'/>"></script>

		<!-- Bootstrap Core JavaScript -->
		<!--     <script src="../vendor/bootstrap/js/bootstrap.min.js"></script> -->
		<script
			src="<c:url value='../startbootstrap-sb-admin-2-gh-pages/vendor/bootstrap/js/bootstrap.min.js'/>"></script>

		<!-- Metis Menu Plugin JavaScript -->
		<!--   <script src="../vendor/metisMenu/metisMenu.min.js"></script> -->
		<script
			src="<c:url value='../startbootstrap-sb-admin-2-gh-pages/vendor/metisMenu/metisMenu.min.js'/>"></script>

		<!-- Morris Charts JavaScript -->
		<!--   <script src="../vendor/raphael/raphael.min.js"></script>-->
		<script
			src="<c:url value='../startbootstrap-sb-admin-2-gh-pages/vendor/raphael/raphael.min.js' />"></script>
		<!--  <script src="../vendor/morrisjs/morris.min.js"></script> -->
		<script
			src="<c:url value='../startbootstrap-sb-admin-2-gh-pages/vendor/morrisjs/morris.min.js'/>"></script>
		<!-- <script src="../data/morris-data.js"></script> -->
		<script
			src="<c:url value='../startbootstrap-sb-admin-2-gh-pages/data/morris-data.js'/>"></script>

		<!-- Custom Theme JavaScript -->
		<!--     <script src="../dist/js/sb-admin-2.js"></script> -->
		<script
			src="<c:url value='../startbootstrap-sb-admin-2-gh-pages/dist/js/sb-admin-2.js'/>"></script>
		<style type="text/css">
footer {
	background-color: #3a3a3a;
	text-align: center;
}


</style>	
</head>
<body>

	<div id="wrapper">
		
		<nav class="navbar navbar-default navbar-static-top" role="navigation"
			style="margin-bottom: 0">

		<div class="navbar-header">
 				 <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
			<a class="navbar-brand" href='<c:url value="/admin/opmain.do"/>'>관리자</a>
			 <ul class="nav navbar-top-links navbar-right">
			 </ul>
			 <ul class="nav navbar-top-links navbar-right">
			 <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li><a href="<c:url value='/adminLogin.do'/>"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
                        </li>
                    </ul>
                    <!-- /.dropdown-user -->
                </li>
                <!-- /.dropdown -->
            </ul>
			 
			
		</div>
		

		<div class="navbar-default sidebar" role="navigation">
			<div class="sidebar-nav navbar-collapse">
				<ul class="nav" id="side-menu">

					<li><a href="<c:url value='/admin/operator.do'/>"><i
							class="fa fa-dashboard fa-fw"></i>메인 배너 관리</a></li>
					<li><a href="<c:url value='/admin/operatorMember.do'/>"><i
							class="fa fa-dashboard fa-fw"></i>회원관리</a></li>
					<li><a href="<c:url value='/admin/operatorHost.do'/>"><i
							class="fa fa-dashboard fa-fw"></i>호스트관리</a></li>

					<li><a href="#"><i class="fa fa-wrench fa-fw"></i>홈페이지 게시판
							관리<span class="fa arrow"></span></a>
						<ul class="nav nav-second-level">
							<li><a href="<c:url value='/admin/useBoard.do'/>">이용안내</a></li>
							<li><a href="<c:url value='/admin/noticeBoard.do'/>">공지사항</a></li>
						</ul> <!-- /.nav-second-level --></li>
						
						
						<li><a href="#"><i class="fa fa-wrench fa-fw"></i>결제 정보
						<span class="fa arrow"></span></a>
						<ul class="nav nav-second-level">
							<li><a href="<c:url value='/admin/payment.do'/>">결제 내역</a></li>
							<li><a href="<c:url value='/admin/paymentcancel.do'/>">결제취소 내역</a></li>
						</ul> <!-- /.nav-second-level --></li>
							
					<li><a href="<c:url value='/admin/operatorBadClass.do'/>"><i
							class="fa fa-dashboard fa-fw"></i>클래스 신고내역</a></li>

				</ul>
			</div>
			<!-- /.sidebar-collapse -->
		</div>
		
		

