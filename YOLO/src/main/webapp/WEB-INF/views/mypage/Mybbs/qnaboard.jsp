<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="mypageMYBBStop.jsp"%>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/mypage2.css" />
<div class="col-md-10">
	<ul class="nav nav-tabs nav-justified">
		<li class="active"><a
			href='<c:url value="/mypage/Mybbs/qnaboard.do"/>'>문의/답변</a></li>
		<li><a href='<c:url value="/mypage/Mybbs/reviewboard.do"/>'>후기</a></li>
	</ul>
	<br>
	<h2>문의/답변</h2>
	<br>
	<!-- 기간별조회 -->
	<div id="date_sort">
		<p>
			<span class="blind"></span>
		</p>	
			<button type="button" class="btn btn-default">1주일 </button>
			<button type="button" class="btn btn-default">15일 </button>
			<button type="button" class="btn btn-default">1개월 </button>

		<a href="javascript:search();" class="btn_s_gray11"><span>조회하기</span></a>
		<div class="search" style="margin-top: 5px">
			<select class="selec" id="SearchKind" name="SearchKind" style="height:22px;margin-left: 21px" ><option
					selected="selected" value="T">제목</option>
				<option value="TC">제목+내용</option>
			</select> <input class="txt" id="SearchText" name="SearchText" type="text"
				value="" /> <a class="btn_s_gray10" href="javascript:search();"><span>조회하기</span></a>
		</div>
	</div>
	<!-- //기간별조회 -->

</div>
<%@ include file="../mypagebottom.jsp"%>