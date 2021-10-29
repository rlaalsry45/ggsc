<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>    
  <script>
	
  	function fn_reg() {
  		if(confirm("회원가입을 하시겠습니까?")) {
  			
  			var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/; // 이메일 유효성검사
  			var userId = $("#userId").val().replace(/ /gi, ""); // 아이디
  			var pw = $("#pw").val().replace(/ /gi, "") // 비밀번호
  			var pwChk = $("#pwChk").val().replace(/ /gi, "") // 비밀번호 확인
  			var userNm = $("#userNm").val().replace(/ /gi, ""); // 이름
  			var birthDt = $("#birthDt").val().replace(/\D/g,""); // 생년월일
  			var email = $("#email").val().replace(/ /gi, ""); // 이메일
  			/* var tel = $("#tel").val().replace(/ /gi, ""); // 전화번호 */
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
  			if(idCheck != "Y"){
				alert("ID 중복확인을 해주세요.");
				return;
			}
  			if(pw.length == 0) {
  				alert("비밀번호를 입력해 주세요.");
  				$("#pw").focus();
  				return;
  			}
  			
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
  			if(birthDt.length == 0) {
  				alert("생년월일을 입력해주세요.");
  				$("#birthDt").focus();
  				return;
  			}
			if(birthDt.length != 8) {
				alert("생년월일을 정확하게 입력해주세요.");
				$("#birthDt").focus();
				return;
			}
			/* if(email.length == 0) {
				alert("이메일을 입력해주세요.");
				$("#email").focus();
				return;
			}
			if(exptext.test(email) == false) {
  				alert("이메일을 옳바르게 입력해 주세요.");
  				$("#email").focus();
  				return;
  			}
  			if(tel.length == 0) {
  				alert("전화번호를 입력해주세요.");
  				$("#tel").focus();
  				return;
  			} */
  			if(mobile.length == 0) {
  				alert("연락처를 입력해 주세요.");
  				$("#mobile").focus();
  				return;
  			}
  			if(addr.length == 0) {
  				alert("주소를 입력해주세요.");
  				$("#addr").focus();
  				return;
  			}
  			
  			document.frm.action = "/gnoincoun/joinReg.do";
  			document.frm.submit();
  			alert("등록이 완료되었습니다.");
  		}
  	}
	var idCheck;
  	
	 function fn_idCheck() {
	 	// var param = $("#frm").serialize(); 
	 	var userId = $("#userId").val();
	 	if(userId.length <= 5) {
	 		alert("ID를 6자 이상으로 입력해주세요.");
	 		$("#userId").focus();
	 		return false;
	 	}
		$.ajax({
			type : "POST",
			url : "/gnoincoun/userIdCheck.do",
			// data : {acptYn:"Y", caseNo:caseNo, cnsGb:cnsGb, userId:userId, userNm:userNm},
			// data : param,
			data : {userId:userId} ,
			dataType : "json",
			success : function(json) {
				alert(json.msg);
				if(json.idCheck == "Y") {
					idCheck = json.idCheck;
					$("#userId").attr("readonly",true);					
				}
			},
			error : function(e) {
			  	alert("서버와 통신 오류입니다.");
			}
		});
	 }
  	
  </script>
<style>
	#wrap {width: 50%; margin: auto;}
