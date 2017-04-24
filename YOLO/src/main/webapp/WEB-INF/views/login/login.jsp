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

<article class="simpleForm">
	<form name="frmLogin"  id="frmLogin" method="post" 
		action="<c:url value='/login/login.do'/>">
		<fieldset>
			<legend><img src="${pageContext.request.contextPath}/img/tit_login2.gif" 
		alt="메인 herb이미지"></legend>
			<div>
				<label for="userid" style="margin-right: 14px;margin-left: 30px">&nbsp;&nbsp;&nbsp;아이디</label>
				<input type="text" name="userid" id="userid" 
				value="${cookie.ck_userid.value}">
			</div>
			<div>
				<label for="pwd" style="margin-left: 30px;">&nbsp;&nbsp;&nbsp;비밀번호</label>
				<input type="password" name="pwd" id="pwd">
			</div>
			<div class="align_right">
				<input type="checkbox" name="chkSaveId" id="chkId" 
					<c:if test="${!empty cookie.ck_userid }">
						checked="checked"
					</c:if>
				>
				<label for="chkId">아이디 저장하기</label><br>
			</div>	
			<div class="align_center">
				<button type="submit" class="btn btn-primary">로그인</button>
				<button type="button" class="btn btn-primary">취소</button>
				
			</div>
			
		</fieldset>
	</form>
	
</article>