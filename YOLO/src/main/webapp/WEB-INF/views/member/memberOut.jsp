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
	}
</style>
<script type="text/javascript">
	$(document).ready(function(){
		$("#frmOut").submit(function(){
			if(!$("#chkAgree").is(":checked")){
				alert("약관에 동의하셔야 합니다.");
				$("#chkAgree").focus();
				return false;
			}else if($("#pwd").val()==''){
				alert('비밀번호를 입력하세요');
				$("#pwd").focus();
				return false;
			}				
		});
		
		$("#no").click(function() {
			history.back();
		})
		
	});
	



	
</script>


	  
<style> 
	.div { display: table; margin-left: auto; margin-right: auto; } 
	
	
	
</style>
<style type="text/css">
	label{
		padding-right: 20px;
	}
	
	.simpleForm { display: table; margin-left: auto; margin-right: auto; } 
</style>
<!-- <script type="text/javascript">
	$(function(){
		$("#pwd").focus();
		
		$("#frmOut").submit(function(){
			if($("#pwd").val()==''){
				alert('비밀번호를 입력하세요');
				$("#pwd").focus();
				return false;
			}			
		});
	});
</script> -->

<article class="simpleForm">
			<legend>회원탈퇴</legend>
			<h2>회원약관</h2>
<div style="border: 1px solid gray">
<iframe src='<c:url value="/inc2/provision.html" />' width="700" height="400"></iframe>
</div>
	<form name="frmOut" id="frmOut" method="post" 
		action='<c:url value= "/member/memberOut.do"/>'>
		<fieldset>

<div id="divAgree">
	
		<div class="align_right">
			<input type="checkbox" name="chkAgree" id="chkAgree" >
			<label for="chkAgree">약관에 동의합니다.</label>
		</div>
		
		<div class="container"> 
		<h3>탈퇴 사유</h3> 
		<select class="form-control" style="width: 60%" id="email2" name="mReason"> 
		<option value="1">잣같아서</option> 
		<option value="2">그냥</option> 
		<option value="3">쏘쏘</option> 
		<option value="4">엑쏘</option> 
		<option value="5">트와이스</option> 
		<option value="etc">직접입력</option>
		</select><br>
		<input type="text" style="visibility:hidden; width: 60%" name="mReason">
		</div>
		<br>
	
		<div>
		<h3>비밀번호를 입력해 주세요</h3>
		<input class="form-control" type="password" placeholder="비밀번호를 입력하세요" name="pwd" id="pwd">
		<div class="align_center">
				<!-- <input type="submit" value="회원탈퇴">
				<input type="reset" value="취소"> -->
				<button type="submit" class="btn btn-primary">회원탈퇴</button>
  				<button type="button" class="btn btn-default" id="no">취소</button>
			</div>
		</div>	
		</div>
		
			
		</fieldset>
		
	</form>
</div>	
</article>

<%@ include file="../inc/bottom.jsp" %>