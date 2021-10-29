<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>고령자미래설계지원센터</title>
<!-- css -->
<link rel="stylesheet" href="<c:url value='/adm/css/common.css'/>" />
<link rel="stylesheet" href="<c:url value='/adm/css/base.css'/>" />
<link rel="stylesheet" href="<c:url value='/adm/css/style.css'/>" />
<link rel="stylesheet" href="<c:url value='/adm/css/login.css'/>" />

<!-- js -->
<script src="<c:url value='/adm/js/jquery-1.9.1.min.js'/>" /></script>
<script src="<c:url value='/adm/js/jquery-common.js'/>" /></script> 
</head>

<body>
<!-- wrap --> 
<div class="wrap"> 
		
		
		
		
		<tiles:insertAttribute name="body" />
	

	
</div>
<!-- /wrap -->  
</body>
</html>