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
<div style="padding-left: 280px">
<img src="${pageContext.request.contextPath}/img/id.jpg">
</div>
<article style="padding-left: 30%">

	<div>
		<div>
		 이름과 이메일을 입력하세요
		</div>
		<br>
		<form name="frmId" method="post" id="frm1"
		action="<c:url value='/member/findUserid.do'/>">
		<div>
  		<input type="text" class="form-control" placeholder="이름을 입력하세요" aria-describedby="sizing-addon2" style="width: 50%"
  				name="mName" id="mName" value="${param.name}">
		</div><br>
		<div style="float: left">
  		<input type="text" class="form-control" placeholder="이메일 @ 앞부분" style="width: 90%; float: left"
  				name="mEmail1" id="mEmail1" value="${param.email1}"><label>&nbsp;@</label>
  		</div>
  		<div style="float: rigth">		
  		<input type="text" class="form-control" placeholder="이메일 @ 뒷부분"  style="width: 25%; float: rigth"
  				name="mEmail2" id="mEmail2" value="${param.email2}">			
  		</div>	<br>
		<div style="padding-left: 20%">				
			<button type="submit" class="btn btn-primary btn-sm">아이디 찾기</button>
		</div>
		</form><br>
	</div>
</article>
</body>
</html>
</div>
</div>
<%@ include file="../inc/bottom.jsp" %>