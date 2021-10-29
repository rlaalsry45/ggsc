<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title id="title">노인상담시스템 </title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<meta http-equiv="content-language" content="ko">
<link rel="stylesheet" href="/gnoincoundb/css/base/default.css" type="text/css" >
<link rel="stylesheet" href="/gnoincoundb/css/jquery/jquery.treeview.css" type="text/css" >
<!-- 20201029 css  -->
<link rel="stylesheet" href="/gnoincoundb/css/common.css">
<link rel="stylesheet" href="/gnoincoundb/css/style.css">
<!-- 20201029 css  //-->
<script src="/gnoincoundb/js/jquery/jquery-1.10.2.js"></script>
<script src="/gnoincoundb/js/jquery/jquery.treeview.js"></script>
<script src="http://malsup.github.com/jquery.form.js"></script>
<script src="/gnoincoundb/js/html2canvas.min.js"></script>
<script src="/gnoincoundb/js/jspdf.min.js"></script>
</head>
<body>
<form name='tmpForm'>
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	<input type='hidden' name='number' />
</form>

<div id="login_area"><tiles:insertAttribute name="login_area"/></div>
<!-- //login status end -->
<!-- wrap start -->
<div id="wrap"> 
    <!-- header start -->
    <div id="subheader"><tiles:insertAttribute name="subheader"/></div>  
    <!-- //header end -->
    <!--  타이틀 이미지 시작 -->
    <div id="title_img_div"><img src="/gnoincoundb/images/title_image/img_title04.gif" alt="" /></div>
    <!--  //타이틀 이미지 끝 -->
    <div id="bodywrap">
        <div id="leftmenu_div"> 
        	<tiles:insertAttribute name="leftmenu"/>
        </div><!-- leftmenu_div -->
        
		<!-- 본문을 담는 Div -->
        <div id="middle_content">
            <tiles:insertAttribute name="body"/>
		</div>
    </div>
   <!-- footer 시작 -->
    <div id="footer">
	     <tiles:insertAttribute name="footer"/>
    </div>
    <!-- //footer 끝 -->
    
</div>
<!-- //wrap end -->
</body>
</html>
