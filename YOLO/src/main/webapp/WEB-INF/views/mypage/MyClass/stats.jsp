<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h1>통계</h1>
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/highcharts-3d.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>


<script type="text/javascript">
	$(function() {
		$("#type").change(function() {
			console.log("change"+$("#type").val())
			if($("#type").val()=='1'){
				console.log("dd")
				$("#bookdiv").css('display','block')
				$("#salesdiv").hide();
			}else if($("#type").val()=="2"){
				$("#bookdiv").hide();
				$("#salesdiv").show();
			}
		})
		
		$("#submit").click(function() {
			$("#highcharts-djvnb8j-0").find().remove();
			var formData = $("#frm").serialize();
			if($("#type").val()=='1'){
				console.log("type=book")
			if($("#booking").val()=='gen'){
				console.log("ajax시작")
				$.ajax({
					url:'<c:url value="/mypage/MyClass/stats.do"/>',
					type:"POST",
		    		data: formData,		    		
		    		success:function(res){
		    			var m=0;
		    			var f=0;
		    			var age='';
		    			var n=0;
		    			var total=0;
		    			var a=new Array();
		    			$.each(res, function(i, list){
		    				$.each(list,function(i,value ){
		    					console.log("하랴"+i+"-"+value )
		    						if(i=='COUNT(*)'){
		    							console.log("count")
			    						a+=value
			    						console.log("this "+a)
			    					}
			    					m+=value[1]
			    					gen=value;
			    					count=value;
			    					total+=count;
		    							    					
		    				})
		    				/* gen=res[i].map['M_GENDER'];
		    				count=res[i].map['COUNT(*)'];
		    				total+=res[i] */
		    			});
		    			
		    			console.log(a[0]+", "+a[1])
		    			total=(a[0]*1)+(a[1]*1)
		    			m=(a[0]*1)/total;
		    			f=(a[1]*1)/total;
		    			console.log(total)
		    			Highcharts.chart('container', {
		    			    chart: {
		    			        type: 'pie',
		    			        options3d: {
		    			            enabled: true,
		    			            alpha: 45,
		    			            beta: 0
		    			        }
		    			    },
		    			    title: {
		    			        text: '예약자 통계'
		    			    },
		    			    tooltip: {
		    			        pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
		    			    },
		    			    plotOptions: {
		    			        pie: {
		    			            allowPointSelect: true,
		    			            cursor: 'pointer',
		    			            depth: 35,
		    			            dataLabels: {
		    			                enabled: true,
		    			                format: '{point.name}'
		    			            }
		    			        }
		    			    },
		    			    series: [{
		    			        type: 'pie',
		    			        name: '예약자 성비',
		    			        data: [
		    			        	['남성',m ],
		    			            ['여성', f]
		    			        ]
		    			    }]
		    			});
		    		},error:function(xhr, status, error){
		    			alert('차트 실패!.');
		    			console.log(error)
		    			history.back();
		    		}			    		
				})
			}else if($("#booking").val()=='age'){
				$.ajax({
					url:'<c:url value="/mypage/MyClass/stats.do"/>',
					type:"POST",
		    		data: formData,		    		
		    		success:function(res){
		    			var age=new Array();
		    			var n=new Array();
		    			var total=0;
		    			var a=new Array();
		    			$.each(res, function(i, list){
		    				$.each(list,function(i,value ){
		    					console.log("하랴"+i+"-"+value )
		    					if(i=='AGE'){
		    						age+=value
		    					}else if(i=='COUNT(*)'){
		    						n+=value
		    					}
		    					
		    				})
		    				console.log(age);
		    				console.log(n);
		    			});
		    			var inx=0;
		    			var per=new Array();
		    			$.each(n, function(i, list){
		    				total+=n[i]*1
		    				inx=i
		    			})
		    			inx+=1
		    			$.each(n,function(i,list){
		    				per+=(n[i]*1)/total
		    			})
		    			
		    			console.log(total)
		    			console.log(per)
		    			Highcharts.chart('container', {
		    			    chart: {
		    			        type: 'pie',
		    			        options3d: {
		    			            enabled: true,
		    			            alpha: 45,
		    			            beta: 0
		    			        }
		    			    },
		    			    title: {
		    			        text: '예약자 통계'
		    			    },
		    			    tooltip: {
		    			        pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
		    			    },
		    			    plotOptions: {
		    			        pie: {
		    			            allowPointSelect: true,
		    			            cursor: 'pointer',
		    			            depth: 35,
		    			            dataLabels: {
		    			                enabled: true,
		    			                format: '{point.name}'
		    			            }
		    			        }
		    			    },
		    			    series: [{
		    			        type: 'pie',
		    			        name: '예약자 연령대',
		    			        data: [
		    			        	$.each(per, function(i, list){
		    			        		[]
		    			        	})
		    			        ]
		    			    }]
		    			});
		    		},error:function(xhr, status, error){
		    			alert('차트 실패!.');
		    			console.log(error)
		    		}			    		
				})
			}}
			if($("#type").val()=='2'){
				if($("#sales").val()=='m'){
					$.ajax({
						url:'<c:url value="/mypage/MyClass/staSel.do"/>',
						type:"GET",		    		
			    		success:function(res){
			    			
			    		},error:function(xhr, status, error){
			    			alert('매출 통계 실패!.');
			    			console.log(error)
			    			
			    		}			    		
					})
				}
			}
			
		})
		//차트
		
	})
</script>
<form action="<c:url value='/mypage/MyClass/stats.do'/>" method="post" id="frm">
<div class="col-xs-4">
<input type="text" id="staCno" name="cNo">
<select class="form-control "  id="type" name="type">
	<option>통계 옵션을 선택하세요.</option>
	<option value="1">예약현황 통계</option>
	<option value="2">매출 통계</option>
</select>
</div>
<div class="col-xs-4" id="bookdiv" style="display: none;">
<select class="form-control "  id="booking" name="book">
	<option>예약현황 옵션을 선택하세요.</option>
	<option value="gen">성별</option>
	<option value="age">연령대별</option>
</select>
</div>
<div class="col-xs-4" id="salesdiv" style="display: none;" >
<select class="form-control "  id=sales name="sales">
	<option>매출 옵션을 선택하세요.</option>
	<option value="d">일별</option>
	<option value="m">월별</option>
	<option value="y">연도별</option>
</select>
</div>
<br>
<button type="button" id="submit">통계보기</button>

</form>
<hr>
<div id="container" style="height: 400px"></div>
