<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ include file="../inc/top.jsp" %>
	
<link href="<c:url value='/css/bootstrap-select.min.css'/>" rel="stylesheet" type="text/css"/>
<script src="<c:url value='/js/bootstrap-select.min.js'/>" ></script>
<script type="text/javascript"></script>

<style>
th {
    text-align: left;
    width: 200px;
}
#div1{
	height: 100%;
}
</style>

<table class="table">
	<div class="container" id="div1">
	<h2 align="left">이용안내</h2>
	<br><br>

	<tr>
		<th>no</th>
		<th>제목</th>
		<th>내용</th>
		<th>등록일</th>
		<th>조회수</th>
	</tr>

	
	<tr>
		<td>1</td>
		<td>안녕하세요</td>
		<td>반갑습니다</td>
		<td>2017-04-13</td>
		<td>1</td>
	</tr>
	<tr>
		<td>2</td>
		<td>테스트</td>
		<td>테스트 중입니다</td>
		<td>2017-04-13</td>
		<td>1</td>
	</tr>
	
	
</table>


<%@ include file="../inc/bottom.jsp" %>
</body>
</html>