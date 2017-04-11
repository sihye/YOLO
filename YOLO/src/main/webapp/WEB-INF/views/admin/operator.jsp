<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <link href="../css/bootstrap.min.css" rel="stylesheet">
  <link href="../css/bootstrap-select.min.css" rel="stylesheet" type="text/css"  />
  <script type="text/javascript" src="../jquery/jquery-3.1.1.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script src="../js/bootstrap-select.min.js" ></script>
<script type="text/javascript">
$(window).on('load', function ()
		{
			$('.selectpicker').selectpicker(
			{
				'selectedText': 'cat'
		 	});
		});
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
<title>Insert title here</title>
</head>
<body>

	<div class="container">
	<h2>배너등록</h2>
	<form class="form-inline" role="form" name="frm1" id="frm1" method="post" action='<c:url value="/admin/operator.do"/>' enctype="multipart/form-data">
	  <div class="form-group">
	   <label>배너이미지 올리기:</label>
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
		
</body>
</html>