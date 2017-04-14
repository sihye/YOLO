<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../inc/admin/top.jsp" %>
<link href="<c:url value='/css/bootstrap-select.min.css'/>" rel="stylesheet" type="text/css"/>
<script src="<c:url value='/js/bootstrap-select.min.js'/>" ></script>


<script type="text/javascript">

$(document).ready(function(){

	$("#btnDel1").click(function(){
		var url = $(this).val();
		if(!confirm("삭제하시겠습니까?")){
			history.back;
		}else{
			location.href=url; 
		}
	});
	$("#btnDel11").click(function(){
		var url = $(this).val();
		if(!confirm("삭제하시겠습니까?")){
			history.back;
		}else{
			location.href=url; 
		}
	
	});
	$("#btnDel111").click(function(){
		var url = $(this).val();
		if(!confirm("삭제하시겠습니까?")){
			history.back;
		}else{
			location.href=url; 
		}
	});
	
	
	$("#btnInsert1").click(function(){
		var url =$(this).val();
		
		 window.open(
		url, '배너 등록',
		'width=1500,height=300,left=10,top=10,location=yes,resizable=yes'); 
			
	});
	$("#btnInsert11").click(function(){
		var url =$(this).val();
	
		 window.open(
		url, '배너 등록',
		'width=1500,height=300,left=10,top=10,location=yes,resizable=yes'); 
			
			
	});
	$("#btnInsert111").click(function(){
		var url =$(this).val();
		
		 window.open(
		url, '배너 등록',
		'width=1500,height=300,left=10,top=10,location=yes,resizable=yes'); 
	});
	
	
	$("#btnEdit1").click(function(){
		var url =$(this).val();
	 	 window.open(
		url, '등록된 배너 수정',
		'width=1500,height=300,left=10,top=10,location=yes,resizable=yes');
	});
	$("#btnEdit11").click(function(){
		var url =$(this).val();
	 	 window.open(
		url, '등록된 배너 수정',
		'width=1500,height=300,left=10,top=10,location=yes,resizable=yes');
	});
	$("#btnEdit111").click(function(){
		var url =$(this).val();
	 	 window.open(
		url, '등록된 배너 수정',
		'width=1500,height=300,left=10,top=10,location=yes,resizable=yes');
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
  		<c:set var='btnDel' value="btnDel"/>
  		<c:set var='btnInsert' value='btnInsert'/>
  		<c:set var='btnEdit' value='btnEdit'/>
  		<c:forEach  var="opmap" items="${map }">
  		
  		<c:set var='btnDel' value="${btnDel+=1}"/>
  		<c:set var='btnInsert' value="${btnInsert+=1}"/>
  		<c:set var='btnEdit' value="${btnEdit+=1}"/>
  		<c:if test='${!empty opmap["OP_SHOWFLAG"]}'>
  		<tr>
  			<td>${opmap["OP_NO"]}</td>
  			<td>${opmap["F_ORIGINALFILENAME"]}</td>
  			<td>${opmap["K_NAME"]}</td>
  			<td>${opmap["OP_SHOWFLAG"] }</td>
		<td>
  			<button id="${btnEdit }" type="button" class="btn btn-default btn-sm" value="<c:url value ='/admin/editBn.do?no=${opmap["OP_NO"]}'/>">수정</button>
  			<button id="${btnDel }" name='btDel1' type="button" class="btn btn-default btn-sm" value="<c:url value='/admin/delBn.do?no=${opmap["OP_NO"]}'/>">삭제</button>
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
  			<button id="${btnInsert }" type="button"  class="btn btn-default btn-sm" value= "<c:url value ='/admin/operatorInsert.do?no=${opmap["OP_NO"]}'/>">등록</button>
  		   </td>
  		</tr>
  		</c:if>
  		</c:forEach>
  		
	</table>	
	<hr>


</div>
<%@include file="../inc/admin/bottom.jsp" %>