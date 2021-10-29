<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
	<h1 class="logo txt-center"><a href="/gnoincoundb/main.do"><img src="/gnoincoundb/images/logo.png" /></a></h1>
	<!-- 
	<nav id="nav">
		<div id="jquery-accordion-menu" class="jquery-accordion-menu navy">
			<ul id="demo-list" style="width: 200px;">
			
				<c:forEach var="result" items="${mnuList}">
					<c:if test="${result.mnuLvl == 1 }">
						<li id="${result.mnuCd }"><a href="#" onclick="javascript:fn_goPage('${result.mnuPath }', '${result.mnuCd }')" style="white-space: normal;">${result.mnuNm }</a></li>
					</c:if>
					<c:if test="${result.mnuLvl == 2 }">
						<li id="${result.mnuCd }"><a href="javascript:fn_goPage('${result.mnuPath }', '${fn:substring(result.mnuCd, 0, 3) }')" style="white-space: normal; padding-left: 30px;">${result.mnuNm }</a></li>
					</c:if>
					<c:if test="${result.mnuLvl == 3 }">
						<li id="${result.mnuCd }"><a href="javascript:fn_goPage('${result.mnuPath }', '${fn:substring(result.mnuCd, 0, 3) }')" style="white-space: normal; padding-left: 40px;"></i>${result.mnuNm }</a></li>
					</c:if>
				</c:forEach>
				 
			 
				<li><a href="#"><i class="fa fa-angle-right"></i>생산일보</a></li>
				<li><a href="#"><i class="fa fa-angle-right"></i>업무일보</a><span class="jquery-accordion-menu-label">12</span></li>
				<li><a href="#"><i class="fa fa-angle-right"></i>출고현황</a></li>
				<li><a href="#"><i class="fa fa-angle-right"></i>생산계획</a></li>
				<li><a href="#"><i class="fa fa-angle-right"></i>생산관리</a></li>
				<li><a href="#"><i class="fa fa-angle-right"></i>업무일보관리</a></li>
				<li><a href="#"><i class="fa fa-angle-right"></i>공통관리</a>
					<ul class="submenu">
						<li><a href="#"><i class="fa fa-angle-right"></i>생산일보 관리</a></li>
						<li><a href="#"><i class="fa fa-angle-right"></i>업무일보 관리</a></li>
						<li><a href="#"><i class="fa fa-angle-right"></i>출고현황 관리</a></li>
					</ul>
				</li>
				
			</ul>
		</div>
	</nav>
	 -->
	     <div class="side-nav">
        <div id="lnb">
            <ul>
            	<c:if test="${mnuList.size() > 0 }">
	            	<c:forEach var="result" items="${mnuList}">
						<c:if test="${result.mnuLvl == 1 }">
							<li class="noto500 fMenu" id="${result.mnuCd }"><a href="#" class="fmOn" onclick="javascript:fn_goPage('${result.mnuPath }', '${result.mnuCd }')"><img src="/gnoincoundb/${result.icon }">${result.mnuNm }</a></li>
						</c:if>
						<c:if test="${result.mnuLvl == 2 }">
							<c:if test="${mnuCd==result.mnuCd }">
								<li class="noto500 sMenu" id="${result.mnuCd }"><a class="ssmOn" href="javascript:fn_goPage('${result.mnuPath }', '${result.mnuCd }')">${result.mnuNm }</a></li>
							</c:if>
							<c:if test="${mnuCd!=result.mnuCd }">
								<c:choose>
									<c:when test="${fn:substring(result.mnuCd, 3, 5) == '01' && fn:length(mnuCd) == 3 }">
										<li class="noto500 sMenu" id="${result.mnuCd }"><a class="ssmOn" href="javascript:fn_goPage('${result.mnuPath }', '${result.mnuCd }')">${result.mnuNm }</a></li>									
									</c:when>
									<c:otherwise>
										<li class="noto500 sMenu" id="${result.mnuCd }"><a href="javascript:fn_goPage('${result.mnuPath }', '${result.mnuCd }')">${result.mnuNm }</a></li>
									</c:otherwise>
								</c:choose>
							</c:if>
						</c:if>
						<!-- 
						<c:if test="${result.mnuLvl == 3 }">
							<li id="${result.mnuCd }"><a href="javascript:fn_goPage('${result.mnuPath }', '${fn:substring(result.mnuCd, 0, 3) }')" style="white-space: normal; padding-left: 40px;">${result.mnuNm }</a></li>
						</c:if>
						-->
					</c:forEach>
            	</c:if>
            	<c:if test="${mnuList.size() == 0 }">
            	
            		<li class="noto500 fMenu" id=""><a class="fmOn" href="javascript:fn_goPage('/counsellor_mng_list.do', 'M01')">운영관리</a></li>
            		<li class="noto500 fMenu" id=""><a class="fmOn" href="javascript:fn_goPage('/cnsAcceptList.do', 'M02')">상담관리</a></li>
            		<li class="noto500 fMenu" id=""><a class="fmOn" href="javascript:fn_goPage('/cnsBookList.do', 'M03')">보고서</a></li>
            		<li class="noto500 fMenu" id=""><a class="fmOn" href="javascript:fn_goPage('/resultReportList.do', 'M04')">실적및통계</a></li>
            		<li class="noto500 fMenu" id=""><a class="fmOn" href="javascript:fn_goPage('/relatedOrgan_mng_list.do', 'M05')">유관기관관리</a></li>
            		<li class="noto500 fMenu" id=""><a class="fmOn" href="javascript:fn_goPage('/overrollStatus.do', 'M06')">모니터링</a></li>
            		<c:choose>
						<c:when test="${authCd eq 1 || authCh eq 2 }">
							<li class="noto500 fMenu" id=""><a class="fmOn" href="javascript:fn_goPage('/noticeList.do', 'M07')">행정지원</a></li>
		            		<li class="noto500 fMenu" id=""><a class="fmOn" href="javascript:fn_goPage('/centerNewsList.do', 'M08')">홈페이지관리</a></li>
		            		<li class="noto500 fMenu" id=""><a class="fmOn" href="javascript:fn_goPage('/menu_mng.do', 'M09')">공통관리</a></li>
						</c:when>
					</c:choose>
            		
            	</c:if>
            </ul>
        </div>
    </div>
	 
	<script type="text/javascript">
	
		$(document).ready(function() {
			
		});


		function fn_goPage(path, mnuCd){
			path = "/gnoincoundb" + path;
			
			path += "?mnuCd=" + mnuCd;
			document.location.href = path;
		}
	</script>
