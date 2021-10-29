<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<style>
	#demo-list a {line-height: 10px;}
	.jquery-accordion-menu ul li a i{width: 34px;float: left;line-height: 10px;font-size: 15px;text-align: left;}
</style>


	<h1 class="logo"><a href="/"><img src="/images/ams_w.png" alt="AMS 근태관리시스템" width="110" /></a></h1>
	<!-- <div class="adm-info">슈퍼관리자<span>과장님</span></div> -->
	<nav id="nav">
		<div id="jquery-accordion-menu" class="jquery-accordion-menu navy">
			<ul id="demo-list">
				<li class="active"><a href="/main.do"><i class="fa fa-home"></i>   Home</a></li>
				
				<li class="active"><a href="javascript:go_page('가나');"><i class="fa fa-folder-open-o"></i>  장부관리</a>
					<ul> 
						<li class="active"><a href="/ApperObjList.do"><i class="fa fa-angle-right"></i>나온물건</a></li>
						<li class="active"><a href="/FindObjList.do"><i class="fa fa-angle-right"></i>찾는물건</a></li>
						<li class="active"><a href="/OrgObjList.do"><i class="fa fa-angle-right"></i>고객원부</a></li>
						<li class="active"><a href="javascript:go_page('다라');"><i class="fa fa-angle-right"></i>계약관리</a></li>
						<li class="active"><a href="javascript:go_page('다라');"><i class="fa fa-angle-right"></i>가계약관리</a></li>
						<li class="active"><a href="javascript:go_page('다라');"><i class="fa fa-angle-right"></i>만기관리</a></li>
					</ul>
				</li>
				
				<li class="active"><a href="javascript:go_page('가나');"><i class="fa fa-calendar-o"></i>  일정관리</a></li>
				<li><a href="#"><i class="fa fa-building-o"></i>  물건설정</a>
				<li><a href="#"><i class="fa fa-id-card-o"></i>  공통관리</a>
					<ul> 
						<li class="active"><a href="/userList.do"><i class="fa fa-angle-right"></i>사용자관리</a></li>
						<li class="active"><a href="/authGrpList.do"><i class="fa fa-angle-right"></i>권한관리</a></li>
						<li class="active"><a href="javascript:go_page('다라');"><i class="fa fa-angle-right"></i>업체관리</a></li>
						<li class="active"><a href="javascript:go_page('다라');"><i class="fa fa-angle-right"></i>코드관리</a></li>
					</ul>
				</li>
				
			</ul>
		</div>
	</nav>
