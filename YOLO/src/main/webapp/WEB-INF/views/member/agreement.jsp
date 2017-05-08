<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8" />
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/mainstyle.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/clear.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/layout.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/mystyle.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/bootstrap-select.min.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/bootstrap.min.css" />
<!--[if lt IE 9]>
      <script src="//html5shiv.googlecode.com/svn/trunk/html5.js"></script>      
    <![endif]-->
<script type="text/javascript"
	src='<c:url value="/jquery/jquery-3.1.1.min.js" />'></script>
<script type="text/javascript" src='<c:url value="/js/member.js" />'></script>	
</head>
<style type="text/css">
	#divAgree{
		width: 700px;
		margin-top: 10px;
		margin-left: 29%;
	}
</style>
<style> 
	.div { display: table; margin-left: auto; margin-right: auto; } 
	
	
	
</style>
<style type="text/css">
	label{
		padding-right: 20px;
	}
	
	.simpleForm { display: table; margin-left: auto; margin-right: auto; } 
</style>
<script type="text/javascript">
	$(document).ready(function(){
		$("#frmAgree").submit(function(){
			if(!$("#chkAgree").is(":checked")){
				alert("약관에 동의하셔야 합니다.");
				$("#chkAgree").focus();
				return false;
			}	
		});
		
		$("#cancle1").click(function() {
			location.href="<c:url value='/index2.do'/>"
		});
	});
	
</script>
<article class="simpleForm">
<h2>회원약관</h2>
<div style="border: 1px solid gray">
<iframe src='<c:url value="/inc2/provision2.html" />' width="700" height="400"></iframe>
</article>
<div id="divAgree" >
	<form id="frmAgree" name="frmAgree" method="get" 
		action='<c:url value="/member/register.do" />' >
		<div class="align_right">
			<input type="checkbox" name="chkAgree" id="chkAgree" >
			<label for="chkAgree">약관에 동의합니다.</label>
		</div>
		<div class="align_center">
			<button type="submit" class="btn btn-primary" id="wr_submit">확인</button>
			<button type="button" class="btn btn-primary" id="cancle1">취소</button>	 				
		</div><br>
	</form>
</div>
</div>


<%@ include file="../inc/bottom.jsp" %>






