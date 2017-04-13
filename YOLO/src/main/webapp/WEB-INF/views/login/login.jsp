<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/core"%>
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
</head>

<script type="text/javascript">
	$(document).ready(function(){
		$("#frmLogin").submit(function(){
			if($("#userid").val()==''){
				alert('아이디를 입력하세요');
				$("#userid").focus();
				return false;
			}else if($("#pwd").val()==''){
				alert('비밀번호를 입력하세요');
				$("#pwd").focus();
				return false;
			}
			
		});
	});
	
</script>

<form role="form" class="form-inline" style="margin-left: 60px; margin-top: 40px">
<h4 class="text-primary">로그인</h4>
	<div class="form-group">
		<label for="userid">&nbsp;&nbsp;&nbsp;아이디</label> <input type="text" class="form-control"
			placeholder="이름"><br><br>
		<label for="pwd">비밀번호</label> <input type="password" class="form-control"
			placeholder="비밀번호"><br>
	</div>
	<br>
	<div class="checkbox" style="margin-top: 5px">
		<label> <input type="checkbox" value="아이디 저장" style="margin-left: 160px"> 아이디 저장
		</label>
	</div>
	<br>
	<div style="margin-left: 70px;margin-top: 5px">
		<button type="submit" class="btn btn-primary btn-sm">로그인</button>
		<button type="button" class="btn btn-primary btn-sm">회원가입</button>
	</div>
	<div style="margin-left: 80px;margin-top: 5px">
		<a href="#">아이디 찾기</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
		<a href="#">비밀번호 찾기</a>
	</div>
	

</form>