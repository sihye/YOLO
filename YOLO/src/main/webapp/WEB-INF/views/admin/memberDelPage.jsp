<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@include file="../inc/admin/top.jsp" %>

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>




<div class="container" id="cont1">


<br><br>
<form class="form-inline" method="post" action="<c:url value= '/admin/memberDelPage.do' />">
  <div class="form-group">
  <div class="container">
    <div class="row">
        <div class="col-md-1" style="text-align: center;"><label for="exampleInputName2">삭제사유</label></div>
        <div class="col-md-11">
    	<input type="text" class="form-control" id="exampleInputName2" name="mReason" style="width: 410px" placeholder ="삭제 사유를 입력하세요 !">
        </div>
  	</div>
  	<input type="hidden" id="mUserid" name="mUserid" value="${mUserid }">  
    </div>
	</div>
	<br><br>
	<div style="margin-left: 250px">
	<input class="btn btn-default" type="submit" value="삭제신청">
  	</div>
 </form>

</div>


	
	
	
	
	
	
<%@include file="../inc/admin/bottom.jsp" %>	