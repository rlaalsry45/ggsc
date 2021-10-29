<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>    
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
				frm.action = "/gnoincoun/actionLogin.do";
				frm.submit();			
			}
		}
  </script>
<style>
	#wrap {width: 30%; margin: auto; height: 594px;}
</style>
<section class="service-2 section">
	<div id="wrap">
        <h2 class="title">로그인</h2>
	  	<form id="loginForm" name="loginForm" method="post">
			<fieldset id="acField">
				<div class="form-group">
					<label for="userId">아이디</label>
                	<input name="userId" id="userId" type="text" class="form-control" placeholder="Your ID" maxlength="15" oninput="this.value = this.value.replace(/[^a-z0-9]/, '');">
              	</div>
				<div class="form-group">
					<label for="pw">비밀번호</label>
					<input name="pw" id="pw" type="password" class="form-control" placeholder="Password" maxlength="20">
				</div>
              <span class="checkbox-custom"><input type="checkbox" name="" id="chech-log" value=""><label for="chech-log"><i></i><span>로그인 유지</span></label></span>
              <button class="btn btn-primary btn-lg w100p mt30" onClick="javascript:login();">로그인</button>
              <span class="btn-group btn-group-justified mt30"><a href="/gnoincoun/agree.do" class="btn btn-default btn-sm">회원가입</a><a href="/gnoincoun/findIdPw.do" class="btn btn-default btn-sm">ID/PW 찾기</a></span>
              <!-- <span class="btn-group btn-group-justified mt30"><a href="/agree.do" class="btn btn-default btn-sm">회원가입</a></span> -->
			</fieldset>
		</form>
	</div>
</section> <!-- End section -->