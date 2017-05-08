<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
.selectreg .multiple {
	width: 100%;
	width: 100%;
}
h3{
		font-size: 20px;
		webkit-margin-before: 1.67em;
	    webkit-margin-after: 1.67em;
	    webkit-margin-start: 0px;
	    webkit-margin-end: 0px;
	    font-weight: bold;
	    color: blue;
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
	
	var to_ids = document.getElementById("notBuddyReceiver").value;
	var selection = document.getElementById("selection");
	if ( selection.length <= 0 && to_ids.length <=0 )
	{
		if ( confirm("받는 사람이 없습니다." + "\n\n창을 닫으시겠습니까?") ) // 확인눌렀는데 선택한 아이디가 없을경우
		{
			 history.go(0)
		}
		else
		{
			return;
		}
	}
	var receiverList = [];

	for (var i = 0 ; i < selection.length ; i++)
	{
		temp_option = selection.options[i];
		if ( temp_option.value!="")
		{
			tempArray = temp_option.text.split(' ');
			var tempVar = temp_option.value;		
			receiverList[i]=tempVar;	
		}
	}
	location.href='<c:url value="/mypage/message/messageSend.do?result='+receiverList+'" />';
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
					<input type="hidden" id="notBuddyReceiver" value=""/>
				</div>
			</div>


	</div>
</div>
<div class="modal-footer">

	<span class="btn btn-sm btn-primary" id="Save" onclick="Apply()"> 확인<i
		class="ace-icon fa fa-arrow-right icon-on-right bigger-110"></i>
	</span>
	<button class="btn btn-sm btn-danger pull-right" data-dismiss="modal"
		id="btnClose">
		<i class="ace-icon fa fa-times"></i>닫기
	</button>
</div>


