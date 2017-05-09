<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="mypageMyClasstop.jsp"%>

<script type="text/javascript">
	$(function() {
		$("#del").click(function() {
			confirm("정말 삭제하시겠습니까? 삭제된 클래스는 복구되지 않습니다.")
		})
	})

</script>
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
				<c:set var="cNo" value="${vo.cNo}" />
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
			    			$("#edit").prop('href','<c:url value="/class/edit.do?cNo='+res.cNo+'"/>')
			    			$("#schEdit").prop('href','<c:url value="/class/schEdit.do?cNo='+res.cNo+'"/>')
			    			$("#del").prop('href','<c:url value="/class/delete.do?cNo='+res.cNo+'"/>')
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
		<input type="text" value="${cla }" >
		<c:set var="cNo" value="" />
		<form name="" action="">
		<%-- <c:if test="${cNo!=0}"> --%>
		<h4>클래스 상세</h4>
		<table class="table">
			<tbody>
				<tr>
					<td rowspan="2" id="img" style="width: 220px;"></td>
					<td id="cName" style="text-align:center; padding: 15px 0 0 0"></td>
					<td rowspan="2"><a id="edit" class="btn btn-info" >클래스수정</a>					
					<a class="btn btn-info" id="del" >클래스 삭제</a>
					<a id="schEdit" class="btn btn-info" >클래스 스케줄 수정</a></td>
					
				</tr>
				<tr>
					<td>
						<div class="col-xs-6">    	
			<select class="form-control" id="dateSel">
				  <option>날짜 선택하기</option>
				  <c:forEach var="day" items="${dayslist}">
				  	<option value="${day}">${day}</option>
				  </c:forEach>
	      	</select>
	      	
      	</div>
      	<div class="col-xs-6">
      		<select class="form-control" id="timeSel">
      			<option>시간 선택하기</option>
      			<c:if test="${! empty sch.scStarttime1 }">
      				<option value="${sch.scStarttime1 }~${sch.scEndtime1 }">${sch.scStarttime1 }~${sch.scEndtime1 }</option>
      			</c:if>
      			<c:if test="${! empty sch.scStarttime2 }">
      				<option value="${sch.scStarttime2 }~${sch.scEndtime2 }">${sch.scStarttime2 }~${sch.scEndtime2 }</option>
      			</c:if>
      			<c:if test="${! empty sch.scStarttime3 }">
      				<option value="${sch.scStarttime3 }~${sch.scEndtime3 }">${sch.scStarttime3 }~${sch.scEndtime3 }</option>
      			</c:if>
      		</select>
      	</div>
					</td>
				</tr>			
				<tr>
					<td colspan="3">신청자리스트</td>
				</tr>
			</tbody>
		</table>
		
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
		</c:if>
		</form>
	<%-- </c:if> --%>
</div>

<%@ include file="../mypagebottom.jsp"%>