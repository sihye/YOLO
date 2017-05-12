<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	
<%@include file="../inc/admin/top.jsp" %>

<script type="text/javascript" 
	src='<c:url value="/jquery/jquery-3.1.1.min.js" />'></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#frmDel").submit(function(event){	
			if(!confirm("삭제하시겠습니까?")){
				event.preventDefault();
			}
			
		});
	});
	
	
</script>
<div class="container" id="cont1">

<div class="col-md-10">

<div class="divForm">
	<h2>공지사항 삭제화면</h2>
	<br>
	<br>
<form id="frmDel" name="frmDelete" method="post"	
	action='<c:url value="/noticeboard/delete.do" />'>
	<input type="hidden" name="no" value="${param.no }">
		<fieldset>
	        <div>           
	        	<span class="sp">${param.no }번 글을 삭제하시겠습니까?</span>                        
	        </div>
	        <br><br>
	        <div class="center">
	            <input class="btn btn-default" type ="submit"  value="삭제" />
	             <input class="btn btn-primary" type = "Button" value="글목록" 
            onclick
           ="location.href='<c:url value="/admin/noticeBoard.do"/>'" /> 
           </div>
	    </fieldset>
    </form>
</div>
</div>
</div>


<%@ include file="../inc/admin/bottom.jsp" %>	
</body>
</html>