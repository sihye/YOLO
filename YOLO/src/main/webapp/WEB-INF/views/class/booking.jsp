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
    width: 90%;
}

.button:hover {
    background-color: #ffc0cb;
    color: white;
}

</style>
<!-- 결제 -->
<script src="https://service.iamport.kr/js/iamport.payment-1.1.4.js" type="text/javascript"></script>


<div class="wrp">
	<div class="container">
		<div class="container divInfo " id="member" style="height: 200px;">
		<table style="width: 100%; height: 80%; margin-top: 30px; padding: 30px; margin-bottom: 10px;">
			<tr>
				<td rowspan="3" style="margin-right: 20px;
    padding-right: 30px; padding: 5px;
    font-size: 23px; border-right: 5px solid pink;"><span style="color: gray;">회원정보</span></td>
				<td style="padding: 5px;">
					<div class="form-group">
					    <label class="col-sm-3 name">이름</label>
					    <div class="col-sm-7">
					      <p class="form-control-static">${memVo.mName}</p>
					    </div>
				    </div>
			    </td>
			</tr>
			<tr>
				<td style="padding: 5px;">
				<div class="form-group">
			    <label class="col-sm-3 name">이메일</label>
				    <div class="col-sm-7">
				      <p class="form-control-static">${memVo.mEmail1}@${memVo.mEmail2}</p>
				    </div>
				</div>
				</td>
			</tr>
			<tr>
				<td style="padding: 5px;">
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
				<td rowspan="1" style="margin-right: 20px;vertical-align: middle;
    font-size: 23px; border-right: 5px solid pink;"><span style="color: gray;">클래스정보</span></td>
    
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
				<td style="vertical-align:middle;">
				<div class="form-group">
			    <label class="col-sm-3 name">예약시간</label>
				    <div class="col-sm-7">
				      <p class="form-control-static" >${bookVo.bkBdate}<br>${bookVo.bkTime}</p>
				    </div>
				</div>
				</td>
			</tr>
			<tr>
				<td>
				<div class="form-group">
				    <label class="col-sm-3 name">장소</label>
				    <div class="col-sm-7">
				      <p class="form-control-static" >${claVo.cPlace }</p>
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
			<table style="width: 100%; height: 80%; margin-top: 20px; padding: 30px; margin-bottom: 20px;">
			<tr>
				<td  style="margin-right: 10px; width: 180px;
    padding-right: 30px;
    font-size: 23px; border-right: 5px solid pink;"><span style="color: gray;">결제방법</span></td>
    			<td>
					<div class="radio" style="margin-left: 10px;">
					  <label>
					    <input type="radio" class="payment" name="payment" id="kakao" value="kakao">
					    	카카오페이
					  </label>
					  <label>
					    <input type="radio" class="payment" name="payment" id="account" value="account" >
					    	무통장입금
					  </label>
					  <label>
					    <input type="radio" class="payment" name="payment" id="card" value="card" >
					    	카드결제
					  </label>
					</div>
			    </td>
			</tr>
		</table>	
		</div>
		
		<div class="divInfo container" id="chk">
		<div class="checkbox">
		  <label>
		    <input type="checkbox" value="" id="infochk">
		   본인은 개인정보 제 3자 제공 동의에 관한 내용을 모두 이해하였으며 이에 동의합니다.
		  </label>
		</div>
		</div>
		
		<div class="divInfo container" id="booking">
			<button class="button">예약하기</button>
		</div> 
		

	</div>
