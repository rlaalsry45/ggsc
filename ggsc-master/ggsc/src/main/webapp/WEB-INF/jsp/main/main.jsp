<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript">
	$(function(){
		list();
	});
	function fn_excelDown(){
		document.location.href = "/gnoincoundb/center_ExcelDown.do";
	}

	function list() {
		var token = $("meta[name='_csrf']").attr("th:content");
		var header = $("meta[name='_csrf_header']").attr("th:content");
		
		// mianCnsResult_ajax
		$.ajax({
			type : "POST",
			url : "/gnoincoundb/mianCnsResult_ajax.do",
			data : $("#searchForm").serialize(),
			dataType : "json",
			beforeSend : function(xhr){
		           xhr.setRequestHeader(header, token);
		    }
			
		}).done(function(json){
			var d = json.list[0];
			var obj = Object.entries(d);
			for(var i=0;i<obj.length;i++){
				var c = obj[i];
				$("td[data-class='" + c[0] + "']").text(c[1]);
			}
			console.log(d);
		}).fail(function(e){
			alert("서버와 통신 오류입니다.");
		});
	}
</script>
<!-- content -->
<section id="content">
	<!-- 메인 -->
	<!-- col-2 -->
	<div class="col-2">
		<!-- 1 -->
		<div class="box-style1">
			<h2 class="h2-main-title"><i class="fa fa-arrow-circle-right fa-style2"></i><span class='subject'></span></h2>
			<h3 class="h3-title mg-t10">상담접수 현황</h3>
			<table class="table-style1">
				<colgroup>
					<col width="15%">
					<col width="15%">
					<col width="15%">
					<col width="15%">
					<col width="15%">
					<col width="15%">
				</colgroup>
				<tr>
					<th>소계</th>
					<th>내방</th>
					<th>방문</th>
					<th>전화</th>
					<th>온라인</th>
					<th>기타</th>
				</tr>
				<tr>
					<td colspan="">명</td>
					<td colspan="">명</td>
					<td colspan="">명</td>
					<td colspan="">명</td>
					<td colspan="">명</td>
					<td colspan="">명</td>
				</tr>
				<tr>
					<td data-class='c1'></td>
					<td data-class='c2'></td>
					<td data-class='c3'></td>
					<td data-class='c4'></td>
					<td data-class='c5'></td>
					<td data-class='c6'></td>
				</tr>
			</table>
			<h3 class="h3-title mg-t10">상담진행상태</h3>
			<%-- <table class="table-style1">
				<colgroup>
					<col width="12.5%">
					<col width="12.5%">
					<col width="12.5%">
					<col width="12.5%">
					<col width="12.5%">
					<col width="12.5%">
					<col width="12.5%">
					<col width="12.5%">
				</colgroup>
				<tr>
					<th colspan="2">총등록인원</th>
					<th colspan="2">종결</th>
					<th>재신청</th>
					<th colspan="2">보류</th>
					<th>복귀</th>
				</tr>
				<tr>
					<td colspan="">명</td>
					<td colspan="">건</td>
					<td colspan="">명</td>
					<td colspan="">건</td>
					<td colspan="">명</td>
					<td colspan="">명</td>
					<td colspan="">건</td>
					<td colspan="">명</td>
				</tr>
				<tr>
					<td data-class='c9'></td>
					<td data-class='c10'></td>
					<td data-class='c11'></td>
					<td data-class='c12'></td>
					<td data-class='c13'></td>
					<td data-class='c14'></td>
					<td data-class='c15'></td>
					<td data-class='c16'></td>
				</tr>
			</table> --%>
			<table class="table-style1">
				<colgroup>
					<col width="13%">
					<col width="13%">
					<col width="13%">
					<col width="13%">
					<col width="13%">
					<col width="13%">
					<col width="13%">
				</colgroup>
				<tr>
					<th colspan="2">총등록인원</th>
					<th>진행</th>
					<th>종결</th>
					<th>재신청</th>
					<th>보류</th>
					<th>기타</th>
				</tr>
				<tr>
					<td colspan="">명</td>
					<td colspan="">건</td>
					<td colspan="">건</td>
					<td colspan="">건</td>
					<td colspan="">건</td>
					<td colspan="">건</td>
					<td colspan="">건</td>
				</tr>
				<tr>
					<td data-class='c7'></td>
					<td data-class='c8'></td>
					<td data-class='c9'></td>
					<td data-class='c10'></td>
					<td data-class='c11'></td>
					<td data-class='c12'></td>
					<td data-class='c13'></td>
				</tr>
			</table>
		</div>
		<div class="box-style1 mg-t40">
			<h2 class="h2-main-title"><i class="fa fa-arrow-circle-right fa-style2"></i>예약 현황</h2>
			<table class="table-style1">
				<colgroup>
					<col width="15%">
					<col width="25%">
					<col width="20%">
				</colgroup>
				<thead>
				<tr>
					<th>성명</th>
					<th>다음 상담 예약일자</th>
					<th>상태</th>
				</tr>
				</thead>
				<tbody id="reservation_list"></tbody>
			</table>
		</div>
	</div>
	<!-- //col-2 -->
	<!-- col-2 -->
	<div class="col-2 mg-t40">
		<!-- 2 -->
		<h2 class="h2-main-title"><i class="fa fa-arrow-circle-right fa-style2"></i>상담현황</h2>
		<div class="col-2-box">
		<div class="box-style1">
			<h3 class="h3-title mg-t10">성별현황</h3>
			<!-- 차트 -->
			<div style="width:65%;position:relative;top:-10px;left:0px; margin:0 auto;"><canvas id="chart1" /></canvas></div>
		</div>
		</div>
		<div class="col-2-box">
		<div class="box-style1">
			<h3 class="h3-title mg-t10">년별현황</h3>
			<!-- 차트 -->
			<div style="width:65%;position:relative;top:-10px;left:0px; margin:0 auto;"><canvas id="chart2" /></canvas></div>
		</div>
		</div>
	</div>
	<!-- col-2 -->
	<!-- // 메인-->
