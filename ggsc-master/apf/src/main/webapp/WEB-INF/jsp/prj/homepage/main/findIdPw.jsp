<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>    
    <script>
	$(document).ready(function() {
		$("#iBtn").css("display", "block");
		$("#pBtn").css("display", "none");
		$("#frmR").css("display", "none");
		
		/* var findId = $("#findId").val();
		var findPw = $("#findPw").val();
		
		$("#sBtn").css("display", "none");
		$("#cnsrDtl_table").css("display", "none");
		$('input:radio[name=cnsrGb]:input[value="${detail.cnsrGb}"]').attr("checked", true);
		$('input:radio[name=gender]:input[value="${detail.gender}"]').attr("checked", true);
		$('#cnsGb').val('${detail.cnsGb}').attr('selected','selected');
		$('#centerGb').val('${detail.centerGb}').attr('selected','selected');
		$('#edu').val('${detail.edu}').attr('selected','selected'); */
		
	});
	
	function fn_findType(param) {
		if(param == "I") {
			$("#iBtn").css("display", "block");
			$("#pBtn").css("display", "none");
			$("#userNm").val("");
			$("#email").val("");
			$("#tel").val("");
		} else if(param == "P") {
			$("#iBtn").css("display", "none");
			$("#pBtn").css("display", "block");
			$("#userNm").val("");
			$("#email").val("");
			$("#tel").val("");
		}
	}
	
  	function fn_reg() {
  		if(confirm("회원가입을 하시겠습니까?")) {
  			
  			var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/; // 이메일 유효성검사
  			var userId = $("#userId").val().replace(/ /gi, ""); // 아이디
  			var pw = $("#pw").val().replace(/ /gi, "") // 비밀번호
  			var pwChk = $("#pwChk").val().replace(/ /gi, "") // 비밀번호 확인
  			var userNm = $("#userNm").val().replace(/ /gi, ""); // 이름
  			var birthDt = $("#birthDt").val().replace(/\D/g,""); // 생년월일
  			var email = $("#email").val().replace(/ /gi, ""); // 이메일
  			var tel = $("#tel").val().replace(/ /gi, ""); // 전화번호
  			var mobile = $("#mobile").val().replace(/ /gi, ""); // 핸드폰
  			var addr = $("#addr").val().replace(/ /gi, ""); // 주소			
  			
  			if($("input:radio[name='joinPath']").is(":checked") == false) {
  				alert("가입경로를 체크해 주세요.");
  				$("#joinPath").focus();
  				return;
  			}
  			if(userId.length == 0) {
  				alert("아이디를 입력해 주세요.");
  				$("#userId").focus();
  				return;
  			}
  			if(userId.length < 5) {
  				alert("아이디를 6글자 이상으로 입력해 주세요.");
  				$("#userId").focus();
  				return;
  			}
  			if(pw.length == 0) {
  				alert("비밀번호를 입력해 주세요.");
  				$("#pw").focus();
  				return;
  			}
  			if(pwChk.length == 0) {
  				alert("비밀번호를 입력해 주세요.");
  				$("#pwChk").focus();
  				return;
  			}
  			if(pw != pwChk) {
  				alert("비밀번호가 동일하지 않습니다.");
  				$("#pwChk").focus();
  				return;
  			}
  			if(userNm.length == 0) {
  				alert("이름을 입력해 주세요.");
  				$("#userNm").focus();
  				return;
  			}
  			if($("input:radio[name='gender']").is(":checked") == false) {
  				alert("성별을 체크해 주세요.");
  				$("#gender").focus();
  				return;
  			}
  			if(mobile.length == 0) {
  				alert("연락처를 입력해 주세요.");
  				$("#mobile").focus();
  				return;
  			}
  			if(exptext.test(email) == false) {
  				alert("이메일을 옳바르게 입력해 주세요.");
  				$("#email").focus();
  				return;
  			}
  			document.frm.action = "/gnoincoun/joinReg.do";
  			document.frm.submit();
  		}
  	}
  	
	 function fn_findIdPw(findGb) {
			if(confirm("ID/PW 찾기를 하시겠습니까?")) {
			 	var userNm = $("#userNm").val().replace(/ /gi, ""); // 성명
			 	var tel = $("#tel").val().replace(/ /gi, ""); // 핸드폰
			 	var email = $("#email").val().replace(/ /gi, ""); // 핸드폰
			 	$("#findGb").val(findGb);
		
				if(userNm.length == 0) {
					alert("[성명]을 입력해주십시오.");
					$("#userNm").focus();
					return;
				}
			 	
				if(tel.length == 0) {
					alert("[핸드폰]을 입력해주십시오.");
					$("#userNm").focus();
					return;
				}
				
				if(email.length == 0) {
					alert("[이메일]을 입력해주십시오.");
					$("#email").focus();
					return;
				}
			 	var param = $("#frm").serialize(); 
				$.ajax({
					type : "POST",
					url : "/gnoincoun/findIdPwAjax.do",
					// data : {acptYn:"Y", caseNo:caseNo, cnsGb:cnsGb, userId:userId, userNm:userNm},
					// data : {userId:userId} ,
					data : param,
					dataType : "json",
					success : function(json) {
						var findGb = json.findGb;
						if(findGb == "I") {
							var result = json.result;
							if(result == null) {
								alert("일치하는 정보가 없습니다.");
							} else {
								var userId = json.result.userId;
								var userNm = json.result.userNm;
								var email = json.result.email;
								var cntn = "회원님의 아이디는 ["+userId+"] 입니다.";
								var title = "경기도노인종합상담센터 ID를 확인하세요."
								$("#sendList").val(email);
								$("#title").val(title);
								$("#cntn").val(cntn);
								$("#sendGb").val("I");
								alert(userNm+"님의 ID를 이메일로 전송했습니다.");	
								
								document.sendMail.action = "/gnoincoun/mailSend.do";
								document.sendMail.submit();	
								// location.href = "/gnoincoun/login.do";
							}
						} else if(findGb == "P") {
							var findPwChk = json.findPwChk;
							if(findPwChk == 1) {
								
								 var newPsswrod;
								 var randomValue = "abcdefghijklmnopqrstuvwxyz0123456789";
								 
								 for(i=1; i<=8; i++){
								  randomPoint = Math.round(Math.random()*34+1);
								  Pwdchar = randomValue.charAt(randomPoint);
								  if(i == 1){
								   newPassword = Pwdchar;
								  }else{
								   newPassword += Pwdchar;
								  }
								 }
								 
								var email = $("#email").val();
								var userNm = $("#userNm").val();
								var tel = $("#tel").val();
								var title = "경기도노인종합상담센터 임시비밀번호를 확인하세요."
								var cntn = "회원님의 임시비밀번호는 ["+newPassword+"] 입니다.";
								$("#sendList").val(email);
								$("#title").val(title);
								$("#cntn").val(cntn);
								$("#newPw").val(newPassword);
								$("#sendGb").val("P");
								$("#MuserNm").val(userNm);
								$("#Memail").val(email);
								$("#Mtel").val(tel);
								alert(userNm+"님의 임시비밀번호를 이메일로 전송했습니다.");	
								document.sendMail.action = "/gnoincoun/mailSend.do";
								document.sendMail.submit();	
							} else {
								alert("일치하는 정보가 없습니다.");
							}
						}
						
					},
					error : function(e) {
					  	alert("서버와 통신 오류입니다.");
					}
				});
			} // confirm end
		 }
		 
		 function fn_pwReset() {
			 if(confirm("비밀번호를 재설정하시겠습니까?")) {
				 
	  			var pw = $("#pw").val().replace(/ /gi, "") // 비밀번호
	  			var pwChk = $("#pwChk").val().replace(/ /gi, "") // 비밀번호 확인
	  			
				var num = pw.search(/[0-9]/g);
				var eng = pw.search(/[a-z]/ig);
				var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
		
				if(pw.length < 8 || pw.length > 20){
					 alert("8자리 ~ 20자리 이내로 입력해주세요.");
					 $("#pw").focus();
					 return false;
				}else if(pw.search(/\s/) != -1){
					 alert("비밀번호는 공백 없이 입력해주세요.");
					 $("#pw").focus();
					 return false;
				}else if(num < 0 || eng < 0){
					 alert("영문,숫자를 혼합하여 입력해주세요.");
					 $("#pw").focus();
					 return false;
			 	}
				
				if(pw != pwChk) {
	  				alert("비밀번호가 동일하지 않습니다.");
	  				$("#pwChk").focus();
	  				return;
	  			}
	  			
			 	var param = $("#frmR").serialize(); 
				$.ajax({
					type : "POST",
					url : "/gnoincoun/pwResetAjax.do",
					// data : {acptYn:"Y", caseNo:caseNo, cnsGb:cnsGb, userId:userId, userNm:userNm},
					// data : {userId:userId} ,
					data : param,
					dataType : "json",
					success : function(json) {
						alert(json.msg);
						location.href = "/gnoincoun/login.do";
						
					},
					error : function(e) {
					  	alert("서버와 통신 오류입니다.");
					}
				});
				 
			 } // confirm end
		 }	 
  </script>
