<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" type="text/css"
   href="${pageContext.request.contextPath}/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css"
   href="${pageContext.request.contextPath}/css/bootstrap-select.min.css" />
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src='<c:url value="/jquery/jquery-3.1.1.min.js" />'></script>

<script type="text/javascript">
	$(document).ready(function(){
		$("#frm").submit(function () {
			if($("#userid").val()==""){
				alert('아이디를 입력하세요 !');
				$("#userid").focus();
				return false;
			}else if($("#pwd").val()==""){
				alert('비밀번호를 입력하세요 !');
				$("pwd").focus();
				return false;
			}
			return true;
		});
	});


function frmfunc() {
	$("#frm").submit();
}

</script>
<style>
.button {
    background-color: #BFD9F2 ;
    border: none;
    color: white;
    padding: 15px 32px;
    text-align: center;
    text-decoration: none;
    font-size:25px;
    display: inline-block;
    font-size: 16px;
    /* margin: 10px 2px 20px 30px; */
    cursor: pointer;
    border-radius: 4px;
    width: 100%;
    height: 60px;
    }
#loginTable td{
	padding: 10px 20px 10px 20px;
}
hr{
	margin: 0;
}
</style>
<body style="background-color: #f0f0f0;">
			<form name='frm' id='frm' method="post" action='<c:url value="/adminLogin.do"/>'>
<table style="width: 50%; margin: 0 auto; margin-top: 90px" id="loginTable">
			<tr><td style="text-align: center;">
			<img alt="YOLO LOGO" src="${pageContext.request.contextPath}/img/3.png" style="width: 130px;">
			<span style="font-size: 3em; color: #324463">관리자 로그인</span>
			</td></tr>
			<tr><td>
				<input name="userid" id="userid" value="${cookie.ck_userid.value}" class="form-control" placeholder="아이디" >
			<td></tr>
			<tr><td>
				<input name="pwd" id="pwd" class="form-control" placeholder="비밀번호" >
			<td></tr>
			<tr><td>
				<button name="login" class="button" value="로그인" onclick="frmFunc()">로그인</button>
			<td></tr>
			<tr><td>
				<input type="checkbox" name="chkSaveId" id="chkId"<c:if test="${!empty cookie.ck_userid }">
                  checked="checked"
               </c:if>>
				<label style="color: #23527c;">아이디 저장하기</label>
			<td></tr>
			<tr><td style="    padding-top: 450px;">
			<div style=" text-align: center;">
				<img alt="YOLO LOGO" src="${pageContext.request.contextPath}/img/3.png" style="width: 40px;">
				<span style="font-size: 11px;">Copyright © YOLO Corp. All Rights Reserved.</span>
			</div>
			<td></tr>
		</table>
			</form>
</body>
</html>