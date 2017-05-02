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
.container{
	display: table;
}
.divInfo{
	display: table-cell;
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
	font-size: 20px;
	margin-top: 2px;
}
#chk{
	background-color: #f5f5f5;
}
</style>
<div class="wrp">
	<div class="container">
		<div class="container divInfo " id="member" style="height: 200px;">
		<table style="width: 100%; height: 80%; margin-top: 30px; padding: 30px; margin-bottom: 10px;">
			<tr>
				<td rowspan="3" style="margin-right: 20px;
    padding-right: 30px;
    font-size: 25px; border-right: 5px solid pink;"><span style="color: gray;">회원정보</span></td>
				<td>
					<div class="form-group">
					    <label class="col-sm-3 name">이름</label>
					    <div class="col-sm-7">
					      <p class="form-control-static">${memVo.mName}</p>
					    </div>
				    </div>
			    </td>
			</tr>
			<tr>
				<td>
				<div class="form-group">
			    <label class="col-sm-3 name">이메일</label>
				    <div class="col-sm-7">
				      <p class="form-control-static">${memVo.mEmail1}@${memVo.mEmail2}</p>
				    </div>
				</div>
				</td>
			</tr>
			<tr>
				<td>
				<div class="form-group">
				    <label class="col-sm-3 name">핸드폰</label>
				    <div class="col-sm-7">
				      <p class="form-control-static">${memVo.mTel1}-${memVo.mTel3}-${memVo.mTel3}</p>
				    </div>
				</div>	
				</td>
			</tr>
		</table>		
		</div>
		
		<div class="divInfo container" id="cla" style="height: 270px;">
			<table style="width: 100%; height: 80%; margin-top: 30px; padding: 30px; margin-bottom: 10px;">
			<tr>
				<td rowspan="1" style="margin-right: 20px;
    padding-right: ;
    font-size: 25px; border-right: 5px solid pink;"><span style="color: gray;">클래스정보</span></td>
    
				<td>
					<div class="form-group">
					    <label class="col-sm-3 name">클래스명</label>
					    <div class="col-sm-7">
					      <p class="form-control-static">${claVo.cName }</p>
					    </div>
				    </div>
			    </td>
			</tr>
			<tr>
				<td rowspan="3" style="margin-right: 20px;
    padding-right: 30px;
    font-size: 25px; border-right: 5px solid pink; width: 180px;">
				<img style="width: 170px; height: 140px; margin-top: 10px; " alt="" src="<c:url value='/upload/${claVo.cMainimg }'/>">
				</td>
				<td>
				<div class="form-group">
			    <label class="col-sm-3 name">예약시간</label>
				    <div class="col-sm-7">
				      <p class="form-control-static" style="font-size: 17px;">${bookVo.bkBdate}<br>${bookVo.bkTime}</p>
				    </div>
				</div>
				</td>
			</tr>
			<tr>
				<td>
				<div class="form-group">
				    <label class="col-sm-3 name">장소</label>
				    <div class="col-sm-7">
				      <p class="form-control-static" style="font-size: 17px;">${claVo.cPlace }</p>
				    </div>
				</div>	
				</td>
			</tr>
			<tr>
				<td>
				<div class="form-group">
				    <label class="col-sm-3 name">결제금액</label>
				    <div class="col-sm-7">
				      <p class="form-control-static"><fmt:formatNumber pattern="#,###" value="${claVo.cPrice }"/>원 </p>
				    </div>
				</div>	
				</td>
			</tr>
		</table>		
		</div>
		
		<div class="divInfo container" id="payment">
			<table style="width: 100%; height: 80%; margin-top: 30px; padding: 30px; margin-bottom: 10px;">
			<tr>
				<td rowspan="2" style="margin-right: 10px; width: 180px;
    padding-right: 30px;
    font-size: 25px; border-right: 5px solid pink;"><span style="color: gray;">결제방법</span></td>
				<td>
					<div class="radio" style="margin-left: 10px;">
					  <label>
					    <input type="radio" name="optionsRadios" id="optionsRadios1" value="option1" checked>
					    	무통장입금
					  </label>
					</div>
			    </td>
			</tr>
			<tr>
				<td>
				<div class="radio" style="margin-left: 10px;">
				  <label>
				    <input type="radio" name="optionsRadios" id="optionsRadios1" value="option1" checked>
				 	신용카드결제
				  </label>
				</div>
				</td>
			</tr>
		</table>	
		</div>
		
		<div class="divInfo container" id="chk">
		<div class="checkbox">
		  <label>
		    <input type="checkbox" value="">
		   본인은 개인정보 제 3자 제공 동의에 관한 내용을 모두 이해하였으며 이에 동의합니다.
		  </label>
		</div>
		</div>
		
		<div class="divInfo container" id="booking">
			<input name="" type="submit" class="" value="예약하기">
		</div>
	</div>
</div>

<%@ include file="../inc/bottom.jsp"%>