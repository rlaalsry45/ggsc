<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE>
<html lang="en">
<head>
<meta charset="utf-8"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
<title id="title"> </title>
<link rel="stylesheet" href="/gnoincoundb/css/font-awesome.min.css">
<link rel="stylesheet" href="/gnoincoundb/css/jquery-accordion-menu.css">
<link rel="stylesheet" href="/gnoincoundb/css/jquery-ui.css">
<link rel="stylesheet" href="/gnoincoundb/css/style.css">
<script src="/gnoincoundb/js/jquery/jquery-1.11.2.min.js"></script>
<script src="/gnoincoundb/js/jquery/jquery.form.js"></script>
<script src="/gnoincoundb/js/jquery/jquery-migrate-1.4.1.js"></script>
<script src="/gnoincoundb/js/jquery/jquery-accordion-menu.js" type="text/javascript"></script>
<script src="/gnoincoundb/js/jquery/jquery-ui.min.js" type="text/javascript"></script>
<script src="/gnoincoundb/js/common.js"></script>

<!--[if lt ie 9]>
	<script src="/js/html5shiv.min.js"></script>
<![endif]-->
<script>
	$(document).ready(function() {
	  	var message = "${message}";
	  	if(message.length > 0) {
	  		alert(message);
	  	}
	});
	function login(){
		if(confirm("로그인 하시겠습니까?")) {
			var frm = document.loginForm;
			frm.action = "/gnoincoundb/login/actionLogin.do";
			frm.submit();			
		}
	}
	function cnsrJoinPopup() {
		var oepnwin;
		var url = "/gnoincoundb/cnsr_join_info.do";
		var name = "상담사 가입";
		var option = "width=530, height=750, left=100, location=yes";
		oepnwin = window.open(url, name, option);
		 /*  wNewWin = window.open(wAddr, '','toolbar=no,menubar=no,location=no,directories=no,status=no,scrollbars=no,resizable=yes,width='+wWidth+',height='+wHeight+',top='+wTop+',left='+wLeft+''); */
		
	}
	
	/* function login() {
		var param = $("#loginForm").serialize(); //ajax로 넘길 data
		if(confirm("로그인을 하시겠습니까?")) {
			
		$.ajax({
			type : "POST",
			url : "/gnoincoundb/center_mng_list_ajax.do",
			data : param,
			dataType : "json",
			beforeSend : function(xhr){
				xhr.setRequestHeader(header, token);
			},
			success : function(json) {
				console.log(json.list);
				
			},
			error : function(e) {
				alert("서버와 통신 오류입니다.");
			}
		});
		}
	} */
</script>

</head>
<body onload=''>
<!-- 로그인 -->
<div class="wrapper-login">
	<section id="login">
		<div class="login-box">
        	<h1 class="title"> <img src="/gnoincoundb/images/logo.png"> <p style="margin-top:25px;">관리자 로그인</p></h1>
			<!-- <h1 class="title"><img src="/images/logo_white.png" alt="서울시여성가족재단" /><br /><br /><img src="/images/ams.png" alt="AMS근태관리시스템" /></h1> -->
		<form id="loginForm" name="loginForm" method="post">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			<div class="input-group"><label>아이디</label><i class="fa fa-user-o"></i><input type="text" name="userId" placeholder="아이디를 입력하세요" class="input"  /></div>
			<div class="input-group"><label>비밀번호</label><i class="fa fa-lock"></i><input type="password" name="pw" placeholder="비밀번호를 입력하세요" class="input" onKeyDown="if (event.keyCode == 13) { login(); }"></div>
		</form>
			<button type="button" class="btn-login" onClick="javascript:login();">로그인</button>
			<button type="button" class="btn-login2" onClick="javascript:cnsrJoinPopup();">상담사 가입</button>
			<p class="copyright">Copyright(C) All Rights Reserved.</p>
		</div>
	</section>
</div>
<!-- //로그인 -->

</body>
</html>