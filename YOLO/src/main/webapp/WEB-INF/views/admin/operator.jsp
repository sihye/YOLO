<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../inc/admin/top.jsp" %>
<link href="<c:url value='/css/bootstrap-select.min.css'/>" rel="stylesheet" type="text/css"/>
<script src="<c:url value='/js/bootstrap-select.min.js'/>" ></script>
<script type="text/javascript">

$(document).ready(function(){
	$("#frm1").submit(function(event){
		if($("#Select1").val()==""){
			alert("카테고리를 선택하세요!");
			event.preventDefault();
		}else if($('#upfile').val()==""){
			alert("배너이미지를 선택하세요!");
			event.preventDefault();
		}else if($('#Select2').val()==""){
			alert("보여주기 여부를 선택해주세요!");
			event.preventDefault();
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
  		<c:forEach var="opmap" items="${map }">
  		<c:if test='${opmap["OP_SHOWFLAG"]=="Y"}'>
  		
  		<tr>
  			<td>${opmap["OP_NO"]}</td>
  			<td>${opmap["F_ORIGINALFILENAME"]}</td>
  			<td>${opmap["K_NAME"]}</td>
  			<td>${opmap["OP_SHOWFLAG"] }</td>
		<td>
  			<button type="button" class="btn btn-default btn-sm">수정</button>
  			<button type="button" class="btn btn-default btn-sm">삭제</button>
  		   </td>
  		</tr>
  		</c:if>
  		</c:forEach>
  		
	</table>	
	<hr>
	
	<br>
	
	<form class="form-inline" role="form" name="frm1" id="frm1" method="post" action='<c:url value="/admin/operator.do"/>' enctype="multipart/form-data">
	  <div class="form-group">
	  
	   <label>배너이미지 올리기 &nbsp; - &nbsp;&nbsp;&nbsp; </label>
	  </div>
	  <div class="form-group">
	   <select id="Select1" name="kNo" class="selectpicker" style="height:30px">
	   <option value="">
	   	카테고리 선택
	   </option>
	   <c:forEach var="vo" items="${list }">
	   <option value="${vo.kNo }">
	   	${vo.kName }
	   </option>
		</c:forEach>
		</select>
		</div>
	   <div class="form-group">
	   <select id="Select2" name="opShowflag" class="selectpicker" style="height:30px">
	   <option value="">
	   	보여주기 여부
	   </option>
	   <option value="N">
	   	N
	   </option>
	   <option value="Y">
	   	Y
	   </option>
		</select>
		<div class="form-group">
	    <label class="sr-only" for="File"></label>
	    <input type="file" id="upfile" name="upfile" style="width: 250px">
	 	 </div>
		&nbsp;&nbsp;&nbsp;  <input type="submit" value="저장하기">
	  </div>
	</form>
</div>
<%@include file="../inc/admin/bottom.jsp" %>