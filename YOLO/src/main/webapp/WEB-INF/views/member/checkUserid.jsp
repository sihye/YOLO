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
<script type="text/javascript" 
	src='<c:url value="/jquery/jquery-3.1.1.min.js" />'></script>

<script type="text/javascript">
	$(document).ready(function(){
		$("#btUse").click(function(){
			$(opener.document).find("#userid").val('${param.userid}');
			$(opener.document).find("#chkId").val('Y');
			
			self.close();
		});
	});

	
</script>
</head>
<body>

	<h2>아이디 중복검사</h2>
	<div>
		<form name="frmId" method="post" 
		action="<c:url value='/member/checkUserid.do'/>">
			<label for="userid">아이디</label>
			<input type="text" name="userid" id="userid" 
				value="${param.userid}">
			<input type="submit" value="아이디 확인">
			<c:if test="${result== EXIST_ID}"> <!-- 이미 아이디 존재 -->
				<p>이미 등록된 아이디입니다. 다른 아이디를 입력하세요</p>
			</c:if>
			<c:if test="${result== NONE_EXIST_ID}"> <!-- 아이디 존재하지 않음 -->
				<input type="button" value="사용하기" id="btUse">
				<p>사용가능한 아이디입니다. [사용하기]버튼을 클릭하세요</p>
			</c:if>
		</form>
	</div>

</body>
</html>













