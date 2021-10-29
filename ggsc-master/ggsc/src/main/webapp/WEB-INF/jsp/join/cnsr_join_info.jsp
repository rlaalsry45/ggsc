<%@ page import="egovframework.rte.psl.dataaccess.util.EgovMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>신청자 정보 팝업</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="/gnoincoundb/css/style.css">
<meta name="_csrf" th:content="${_csrf.token}"/>
<meta name="_csrf_header" th:content="${_csrf.headerName}"/>
<script src="/gnoincoundb/js/jquery-1.11.2.min.js" ></script>
<script type="text/javascript">

	$(document).ready(function() {
		$("#userId").val("");
		$("#pw").val("");
		var msg = "${msg}";
		if(msg != "") {
			alert(msg);
			window.close();
		}
	});

	var idCheck;
	function fn_save(){
		
		var cnsGb = $("#cnsGb").val(); // 상담구분
		var zoneGb = $("#zoneGb").val(); // 권역구분
		//var localGb = $("#localGb").val(); // 지역구분
		var centerGb = $("#centerGb").val(); // 센터구분
		var edu = $("#edu").val(); // 학력
		var mobile = $("#mobile").val().replace(/\D/g,""); // 숫자가 아닌 공백,문자 제거 (연락처)
		var userId = $("#userId").val().replace(/ /gi, ""); // 아이디
		var pw = $("#pw").val().replace(/ /gi, ""); // 비밀번호
		var pwChk = $("#pwChk").val().replace(/ /gi, ""); // 비밀번호 확인
		var cnsrNm = $("#cnsrNm").val().replace(/ /gi, ""); // 이름
		//var age = $("#age").val().replace(/\D/g,""); // 나이
		var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/; // 이메일 유효성검사
		var email = $("#email").val().replace(/ /gi, ""); // 이메일
		var birthDt = $("#birthDt").val().replace(/\D/g,""); // 생년월일
		var posi = $("#posi").val(); // 직책
		
		var authCd = $('input:radio[name="cnsrGb"]:checked').val();
		
		if(Number(authCd) <= 4) {
			$("#authCd").val("4");
		} else {
			$("#authCd").val(authCd);
		}
		
		if(cnsGb.length == 0) {
			alert("상담구분을 선택해 주세요");
			$("#cnsGb").focus();
			return;
		}
		if(zoneGb.length == 0) {
			alert("권역구분을 선택해 주세요");
			$("#zoneGb").focus();
			return;
		}
		if(centerGb.length == 0) {
			alert("센터구분을 선택해 주세요");
			$("#centerGb").focus();
			return;
		}
		/* if(localGb.length == 0) {
			alert("지역구분을 선택해 주세요");
			$("#localGb").focus();
			return;
		} */
		if($("input:radio[name='cnsrGb']").is(":checked") == false) {
			alert("상담사 구분을 체크해 주세요.");
			$("#cnsrGb").focus();
			return;
		}
		if(userId.length == 0) {
			alert("아이디를 입력해 주세요.");
			$("#userId").focus();
			return;
		}
		if(userId.search(/\s/) != -1) {
			alert("아이디는 공백 없이 입력해주세요.");
			$("#userId").focus();
			return;
		}
		if(userId.length < 6) {
			alert("아이디를 6자 이상으로 입력해 주세요.");
			$("#userId").focus();
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
		 }else if(num < 0 || eng < 0 || spe < 0){
			  alert("영문,숫자,특수문자를 혼합하여 입력해주세요.");
			  $("#pw").focus();
			  return false;
		 }
		
		/* if(pw.length == 0) {
			alert("비밀번호를 입력해 주세요.");
			$("#pw").focus();
			return;
		}
		if(pwChk.length == 0) {
			alert("비밀번호를 입력해 주세요.");
			$("#pwChk").focus();
			return;
		} */
		
		if(pw != pwChk) {
			alert("비밀번호가 동일하지 않습니다.");
			$("#pwChk").focus();
			return;
		}
		if(cnsrNm.length == 0) {
			alert("이름을 입력해 주세요.");
			$("#cnsrNm").focus();
			return;
		}
		/*
		if(age.length == 0) {
			alert("연령을 입력해 주세요.");
			$("#age").focus();
			return;
		}
		*/
		if($("input:radio[name='gender']").is(":checked") == false) {
			alert("성별을 체크해 주세요.");
			$("#gender").focus();
			return;
		}
		if(birthDt.length == 0) {
			alert("생년월일을 입력해 주세요.");
			$("#birthDt").focus();
			return;
		}
		if(birthDt.length != 8) {
			alert("생년월일을 예시에 맞게 적어주세요");
			$("#birthDt").focus();
			return;
		}
		
		 var year = Number(birthDt.substr(0,4)); 
	     var month = Number(birthDt.substr(4,2));
	     var day = Number(birthDt.substr(6,2));
	     var today = new Date(); // 날자 변수 선언
	     var yearNow = today.getFullYear();
	     var adultYear = yearNow-20;
	 
	     if (year < 1900 || year > adultYear){
	          alert("년도를 확인하세요. "+adultYear+"년생 이전 출생자만 등록 가능합니다.");
	          $("#birthDt").focus();
	          return;
	     }
	     if (month < 1 || month > 12) { 
	          alert("달은 1월부터 12월까지 입력 가능합니다.");
	          $("#birthDt").focus();
	          return;
	     }
	    if (day < 1 || day > 31) {
	          alert("일은 1일부터 31일까지 입력가능합니다.");
	          $("#birthDt").focus();
	          return;
	     }
	     if ((month==4 || month==6 || month==9 || month==11) && day==31) {
	          alert(month+"월은 31일이 존재하지 않습니다.");
	          $("#birthDt").focus();
	          return;
	     }
	     if (month == 2) {
	          var isleap = (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0));
	          if (day>29 || (day==29 && !isleap)) {
	               alert(year + "년 2월은  " + day + "일이 없습니다.");
	               $("#birthDt").focus();
	               return;
	          }
	     }

		if(posi.length == 0) {
			alert("직책을 선택해 주세요");
			$("#posi").focus();
			return;
		}
		if($("input:checkbox[name='major']").is(":checked") == false) {
			alert("전공항복을 체크해 주세요.");
			$("#major").focus();
			return;
		}
		if(mobile.length == 0) {
			alert("연락처를 입력해 주세요.");
			$("#mobile").focus();
			return;
		}
		if(email.length == 0) {
			alert("이메일을 입력해 주세요");
			$("#email").focus();
			return;
		}
		if(email.search(/\s/) != -1) {
			alert("이메일은 공백 없이 입력해 주세요");
			$("#email").focus();
			return;
		}
		if(exptext.test(email) == false) {
			alert("이메일을 옳바르게 입력해 주세요.");
			$("#email").focus();
			return;
		}
		if(edu.length == 0) {
			alert("학력을 선택해 주세요");
			$("#edu").focus();
			return;
		}
		/* if($("input:checkbox[name='socialWorkProv']").is(":checked") == false) {
			alert("인정자격증을 체크해 주세요.");
			$("#socialWorkProv").focus();
			return;
		}
		if($("input:checkbox[name='cnsProv']").is(":checked") == false) {
			alert("기타 자격증을 체크해 주세요.");
			$("#cnsProv").focus();
			return;
		} */
		
		if(idCheck != "Y"){
			alert("ID 중복확인을 해주세요.");
			return;
		} 
		
		if(confirm("등록 하시겠습니까?")){
				
			document.frm.action = "/gnoincoundb/cnsr_join_write.do";
	       	document.frm.submit();
		}
			
	} 
	
	function fn_save1() {
		/* var chk = document.getElementsByName("major");
		
		if(var i=0; i<chk.length; i++) {
			
		} */
		/* for (i=0; i<f.elements['major'].length; i++)
        {
            if (f.elements['major'][i].checked==false)
            {
                f.elements['major'][i].disabled=true;
                f.elements['major'][i].disabled=true;
            }
        } */
     
       	var arr = "2,4,5";
       	arr = arr.split(',');

       	var cnt = arr.length;

       	for(var i=0; i<cnt; i++){
       	  $('input:checkbox[name=porm]').each(function(){
       	    if( arr[i].indexOf(this.value) > -1 ){ //현재 라인 배열에 값 존재여부 조건문 수정
       	    this.checked = true;
       	    }
       	  });
       	}
        
        var checkBoxArr = [];
        $("input[name=major]:checked").each(function(i){
        	checkBoxArr.push($(this).val());
        });
		alert(checkBoxArr);
        
	}
	
	function fn_idCheck(){
		var param = $("#userId").val();
		if(param.length <= 5) {
			alert("ID를 6자 이상으로 작성해주세요.");
			return false;
		}
		var token = $("meta[name='_csrf']").attr("th:content");
		var header = $("meta[name='_csrf_header']").attr("th:content");
		if(param.replace(/ /gi, "").length == 0){
			alert("ID를 입력해주세요.");
			return;
		}
		$.ajax({
			type : "POST",
			url : "/gnoincoundb/idCheck_ajax.do",
			data : {userId:param},
			dataType : "json",
			beforeSend : function(xhr){
				xhr.setRequestHeader(header, token);
			},
			success : function(json) {
				var msg = json.msg;
				idCheck = json.idCheck;
				if(idCheck == "Y") {
					$("#userId").attr("readOnly","true");
				}
				alert(msg);
			},
			error : function(e) {
				alert("서버와 통신 오류입니다.");
			}
		});
	}
	
	function fn_clear(){
		$("input[type=radio]").removeAttr("checked");
		$("input[type!=radio]").val("");
	}
	
	/* $(document).on('click','.selZone',function(){
		var nm = $("#zoneGb option:checked").text();

		fn_centerGb(nm);
		
	});
	
	function fn_centerGb(param){
		
		var param = $("#frm").serialize();
		var token = $("meta[name='_csrf']").attr("th:content");
		var header = $("meta[name='_csrf_header']").attr("th:content");
		
		$.ajax({
			type : "POST",
			url : url,
			data : {zoneGb:param},
			dataType : "json",
			beforeSend : function(xhr){
				xhr.setRequestHeader(header, token);
			},
			success : function(json) {
				
			},
			error : function(e) {
				alert("서버와 통신 오류입니다.");
			}
		});
	} */
