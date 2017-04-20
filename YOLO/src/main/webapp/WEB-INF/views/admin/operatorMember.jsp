<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="../inc/admin/top.jsp" %>

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>




<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<!-- datepicker 한국어로 -->
<script
	src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/i18n/datepicker-ko.js"></script>
<script>
$(document).ready(function() {

    //datepicker 한국어로 사용하기 위한 언어설정
    $.datepicker.setDefaults($.datepicker.regional['ko']);     

    // Datepicker            
    $(".datepicker").datepicker({
        showButtonPanel: true,
        dateFormat: "yy-mm-dd",
        onClose : function ( selectedDate ) {
        
            var eleId = $(this).attr("id");
            var optionName = "";

            if(eleId.indexOf("StartDate") > 0) {
                eleId = eleId.replace("StartDate", "EndDate");
                optionName = "minDate";
            } else {
                eleId = eleId.replace("EndDate", "StartDate");
                optionName = "maxDate";
            }

            $("#"+eleId).datepicker( "option", optionName, selectedDate );        
            $(".searchDate").find(".chkbox2").removeClass("on"); 
        }
    }); 

    //시작일.
    /*$('#searchStartDate').datepicker("option","onClose", function( selectedDate ) {    
        // 시작일 datepicker가 닫힐때
        // 종료일의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
        $("#searchEndDate").datepicker( "option", "minDate", selectedDate );
        $(".searchDate").find(".chkbox2").removeClass("on");
    });
    */

    //종료일.
    /*$('#searchEndDate').datepicker("option","onClose", function( selectedDate ) {    
        // 종료일 datepicker가 닫힐때
        // 시작일의 선택할수있는 최대 날짜(maxDate)를 선택한 종료일로 지정 
        $("#searchStartDate").datepicker( "option", "maxDate", selectedDate );
        $(".searchDate").find(".chkbox2").removeClass("on");
    });
    */

    $(".dateclick").dateclick();    // DateClick
    $(".searchDate").schDate();        // searchDate
    
});

// Search Date
jQuery.fn.schDate = function(){
    var $obj = $(this);
    var $chk = $obj.find("input[type=radio]");
    $chk.click(function(){                
        $('input:not(:checked)').parent(".chkbox2").removeClass("on");
        $('input:checked').parent(".chkbox2").addClass("on");                    
    });
};

// DateClick
jQuery.fn.dateclick = function(){
    var $obj = $(this);
    $obj.click(function(){
        $(this).parent().find("input").focus();
    });
}    


function setSearchDate(start){

    var num = start.substring(0,1);
    var str = start.substring(1,2);

    var today = new Date();

    //var year = today.getFullYear();
    //var month = today.getMonth() + 1;
    //var day = today.getDate();
    
    var endDate = $.datepicker.formatDate('yy-mm-dd', today);
    $('#searchEndDate').val(endDate);
    
    if(str == 'd'){
        today.setDate(today.getDate() - num);
    }else if (str == 'w'){
        today.setDate(today.getDate() - (num*7));
    }else if (str == 'm'){
        today.setMonth(today.getMonth() - num);
        today.setDate(today.getDate() + 1);
    }

    var startDate = $.datepicker.formatDate('yy-mm-dd', today);
    $('#searchStartDate').val(startDate);
            
    // 종료일은 시작일 이전 날짜 선택하지 못하도록 비활성화
    $("#searchEndDate").datepicker( "option", "minDate", startDate );
    
    // 시작일은 종료일 이후 날짜 선택하지 못하도록 비활성화
    $("#searchStartDate").datepicker( "option", "maxDate", endDate );

}

</script>


<script type="text/javascript">
$(document).ready(function() {
	
	if($("#searchCondition").val()=='M_JOINDATE'){
		$("#searchKeyword").hide();
		$(".clearfix").show();
	}else{
		$("#searchKeyword").show();
		$("#searchStartDate").val('');
		$("#searchEndDate").val('');
		$(".clearfix").hide();
	}
	
	
	
	
	$("#searchCondition").change(function() {
		var selCondition = $(this).val();
		if(selCondition == 'M_JOINDATE'){
			$("#searchKeyword").hide();
			$(".clearfix").show();
		}else{
			$("#searchKeyword").show();
			$("#searchStartDate").val('');
			$("#searchEndDate").val('');
			$(".clearfix").hide();
		}
	});
});




function pageFunc(curPage){
	document.frmPage.currentPage.value=curPage;
	frmPage.submit();
}
</script>
<style>

.bootstrap-select>.dropdown-toggle {
    width: 60%;
}
th {
    text-align: left;
    width: 200px;
}
#cont1{
	height: 100%;
}
element.style {
    width: 770%;
}
a{
	color: black;
}

#downA{
	color: blue;
}

#frm1{
	width: 400px; 
	margin: 0 auto;
}
#searchSel{
	margin : 0 auto;
}



</style>







<div class="container" id="cont1">

<!-- 페이징 처리를 위한 form 태그 -->
<form name="frmPage" method="post"
	action='<c:url value="/admin/operatorMember.do" />'>
	<input type="hidden" name="currentPage"> <input type="hidden"
		name="searchCondition" value="${param.searchCondition }"> <input
		type="hidden" name="searchKeyword" value="${param.searchKeyword}">
	<input type="hidden" name="searchStartDate"
		value="${param.searchStartDate}"> <input type="hidden"
		name="searchEndDate" value="${param.searchEndDate}">
