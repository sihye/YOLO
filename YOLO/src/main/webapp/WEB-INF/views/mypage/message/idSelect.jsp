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
function addNode() {
	// 우측 선택한 아이디 목록으로 복사한다
	var candidate = document.getElementById("candidate");
	var selection = document.getElementById("selection");

	var new_option;
	if ( candidate.selectedIndex == -1 )
	{
		alert("받는 사람에 추가할 아이디를 선택하세요");
		return;
	}
	for (var i=0;i< candidate.length; i++)
	{
		if (candidate.options[i].selected == true)
		{
			temp_option = candidate.options[i];
			var already = false;
			for( var j = 0; j < selection.options.length; j++)
			{
				// id 중복해서 추가하지 않는다
				if( selection.options[j].value == temp_option.value)
				{
					alert( " 이미 추가된 친구입니다.\r\n"+ selection.options[j].text );
					already = true;
					break;
				}
			}
			if( !already )
			{
				/* if(buddySize(temp_option.value.length) > 4000)
				{
					alert("최대인원이 초과되어  그룹쪽지를 보낼 수 없습니다  \r\n받는 사람을 확인해주세요.");
					return;
				}
 */
				new_option = document.createElement("Option");
				new_option.text= temp_option.text;
				new_option.value= temp_option.value;
				selection.options.add(new_option);
			}
		}
	}
}
function delNode()	{
	// 선택한 아이디 목록에서 삭제한다
	var selection = document.getElementById("selection");
	if ( selection.selectedIndex == -1 )
	{
		alert("받는 사람에서 삭제할 아이디를 선택하세요");
		return;
	}
	for (var i=0;i< selection.length; i++)
	{
		if (selection.options[i].selected == true && selection.options[i].value!="")
		{
			selection.options[i] = null;
			i--;
		}
	}
}
function Apply()
{
	
	//2014.06.23. userId와 부모창의 login ID의 일치성은 부모창에서 보고 판단한다.
	//해당창이 부모가 없으며( == 내가iframe이 아닌 경우) && 팝업창이 없으면. 
	if (!(parent && parent != this) && (window.opener == null ||  window.opener.closed))
	{
		alert("쓰기페이지를 찾을 수 없습니다.\r\n창을 닫고 다시 시도해주시기 바랍니다.");				
		closeWindow();
		return;
	}
	
	
	var to_ids = document.getElementById("notBuddyReceiver").value;
	var selection = document.getElementById("selection");
	if ( selection.length <= 0 && to_ids.length <=0 )
	{
		if ( confirm("받는 사람이 없습니다." + "\n\n창을 닫으시겠습니까?") ) // 확인눌렀는데 선택한 아이디가 없을경우
		{
			closeWindow();
		}
		else
		{
			return;
		}
	}
	
	if (window.opener == null && (!isBrowserIE) || (ieVersion >= 8) || (ieVersion < 8 && isTrident))
	{
		var postMsgData = {};
		postMsgData.code = "sendMemoData";
		postMsgData.userId = userId;
		postMsgData.receiverList = [];
		
		for (var i = 0 ; i < selection.length ; i++)
		{
			temp_option = selection.options[i];
			if ( temp_option.value!="")
			{
				tempArray = temp_option.text.split(' ');
				var tempVar = {id: "", name:""};
				if (tempArray.length>1)
				{
					tempVar.name = temp_option.text.split(' ')[0];
				}
				tempVar.id = temp_option.value;
				
				postMsgData.receiverList[i] = isBrowserIE ? JSON.stringify(tempVar) : tempVar;
				
			}
		}
		
		parent.postMessage(isBrowserIE? JSON.stringify(postMsgData) : postMsgData, "http://" + currentDomain);
		
	}
	else
	{
		for (var i=0; i< selection.length; i++)
		{
			temp_option = selection.options[i];
			if ( temp_option.value!="")
			{
				tempArray = temp_option.text.split(' ');
				if (tempArray.length>1)
					to_ids += "\"" + temp_option.text.split(' ')[0] + "\"<" + temp_option.value + ">;";
				else
					to_ids += "<" + temp_option.value + ">;";
			}
		}
		
		$('textarea.to_input', window.opener.document).val(to_ids).focus();
		
	}
	
	closeWindow();

}

</script>
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
						<c:forEach var="alist" items="${flList }">	
							<option value="${alist.flWuserid}">${alist.flWuserid}</option>
						</c:forEach>
					</select>
					<input type="hidden" id="notBuddyReceiver" value=""/>
				</div>

				<div class="col-md-2">
					<br><br>
					<span class="button icon"><button
							class="btn btn-sm btn-primary" type="button"
							title="받는 사람 목록으로 추가하기" onclick="addNode()">
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