<style>
	#wrap {width: 30%; margin: auto; height: 594px;}
</style>
<section class="service-2 section">
	<div id="wrap">
       <div class="page-header">
        <h1 class="title"><i class="fa fa-comments-o"></i>ID/PW 찾기</h1>
        <ol class="breadcrumb">
          <li><a href="/gnoincoun/homepageMainList.do">홈</a></li>
          <!--<li><a href="#">센터소개</a></li>-->
          <li class="active">ID/PW 찾기</li>
        </ol>
      </div>
      <div class="content login-content content-narrow">
      	<label class="control-label" for=""></label>
        <div class="fr">
          <span class="radio-custom"><input type="radio" name="joinPath" id="joinPath1" value="I" onClick="javascript:fn_findType('I');" checked="checked"><label for="joinPath1"><i></i><span>ID찾기</span></label></span>
          <span class="radio-custom"><input type="radio" name="joinPath" id="joinPath2" value="Y" onClick="javascript:fn_findType('P');" ><label for="joinPath2"><i></i><span>비밀번호찾기</span></label></span>
        </div>	
        <form class="form-wrap" id="sendMail" name="sendMail" method="post">
		  <input type="hidden" id="sendList" name="sendList" />
		  <input type="hidden" id="cntn" name="cntn" />
		  <input type="hidden" id="title" name="title" />
		  <input type="hidden" id="sendGb" name="sendGb" />
		  <input type="hidden" id="MuserNm" name="userNm" />
		  <input type="hidden" id="Memail" name="email" />
		  <input type="hidden" id="newPw" name="newPw" />
		  <input type="hidden" id="Mtel" name="tel" />
        </form>
		<form class="form-wrap" id="frm" name="frm" method="post">
		  <input type="hidden" id="findGb" name="findGb" />
          <div class="form-group">
            <label class="control-label" for="userNm">성명<i class="cr">*</i></label>
            <input type="text" id="userNm" name="userNm" class="form-control">
          </div>
          <div class="form-group">
            <label class="control-label" for="tel">핸드폰<i class="cr">*</i></label>
            <input type="text" class="form-control" id="tel" name="tel">
          </div>
          <div class="form-group">
            <label class="control-label" for="email">이메일<i class="cr">*</i></label>
            <input type="text" class="form-control" id="email" name="email">
          </div>
          <div class="btn-wrap line bt pt20">
            <button type="button" id="iBtn" class="btn btn-primary btn-lg w100p" onClick="javascript:fn_findIdPw('I');">ID 찾기</button>
            <button type="button" id="pBtn" class="btn btn-primary btn-lg w100p" onClick="javascript:fn_findIdPw('P');">비밀번호찾기</button>
            <!-- <button type="button" class="btn btn-primary btn-lg w100p" onclick="location.href='/login.do'" style="color: #fff; background-color: #78849E; border-color: #78849E;">비밀번호찾기</button> -->
          </div>
        </form>
        <!-- PW 재설정 from -->
		<form class="form-wrap" id="frmR" name="frmR" method="post">
		  <input type="hidden" id="RuserNm" name="userNm" />
		  <input type="hidden" id="Rtel" name="tel" />
		  <h2 class="title">비밀번호 재설정</h2>
          <div class="form-group">
            <label class="control-label" for="pw">비밀번호<i class="cr">*</i></label>
            <input type="password" id="pw" name="pw" class="form-control">
          </div>
          <div class="form-group">
            <label class="control-label" for="pwChk">비밀번호 확인<i class="cr">*</i></label>
            <input type="password" class="form-control" id="pwChk" name="pwChk">
          </div>
          <div class="btn-wrap line bt pt20">
            <button type="button" id="pBtn" class="btn btn-primary btn-lg w100p" onClick="javascript:fn_pwReset();">비밀번호 재설정</button>
          </div>
        </form>
	</div>
	</div>
</section> <!-- End section -->