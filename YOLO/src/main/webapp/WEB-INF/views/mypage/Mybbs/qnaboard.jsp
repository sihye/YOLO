<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
		<li class="active"><a
			href='<c:url value="/mypage/Mybbs/qnaboard.do"/>'>문의/답변</a></li>
		<li><a href='<c:url value="/mypage/Mybbs/reviewboard.do"/>'>후기</a></li>
	</ul>
	<br>
	<h2>문의/답변</h2>
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
        <th>상태</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>John</td>
        <td>Doe</td>
        <td>john@example.com</td>
        <td>john@example.com</td>
        <td>john@example.com</td>
      </tr>
      <tr>
        <td>Mary</td>
        <td>Moe</td>
        <td>mary@example.com</td>
        <td>mary@example.com</td>
        <td>mary@example.com</td>
      </tr>
      <tr>
        <td>July</td>
        <td>Dooley</td>
        <td>july@example.com</td>
        <td>july@example.com</td>
        <td>july@example.com</td>
      </tr>
    </tbody>
  </table>
</div>
<%@ include file="../mypagebottom.jsp"%>