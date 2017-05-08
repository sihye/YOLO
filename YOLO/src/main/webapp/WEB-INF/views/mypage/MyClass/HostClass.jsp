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
		
		<select class="form-control" id="claName">
			<option value="0">클래스이름</option>
			<c:forEach var="vo" items="${claList}">
				<option value="${vo.cNo}">${vo.cName}</option>
			</c:forEach>
		</select>
		<script type="text/javascript">
			$(function() {
				$("#claName").change(function(){
					var cla=$(this).val();
					$.ajax({
						url:'<c:url value="/mypage/MyClass/claSel.do"/>',
						type:"POST",
			    		data:'cNo='+$(this).val(),/* 
			    		dataType:'json', */		    		
			    		success:function(res){
			    			$("#cName").html("<span>"+res.cName+"</span>");
			    			$("#img").html("<img style='width: 200px; height: 100px;' src='<c:url value='/upload/"+res.cMainimg+"'/>'>")
			    		},
			    		error:function(xhr, status, error){
			    			alert('클래스 불러오기 실패!.');
			    			console.log(error)
			    			history.back();
			    		}			    		
					})
				})
			})
			
		</script>
		<br>
		<h4>클래스 상세</h4>
		<input type="hidden" id="claNo">
		<form name="" action="">
		<c:if test="${cla!=0}">
		<table class="table">
			<tbody>
				<tr>
					<td rowspan="2" id="img" style="width: 220px;"></td>
					<td id="cName" style="text-align:center; padding: 15px 0 0 0"></td>
					<td rowspan="2"><button type="button" class="btn btn-info">클래스수정</button>
					<button type="button" class="btn btn-info">클래스삭제</button></td>
				</tr>
				<tr>
					<td>
						<select class="form-control" >
							<option>모집중</option>
							<option>모집완료</option>
						</select>
					</td>
				</tr>
			</c:if>
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