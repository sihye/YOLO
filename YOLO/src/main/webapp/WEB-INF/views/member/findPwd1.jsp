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
	<a>${result}</a>
		<form name="frm2" method="post" id="frm2" 
		action="<c:url value='/member/findPwd1.do'/>">
			
			<label for="questionanswer">답변</label>
			<input type="text" name="mQuestionanswer" id="mQuestionanswer" 
				value="${param.questionanswer}">
			<div>		
			<label for="email1">이메일&nbsp;&nbsp;</label>
			<input type="text" name="mEmail1" id="mEmail1" 
				value="${param.email1}">
				
			<label for="email2">@</label>
			<input type="text" name="mEmail2" id="mEmail2" 
				value="${param.email2}">
		</div><br>
			<button type="submit" class="btn btn-primary btn-sm">비밀번호 확인</button>

			
		</form>
	</div>

</body>
</html>