</form>


	<h2>회원 관리</h2>

    <br><br>


<label> 현재 회원 정보 엑셀 저장 </label>
<a id='downA' href="<c:url value="/admin/excel.do?searchKeyword=${param.searchKeyword }&searchCondition=${param.searchCondition }&searchStartDate=${param.searchStartDate }&searchEndDate=${param.searchEndDate }"/>">다운로드</a> <br><br>

	<table class="table table-hover">
  		<tr>
  			<th>NO</th>
  			<th>이름</th>
  			<th>아이디</th>
  			<th>가입일자</th>
  			<th>관심목록1</th>
  			<th>관심목록2</th>
  			<th>관심목록3</th>
  		</tr>
  		<c:if test="${!empty alist }">
  		<c:forEach var="map" items="${alist }">
  		<tr>
  			<td>${map["M_NO"]}</td>
  			<td><a href="#">${map["M_NAME"]}</a></td>
  			<td>${map["M_USERID"]}</td>
  			<td><fmt:formatDate value="${map['M_JOINDATE'] }" pattern="yyyy-MM-dd"/></td>
 			<td>${map["K_1"] }</td>
 			<td>${map["K_2"] }</td>
 			<td>${map["K_3"] }</td>
		</c:forEach>  		
		</c:if>
	</table>	
			<c:if test="${empty alist }">
				<span class="center">검색에 대한 정보가 존재하지 않습니다.</span>
			</c:if>
		
	<hr>
	
	
  
	<%-- <form class="form-inline" role="form" name="frm1" id="frm1" method="post" action='<c:url value="/admin/operatorInsert.do"/>' enctype="multipart/form-data">
	  <div class="form-group">
	  </div>
	  <div class="form-group">
	   <select id="Select1" name="kNo" class="selectpicker" style="height:30px">
	   <option value="">
	   	검색 목록
	   </option>
	   <option value="M_USERID">
	   ID 검색
	   </option>
	   <option value="M_NAME">
	   이름 검색
	   </option>
		</select>
		</div>
	   <div class="form-group">
	   <input type="text"> 
		
		<input type="submit" id="btSubmit" value="검색">
		
	  </div>
	</form> --%>
	<div class="divList">
	<div class="divPage" style="text-align: center">
	<!-- 페이지 번호 추가 -->
	<!-- 이전 블럭으로 이동 ◀-->
	<nav>
		<ul class="pagination">
			<c:if test="${pagingInfo.firstPage>1 }">
				<li><a href="#" aria-label="Previous" 
				onclick="pageFunc(${pagingInfo.firstPage-1})">
				<span aria-hidden="true">&laquo;</span></a></li>
			</c:if>

			<c:forEach var="i" begin="${pagingInfo.firstPage }"
				end="${pagingInfo.lastPage }">
				<c:if test="${i==pagingInfo.currentPage }">
					<li class="active"><a href="#"> ${i}<span class="sr-only">${i }</span></a></li>
				</c:if>
				<c:if test="${i!=pagingInfo.currentPage }">
					<li><a href="#" onclick="pageFunc(${i})">${i}</a></li>
				</c:if>
			</c:forEach>

			<!-- 다음 블럭으로 이동 ▶-->
			<c:if test="${pagingInfo.lastPage < pagingInfo.totalPage}">
				<li><a href="#" aria-label="Previous" 
				onclick="pageFunc(${pagingInfo.lastPage+1})">
				<span aria-hidden="true">&raquo;</span></a></li>			
			</c:if>

			<!--  페이지 번호 끝 -->
		</ul>
	</nav>
</div>
</div>
	
	
	
	
	
	
	<div class ="divlist">
	<form  id="frm1" name ="frm1" method="post" action="" >
		<select id="searchCondition" name="searchCondition" style="height: 26px">
			<option value="M_USERID" <c:if test="${param.searchCondition eq 'M_USERID' }" >selected="selected"</c:if>>
			ID 검색
			</option>
			<option value="M_NAME" <c:if test="${param.searchCondition eq 'M_NAME' }" >selected="selected"</c:if>>
			이름 검색
			</option>
			<option value="M_JOINDATE" <c:if test="${param.searchCondition eq 'M_JOINDATE' }" >selected="selected"</c:if>>
			가입일 검색
			</option> 
		</select>
		<input type="text"  id = "searchKeyword" name="searchKeyword" style="height: 25px" value="${param.searchKeyword}">
			<div class="clearfix">
							<!-- 시작일 -->
							<span class="dset"> <input type="text"
								class="datepicker inpType" name="searchStartDate"
								id="searchStartDate" value="${param.searchStartDate}">
							</span> <span class="demi">~</span>
							<!-- 종료일 -->
							<span class="dset"> <input type="text"
								class="datepicker inpType" name="searchEndDate"
								id="searchEndDate" value="${param.searchEndDate}">
							</span>
			</div>
		<input type="submit" value="검색"  style="height: 25px">
	</form>
	</div>
	
	
</div>
</form>






<%@include file="../inc/admin/bottom.jsp" %>