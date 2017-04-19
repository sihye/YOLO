<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   
<!DOCTYPE html>
<html lang="ko">
<head>
<title>공지사항 글 수정</title>
<meta charset="utf-8">
<link rel="stylesheet" type="text/css" href='<c:url value="/css/mainstyle.css"/>' />
<link rel="stylesheet" type="text/css" href='<c:url value="/css/clear.css"/>' />
<link rel="stylesheet" type="text/css" href='<c:url value="/css/formLayout.css"/>' />
<link rel="stylesheet" type="text/css" href='<c:url value="/css/mystyle.css"/>' />

<script type="text/javascript" 
	src='<c:url value="/jquery/jquery-3.1.1.min.js" />'></script>
<script type="text/javascript">
	$(document).ready(function(){
		$('#frmEdit').submit(function(){
			if($("#title").val()==""){
				alert("제목을 입력하세요");
				$('#title').focus();
				event.preventDefault();
			}	
		});
	});
	
	
</script>

</head>
<body>
<div class="divForm">
<form id="frmEdit" name="frmEdit" method="post" 
	action='<c:url value="/noticeboard/edit.do" />' > 
	
	<input type="hidden" name="nbNo" 
            	value="${vo.nbNo}" />
   	<input type="hidden" name="bgNo" 
        		value="${vo.bgNo}" />
            	
    <fieldset>
	<legend>글수정</legend>
        <div class="firstDiv">
            <label for="title">제목</label>
            <input type="text" id="nbTitle" name="nbTitle" 
            	value="${vo.nbTitle}" />
        </div>
        <div>
            <label for="mUserid">작성자</label>
            <input type="text" id="mUserid" name="mUserid" 
            	value="${vo.mUserid}"/>
        </div>
        <div>  
        	<label for="content">내용</label>        
 			<textarea id="nbContent" name="nbContent" rows="12" cols="40">${vo.nbContent}</textarea>
        </div>
        <div class="center">
            <input type = "submit" value="수정"/>
            <input type = "Button" value="목록" 
   onclick="location.href='<c:url value="/noticeboard/list.do"/>'" />         
        </div>
	</fieldset>
</form>    
</div>

</body>
</html>