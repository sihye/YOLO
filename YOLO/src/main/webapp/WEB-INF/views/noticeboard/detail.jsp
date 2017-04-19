<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    

<!DOCTYPE HTML>
<html lang="ko">
<head>
<meta charset="utf-8">

<link rel="stylesheet" type="text/css" href='<c:url value="/css/mainstyle.css"/>' />
<link rel="stylesheet" type="text/css" href='<c:url value="/css/clear.css"/>' />
<link rel="stylesheet" type="text/css" href='<c:url value="/css/formLayout.css"/>' />
<link rel="stylesheet" type="text/css" href='<c:url value="/css/mystyle.css"/>' />

<style type="text/css">
	body{
		padding:5px;
		margin:5px;
	 }
	.divForm {
		width: 500px;
		}
</style>  
</head>
<body>
	<h2>공지사항 상세보기</h2>
	<div class="divForm">
		<div class="firstDiv">
			<span class="sp1">제목</span> <span>${vo.nbTitle}</span>
		</div>
		<div>
			<span class="sp1">작성자</span> <span>${vo.mUserid}</span>
		</div>
		<div>
			<span class="sp1">등록일</span> <span>${vo.nbRegdate}</span>
		</div>
		<div>
			<span class="sp1">조회수</span> <span>${vo.nbReadcount}</span>
		</div>
	
		<div class="lastDiv">			
			<p class="content">${fn:replace(vo.nbContent, newLine, "<br>")}</p>
		</div>
		<div class="center">
			<a href="<c:url value='/noticeboard/edit.do?no=${vo.nbNo}'/>">수정</a> |
        	<a href="<c:url value='/noticeboard/delete.do?no=${vo.nbNo}'/>">삭제</a> |
        	<a href="<c:url value='/noticeboard/reply.do?no=${vo.nbNo}'/>">답변</a> |
        	<a href="<c:url value='/noticeboard/list.do'/>">목록</a>			
		</div>
	</div>

	
</body>
</html>










