<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="mypageMYBBStop.jsp"%>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/mypage2.css" />
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

<script>
	$(function() {
		$("#datepicker1, #datepicker2").datepicker({
			dateFormat : 'yy-mm-dd'
		});
	});
</script>


<div class="col-md-10">
	<ul class="nav nav-tabs nav-justified">
		<li><a
			href='<c:url value="/mypage/Mybbs/qnaboard.do"/>'>문의/답변</a></li>
		<li class="active"><a href='<c:url value="/mypage/Mybbs/reviewboard.do"/>'>후기</a></li>
	</ul>
	<br>
	<h2>후기</h2>
	<br>
	<!-- 기간별조회 -->
	<div id="date_sort">
		<label>기간별조회:</label>
		<button type="button" class="btn btn-default">1주일</button>
		<button type="button" class="btn btn-default">15일</button>
		<button type="button" class="btn btn-default">1개월</button>
		<button type="button" class="btn btn-default">3개월</button>
		<button type="button" class="btn btn-default">6개월</button>
		<label>조회기간:</label><input type="text" id="datepicker1"> ~ <input
			type="text" id="datepicker2"> <a href="javascript:search();"
			class="btn_s_gray11"><span>조회하기</span></a>
		<div class="search" style="margin-top: 5px">
			<select class="selec" id="SearchKind" name="SearchKind"
				style="height: 22px; margin-left: 21px"><option
					selected="selected" value="T">제목</option>
				<option value="TC">제목+내용</option>
			</select> <input class="txt" id="SearchText" name="SearchText" type="text"
				value="" /> <a class="btn_s_gray10" href="javascript:search();"><span>조회하기</span></a>
		</div>
	</div>
	<!-- //기간별조회 -->
	<table class="table table-hover">
    <thead>
      <tr style="background: skyblue">
        <th>번호</th>
        <th>종류</th>
        <th>내용</th>
        <th>문의일</th>
      </tr>
    </thead>
    <tbody>
    <c:forEach var="map" items="${alist }">
      <tr>
        <td>${map["CQ_NO"] }</td>
        <td>${map["C_NAME"] }</td>
        <td>${map["CQ_CONTENT"] }</td>
        <td>${map["C_REGDATE"] }</td>
      </tr>
    </c:forEach>  
    </tbody>
  </table>
</div>
<%@ include file="../mypagebottom.jsp"%>