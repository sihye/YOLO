<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link
	href="<c:url value='../startbootstrap-sb-admin-2-gh-pages/vendor/bootstrap/css/bootstrap.min.css'/>"
	rel="stylesheet">
<link href="<c:url value='/css/bootstrap-select.min.css'/>" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="<c:url value='/jquery/jquery-3.1.1.min.js'/>"></script>
<script src="<c:url value='/js/bootstrap-select.min.js'/>" ></script>
<script
			src="<c:url value='../startbootstrap-sb-admin-2-gh-pages/vendor/bootstrap/js/bootstrap.min.js'/>"></script>


<script type="text/javascript">
$(document).ready(function(){
	$("#frm1").submit(function(event){
		if($("#Select1").val()==""){
			alert("카테고리를 선택하세요!");
			event.preventDefault();
		}else if($('#Select2').val()==""){
			alert("보여주기 여부를 선택해주세요!");
			event.preventDefault();
		}
		
	});
		  $("#btClose2").click(function(){
			  self.close();
		}); 
	 
});

</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>
<c:if test="${result == 1 }">
<script type="text/javascript">
 alert('${msg }' );
 opener.location.href="<c:url value='/admin/operator.do'/>";
 self.close();
</script>
</c:if>
<div class="container" id="cont1">
	<h2>메인 배너 관리</h2>
	<br><br>
	
		
	<form class="form-inline" role="form" name="frm1" id="frm1" method="post" action='<c:url value="/admin/editBn.do"/>' enctype="multipart/form-data">
	  <div class="form-group">
	  <input type="hidden" id="opNo" id="opNo" name="opNo" value="${param.no }"> 
	   <label>배너이미지 올리기 &nbsp; - &nbsp;&nbsp;&nbsp; </label>
	  </div>
	  <div class="form-group">
	   <select id="Select1" name="kNo" class="selectpicker" style="height:30px">
	   <option value="">
	   	카테고리 선택
	   </option>
	   <c:forEach var="vo" items="${list }">
	   <option value="${vo.kNo }"
	      <c:if test="${vo.kName == map['K_NAME'] }"> 
	      selected="selected"
	      </c:if>
	   > 
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
	   <option value="N"
	      <c:if test="${map['OP_SHOWFLAG'] eq 'N' }"> 
	      selected="selected"
	      </c:if>
	   >
	   	N
	   </option>
	   <option value="Y"
	    <c:if test="${map['OP_SHOWFLAG'] eq 'Y' }"> 
	      selected="selected"
	      </c:if>
	   >
	   	Y
	   </option>
		</select>
		<div class="form-group">
	    <label class="sr-only" for="File"></label>
	    <input type="file" id="upfile" name="upfile" style="width: 250px">
	    <input type="hidden" id = originalFileName value="${map['F_ORIGINALFILENAME'] }"> 
	    <label>등록되어있는 배너 : ${map['F_ORIGINALFILENAME'] }</label>
	 	 </div>
		&nbsp;&nbsp;&nbsp;  <input type="submit" id="btSubmit" value="수정하기">
		<input type="button" id="btClose2" value="취소(창닫기)">
	  </div>
	</form>
	
	
	
</div>
</body>
</html>