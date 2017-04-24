<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>




<style type="text/css">
	.divForm{
		margin:20px 0;
		margin-left: 200px;
		margin-right: 200px;
		font-size: 1.5em;	
	 }
	/* .divForm form{
		width:650px;
	} */
	.divForm div	{
		/* clear: both; */
		border:none;
		padding: 7px 0;
		margin: 0;
		overflow: auto;
	}	
	.sp{
		font-size:0.9em;
		color:#0056AC;			
	}
	.divForm fieldset	{
		border:0;
	}
</style>

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
</head>
<body>
<div class="divForm">
	<h2>이용안내 삭제화면</h2>
	<br>
	<br>
<form id="frmDel" name="frmDelete" method="post"	
	action='<c:url value="/useboard/delete.do" />'>
	<input type="hidden" name="no" value="${param.no }">
		<fieldset>
	        <div>           
	        	<span class="sp">${param.no }번 글을 삭제하시겠습니까?</span>                        
	        </div>
	        <div class="center">
	            <input class="btn btn-default" type ="submit"  value="삭제" />
	            <input class="btn btn-default" type = "Button" value="글목록" 
           onclick ="location.href='<c:url value="/useboard/list.do"/>'" />
	        </div>
	    </fieldset>
    </form>
</div>

<%@ include file="../inc/bottom.jsp" %>	
</body>
</html>