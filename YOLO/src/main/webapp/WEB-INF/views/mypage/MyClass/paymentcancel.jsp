<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
.selectreg .multiple {
	width: 100%;
	width: 100%;
}
</style>
<script>
	$(function() {
		$("#cancel").change(function() {
			if($("#cancel option:selected").val()=='etc'){
				$("#etcdiv").show();
			}else{
				$("#etcdiv").hide();
				$("#etctext").val('');
			}
			
		});
		$("#Save").click(function() {
			var pmcCalcel=$("#cancel option:selected").val();
			var pmcDetatl=$("#etctext").val();
			var pmNo=${param.pmNo};
			if(pmcCalcel=='menu0'){
				alert("취소유형을 선택해주세요");
				return false;
			}else if(pmcCalcel=='etc'){
				if(pmcDetatl==''){
					alert("기타사유를  작성해주세요");
					return false;
				}else{
					$(location).attr('href'
							,'<c:url value="/mypage/MyClass/insertPaymentCancel.do?pmcCalcel='
									+pmcCalcel+'&pmcDetatl='+pmcDetatl+'&pmNo='+pmNo+'"/>');
				}
				
			}else{
				$(location).attr('href'
				,'<c:url value="/mypage/MyClass/insertPaymentCancel.do?pmcCalcel='+pmcCalcel+'&pmNo='+pmNo+'"/>');
			}
		});
	});
</script>
<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal"
		aria-label="Close" aria-hidden="true">×</button>
	<h3 class="smaller lighter blue no-margin modal-title">결제 취소</h3>
</div>

<div class="modal-body">
	<div class="selectreg">
		<div class="row">
			<div class="col-md-5">
				<h4 class="smalltitle">취소유형</h3>
				<select id="cancel" class="form-control">
					<option id="menu0" value="menu0">선택하세요</option>
					<option id="menu1" value="잘못신청">잘못신청</option>
					<option id="menu2" value="단순변심">단순변심</option>
					<option id="menu3" value="서비스불량">서비스불량</option>
					<option id="menu4" value="재결제">재결제</option>
					<option id="etc" value="etc">기타</option>
				</select>

			</div>	
			<div class="col-md-7">
			<div id="etcdiv" style="display: none;">
			<h4 class="etctitle">기타사유</h3>
			<input type="text" class="form-control" id="etctext" placeholder="기타사유를 입력하세요">
			</div>
			</div>		
		</div>


	</div>
</div>
<div class="modal-footer">

	<span class="btn btn-sm btn-primary" id="Save" >
		확인<i class="ace-icon fa fa-arrow-right icon-on-right bigger-110"></i>
	</span>
	<button class="btn btn-sm btn-danger pull-right" data-dismiss="modal"
		id="btnClose">
		<i class="ace-icon fa fa-times"></i>닫기
	</button>
</div>