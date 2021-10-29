<%--
  Class Name : EgovLoginUsr.jsp
  Description : Login 인증 화면
  Modification Information
 
      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2009.03.03  박지욱          최초 생성
     2011.08.31  JJY       경량환경 버전 생성
 
    author   : 공통서비스개발팀 박지욱
    since    : 2009.03.03
--%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, target-densitydpi=medium-dpi" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" >
<meta http-equiv="content-language" content="ko">
<link href="/erp/build/css/login.css" rel="stylesheet">
<title>로그인</title>
<script type="text/javascript">

function actionLogin() {

    if (document.loginForm.id.value =="") {
        alert("아이디를 입력하세요");
    } else if (document.loginForm.password.value =="") {
        alert("비밀번호를 입력하세요");
    } else {
        document.loginForm.action="<c:url value='/adm/lgn/actionLogin.do'/>";
        //document.loginForm.j_username.value = document.loginForm.userSe.value + document.loginForm.username.value;
        //document.loginForm.action="<c:url value='/j_spring_security_check'/>";
        document.loginForm.submit();
    }
}







function goRegiUsr() {
    var userSe = document.loginForm.userSe.value;
    // 일반회원
    if (userSe == "GNR") {
        document.loginForm.action="<c:url value='/uss/umt/cmm/EgovMberSbscrbView.do'/>";
        document.loginForm.submit();
    }else{
        alert("일반회원 가입만 허용됩니다.");
    }
}

// function setCookie (name, value, expires) {
//     document.cookie = name + "=" + escape (value) + "; path=/; expires=" + expires.toGMTString();
// }

// function getCookie(Name) {
//     var search = Name + "="
//     if (document.cookie.length > 0) { // 쿠키가 설정되어 있다면
//         offset = document.cookie.indexOf(search)
//         if (offset != -1) { // 쿠키가 존재하면
//             offset += search.length
//             // set index of beginning of value
//             end = document.cookie.indexOf(";", offset)
//             // 쿠키 값의 마지막 위치 인덱스 번호 설정
//             if (end == -1)
//                 end = document.cookie.length
//             return unescape(document.cookie.substring(offset, end))
//         }
//     }
//     return "";
// }

// function saveid(form) {
//     var expdate = new Date();
//     // 기본적으로 30일동안 기억하게 함. 일수를 조절하려면 * 30에서 숫자를 조절하면 됨
//     if (form.checkId.checked)
//         expdate.setTime(expdate.getTime() + 1000 * 3600 * 24 * 30); // 30일
//     else
//         expdate.setTime(expdate.getTime() - 1); // 쿠키 삭제조건
//     setCookie("saveid", form.id.value, expdate);
// }

// function getid(form) {
//     form.checkId.checked = ((form.id.value = getCookie("saveid")) != "");
// }

function fnInit() {
    var message = document.loginForm.message.value;
    if (message != "") {
        alert(message);
    }
    
//     getid(document.loginForm);
}

</script>
</head>
<body onLoad="fnInit();">
	<div class="login"> 
		<div class="tit txtC font18 mgB10">유정ERP 로그인</div>
		<div style="width:327px;margin:0 auto;"> 
			<form name="loginForm" action ="<c:url value='/adm/lgn/actionLogin.do'/>" method="post"> 
		        <input type="hidden" name="message" value="${message}" />
				<fieldset> 
				<legend>Login</legend> 
					<div class="item mgB10"> 
						<label class="i_label">아이디</label>
						<input class="i_text" type="text" name="userId" id="id" title="아이디" maxlength="30"> 
					</div> 
					<div class="item"> 
						<label class="i_label">비밀번호</label>
						<input class="i_text"  type="password" name="pw" id="password" title="비밀번호" onKeyDown="javascript:if (event.keyCode == 13) { actionLogin(); }"> 
					</div> 
					<span class="btn_login"><input type="submit" value="로그인" onClick="javascript:actionLogin()"></span> 
		             <!-- <a href="#LINK" onClick="goRegiUsr();">회원가입</a> -->
				</fieldset> 
			</form> 
			
			<div class="copyright mgT25 txtC" style="border-top:1px solid #ddd;padding:10px 0;">
			<span class="fl mgR"><img src="/gnoincoundb/images/yoojung_logo.png" width="50" height="50" alt="유정산업"></span>
				<ul>
					<li>사업자번호:126-81-03986 / 전화:02-417-8894</li>
				</ul>
				
				<ul>
					<li>COPYRIGHT2014 유정산업(주) ALL Right Reserved.</li>
				</ul>
			</div>
		</div>
	</div>
	
	
</body>
</html>