</style>
<section class="service-2 section">
	<div id="wrap">
        <h2 class="title">개인정보</h2>
	  	<form class="form-wrap" id="frm" name="frm" method="post">
          <div class="form-group line bt bb pt15 pb10">
            <label class="control-label" for="">가입경로</label>
            <div class="fr">
              <span class="radio-custom"><input type="radio" name="joinPath" id="joinPath1" value="I" checked="checked"><label for="joinPath1"><i></i><span>인터넷</span></label></span>
              <span class="radio-custom"><input type="radio" name="joinPath" id="joinPath2" value="Y" ><label for="joinPath2"><i></i><span>유튜브</span></label></span>
              <span class="radio-custom"><input type="radio" name="joinPath" id="joinPath3" value="T" ><label for="joinPath3"><i></i><span>TV</span></label></span>
            </div>
          </div>
          <div class="form-group">
            <label for="userId">아이디<i class="cr">*</i></label>
            <div class="input-group">
              <input name="userId" id="userId" type="text" class="form-control" placeholder="Your ID" oninput="this.value = this.value.replace(/[^a-z0-9]/, '');" maxlength="15">
              <span class="input-group-btn"><button type="button" class="btn btn-primary" onClick="fn_idCheck()">중복확인</button></span>
            </div>
          </div>
          <div class="form-group">
            <label for="pw">비밀번호<i class="cr">*</i></label>
            <input name="pw" id="pw" type="password" class="form-control" placeholder="Password" maxlength="20">
          </div>
          <div class="form-group">
            <label for="pwChk">비밀번호 확인<i class="cr">*</i></label>
            <input name="pwChk" id="pwChk" type="password" class="form-control" placeholder="Password" maxlength="20">
          </div>
          
		  <div class="form-group">
		  	   <label for="pwChk">시군구분<i class="cr">*</i></label>
               <select class="form-control" id="sigunCd" name="sigunCd">
					<c:forEach items="${sigunCdList }" var="code">
						<option value="${code.odr }">${code.mclassNm }</option>
					</c:forEach>
				</select>
          </div>
          <div class="form-group">
          		<label for="pwChk">센터구분<i class="cr">*</i></label>
          		<select class="form-control" name="centerGb" id="centerGb" >
					<c:forEach items="${cnsCenterList }" var="result">
						<option value="${result.num }">${result.centerGb }</option>
					</c:forEach>
				</select>
		  </div>
          <div class="form-group">
            <label class="control-label" for="userNm">성명<i class="cr">*</i></label>
            <input type="text" id="userNm" name="userNm" class="form-control" maxlength="8" onlyKorean oninput="this.value = this.value.replace(/[^ㄱ-힣]/, '');">
          </div>
          <div class="form-group line bb pb10">
            <label class="control-label" for="">성별<i class="cr">*</i></label>
            <div class="fr">
              <span class="radio-custom"><input type="radio" name="gender" id="gender1" value="M" checked="checked"><label for="gender1"><i></i><span>남</span></label></span>
              <span class="radio-custom"><input type="radio" name="gender" id="gender2" value="F" ><label for="gender2"><i></i><span>여</span></label></span>
            </div>
          </div>
          <div class="form-group">
            <label class="control-label" for="birthDt">생년월일<i class="cr">*</i></label>
            <input type="text" id="birthDt" name="birthDt" class="form-control" placeholder="19810101" maxlength="8" value="${map.birthDt }" oninput="this.value = this.value.replace(/[^0-9]/, '');">
            <!-- <div class="input-group">
              <span class="input-group-btn">
                <button class="btn btn-default ico"><i class="fa fa-calendar"></i></button>
              </span>
            </div> -->
          </div>
          <!-- <div class="form-group">
            <label class="control-label" for="telNo">연락처<i class="cr">*</i></label>
            <input type="text" class="form-control" id="tel" name="tel">
          </div> -->
          <div class="form-group">
            <label class="control-label" for="email">이메일</label>
            <input type="text" class="form-control" id="email" name="email" maxlength="30" value="${map.email }">
          </div>
          <!-- <div class="form-group">
            <label class="control-label" for="tel">전화번호<i class="cr">*</i></label>
            <input type="text" class="form-control" id="tel" name="tel" maxlength="20" oninput="this.value = this.value.replace(/[^0-9]/, '');">
          </div> -->
          <div class="form-group">
            <label class="control-label" for="mobile">전화번호<i class="cr">*</i></label>
            <input type="text" class="form-control" id="mobile" name="mobile" maxlength="20" value="${map.mobile }" oninput="this.value = this.value.replace(/[^0-9]/, '');">
          </div>
          <div class="form-group">
            <label class="control-label" for="addr">주소<i class="cr">*</i></label>
            <input type="text" class="form-control" id="addr" name="addr" maxlength="40" value="${map.addr }">
            <!-- <input type="text" class="form-control mt5" id="">
            <input type="text" class="form-control mt5" id=""> -->
          </div>
          <div class="btn-wrap line bt pt20">
            <button type="button" class="btn btn-primary btn-lg w100p" onclick="javascript:fn_reg();">회원가입</button>
            <button type="button" class="btn btn-primary btn-lg w100p" onclick="location.href='/gnoincoun/login.do'" style="color: #fff; background-color: #78849E; border-color: #78849E;">로그인</button>
          </div>
        </form>
	</div>
</section> <!-- End section -->