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
					$("#dateSel").find("option").remove();
					$("#timeSel").find("option").remove();
					$('#info').siblings().remove();
					
					/* var cla=$(this).val(); */
					//클래스 select
					$.ajax({
						url:'<c:url value="/mypage/MyClass/claSel.do"/>',
						type:"POST",
			    		data:'cNo='+$(this).val(),		    		
			    		success:function(res){
			    			$("#cName").html("<span>"+res.cName+"</span>");
			    			$("#img").html("<img style='width: 200px; height: 100px;' src='<c:url value='/upload/"+res.cMainimg+"'/>'>")
			    			$("#edit").prop('href','<c:url value="/class/edit.do?cNo='+res.cNo+'"/>')
			    			$("#schEdit").prop('href','<c:url value="/class/schEdit.do?cNo='+res.cNo+'"/>')
			    			$("#del").prop('href','<c:url value="/class/delete.do?cNo='+res.cNo+'"/>')
			    			$("#cNo").val(res.cNo);
			    			$("#staCno").val(res.cNo)
			    		},error:function(xhr, status, error){
			    			alert('클래스 불러오기 실패!.');
			    			console.log(error)
			    			history.back();
			    		}			    		
					})
					
					//스케줄 날짜 select
					$.ajax({
						url:'<c:url value="/mypage/MyClass/schSel.do"/>',
						type:"POST",
			    		data:'cNo='+$(this).val(),	
			    		success:function(res){
			    			$("#dateSel").append("<option>날짜선택하기</option>");
			    			$.each(res, function(i, item) {
								$("#dateSel").append("<option>"+item+"</option>");
						   });
			    		},
			    		error:function(xhr, status, error){
			    			alert('날짜 실패!.');
			    			console.log(error)
			    			history.back();
			    		}			    		
					})
										
				})
				
				$("#dateSel").change(function(){
					$("#timeSel").find("option").remove();
					$('#info').siblings().remove();
					//스케줄 시간 select
					$.ajax({
						url:'<c:url value="/mypage/MyClass/time.do"/>',
						type:"POST",
			    		data:'cNo='+$("#cNo").val(),	    		
			    		success:function(res){
			    			$("#scNo").val(res.scNo)
			    			$("#timeSel").append("<option id='timeOption'>시간선택하기</option>");
			    			$("#timeSel").append("<option>"+res.scStarttime1+"~"+res.scEndtime1+"</option>");
			    			if(res.scStarttime2!=null&&res.scStarttime2!=''){
			    				$("#timeSel").append("<option>"+res.scStarttime2+"~"+res.scEndtime2+"</option>");
			    			}
			    			if(res.scStarttime3!=null&&res.scStarttime3!=''){
			    				$("#timeSel").append("<option>"+res.scStarttime3+"~"+res.scEndtime3+"</option>");
			    			}
			    		},
			    		error:function(xhr, status, error){
			    			alert('시간 실패!.');
			    			console.log(error)
			    			history.back();
			    		}			    		
					})
					
					
				})
				$("#timeSel").change(function(){
					$('#info').siblings().remove();
					$("#bkTime").val($(this).val())
					if($("#bkBdate").val()!='0'&&$("#bkTime").val()!='0'){
						var formData = $("#multiForm").serialize();
						$.ajax({
							url:'<c:url value="/mypage/MyClass/selMem.do"/>',
							type:"POST",
							data : formData,	    		
				    		success:function(res){
				    			var i=0;
				    			$.each(res, function(i, map) {
				    						$("#info").find("TR").remove();
				    						$("#searchCondition").val(map['searchCondition'])	
					    					var time=$.foo(map['BK_DATE'])
						    				var paychk='';
						    				if(map['PM_COMPLETECHECK']=='Y'){
						    					paychk='결제완료';
						    				}else{
						    					paychk='결제진행중';
						    				}
						    				
						    				$("#info").after("<TR><td><input type='checkbox' id='chk_"+i+"' name='' value="+map['BK_NO']+"></td><td>"+map['BK_USERID']+"</td><td>"+map['M_TEL1']+"-"+map['M_TEL2']+"-"+map['M_TEL3']+"</td><td>"+map['M_EMAIL1']+"@"+map['M_EMAIL2']+"</td><td>"+time+"</td><td>"+map['PM_PAYMENTWAY']+"</td><td>"+paychk+"</td></TR>")
						    				i++;
				    					});
				    		},
				    		error:function(xhr, status, error){
				    			alert('멤버 select 실패!.');
				    		}			    		
						})
					}
				})
				$.foo=function (timestamp){
					var date = new Date(timestamp);
					var year = date.getFullYear();
					var month = date.getMonth()+1;
					var day = date.getDay();
					var retVal =   year + "-" + (month < 10 ? "0" + month : month) + "-" 
					                        + (day < 10 ? "0" + day : day);
					return retVal
				}
				function pageFunc(curPage){
		    		document.formData.currentPage.value=curPage;
		    		formData.submit();
		    	}
				$("#chkAll").click(function(){
	    			$("thead input[type=checkbox]").prop("checked", this.checked);
	    		});
		

			})
		</script>
		<br>
		<input type="text" id="cNo"  >
		
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
						
					</td>
				</tr>			
				<tr>
					<td colspan="3">신청자리스트</td>
				</tr>
			</tbody>
		</table>
		<!-- 페이징 처리를 위한 form 태그 -->
		<form name="frmPage" method="post"
			action='<c:url value="/mypage/MyClass/selMem.do" />'>
			<input type="hidden" name="currentPage"> <input type="hidden" id="searchCondition"
				name="searchCondition" value=""> 
		</form>
		<form method="post" name="multiForm" id="multiForm" >
		<input type="text" name="scNo" id="scNo">
				<table class="searchBox">
			<caption>조회</caption>
			<colgroup>
				<col width="123px">
				<col width="*">
			</colgroup>
			<tbody>
				<tr>
					<th>조회클래스</th>
					
					<td>
						<div>
						<label>스케줄:</label>
						<div class="col-xs-4">
							<select class="form-control" id="dateSel" name="bkBdate">
								<option value="0">날짜 선택하기</option>
				     	 	</select>
				     	 	<!-- <input type="text" name="bkBdate" id="bkBdate"> -->
				     	 </div>
					<div class="col-xs-4">
      			<select class="form-control" id="timeSel" name="bkTime">
      				<option value="0" id="timeOption">시간 선택하기</option>
      			</select>
      			<!-- <input type="text" name="bkTime" id="bkTime"> -->
      	</div>
      	</div>

						<div class="clearfix">
							
						</div>
						<div class="search1" style="margin-top: 10px;">
							<label>신청자 이름:</label> <input class="txt" id="searchKeyword"
								name="searchKeyword" type="text" /> <input type="submit"
								value="조회하기">
						</div>
					</td>
				</tr>
			<tbody>
		</table>
		</form>
		<form name="frmList" id="frmList" method="post">
		<table class="table table-hover" id="bookMem">
			<thead>
				<tr style="background: skyblue" ID="info">
					<th width="5%"><input type="checkbox" value="None" id="chkAll"
						name="chkAll" /></th>
					<th width="15%">이름</th>
					<th width="25%">핸드폰</th>
					<th width="20%">e-mail</th>
					<th width="10%">예약일</th>
					<th width="10%">결제방법</th>
					<th width="15%">결제상태</th>
					
				</tr>
			</thead>
			<tbody>
				
				

			</tbody>
			<tfoot>
				<tr>
					<td colspan="6" style="text-align: center">
						<button id="btDeleteMulti" class="btn btn-primary" type="button">이메일 보내기</button>
						<button id="btDeleteMulti" class="btn btn-primary" type="button">입금 확인</button>
					</td>
				</tr>
			</tfoot>
		</table>
		</form>
		
		<div class="divPage" style="text-align: center">
	<!-- 페이지 번호 추가 -->
	<!-- 이전 블럭으로 이동 ◀-->
	<nav>
		<ul class="pagination" id="pagination"></ul>
	</nav>
	</div>
		
		</c:if>
<%@ include file="stats.jsp" %>
</div>

<%@ include file="../mypagebottom.jsp"%>