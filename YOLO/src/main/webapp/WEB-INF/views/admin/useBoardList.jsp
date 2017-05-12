<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
	
	if($("#searchCondition").val()=='NB_REGDATE'){
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
		if(selCondition == 'NB_REGDATE'){
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
#membersave{
	color: blue;
}

#frm1{
	width: 400px; 
	margin: 0 auto;
}
#searchSel{
	margin : 0 auto;
}

#filelabel{
	font-size: 10px;
}

</style>







<script type="text/javascript">
	function pageFunc(curPage) {
		document.frmPage.currentPage.value=curPage;
		frmPage.submit();
	}
	 function typeFunc(type) {
		document.frmPage.ubType.value=type;
		document.frmPage.currentPage.value=1;
		if(type == 1) {
			document.frmPage.action = $("#context").val() + "/useboard/list.do";
		}
		if(type == 2) {
			document.frmPage.action = $("#context").val() + "/useboard/uselist.do";
		}
		if(type == 3) {
			document.frmPage.action = $("#context").val() + "/useboard/paylist.do";
			///useboard/paylist.do
		}
		
		
		frmPage.submit(); 
	} 
	
	function showContent($obj) {
		if($("pre", $obj).css('display') === 'none') {
			$("pre", $obj).show();
		}
		else {
			$("pre", $obj).hide();
		}
	}

	
</script>

<style>
ul{
   list-style:none;
   padding-left:0px;
   }
</style>


<!-- 페이징 처리를 위한 form 시작-->
<form name="frmPage" method="post" 
	action='<c:url value="/useboard/list.do"/>'>
	<input type="hidden" name="currentPage">
	<input type="hidden" name="searchCondition" value="${param.searchCondition }">
	<input type="hidden" name="searchKeyword" value="${param.searchKeyword}">
	<input type="hidden" name="ubType" value="${param.ubType}">
	<input type="hidden" id="context" value="${pageContext.request.contextPath}">
</form>

<c:if test="${!empty param.searchKeyword }">
	<p>검색어 : ${param.searchKeyword}, 
	${pagingInfo.totalRecord}건 검색되었습니다</p>
</c:if>

<style>
.tab-pane table{width:100%;}
</style>

<div class="col-md-10">
	<div class="container">
		<div class="col-md-2" align="left"></div>
		<h2>이용안내</h2>
		
		  <br><br>
		
		
		<div class="col-md-10">
			<ul class="nav nav-tabs nav-justified">
				<li class="active"><a role="tab" data-toggle="tab" 
				onclick="typeFunc(1);"> 자주묻는 질문</a></li>
				<li><a role="tab" data-toggle="tab" 
				onclick="typeFunc(2);">이용 관련</a></li>
				<li><a role="tab" data-toggle="tab" 
				onclick="typeFunc(3);">결제 관련</a></li>
			</ul>

					<!-- Tab panes -->
					<div class="tab-content">
						<div role="tabpanel" class="tab-pane active" id="/useboard/list.do">
							
						

						<!-- <div role="tabpanel" class="tab-pane" id="use"> -->

							
					
						<div class="tab-content">
							
						</div>
						<br>
						<br>
						
						<ul id="ulTemp">
							<c:forEach var="vo" items="${uList }" varStatus="status">
								<li onclick="showContent($(this))">
									<span>0${status.index+1}  ${vo.ubTitle}</span>
									<pre style="display: none;">${vo.ubContent}</pre>
								</li>
							</c:forEach>
						</ul>
						

						<!-- div role="tabpanel" class="tab-pane" id="pay"> -->
						
			</div>
		</div>
	</div>
</div>
						
						
						
						


<div class="col-md-10">
	<div class="col-md-2" align="left"></div>
	<div class="col-md-10">
   	<form name="frmSearch" method="post" align="center"
   		action="<c:url value='/useboard/list.do' />" >
        <select name="searchCondition" class="btn btn-default">
            <option value="ub_title" 
            	<c:if test="${'ub_title'==param.searchCondition }">
            		selected            	
            	</c:if>
            	>제목</option>
            <option value="ub_content" class="btn btn-default"
            	<c:if test="${'ub_content'==param.searchCondition }">
            		selected            	
            	</c:if>
            >내용</option>
        </select>
        
        
        <input class="btn btn-default" type="text" name="searchKeyword" title="검색어 입력" placeholder="Use Search..."
        	value="${param.searchKeyword }">
        <input class="btn btn-primary" type="submit" value="검색">

		<!-- <input type="submit" value="검색"> -->
		<div style="text-align:right;">
		    <a href="<c:url value='/useboard/write.do'/>" >이용안내추가</a>
		</div>

    </form>
</div>
</div>
</div>






<%@include file="../inc/admin/bottom.jsp" %>