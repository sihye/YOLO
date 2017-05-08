<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../inc/top.jsp" %>

<style>
	h2{
		font-size: 25px;
		webkit-margin-before: 1.67em;
	    webkit-margin-after: 1.67em;
	    webkit-margin-start: 0px;
	    webkit-margin-end: 0px;
	    font-weight: bold;
	    color: rgb(63, 148, 7);
	}
</style>

	<div class="container" style="margin-top: 40px;">
		<div class="row">
			<div class="col-md-2">
				<ul class="nav nav-pills nav-stacked">
					<li class="active"><a href='<c:url value="/noticeboard/list.do"/>'>공지사항</a></li>
					<li><a href='<c:url value="/useboard/list.do"/>'>이용안내
						</a></li>		
				</ul>
			</div>