</section>
<!-- //content -->
<style>
canvas
{
	-moz-user-select: none;
	-webkit-user-select: none;
	-ms-user-select: none;
	user-select: none;
}
</style>
<script src="/gnoincoundb/js/utils.js"></script>
<script src="/gnoincoundb/js/Chart.bundle.js"></script>
<script type="text/javascript">
var chartData = {};
	function graph(ctx, data, t) {
		let datasets;
		if(t==4){
			chartData.display = true;
			datasets = [{
			   label: '남',
               backgroundColor: 'rgba(154, 208, 244, 0.5)',
               borderColor: '#36a2eb',
               borderWidth: 1,
               data: chartData.personM
			},
			{
			   label: '여',
               backgroundColor: 'rgba(176, 15, 87, 0.5)',
               borderColor: '#ef3262',
               borderWidth: 1,
               data: chartData.personF
			}
			
			
			]
			
		}else{
			chartData.display = false;
			datasets = [{
			   label: '월',
               backgroundColor: 'rgba(154, 208, 244, 0.5)',
               borderColor: '#36a2eb',
               borderWidth: 1,
               data: data
			}]
			
		}
		
		
		
		var color = Chart.helpers.color;
        var barChartData = {
           labels: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
           datasets: datasets
        };
        
        
        var config = {
            type: 'bar',
            data: barChartData,
            options: {
                responsive: true,
                legend: {
                	display : chartData.display,
                    position: 'top',
                },
                title: {
                    display: false,
                    text: 'test'
                },
                scales: {
                    yAxes: [{
                        ticks: {
                        	suggestedMax: 4,
                        	suggestedMin: 0,
                            stepSize: 5,
                            max:20,
                            min:0
                        }
                    }]
                },
                
                tooltips: {
                    callbacks: {
                       label: function(tooltipItem) {
                              return tooltipItem.yLabel;
                       }
                    }
                }
            },
            
        };
		window.myBar = new Chart(ctx, config);
	}
	
	function list2(){
		var token = $("meta[name='_csrf']").attr("th:content");
		var header = $("meta[name='_csrf_header']").attr("th:content");
		
		$.ajax({
			url : "/gnoincoundb/main_reservation_ajax.do",
			data : {  },
			type : "post",
			dataType : "json",
			beforeSend : function(xhr){
		           xhr.setRequestHeader(header, token);
		    }
			
		}).done(function(e){
			$("#reservation_list tr").remove();
			var obj = e.reservation;
			for(var i=0;i<obj.length;i++){
				$("#reservation_list").append("<tr>" +
				"<td>" + obj[i].cnsleNm + "</td>" + 
				"<td>" + obj[i].cnsRsvtDt + "</td>" + 
				"<td>" + obj[i].mclassNm + "</td>" + 
				"</tr>");
			}
		}).fail(function(e){
			alert('서버 오류가 발생하였습니다.');
		});
		
		
		$.ajax({
			url : "/gnoincoundb/monitoring_ajax.do",
			data : { "schYearGb" : new Date().getFullYear() },
			type : "post",
			dataType : "json",
			beforeSend : function(xhr){
		           xhr.setRequestHeader(header, token);
		    }
		}).done(function(e){
			setChartValue("chartData.person",e.person,document.getElementById("chart1").getContext("2d"), 1);
			setChartValue("chartData.group",e.group,  document.getElementById("chart2").getContext("2d"), 2);
			
		}).fail(function(e){
			alert('서버 오류가 발생하였습니다.');
		});
	}
	
	$(function(){
		list2();
		$(".subject").text(new Date().getFullYear() + "년 " + (new Date().getMonth()+1) +"월 상담현황");
	});
	
function setChartValue(chartObj, obj, ctx, t ){
	if(t==1){
		chartData.personM = [];
		chartData.personF = [];
		for(var i=1;i<=12;i++){
			if(obj.find(data=>data.m==i) == undefined){
				chartData.personM.push(0);
				chartData.personF.push(0);
			}else{
				chartData.personM.push(obj.find(data=>data.m==i).genderM);
				chartData.personF.push(obj.find(data=>data.m==i).genderF);
			}
		}
		
	}
	
	
	eval(chartObj + " = []");
	for(var i=1;i<=12;i++){
		obj.find(data=>data.m==i) == undefined ? eval(chartObj).push(0) : eval(chartObj).push(obj.find(data=>data.m==i).cnt);
	}
	
	graph(ctx, eval(chartObj), t);
	
}
</script>