</div>
<script type="text/javascript">
	$(function(){
		//결제
		IMP.init('imp97437286');
		$(".button").click(function(){
			if($("#infochk").is(":checked")){
				if($("input[type=radio][name=payment]:checked").val()=='card'){
					IMP.request_pay({
					    pg : 'html5_inicis',
					    pay_method : 'card',
					    merchant_uid : 'merchant_' + new Date().getTime(),
					    name : '주문명:${claVo.cName}',
					    amount : 100/* ${claVo.cPrice} */,
					    buyer_email : '${memVo.mEmail1}@${memVo.mEmail2}',
					    buyer_name : '${memVo.mName}',
					    buyer_tel : '${memVo.mTel1}-${memVo.mTel3}-${memVo.mTel3}'
					}, function(rsp) {
					    if ( rsp.success ) {
					    	console.log("ajax 성공")
					    	console.log(rsp.merchant_uid)
					    	$.ajax({
					    		url:'<c:url value="/class/bookingOk.do"/>',		
					    		type:'POST',
					    		data:{
					    			scNo:'${bookVo.scNo}',
					    			bkBdate:'${bookVo.bkBdate}',
					    			bkTime:'${bookVo.bkTime}',	
					    			pmNo:rsp.merchant_uid,
					    			pmPaymentway:'card',
					    			cNo:${claVo.cNo}
					    		},
					    		dataType:'json',
					    		success:function(res){
					    			alert('결제가 완료됐습니다.');
					    			location.href="<c:url value='/class/payOk.do?cNo=${claVo.cNo}'/>";
					    		},error:function(xhr,status,error){
					    			alert('결제가 정보 입력 실패! 다시 시도해 주세요.');
					    			history.back();
					    		}
					    	})
					        
					       /*  msg += '고유ID : ' + rsp.imp_uid;
					        msg += '상점 거래ID : ' + rsp.merchant_uid;
					        msg += '결제 금액 : ' + rsp.paid_amount;
					        msg += '카드 승인번호 : ' + rsp.apply_num; */
					    } else {
					        var msg = '결제에 실패하였습니다.';
					        msg += '에러내용 : ' + rsp.error_msg;
					        alert(msg);
					    }  
					});
				}else if($("input[type=radio][name=payment]:checked").val()=='account'){
					//입금기한 셋팅
					var today = new Date();
					today.setDate(today.getDate() + 3);
					Date.prototype.yyyymmdd = function()
					 {
					     var yyyy = this.getFullYear().toString();
					     var mm = (this.getMonth() + 1).toString();
					     var dd = this.getDate().toString();
					 
					     return yyyy + (mm[1] ? mm : '0'+mm[0]) + (dd[1] ? dd : '0'+dd[0]);
					 }
					var day=(today).yyyymmdd();
					console.log(day);
					
					IMP.request_pay({
					    pg : 'html5_inicis',
					    pay_method : 'vbank',
					    merchant_uid : 'merchant_' + new Date().getTime(),
					    vbank_due:'${day}',
					    name : '주문명:${claVo.cName}',
					    amount : ${claVo.cPrice},
					    buyer_email : '${memVo.mEmail1}@${memVo.mEmail2}',
					    buyer_name : '${memVo.mName}',
					    buyer_tel : '${memVo.mTel1}-${memVo.mTel3}-${memVo.mTel3}'
					}, function(rsp) {
					    if ( rsp.success ) {
					        var msg = '결제가 완료되었습니다.';
					        msg += '고유ID : ' + rsp.imp_uid;
					        msg += '상점 거래ID : ' + rsp.merchant_uid;
					        msg += '결제 금액 : ' + rsp.paid_amount;
					        msg += '카드 승인번호 : ' + rsp.apply_num;
					    } else {
					        var msg = '결제에 실패하였습니다.';
					        msg += '에러내용 : ' + rsp.error_msg;
					    }
					    
					    alert(msg);
					});
				}else if($("input[type=radio][name=payment]:checked").val()=='kakao'){
					console.log($("input[name=payment]").val()=='kakao')
					IMP.request_pay({
					    pg : 'kakao',
					    merchant_uid : 'merchant_' + new Date().getTime(),
					    name : '주문명:${claVo.cName}',
					    amount : ${claVo.cPrice},
					    buyer_email : '${memVo.mEmail1}@${memVo.mEmail2}',
					    buyer_name : '${memVo.mName}',
					    buyer_tel : '${memVo.mTel1}-${memVo.mTel3}-${memVo.mTel3}'
					}, function(rsp) {
					    if ( rsp.success ) {
					        var msg = '결제가 완료되었습니다.';
					        msg += '고유ID : ' + rsp.imp_uid;
					        msg += '상점 거래ID : ' + rsp.merchant_uid;
					        msg += '결제 금액 : ' + rsp.paid_amount;
					        msg += '카드 승인번호 : ' + rsp.apply_num;
					    } else {
					        var msg = '결제에 실패하였습니다.';
					        msg += '에러내용 : ' + rsp.error_msg;
					    }
					    
					    alert(msg);
					});
				}else{
					alert("결제방법을 선택해 주세요!")
					$(".payment").focus();
				}
					
					
				
			}else{
				alert("개인정보 제 3자 제공 동의에 관한 내용에 동의하셔야 결제가 진행됩니다.")
				$("#infochk").focus();
			}
		})
	})
</script>
<%@ include file="../inc/bottom.jsp"%>