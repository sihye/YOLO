<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>자료실 글쓰기 - 허브몰</title>
<link rel="stylesheet" type="text/css" 
	href='<c:url value="/css/mainstyle.css"/>' />
<link rel="stylesheet" type="text/css" href='<c:url value="/css/clear.css"/>' />
<link rel="stylesheet" type="text/css" href='<c:url value="/css/formLayout.css"/>' />
<link rel="stylesheet" type="text/css" href='<c:url value="/css/mystyle.css"/>' />

<script type="text/javascript" 
	src='<c:url value="/jquery/jquery-3.1.1.min.js" />'></script>

<script type="text/javascript">
	$(document).ready(function(){
		$("#frmWrite").submit(function(event){
			if($("#title").val()==""){
				alert("제목을 입력하세요");
				$('#title').focus();
				event.preventDefault();
			}else if($('#content').val()==""){
				alert("내용를 입력하세요");
				$('#content').focus();
				event.preventDefault();
			}			
		});
	});
	
</script>

</head>
<body>
<div class="divForm">
<form id="frmWrite" name="frmWrite" method="post" 
	action='<c:url value="/noticeboard/write.do"/>'>
 <fieldset>
	<legend>공지사항 쓰기</legend>
		<%-- <input type="hidden" name="bgNo" value="${bgNo}" /> --%>
        <div class="firstDiv">
            <label for="title">제목</label>
            <input type="text" id="nbTitle" name="nbTitle" />
        </div>
        <div>
            <label for="name">작성자</label>
            <input type="text" id="mUserid" name="mUserid" />
        </div>
        <div>  
        	<label for="content">내용</label>        
 			<textarea id="nbContent" name="nbContent" rows="12" cols="40"></textarea>
        </div>
        <div class="center">
            <input type = "submit" value="등록"/>
            <input type = "Button" value="글목록" 
            onclick
           ="location.href='<c:url value="/noticeboard/list.do"/>'" />        
        </div>
    </fieldset>
</form>
</div>   

              
</body>
</html>




