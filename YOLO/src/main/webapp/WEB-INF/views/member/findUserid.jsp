<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>
<%@ include file="../member/findtop.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>checkUserid.jsp</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/mainstyle.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/mystyle.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/bootstrap-select.min.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/bootstrap.min.css" />
<script type="text/javascript" 
	src='<c:url value="/jquery/jquery-3.1.1.min.js" />'></script>

<script type="text/javascript">
	$(document).ready(function(){
		$("#frm1").submit(function(){
			if($("#mName").val()==''){
				alert('이름을 입력하세요');
				$("#mName").focus();
				return false;
			}else if($("#mEmail1").val()==''){
				alert('이메일 @ 앞자리를 입력하세요');
				$("#mEmail1").focus();
				return false;
			}else if($("#mEmail2").val()==''){
				alert('이메일 @ 뒷자리를 입력하세요');
				$("#mEmail1").focus();
				return false;
			}		
		});
	});

	
</script>
</head>
<body>
<article style="padding-left: 30%">
	<h2>아이디 찾기</h2>
	<div>
		<div>
			아이디와 이메일을 입력하세요
		</div>
		<br>
		<form name="frmId" method="post" id="frm1"
		action="<c:url value='/member/findUserid.do'/>">
		<DIV>
			<label for="mName">이름&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
			<input type="text" name="mName" id="mName" 
				value="${param.name}"><br><br>
		</DIV>
		<div>		
			<label for="email1">이메일&nbsp;&nbsp;</label>
			<input type="text" name="mEmail1" id="mEmail1" 
				value="${param.email1}">
				
			<label for="email2">@</label>
			<input type="text" name="mEmail2" id="mEmail2" 
				value="${param.email2}">
		</div><br>
		<div style="padding-left: 25%">				
			<button type="submit" class="btn btn-primary btn-sm">아이디 찾기</button>
		</div>
		</form><br>
	</div>
</article>
</body>
</html>
<%@ include file="../inc/bottom.jsp" %>