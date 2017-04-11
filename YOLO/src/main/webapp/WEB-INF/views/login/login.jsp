<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8" />
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/mainstyle.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/clear.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/layout.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/mystyle.css"/>
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

<article class="simpleForm">
	<form name="frmLogin"  id="frmLogin" method="post" 
		action="<c:url value='/login/login.do'/>">
		<fieldset>
			<legend>로그인</legend>
			<div>
				<label for="userid" class="label">아이디</label>
				<input type="text" name="userid" id="userid" 
				value="${cookie.ck_userid.value}">
			</div>
			<div>
				<label for="pwd" class="label">비밀번호</label>
				<input type="password" name="pwd" id="pwd">
			</div>
			<div class="align_center">
				<input type="submit" value="로그인">
				<input type="checkbox" name="chkSaveId" id="chkId" 
					<c:if test="${!empty cookie.ck_userid }">
						checked="checked"
					</c:if>
				>
				<label for="chkId">아이디 저장하기</label>
			</div>
			
		</fieldset>
	</form>
	
</article>


