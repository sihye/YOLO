<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../inc/admin/top.jsp" %>
<link href="<c:url value='/css/bootstrap-select.min.css'/>" rel="stylesheet" type="text/css"/>
<script src="<c:url value='/js/bootstrap-select.min.js'/>" ></script>


<script type="text/javascript">

$(document).ready(function(){

	$("#btn1").click(function(){
		var url = $(this).val();
		if(!confirm("삭제하시겠습니까?")){
			history.back;
		}else{
			location.href=url; 
		}
	});
	$("#btn11").click(function(){
		var url = $(this).val();
		if(!confirm("삭제하시겠습니까?")){
			history.back;
		}else{
			location.href=url; 
		}
	
	});
	$("#btn111").click(function(){
		var url = $(this).val();
		if(!confirm("삭제하시겠습니까?")){
			history.back;
		}else{
			location.href=url; 
		}
	});
});
</script>


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
</style>
	<div class="container" id="cont1">
	<h2>메인 배너 관리</h2>
	<br><br>
	<table class="table table-hover">
  		<tr>
  			<th>NO</th>
  			<th>이미지파일</th>
  			<th>카테고리</th>
  			<th>보여주기 여부</th>
  			<th>관리</th>
  		</tr>
  		<c:set var='cnt' value="btn"/>
  		<c:forEach  var="opmap" items="${map }">
  		<c:set var='cnt' value="${cnt+=1}"/>

  		<c:if test='${!empty opmap["OP_SHOWFLAG"]}'>
  		<tr>
  			<td>${opmap["OP_NO"]}</td>
  			<td>${opmap["F_ORIGINALFILENAME"]}</td>
  			<td>${opmap["K_NAME"]}</td>
  			<td>${opmap["OP_SHOWFLAG"] }</td>
		<td>
  			<button type="button" class="btn btn-default btn-sm" onclick="location.href='<c:url value ='/admin/editBn.do?no=${opmap["OP_NO"]}'/>'">수정</button>
  			<button id="${cnt }" name='btDel1' type="button" class="btn btn-default btn-sm" value="<c:url value='/admin/delBn.do?no=${opmap["OP_NO"]}'/>">삭제</button>
  		   </td>
  		</tr>
  		</c:if>
  		<c:if test='${empty opmap["OP_SHOWFLAG"]}'>
  		<tr>
  			<td>${opmap["OP_NO"]}</td>
  			<td></td>
  			<td>등록된 배너가 없습니다.</td>
  			<td></td>
		<td>
  			<button type="button"  class="btn btn-default btn-sm" onclick="location.href='<c:url value ='/admin/insertBn.do?no=${opmap["OP_NO"]}'/>'">등록</button>
  		   </td>
  		</tr>
  		</c:if>
  		</c:forEach>
  		
	</table>	
	<hr>


</div>
<%@include file="../inc/admin/bottom.jsp" %>