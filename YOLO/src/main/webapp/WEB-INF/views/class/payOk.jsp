<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>

<style>
.wrp{
background-color: #f5f5f5;
}

#member{
	margin-top: 15px;
}
.divInfo{
	width:600px;
	background-color: white;
	margin-bottom: 20px;
	float: left;
	margin-left: 300px;
}
.input-lg{
	margin-top: 10px;
}
.control-label{
	margin-top: 20px;
}
.name{
margin-top: 10px;
}
.form-control-static{
	font-size: 15px;
	margin-top: 2px;
}
#chk, #booking{
	background-color: #f5f5f5;
}
.button {
    background-color: #ffc0cb ;
    border: none;
    color: white;
    padding: 15px 32px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 10px 2px 20px 30px;
    cursor: pointer;
    border-radius: 4px;
    width: 40%;
}

.button:hover {
    background-color: #ffc0cb;
    color: white;
}
</style>



<div class="wrp">
	<div class="container">	
		<div id="mainInfo" class="divInfo container" style="margin-top: 20px;">			
			<span>${memVo.mName}님</span>  <b>${vo['C_NAME']} | ${vo['BK_TIME']}</b><span>으로 예약되었습니다.</span>
			<h3>예약 번호: <a href="#">${fn:split(vo['BK_BDATE'],"/")[0]}${vo['BK_NO']}${vo['SC_NO']}${vo['C_NO']}</a></h3>
			<h3>YOLO를 이용해 주셔서 감사합니다.</h3>
		</div>	
		<div class="divInfo container" id="cla" style="height: 270px;">
			<table style="width: 100%; height: 80%; margin-top: 42px; padding: 30px; margin-bottom: 10px;">
			<tr>
				<td rowspan="1" style="margin-right: 20px;vertical-align: middle;
    font-size: 23px; border-right: 5px solid pink;"><span style="color: gray;">클래스정보</span></td>
    
				<td>
					<div class="form-group">
					    <label class="col-sm-3 name">클래스명</label>
					    <div class="col-sm-7">
					      <p class="form-control-static">${vo['C_NAME']}</p>
					    </div>
				    </div>
			    </td>
			</tr>
			<tr>
				<td rowspan="3" style="margin-right: 20px;
    padding-right: 30px;
    font-size: 25px; border-right: 5px solid pink; width: 180px;">
				<img style="width: 170px; height: 140px; margin-top: 10px; " alt="" src="<c:url value='/upload/${vo["C_MAINIMG"]}'/>">
				</td>
				<td style="vertical-align:middle;">
				<div class="form-group">
			    <label class="col-sm-3 name">예약시간</label>
				    <div class="col-sm-7">
				      <p class="form-control-static" >${vo['BK_BDATE']}<br>${vo['BK_TIME']}</p>
				    </div>
				</div>
				</td>
			</tr>
			<tr>
				<td>
				<div class="form-group">
				    <label class="col-sm-3 name">장소</label>
				    <div class="col-sm-7">
				      <p class="form-control-static" >${vo['C_PLACE']}</p>
				    </div>
				</div>	
				</td>
			</tr>
		</table>		
		</div>
		<div class="divInfo container" id="payInfo" style="height: 130px;">
			<table style="width: 100%; height: 80%; margin-top: 30px; padding: 30px; margin-bottom: 10px;">
			<tr>
				<td rowspan="2" style="margin-right: 20px;vertical-align: middle;
    font-size: 23px; border-right: 5px solid pink; width: 180px;"><span style="color: gray;">결제정보</span></td>
    
				<td>
					<div class="form-group">
					    <label class="col-sm-3 name">결제방법</label>
					    <div class="col-sm-7">
					      <p class="form-control-static">${vo['PM_PAYMENTWAY']}</p>
					    </div>
				    </div>
			    </td>
			</tr>
			<tr>
				<td style="vertical-align:middle;">
				<div class="form-group">
			    <label class="col-sm-3 name">결제상태</label>
				    <div class="col-sm-7">
				      <p class="form-control-static" >
				      <c:if test="${vo['PM_COMPLETECHECK']=='Y' }">
				      <p>결제완료</p>
				      </c:if>
				      <c:if test="${vo['PM_COMPLETECHECK']=='N' }">
				      <p>결제진행중</p>
				      </c:if>
				    </div>
				</div>
				</td>
			</tr>
		</table>		
		</div>

		<div class="divInfo container" id="booking">
			<button class="button" id="bookingGo" onclick="">예약내역 보기</button>
			<button class="button" id="mainGo" onclick="">메인 홈 가기</button>
		</div> 
		<script type="text/javascript">
			$(function(){
				$("#bookingGo").click(function(){
					location.href="<c:url value='/mypage/MyClass/Payment.do'/>";
				})
				$("#mainGo").click(function(){
					location.href="<c:url value='/index2.do'/>";
				})
			})
		</script>
	</div>
</div>

<%@ include file="../inc/bottom.jsp"%>