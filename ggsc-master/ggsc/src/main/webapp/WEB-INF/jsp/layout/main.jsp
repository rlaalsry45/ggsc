<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title id="title">노인상담관리시스템</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
<!--<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">-->
<meta name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, target-densitydpi=medium-dpi" />
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<meta http-equiv="content-language" content="ko">
<link rel="stylesheet" href="/gnoincoundb/css/font-awesome.min.css">
<link rel="stylesheet" href="/gnoincoundb/css/jquery-accordion-menu.css">
<link rel="stylesheet" href="/gnoincoundb/css/jquery-ui.css">
<!-- 20201029 css  -->
<link rel="stylesheet" href="/gnoincoundb/css/common.css">
<link rel="stylesheet" href="/gnoincoundb/css/style.css">
<!-- 20201029 css  //-->
<script src="/gnoincoundb/js/jquery/jquery-1.11.2.min.js"></script>
<script src="/gnoincoundb/js/jquery/jquery.form.js"></script>
<script src="/gnoincoundb/js/jquery/jquery-migrate-1.4.1.js"></script>
<script src="/gnoincoundb/js/jquery/jquery-accordion-menu.js" type="text/javascript"></script>
<script src="/gnoincoundb/js/jquery/jquery-ui.min.js" type="text/javascript"></script>
<script src="/gnoincoundb/js/common.js"></script>
<script src="/gnoincoundb/js/custom.js" ></script>
<!-- 에디터 css -->
<link href="/gnoincoundb/editor/css/summernote_0.8.3.css" rel="stylesheet">
<link href="/gnoincoundb/editor/css/bootstrap_3.3.5.css" rel="stylesheet"> 
<meta name="_csrf" th:content="${_csrf.token}"/>
<meta name="_csrf_header" th:content="${_csrf.headerName}"/>

<!--[if lt ie 9]>
	<script src="/js/html5shiv.min.js"></script>
<![endif]-->

	<script type="text/javascript">
		
		var GV_USER_ID = "${userVO.userId}";
		var GV_USER_NM = "${userVO.name}";
		
		function go_page(mnuCd){
			var frm = document.mnuForm;
			//frm.mnuCd.value = mnuCd;
			frm.action="/gnoincoundb/goPage.do";
			frm.submit();
		}
		
		function logout(){
			if(confirm("로그아웃 하시겠습니까?")){
				/* var frm = document.mnuForm;
				frm.action="/gnoincoundb/login/logout.do";
				frm.submit(); */
				document.location.href = "/gnoincoundb/login/logout.do";
			}
		}

		function manualDown(){
			window.open("/pdf/근태관리시스템 사용자 매뉴얼.hwp", "_blank");
		}

	</script>
</head>
<body oncontextmenu="return false">
<form name='tmpForm'>
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	<input type='hidden' name='number' />
	<input type='hidden' name='schCnsGb' />
	<input type='hidden' name='schCenterGb' />
	<input type='hidden' name='schCnsleNm' />
	<input type='hidden' name='schDateGb' />
	<input type='hidden' name='schText' />
	<input type='hidden' name='schCnsrGb' />
	<input type='hidden' name='schCnsrNm' />
	<input type='hidden' name='schUserId' />
	<input type='hidden' name='schZoneGb' />
	<input type='hidden' name='schSigunNm' />
	<input type='hidden' name='schHclassNm' />
	<input type='hidden' name='schMclassNm' />
	<input type='hidden' name='schSclassNm' />
	<input type='hidden' name='schLocalGb' />
	<input type='hidden' name='schorganGb' />
	
	<input type='hidden' name='schStartDate' />
	<input type='hidden' name='schEndDate' />
	<input type='hidden' name='schWriteYn' />
	<input type='hidden' name='schLeaderNm' />
	<input type='hidden' name='schPgrmNm' />
	<input type='hidden' name='schAcptNm' />
	<input type='hidden' name='schLinkReqGb' />
	<input type='hidden' name='schJoinOrgCd' />
	<input type='hidden' name='schEduManGb' />
	<input type='hidden' name='schPromotionGb' />
	<input type='hidden' name='schVisitOrgGb' />
	
</form>

<!-- 레프트영역 -->
	<section id="left-box">
	    <tiles:insertAttribute name="left"/>
	</section>
<!-- //레프트영역 -->
    <form name="mnuForm">
    	<input type="hidden" name="mnuCd"/>
    </form>


	<section id="container">
	<!-- header -->
	<header id="header">
	    <tiles:insertAttribute name="header"/>
	</header>
	<!-- // header -->

	<!-- content -->
         <tiles:insertAttribute name="body"/>

	<iframe id="excelFrame" name="excelFrame" width="0" height="0" style="display:none;"></iframe>
	<!-- content -->
	<!-- footer
	<footer id="footer">
		<p>xxxxxxxxxxxxxx  Copyright(C) All Rights Reserved.</p>
	</footer>
	 -->
	<!-- //footer -->
	</section>
</body>
</html>
