<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
.selectreg .multiple {
	width: 100%;
	width: 100%;
}

</style>
<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal"
		aria-label="Close" aria-hidden="true">×</button>
	<h3 class="smaller lighter blue no-margin modal-title">관심호스트 목록</h3>
</div>

<div class="modal-body">
	<div class="selectreg">
			<div class="row">
				<div class="col-md-5">
					<h3 class="smalltitle">관심호스트</h3>
					<select name="candidate" id="candidate" multiple="multiple"
						class="multiple">
					</select>
				</div>

				<div class="col-md-2">
					<br><br>
					<span class="button icon"><button
							class="btn btn-sm btn-primary" type="button"
							title="받는 사람 목록으로 추가하기" onclick="javascript:addNode();">
							추가<i class="ace-icon fa fa-arrow-right icon-on-right bigger-110"></i>
						</button></span> 
						<br><br>
						<span class="button icon"><button
							class="btn btn-sm btn-primary" type="button"
							title="받는 사람 목록에서 삭제하기" onclick="javascript:delNode();">
							삭제<i class="ace-icon fa fa-arrow-left icon-on-left bigger-110"></i>
						</button></span>
				</div>
				<div class="col-md-5">
					<h3 class="smalltitle">받는 사람</h3>
					<select name="selection" id="selection" multiple="multiple"
						class="multiple">
					</select>
				</div>
			</div>


	</div>
</div>
<div class="modal-footer">

	<span class="btn btn-sm btn-primary" id="Save"> 확인<i
		class="ace-icon fa fa-arrow-right icon-on-right bigger-110"></i>
	</span>
	<button class="btn btn-sm btn-danger pull-right" data-dismiss="modal"
		id="btnClose">
		<i class="ace-icon fa fa-times"></i>닫기
	</button>
</div>


