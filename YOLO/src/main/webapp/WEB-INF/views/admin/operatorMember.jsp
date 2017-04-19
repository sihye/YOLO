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


#frm1{
	width: 500px; 
	margin: 0 auto;
}
#searchSel{
	margin : 0 auto;
}
</style>


<div class="container" id="cont1">
	<h2>메인 배너 관리</h2>

    <br><br>


<label>엑셀다운로드 </label>
<a href="<c:url value="/admin/excel.do"/>">Excel Export</a>

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
  		<c:forEach var="map" items="${listMap }">
  		<tr>
  			<td>${map["M_NO"]}</td>
  			<td><a href="#">${map["M_NAME"]}</a></td>
  			<td>${map["M_USERID"]}</td>
  			<td><fmt:formatDate value="${map['M_JOINDATE'] }" pattern="yyyy-MM-dd"/></td>
 			<td>${map["K_1"] }</td>
 			<td>${map["K_2"] }</td>
 			<td>${map["K_3"] }</td>

		</c:forEach>  		
	</table>	
	<hr>
	
	
  
	<%-- <form class="form-inline" role="form" name="frm1" id="frm1" method="post" action='<c:url value="/admin/operatorInsert.do"/>' enctype="multipart/form-data">
	  <div class="form-group">
	  </div>
	  <div class="form-group">
	   <select id="Select1" name="kNo" class="selectpicker" style="height:30px">
	   <option value="">
	   	검색 목록
	   </option>
	   <option value="M_USERID">
	   ID 검색
	   </option>
	   <option value="M_NAME">
	   이름 검색
	   </option>
		</select>
		</div>
	   <div class="form-group">
	   <input type="text"> 
		
		<input type="submit" id="btSubmit" value="검색">
		
	  </div>
	</form> --%>
	
	<form  id="frm1" name ="frm1" method="post" action="" >
		<select id="searchSel" name="searchSel" style="height: 26px">
			<option value="">
				선택하세요
			</option>
			<option value="M_USERID">
			ID 검색
			</option>
			<option value="M_NAME">
			이름 검색
			</option>
		</select>
		<input type="text"  id = "keyword" name="keyword"  style="height: 25px">
		<input type="submit" value="검색"  style="height: 25px">
	</form>
	
	
	
</div>
</form>






<%@include file="../inc/admin/bottom.jsp" %>