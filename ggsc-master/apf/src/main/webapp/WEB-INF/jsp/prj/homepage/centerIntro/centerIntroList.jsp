<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>    
	
	<style>
		table {
		    text-align : center;
		}
		th {
			text-align : center;
			padding : 10px 18px 12px;
		}
		td {
		}
	</style>
    <script>
	  	$(document).ready(function() {
	  		$("#operating").css("display","none");
	  		$("#vision").css("display","none");
	  		$("#pathway").css("display","none");
	  		$("#together").css("display","none");
	  		$("#centerInfo").css("display","none");
	  		$("#directions").css("display","none");
	  		
	  		$("#operating2").css("display","none");
	  		$("#operating3").css("display","none");
	  		$("#operating4").css("display","none");
		});
	  	
	  	function greeting() {
	  		$("#greeting").css("display","");
	  		$("#operating").css("display","none");
	  		$("#vision").css("display","none");
	  		$("#pathway").css("display","none");
	  		$("#together").css("display","none");
	  		$("#centerInfo").css("display","none");
	  		$("#directions").css("display","none");
		}
	  	
	  	function operating() {
	  		$("#greeting").css("display","none");
	  		$("#operating").css("display","");
	  		$("#vision").css("display","none");
	  		$("#pathway").css("display","none");
	  		$("#together").css("display","none");
	  		$("#centerInfo").css("display","none");
	  		$("#directions").css("display","none");
		}
	  	
	  	function vision() {
	  		$("#greeting").css("display","none");
	  		$("#operating").css("display","none");
	  		$("#vision").css("display","");
	  		$("#pathway").css("display","none");
	  		$("#together").css("display","none");
	  		$("#centerInfo").css("display","none");
	  		$("#directions").css("display","none"); 
		}
	  	
	  	function pathway() {
	  		$("#greeting").css("display","none");
	  		$("#operating").css("display","none");
	  		$("#vision").css("display","none");
	  		$("#pathway").css("display","");
	  		$("#pathwayBtn1").css("display","");
			$("#pathwayBtn2").css("display","none");
			$("#pathwayBtn3").css("display","none");
			$("#pathwayBtn4").css("display","none");
	  		$("#together").css("display","none");
	  		$("#centerInfo").css("display","none");
	  		$("#directions").css("display","none"); 
		}
	  	
	  	function together() {
	  		$("#greeting").css("display","none");
	  		$("#operating").css("display","none");
	  		$("#vision").css("display","none");
	  		$("#pathway").css("display","none");
	  		$("#together").css("display","");
	  		$("#centerInfo").css("display","none");
	  		$("#directions").css("display","none");
		}
	  	
	  	function centerInfo() {
	  		$("#greeting").css("display","none");
	  		$("#operating").css("display","none");
	  		$("#vision").css("display","none");
	  		$("#pathway").css("display","none");
	  		$("#together").css("display","none");
	  		$("#centerInfo").css("display","");
	  		$("#directions").css("display","none");
		}
		
		function directions() {
			$("#greeting").css("display","none");
	  		$("#operating").css("display","none");
	  		$("#vision").css("display","none");
	  		$("#pathway").css("display","none");
	  		$("#together").css("display","none");
	  		$("#centerInfo").css("display","none");
	  		$("#directions").css("display","");
		}
		
		function operatingBtn(no) {
			if(no == "1") {
				$("#operating1").css("display","");
				$("#operating2").css("display","none");
				$("#operating3").css("display","none");
				$("#operating4").css("display","none");
			} else if(no == "2") {
				$("#operating1").css("display","none");
				$("#operating2").css("display","");
				$("#operating3").css("display","none");
				$("#operating4").css("display","none");
			} else if(no == "3") {
				$("#operating1").css("display","none");
				$("#operating2").css("display","none");
				$("#operating3").css("display","");
				$("#operating4").css("display","none");
			} else if(no == "4") {
				$("#operating1").css("display","none");
				$("#operating2").css("display","none");
				$("#operating3").css("display","none");
				$("#operating4").css("display","");
			}
		}
		
		function pathwayBtn(no) {
			if(no == "1") {
				$("#pathwayBtn1").css("display","");
				$("#pathwayBtn2").css("display","none");
				$("#pathwayBtn3").css("display","none");
				$("#pathwayBtn4").css("display","none");
			} else if(no == "2") {
				$("#pathwayBtn1").css("display","none");
				$("#pathwayBtn2").css("display","");
				$("#pathwayBtn3").css("display","none");
				$("#pathwayBtn4").css("display","none");
			}else if(no == "3") {
				$("#pathwayBtn1").css("display","none");
				$("#pathwayBtn2").css("display","none");
				$("#pathwayBtn3").css("display","");
				$("#pathwayBtn4").css("display","none");
			} else if(no == "4") {
				$("#pathwayBtn1").css("display","none");
				$("#pathwayBtn2").css("display","none");
				$("#pathwayBtn3").css("display","none");
				$("#pathwayBtn4").css("display","");
			}
		}
		
  </script>