</script>
<style>
	td:nth-child(odd){text-align:center;} 
</style>
</head>
<body style="background:white;">
	<div class="h3-title" style="background: #1266FF;height:30px;color:white;line-height:32px;">
		&nbsp;&nbsp;&nbsp;상담사가입 팝업
	</div>
	<h2 class="h2-title mg-t20 mg-l25">
		<i class="fa fa-circle"></i>상담사 가입 
	</h2>
	<div style="width:240px;height:20px;float:right;text-align:right;padding-top:10px;"><img src="/gnoincoundb/images/logo.png" style="width:240px;height:35px;"></div>
	<div style="border-top:1px solid black;width:500px;margin-left:10px;margin-top:10px;margin-bottom:10px;"></div>
	<div class="box-style1" style="background:#f4f4f4;width:500px;margin-left:10px;">
		[도움말]<p>
		∙ 반드시 아이디 중복확인을 하셔야 합니다.<p>
		∙ 상담사 권한에서 승인이 되지 않으면 경기도 노인 상담 센터로 문의하세요.
	</div>
	<form id="frm" name="frm" method="post">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		<input type="hidden" id="authCd" name="authCd" />
		<table class="table-write wd500 h600 mg-all10">
			<colgroup>
				<col width="15%"></col>
				<col width="35%"></col>
				<col width="15%"></col>
				<col width="35%"></col>
			</colgroup>
			<tr>
				<td colspan="4">상담구분</td>
			</tr>
			<tr>
				<th>상담구분 <span style="color: red;">*</span></th>
				<td colspan="1">
					<span class="label">
						<select name="cnsGb" id="cnsGb" style="width:170px;">
						 	<option value="">- 선택하세요 -</option>
							<c:forEach items="${cnsGbList }" var="result">
								<option value="${result.odr }">${result.mclassNm }</option>
							</c:forEach>
						</select>
					</span>
				</td>
				<th style="text-align: center;">권역구분  <span style="color: red;">*</span></th>
				<td colspan="1">
					<span class="label">
						<select name="zoneGb" id="zoneGb" class="selZone" style="width:170px;">
						 	<option value="">- 선택하세요 -</option>
							<c:forEach items="${zoneGbList }" var="result">
								<option value="${result.odr }">${result.mclassNm }</option>
							</c:forEach>
						</select>
					</span>
				</td>
			</tr>
			<tr>
				<td colspan="4">기관정보</td>
			</tr>
			<tr>
				<th style="text-align: center;">센터구분  <span style="color: red;">*</span></th>
				<td colspan="1">
					<span class="label">
						<select name="centerGb" id="centerGb" style="width:170px;">
						 	<option value="">- 선택하세요 -</option>
							<c:forEach items="${cnsCenterList }" var="result">
								<option value="${result.num }">${result.centerGb }</option>
							</c:forEach>
						</select>
					</span>
				</td>
				<th style="text-align: center;">시군구분  <span style="color: red;">*</span></th>
				<td colspan="1">
					<span class="label">
						<select name="sigunCd" id="sigunCd" class="selZone" style="width:170px;">
						 	<option value="">- 선택하세요 -</option>
							<c:forEach items="${sigunList }" var="result">
								<option value="${result.odr }">${result.mclassNm }</option>
							</c:forEach>
						</select>
					</span>
				</td>
			</tr>
			<tr>
				<td colspan="4">개인정보</td>
			</tr>
			<tr>
				<th>상담사<br>구분  <span style="color: red;">*</span></th>
				<td colspan="3">
					<input type="radio" id="radio1" name="cnsrGb" value="1" /><label for="radio1">전체운영자</label>
					<input type="radio" id="radio2" name="cnsrGb" value="2" /><label for="radio2">센터운영자</label>
					<input type="radio" id="radio3" name="cnsrGb" value="3" /><label for="radio3">전문상담사</label><br>
					<input type="radio" id="radio4" name="cnsrGb" value="4" /><label for="radio4">마음나눔봉사단</label>
					<input type="radio" id="radio5" name="cnsrGb" value="5" /><label for="radio5">실무자</label>
					<input type="radio" id="radio6" name="cnsrGb" value="6" /><label for="radio6">기타</label>
				</td>
			</tr>
			<tr>
				<th>ID  <span style="color: red;">*</span></th>
				<td colspan="3">
					<input type="text" id="userId" name="userId" style="width:164px;" oninput="this.value = this.value.replace(/[^a-z0-9]/, '');" maxlength="20">
					<button type="button" class="btn-basic" onclick="fn_idCheck()">중복확인</button>
				</td>
			</tr>
			<tr>
				<th>비밀번호  <span style="color: red;">*</span></th>
				<td><input type="password" id="pw" name="pw" oninput="this.value = this.value.replace(/[^a-z0-9~!@@#$%^&*]/, '');" maxlength="20"></td>
				<th>비밀번호 확인  <span style="color: red;">*</span></th>
				<td><input type="password" id="pwChk" name="pwChk" oninput="this.value = this.value.replace(/[^a-z0-9~!@@#$%^&*]/, '');" maxlength="20"></td>
			</tr>
			<tr>
				<th>이름  <span style="color: red;">*</span></th>
				<td>
					<input type="text" id="cnsrNm" name="cnsrNm" style="width:170px;" oninput="this.value = this.value.replace(/[^a-zㄱ-힣]/, '');" maxlength="8">
				</td>
				<th>성별  <span style="color: red;">*</span></th>
				<td>
					<input type="radio" id="gender1" name="gender" value="M" ><label for="gender1">남</label>
					<input type="radio" id="gender2" name="gender" value="F" /><label for="gender2">여</label>
				</td>
				<!-- 
				<td>연령</td>
				<td>
					<input type="text" id="age" name="age" oninput="this.value = this.value.replace(/[^0-9]/g, '');">
				</td>
				-->
			</tr>
			<tr>
				<th>생년월일  <span style="color: red;">*</span></th>
				<td><input type="text" id="birthDt" name="birthDt" placeholder="ex)19801010" oninput="this.value = this.value.replace(/[^0-9]/, '');" maxlength="8"></td>
				<th>직책  <span style="color: red;">*</span></th>
				<td colspan="3">
					<span class="label">
						<select name="posi" id="posi" style="width:170px;">
						 	<option value="">- 선택하세요 -</option>
							<c:forEach items="${posiList }" var="result">
								<option value="${result.odr }">${result.mclassNm }</option>
							</c:forEach>
						</select>
					</span>
				</td>
			</tr>
			<tr>
				<th>전공  <span style="color: red;">*</span></th>
				<td colspan="3">
			    	<input type="checkbox" id="major1" name="major" value="1">
			    	<label for="major1">상담</label>
			    	<input type="checkbox" id="major2" name="major" value="2">
			    	<label for="major2">사회복지</label>
			    	<input type="checkbox" id="major3" name="major" value="3">
			    	<label for="major3">심리</label>
			    	<input type="checkbox" id="major4" name="major" value="4">
			    	<label for="major4">교육</label><br>
			    	<input type="checkbox" id="major5" name="major" value="5">
			    	<label for="major5">아동가족</label>
			    	<input type="checkbox" id="major6" name="major" value="6">
			    	<label for="major6">기타</label>
				</td>
			</tr>
			<tr>
				<th>연락처  <span style="color: red;">*</span></th>
				<td><input type="text" id="mobile" name="mobile" placeholder="01012345678" oninput="this.value = this.value.replace(/[^0-9]/g, '');" maxlength="20"></td>
				<th>이메일  <span style="color: red;">*</span></th>
				<td><input type="text" id="email" name="email" maxlength="30"></td>
			</tr>
			<tr>
				<th>학력  <span style="color: red;">*</span></th>
				<td colspan="3">
					<span class="label">
						<select name="edu" id="edu" style="width:170px;">
						 	<option value="">- 선택하세요 -</option>
							<c:forEach items="${eduGbList }" var="result">
								<option value="${result.odr }">${result.mclassNm }</option>
							</c:forEach>
						</select>
					</span>
				</td>
			</tr>
			<tr>
				<th>인정자격증</th>
				<td colspan="3">
			    	<input type="checkbox" id="socialWorkProv1" name="socialWorkProv" value="1">
			    	<label for="socialWorkProv1">상담심리사</label>
			    	<input type="checkbox" id="socialWorkProv2" name="socialWorkProv" value="2">
			    	<label for="socialWorkProv2">전문상담사</label>
			    	<input type="checkbox" id="socialWorkProv3" name="socialWorkProv" value="3">
			    	<label for="socialWorkProv3">가족치료사</label><br>
			    	<input type="checkbox" id="socialWorkProv4" name="socialWorkProv" value="4">
			    	<label for="socialWorkProv4">청소년상담사</label>
			    	<input type="checkbox" id="socialWorkProv5" name="socialWorkProv" value="5">
			    	<label for="socialWorkProv5">임상심리사</label>
			    	<input type="checkbox" id="socialWorkProv6" name="socialWorkProv" value="6">
			    	<label for="socialWorkProv6">전문상담교사</label><br>
			    	<input type="checkbox" id="socialWorkProv7" name="socialWorkProv" value="7">
			    	<label for="socialWorkProv7">사회복지사</label>
				</td>
			</tr>
			<tr>
				<th>기타자격증</th>
				<td colspan="3">
			    	<input type="checkbox" id="cnsProv1" name="cnsProv" value="1">
			    	<label for="cnsProv1">노인전문상담사</label>
			    	<input type="checkbox" id="cnsProv2" name="cnsProv" value="2">
			    	<label for="cnsProv2">가정폭력전문상담원</label><br>
			    	<input type="checkbox" id="cnsProv3" name="cnsProv" value="3">
			    	<label for="cnsProv3">성폭력전문상담원</label>
			    	<input type="checkbox" id="cnsProv4" name="cnsProv" value="4">
			    	<label for="cnsProv4">미술치료사</label><br>
			    	<input type="checkbox" id="cnsProv5" name="cnsProv" value="5">
			    	<label for="cnsProv5">자살예방 QPR Instructor</label>
			    	<input type="checkbox" id="cnsProv6" name="cnsProv" value="6">
			    	<label for="cnsProv6">기타</label>
				</td>
			</tr>
		</table>
	</form>
	<div style="float:right;margin-right:7px;">
		<button type="button" class="btn-basic" onclick="javascript:fn_save();">저장</button>
		<button type="button" class="btn-basic" onclick="window.close();">닫기</button>
	</div>
</body>
</html>