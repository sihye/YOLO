<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
	<div class="container" style="margin-top: 40px;">
		<div class="row">
			<div class="col-md-2">
				<ul class="nav nav-pills nav-stacked">
					<li ><a href='<c:url value="/member/findUserid.do"/>'>아이디 찾기</a></li>
					<li class="active"><a href='<c:url value="/useboard/list.do"/>'>비밀번호 찾기
						</a></li>		
				</ul>
			</div>