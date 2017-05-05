<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		$("#frm2").submit(function(){
			if($("#mName").val()==''){
				alert('이름을 입력하세요');
				$("#mName").focus();
				return false;
			}else if($("#mUserid").val()==''){
				alert('아이디를 입력하세요');
				$("#mUserid").focus();
				return false;
			}		
		});
	});

	
</script>
</head>
<body>

	<h2>비밀번호 찾기</h2>
	<div>
		<form name="frm2" method="post" id="frm2" 
		action="<c:url value='/member/findPwd.do'/>">
			<label for="name">이름</label>
			<input type="text" name="mName" id="mName" 
				value="${param.name}">
			<label for="userid">아이디</label>
			<input type="text" name="mUserid" id="mUserid" 
				value="${param.userid}">
			<button type="submit" class="btn btn-primary btn-sm">아이디 확인</button>
			<c:if test="${result!=null}">
				<p>${result}</p>
				<input type="text">
			</c:if>
			
		</form>
	</div>

</body>
</html>

