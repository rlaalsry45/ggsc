<%@ page import="egovframework.rte.psl.dataaccess.util.EgovMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<style>
	.search-group select{width:200px;}
	.label {margin-right:15px;}
	.label2 {display:inline-block;width:120px;color:#333;padding-right:5px;margin-bottom:2px;letter-spacing:-0.5px;text-align:right;}
</style>
<section id="content">
	<h2 class="h2-title"><i class="fa fa-check-square"></i>종합현황</h2>
		
		<div class="box-style1 x-scroll-auto" >
				<!-- 검색영역 -->
			<form name="searchForm" id="searchForm" action="/gnoincoundb/zoneStatus.do" method="get">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				<input type="hidden" id="mnuCd" name="mnuCd" value="${mnuCd}" />
				
				<div class="search-box" style='position:relative'>
					<div class="search-group" style="margin-left:70px;">
						<span class="label">년도</span>
						<span class="label2">
							 <select name="schYearGb" style="width:200px;">
							 	<jsp:useBean id="now" class="java.util.Date" />
								<c:forEach var="i" begin="2020" end="${now.year+1900}">
								    <option value="${i}"  <c:choose> <c:when test="${empty vo.schYearGb}"> <c:if test="${ (now.year+1900) eq i}"> selected </c:if> </c:when> <c:otherwise> <c:if test="${i eq vo.schYearGb}">selected</c:if> </c:otherwise> </c:choose> >${i}</option>
								</c:forEach>
							</select>
						</span>
						
					</div>
					<div class="search-group" style="margin-left:70px;">
						<span class="label">권역</span>
						<span class="label2">
							 <select name="schZoneGb" style="width:200px;">
							 	<option value="">전체</option>
								<c:forEach items="${cnsZoneList }" var="result">
									<option value="${result.odr }" <c:if test="${result.odr eq vo.schZoneGb }">selected</c:if>>${result.mclassNm }</option>
								</c:forEach>
							</select>
						</span>
					</div>
					
					
					<br>
					<div class="btn" style="position:absolute; right:5%; top%; transform:translate(-50%);">
						<button type="submit" class="btn-search" id="searchBtn">
							<i class="fa fa-search"></i>검색
						</button>
					</div>
			</div>
			</form>
		</div>
		
		
		<div class="col-2 mg-t40">
			<div class="col-2-box">
			<div class="box-style1">
				<h3 class="h3-title mg-t10">개인상담현황</h3>
				<div style="width:65%;position:relative;top:-10px;left:0px; margin:0 auto;"><canvas id="chart1" /></canvas></div>
			</div>
			</div>
			<div class="col-2-box">
			<div class="box-style1">
				<h3 class="h3-title mg-t10">집단상담현황</h3>
				<div style="width:65%;position:relative;top:-10px;left:0px; margin:0 auto;"><canvas id="chart2" /></canvas></div>
			</div>
			</div>
		</div>
		
		<div class="col-2 mg-t40">
			<div class="col-2-box">
			<div class="box-style1">
				<h3 class="h3-title mg-t10">온라인접수현황</h3>
				<div style="width:65%;position:relative;top:-10px;left:0px; margin:0 auto;"><canvas id="chart3" /></canvas></div>
			</div>
			</div>
			<div class="col-2-box">
			<div class="box-style1">
				<h3 class="h3-title mg-t10">주호소별현황</h3>
				<div style="width:65%;position:relative;top:-10px;left:0px; margin:0 auto;"><canvas id="chart4" /></canvas></div>
			</div>
			</div>
		</div>
</section>


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

function list(){
	var token = $("meta[name='_csrf']").attr("th:content");
	var header = $("meta[name='_csrf_header']").attr("th:content");
	
	$.ajax({
		url : "/gnoincoundb/monitoring_ajax.do",
		data : $("#searchForm").serialize(),
		type : "post",
		dataType : "json",
		beforeSend : function(xhr){
			xhr.setRequestHeader(header, token);
		}
	}).done(function(e){
		setChartValue("chartData.person",e.person,document.getElementById("chart1").getContext("2d"), 1);
		setChartValue("chartData.group",e.group,  document.getElementById("chart2").getContext("2d"), 2);
		setChartValue("chartData.g14",e.g14,  document.getElementById("chart3").getContext("2d"), 3);
		
		var color = Chart.helpers.color;
        var barChartData = { labels: [], 
    		datasets : [ 
    		{ 
    			label: '',
    			backgroundColor: 'rgba(154, 208, 244, 0.5)',
    			borderColor: '#36a2eb',
    			borderWidth: 1,
    			data: []
            }
    		]
        };
		for(var i=0;i<e.majorGb.length;i++){
			var data = e.majorGb[i];
			barChartData.labels.push(data.mclassNm);
			barChartData.datasets[0].data.push(data.cnt);
			console.log(data)
		}
		console.log(barChartData);
		
		var config = {
            type: 'bar',
            data: barChartData,
            options: {
                responsive: true,
                legend: {
                	display : false,
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
			window.myBar = new Chart(document.getElementById("chart4").getContext("2d"), config);
			
		
		
	}).fail(function(e){
		alert('서버 오류가 발생하였습니다.');
	});
}

$(function(){
	list();
	setInterval(function(){
		list();		
	}, 60 * 1000);
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
</html>
