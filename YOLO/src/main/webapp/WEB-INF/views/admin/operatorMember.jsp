<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@include file="../inc/admin/top.jsp" %>
<link href="<c:url value='/css/bootstrap-select.min.css'/>" rel="stylesheet" type="text/css"/>
<script src="<c:url value='/js/bootstrap-select.min.js'/>" ></script>
<style>

.bootstrap-select>.dropdown-toggle {
    width: 60%;
}
th {
    text-align: left;
    width: 200px;
}
#cont1{
	height: 100%;
}
element.style {
    width: 770%;
}
a{
	color: black;
}

</style>


<div class="container" id="cont1">
	<h2>메인 배너 관리</h2>
	엑셀업로드</br></br></br>
	<form id="excelUp" name="excelUp" enctype="multipart/form-data" method="post" action="/admin/excelUpload.do" >
    <input type="file" id="excelFile" name="excelFile"/>
    <input type="submit" value="엑셀업로드"/> 
    


	<table class="table table-hover">
  		<tr>
  			<th>NO</th>
  			<th>이름</th>
  			<th>아이디</th>
  			<th>가입일자</th>
  			<th>관심목록1</th>
  			<th>관심목록2</th>
  			<th>관심목록3</th>
  		</tr>
  		<c:forEach var="memberVo" items="${memberList }">
  		<tr>
  			<td>${memberVo.mNo}</td>
  			<td><a href="#">${memberVo.mName}</a></td>
  			<td>${memberVo.mUserid}</td>
  			<td><fmt:formatDate value="${memberVo.mJoindate }" pattern="yyyy-MM-dd"/></td>
  			
  			<c:set var="cg1" value=""/>
  			<c:forEach var="categoryVo" items="${categoryList }">
  			<c:if test="${memberVo.kNo1 eq categoryVo.kNo }">
  			<c:set var="cg1" value="${categoryVo.kName }"/>
  			</c:if>
 			</c:forEach>
 			<td>${cg1 }</td>
 			
 			<c:set var="cg2" value=""/>
  			<c:forEach var="categoryVo" items="${categoryList }">
  			<c:if test="${memberVo.kNo2 eq categoryVo.kNo }">
  			<c:set var="cg2" value="${categoryVo.kName }"/>
  			</c:if>
 			</c:forEach>
 			<td>${cg2 }</td>
 			
 			<c:set var="cg3" value=""/>
  			<c:forEach var="categoryVo" items="${categoryList }">
  			<c:if test="${memberVo.kNo3 eq categoryVo.kNo }">
  			<c:set var="cg3" value="${categoryVo.kName }"/>
  			</c:if>
 			</c:forEach>
 			<td>${cg3 }</td>


		</c:forEach>  		
	</table>	
	<hr>

<label>엑셀다운로드 </label>
<a href="<c:url value="/admin/excelDownload.do"/>">Excel Export</a>

</div>
</form>






<%@include file="../inc/admin/bottom.jsp" %>