<style>
	#wrap {width: 100%; margin: auto; height: auto;}
</style>
<section class="service-2 section">
	<div id="wrap">
        <div style="border-top: 1px solid #f09d4c;">
			<img src='/gnoincoun/images/cenIntro1.jpg' alt="맘편한 상담" style="width: 1920px;"/>
		</div>
		<div style="width: 910px; margin: auto;">
			<span style="float: left; margin-top: 20px; margin-bottom: 15px; font: bold; font-weight: 900;">센터안내</span>
			<ul class="main-menu" style="width: 730px; font-size: 14px; float: right; margin-top: 20px; margin-bottom: 15px;"> <!-- margin-right: 26%; -->
				<li><a href="javascript: greeting();">인사말</a></li>
				<li><a href="javascript: operating();">운영법인</a></li>
				<li><a href="javascript: vision();">미션과 비전</a></li>
				<li><a href="javascript: pathway();">걸어온길</a></li>
				<li><a href="javascript: together();">함께하는 사람들</a></li>
				<li><a href="javascript: centerInfo();">시군센터</a></li>
				<li><a href="javascript: directions();">오시는길</a></li>
			</ul>
		</div>
		
		<!-- content 영역 -->
		<div id="greeting">
			<div style="border-bottom: 1px solid #CFCFCF; padding-bottom: 63px;">
			</div>
			<div style="width: 920px; margin: auto; margin-top: 30px;">
				<img src='/gnoincoun/images/cenIntro2.jpg' alt="전화상담" style="width: 920px;"/>
			</div>
			<div style="width: 100%; text-align: center; margin-top: 20px;">
				<!-- <button type="button" class="btn btn-warning" style="border-radius: 11px;" >전화상담 신청하기</button> -->
			</div>
		</div>
		<div id="operating">
			<div style="border-bottom: 1px solid #CFCFCF; padding-bottom: 63px;">
			</div>
			<div style="width: 100%; margin: auto; text-align: center; margin-top: 30px; margin-bottom: 30px;">
				<button type="button" class="btn btn-primary" style="width: 150px; background-color: #f09d4c; border-color: #f09d4c;" onclick="javascript: operatingBtn('1')">소개</button>
				<button type="button" class="btn btn-primary" style="width: 150px; background-color: #f09d4c; border-color: #f09d4c;" onclick="javascript: operatingBtn('2')">설립목적</button>
				<button type="button" class="btn btn-primary" style="width: 150px; background-color: #f09d4c; border-color: #f09d4c;" onclick="javascript: operatingBtn('3')">주요사업</button>
				<button type="button" class="btn btn-primary" style="width: 150px; background-color: #f09d4c; border-color: #f09d4c;" onclick="javascript: operatingBtn('4')">조직도</button>
			</div>
			
			<div id="operating1" style="width: 920px; margin: auto;">
				<img src='/gnoincoun/images/cenIntro6.jpg' alt="내방상담" style="width: 920px;"/>
			</div>
			<div id="operating2" style="width: 920px; margin: auto;">
				<img src='/gnoincoun/images/cenIntro15.png' alt="내방상담" style="width: 920px;"/> 
			</div>
			<div id="operating3" style="width: 920px; margin: auto;">
				<img src='/gnoincoun/images/cenIntro7.jpg' alt="내방상담" style="width: 920px;"/>
			</div>
			<div id="operating4" style="width: 920px; margin: auto;">
				<img src='/gnoincoun/images/cenIntro13.png' alt="내방상담" style="width: 920px;"/>
			</div>
			
		</div>
		<div id="vision">
			<div style="border-bottom: 1px solid #CFCFCF; padding-bottom: 63px;">
			</div>
			<div style="width: 920px; margin: auto; margin-top: 30px;">
				<img src='/gnoincoun/images/cenIntro16.png' alt="미션과 비전" style="width: 920px;"/>
			</div>
		</div>
		<div id="pathway">
			<div style="border-bottom: 1px solid #CFCFCF; padding-bottom: 63px;">
			</div>
			<div style="width: 100%; margin: auto; text-align: center; margin-top: 30px; margin-bottom: 30px;">
				<button type="button" class="btn btn-primary" style="width: 150px; background-color: #f09d4c; border-color: #f09d4c;" onclick="javascript: pathwayBtn('1')">2020 ~ 2021</button>
				<button type="button" class="btn btn-primary" style="width: 150px; background-color: #f09d4c; border-color: #f09d4c;" onclick="javascript: pathwayBtn('2')">2018 ~ 2019</button>
				<button type="button" class="btn btn-primary" style="width: 150px; background-color: #f09d4c; border-color: #f09d4c;" onclick="javascript: pathwayBtn('3')">2016 ~ 2017</button>
				<button type="button" class="btn btn-primary" style="width: 150px; background-color: #f09d4c; border-color: #f09d4c;" onclick="javascript: pathwayBtn('4')">1999 ~ 2012</button>
			</div>
			
			<div id="pathwayBtn1" style="width: 920px; margin: auto;">
				<img src='/gnoincoun/images/cenIntro9.png' alt="센터안내" style="width: 920px;"/>
			</div>
			<div id="pathwayBtn2" style="width: 920px; margin: auto;">
				<img src='/gnoincoun/images/cenIntro10.png' alt="센터안내" style="width: 920px;"/>
			</div>
			<div id="pathwayBtn3" style="width: 920px; margin: auto;">
				<img src='/gnoincoun/images/cenIntro11.png' alt="센터안내" style="width: 920px;"/>
			</div>
			<div id="pathwayBtn4" style="width: 920px; margin: auto;">
				<img src='/gnoincoun/images/cenIntro12.png' alt="센터안내" style="width: 920px;"/>
			</div>
		</div>
		<div id="together">
			<div style="border-bottom: 1px solid #CFCFCF; padding-bottom: 63px;">
			</div>
			<div style="width: 920px; margin: auto; margin-top: 30px;">
				<img src='/gnoincoun/images/cenIntro14.png' alt="함께하는 사람들"
					style="width: 920px;" />
				<!--  <div style="margin-top: 35px;">
					<table class="table table-bordered" style="vertical-align:middle;">
						<colgroup>
							<col width="30%" />
							<col width="10%" />
							<col width="8%" />
							<col width="15%" />
							<col width="35%" />
						</colgroup>
						<thead>
							<tr>
								<th scope="col" colspan="2">직급</th>
								<th scope="col">이름</th>
								<th scope="col">전화번호</th>
								<th scope="col">당담업무</th>
							</tr>
						</thead>
						<tbody style="vertical-align:middle;">
							<tr>
								<td colspan="2" rowspan="2">센터장</th>
								<td rowspan="2">김미나</td>
								<td rowspan="2">070-4832-6360</td>
								<td>• 센터 운영 총괄</td>
							</tr>
							<tr>
								<td>• 대외 협력업무</td>
							</tr>
							<tr>
								<td rowspan="5">노인상담지원팀</th>
								<td rowspan="2">팀장</td>
								<td rowspan="2">오명심</td>
								<td rowspan="2">070-4832-6361</td>
								<td>• 센터 사업 총괄</td>
							</tr>
							<tr>	
								<td>• 복무 및 인사관리</td>
							</tr>
							<tr>
								<td rowspan="3">과장</th>
								<td rowspan="3">박경숙</td>
								<td rowspan="3">070-4832-6363</td>
								<td>• 상담지원사업</td>
							</tr>
							<tr>	
								<td>• 교육지원사업</td>
							</tr>
							<tr>	
								<td>• 외부지원사업</td>
							</tr>
						</tbody>
					</table>
				</div> -->
			</div>
			<div style="width: 100%; text-align: center; margin-top: 20px;">
				<!-- <button type="button" class="btn btn-success" style="border-radius: 11px;" onclick="location.href='/gnoincoun/comfCnsWrite.do'">온라인상담 예약하기</button> -->
			</div>
		</div>
		<div id="centerInfo">
			<div style="border-bottom: 1px solid #CFCFCF; padding-bottom: 63px;">
			</div>
			<div style="width: 920px; margin: auto; margin-top: 30px;">
				<img src='/gnoincoun/images/cenIntro4.jpg' alt="온라인상담" style="width: 920px;"/>
			</div>
			<div style="width: 100%; text-align: center; margin-top: 20px;">
				<!-- <button type="button" class="btn btn-success" style="border-radius: 11px;" onclick="location.href='/gnoincoun/comfCnsWrite.do'">온라인상담 예약하기</button> -->
			</div>
		</div>
		<div id="directions">
			<div style="border-bottom: 1px solid #CFCFCF; padding-bottom: 63px;">
			</div>
			<div style="width: 920px; margin: auto;">
				<img src='/gnoincoun/images/cenIntro5.jpg' alt="온라인상담" style="width: 920px;"/>
			</div>
			<div style="width: 100%; text-align: center; margin-top: 20px;">
				<!-- <button type="button" class="btn btn-success" style="border-radius: 11px;" onclick="location.href='/gnoincoun/comfCnsWrite.do'">온라인상담 예약하기</button> -->
			</div>
		</div>
		
		
	</div>
</section> <!-- End section -->