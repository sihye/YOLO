<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>
<%@ include file="../member/findtop2.jsp" %>    
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
<div style="padding-left: 280px">
<img src="${pageContext.request.contextPath}/img/pwd.jpg">
</div>
<article style="padding-left: 30%">

	<div>
		<div>
		 이름과 아이디를 입력하세요
		</div>
		<br>
		<form name="frmId" method="post" id="frm2"
		action="<c:url value='/member/findPwd.do'/>">
		<div>
  		<input type="text" class="form-control" placeholder="이름을 입력하세요" aria-describedby="sizing-addon2" style="width: 50%"
  				name="mName" id="mName" value="${param.name}">
		</div><br>
		<div>
  		<input type="text" class="form-control" placeholder="아이디를 입력하세요" aria-describedby="sizing-addon2" style="width: 50%"
  				name="mUserid" id="mUserid" value="${param.userid}">
		</div><br>
		<div style="padding-left: 20%">				
			<button type="submit" class="btn btn-primary btn-sm">비밀번호 찾기</button>
		</div>
		</form><br>
	</div>
</article>
</body>
</html>
</div>
</div>
<%@ include file="../inc/bottom.jsp" %>
