<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>    
    <script>
	  	$(document).ready(function() {
	  		$("#cnsVisit").css("display","none");
	  		$("#cnsOnline").css("display","none");
		});
	  	
		function cnsCall() {
			$("#cnsCall").css("display","");
			$("#cnsVisit").css("display","none");
	  		$("#cnsOnline").css("display","none");
		}
		
		function cnsVisit() {
			$("#cnsCall").css("display","none");
			$("#cnsVisit").css("display","");
	  		$("#cnsOnline").css("display","none");
		}
		
		function cnsOnline() {
			$("#cnsCall").css("display","none");
			$("#cnsVisit").css("display","none");
	  		$("#cnsOnline").css("display","");
		}
		
		
  </script>
<style>
	#wrap {width: 100%; margin: auto; height: 594px;}
</style>
<section class="service-2 section">
	<div id="wrap">
        <div style="border-top: 1px solid #f09d4c;">
			<img src='/gnoincoun/images/cns1.jpg' alt="맘편한 상담" style="width: 1920px;"/>
		</div>
		<div style="width: 910px; margin: auto;">
			<span style="float: left; margin-top: 20px; margin-bottom: 15px;font: bold; font-weight: 900;">맘편한 상담</span>
			<ul class="main-menu" style="width: 300px; float: right;margin-top: 20px; margin-bottom: 15px;"> <!-- margin-right: 26%; -->
				<li><a href="javascript: cnsCall();">전화상담</a></li>
				<li><a href="javascript: cnsVisit();">내방상담</a></li>
				<li><a href="javascript: cnsOnline();">온라인상담</a></li>
			</ul>
		</div>
		
		<!-- content 영역 -->
		<div id="cnsCall">
			<div style="border-bottom: 1px solid #CFCFCF; padding-bottom: 63px;">
			</div>
			<div style="width: 920px; margin: auto;">
				<img src='/gnoincoun/images/cns2.jpg' alt="전화상담" style="width: 920px;"/>
			</div>
			<div style="width: 100%; text-align: center; margin-top: 20px;">
				<button type="button" class="btn btn-warning" style="border-radius: 11px;" >전화상담 신청하기</button>
			</div>
		</div>
		<div id="cnsVisit">
			<div style="border-bottom: 1px solid #CFCFCF; padding-bottom: 63px;">
			</div>
			<div style="width: 920px; margin: auto;">
				<img src='/gnoincoun/images/cns3.jpg' alt="내방상담" style="width: 920px;"/>
			</div>
			<div style="width: 100%; text-align: center; margin-top: 20px;">
				<button type="button" class="btn btn-primary" style="border-radius: 11px;" onclick="location.href='/gnoincoun/comfCnsWrite.do'">내방상담 예약하기</button>
			</div>
		</div>
		<div id="cnsOnline">
			<div style="border-bottom: 1px solid #CFCFCF; padding-bottom: 63px;">
			</div>
			<div style="width: 920px; margin: auto;">
				<img src='/gnoincoun/images/cns4.jpg' alt="온라인상담" style="width: 920px;"/>
			</div>
			<div style="width: 100%; text-align: center; margin-top: 20px;">
				<button type="button" class="btn btn-success" style="border-radius: 11px;" onclick="location.href='/gnoincoun/comfCnsWrite.do'">온라인상담 예약하기</button>
			</div>
		</div>
		
		
	</div>
</section> <!-- End section -->