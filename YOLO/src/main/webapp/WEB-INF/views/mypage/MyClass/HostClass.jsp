<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="mypageMyClasstop.jsp"%>
<div class="col-md-10">
	<ul class="nav nav-tabs nav-justified">
		<li class="active"><a
			href='<c:url value="/mypage/MyClass/HostClass.do"/>'>주최클래스</a></li>
		<li><a href='<c:url value="/mypage/MyClass/PartClass.do"/>'>참여클래스</a></li>
		<li><a href='<c:url value="/mypage/MyClass/Payment.do"/>'>결제내역</a></li>
	</ul>
	<c:if test="${empty claList }">
		<h3>아직 등록된 클래스가 없습니다.</h3>
		<a href="<c:url value='/class/clacre.do'/>">클래스 등록하러 가기!</a>
	</c:if>
	<c:if test="${!empty claList }">
	<h3>총${fn:length(claList) }개 </h3>
	<br><BR>
		
		<select class="form-control">
			<option>클래스이름</option>
			<c:forEach var="vo" items="${claList}">
				<option value="${vo.cNo}">${vo.cName}</option>
			</c:forEach>
		</select>
		
		<br>
		<h4>클래스 상세</h4>
		<form name="" action="">
		<table class="table">
			<tbody>
				<tr >
					<td rowspan="2">사진</td>
					<td>이름</td>
					<td rowspan="2">버튼</td>
				</tr>
				<tr>
					<td>모집상태 select</td>
				</tr>
				<tr>
					<td colspan="3">신청자리스트</td>
				</tr>
				<tr>
				
					<table class="table table-hover">
						<tbody>
						<!-- 신청자 리스트 반복 -->
							<tr>
								<td>사진</td>
								<td>이름</td>
								<td>예약시간</td>
								<td>버튼</td>
							</tr>
							<tr>
								<td>사진</td>
								<td>이름</td>
								<td>예약시간</td>
								<td>버튼</td>
							</tr>
							<tr>
								<td>사진</td>
								<td>이름</td>
								<td>예약시간</td>
								<td>버튼</td>
							</tr>
						</tbody>
					</table>
				</tr>
			</tbody>
		</table>
		</form>
	</c:if>
</div>

<%@ include file="../mypagebottom.jsp"%>