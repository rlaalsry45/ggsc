<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!-- login --> 
<div id="login">
	<h1><img src="/adm/img/logo.jpg" alt="고령자미래설계지원센터"></h1>
	<h2><strong>| 관리자모드 |</strong> &nbsp;로그인하세요</h2>
	
	<!-- container -->
	<form id="frm" name="frm" method="post">
		<div class="login_bg">
			<div class="login_box">
				<div class="ico id"><input type="text" name="id" placeholder="아이디를 입력하세요"></div>
				<div class="ico pw"><input type="password" name="password" placeholder="비밀번호를 입력하세요"></div>
				<a href="javascript:fn_egov_login();" class="btn_login">로그인</a>
			</div>
		</div>
	<!-- //container -->
	</form>
	
	<div class="footer"> 
		<p>All Rights Reserved.</p>
	</div> 
</div>
<!-- /login -->  


 <!--/#action-->
    <script type="text/javaScript" language="javascript" defer="defer">
    
	    var loginYn = "";
		window.onload = function () {
			loginYn = '${loginYn}';
	    	
			if(loginYn=='N'){
	    		alert("로그인 정보를 확인해 주세요.");
	    	}
		}
		
		
        /* 글 수정 화면 function */
        function fn_egov_login() {
        	document.frm.action = "/usrMng/admLoginProc.do";
           	document.frm.submit();
        }
        
        
        //-->
    </script>