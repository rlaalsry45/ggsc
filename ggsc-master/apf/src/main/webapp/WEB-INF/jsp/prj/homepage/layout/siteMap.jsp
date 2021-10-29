<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>    
    <script>
	  	$(document).ready(function() {
	  		$("#psyExam").css("display","none");
		});
	  	
		
		function fn_move(url) {
			  var loginYn = "${loginYn}";
			  if(loginYn == "Y") {
				  location.href=url;			  
			  } else if(loginYn == "N") {
				  alert("로그인 후에 간편한 심리검사를 하실 수 있습니다.");
				  // location.href="/login.do";
			  }
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
			<span style="float: left; margin-top: 20px; margin-bottom: 15px;font: bold; font-weight: 900;">간편한심리검사</span>
			<ul class="main-menu" style="width: 300px; float: right;margin-top: 20px; margin-bottom: 15px;"> <!-- margin-right: 26%; -->
			</ul>
		</div>
		
		<!-- content 영역 -->
		<div id="psyInfo">
			<div style="border-bottom: 1px solid #CFCFCF; padding-bottom: 63px;">
			</div>
			<div style="width: 920px; margin: auto; margin-top: 30px;">
				<img src='/gnoincoun/images/psy1.jpg' alt="간편심리검사소개" style="width: 920px;"/>
			</div>
			<div style="width: 100%; text-align: center; margin-top: 20px;">
				<!-- <button type="button" class="btn btn-warning" style="border-radius: 11px;">전화상담 신청하기</button> -->
			</div>
		</div>
		<div id="psyExam">
			<div style="border-bottom: 1px solid #CFCFCF; padding-bottom: 63px;">
			</div>
			
			<div style="width: 920px; margin: auto; margin-top: 30px;">
				<div class="quick-question">
		        <ul>
		          <li class="col-xs-12 col-sm-6 col-md-6">
		            <h2 class="title">듀크 불안-우울 척도</h2>
		            <a href="javascript:fn_move('/gnoincoun/psyDukeDoc.do')" class="btn btn-default btn-sm">바로가기<i class="fa fa-caret-right ml5"></i></a>
		          </li>
		          <li class="col-xs-12 col-sm-6 col-md-6">
		            <h2 class="title">노인우울 및 자살사고 척도</h2>
		            <a href="javascript:fn_move('/gnoincoun/psyGdsDoc.do')" class="btn btn-default btn-sm">바로가기<i class="fa fa-caret-right ml5"></i></a>
		          </li>
		          <li class="col-xs-12 col-sm-6 col-md-4">
		            <h2 class="title">불안척도</h2>
		            <a href="javascript:fn_move('/gnoincoun/psyAnxiDoc.do')" class="btn btn-default btn-sm">바로가기<i class="fa fa-caret-right ml5"></i></a>
		          </li>
		          <li class="col-xs-12 col-sm-6 col-md-4">
		            <h2 class="title">스트레스척도</h2>
		            <a href="javascript:fn_move('/gnoincoun/psyStressDoc.do')" class="btn btn-default btn-sm">바로가기<i class="fa fa-caret-right ml5"></i></a>
		          </li>
		          <li class="col-xs-12 col-sm-6 col-md-4">
		            <h2 class="title">사별스트레스척도</h2>
		            <a href="javascript:fn_move('/gnoincoun/psyBereavDoc.do')" class="btn btn-default btn-sm">바로가기<i class="fa fa-caret-right ml5"></i></a>
		          </li>
		        </ul>
		      </div>
			</div>
		
		</div>
		
	</div>
</section> <!-- End section -->