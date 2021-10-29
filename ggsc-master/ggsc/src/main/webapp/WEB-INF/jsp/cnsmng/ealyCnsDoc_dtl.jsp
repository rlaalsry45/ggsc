<%@ page import="egovframework.rte.psl.dataaccess.util.EgovMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script src="/gnoincoundb/js/html2canvas.min.js" ></script>
<!-- <script src="/gnoincoundb/js/jquery-1.11.2.min.js" ></script> -->
<script src="/gnoincoundb/js/jspdf.min.js" ></script>
<style>
	.filebox input[type="file"] {
    position: absolute;
    width: 0;
    height: 0;
    padding: 0;
    overflow: hidden;
    border: 0;
	}
	.filebox label {
	    display: inline-block;
	    padding: 2px 20px;
	    color: #999;
	    vertical-align: middle;
	    background-color: #fdfdfd;
	    cursor: pointer;
	    border: 1px solid #ebebeb;
	    border-radius: 5px;
	}
	
	/* named upload */
	.filebox .upload-name {
	    display: inline-block;
	  height: 25px;
	  font-size:18px; 
	  padding: 0 10px;
	  vertical-align: middle;
	  background-color: #f5f5f5;
	  border: 1px solid #ebebeb;
	  border-radius: 5px;
	  width: 600px;
	}
	
</style>
  </head>
<script type="text/javascript">
	$(document).ready(function() {
		var cnsrId = "${result.cnsrId}";
		var cnsrNm = "${result.cnsrNm}";
		
		if(cnsrId.length > 0) {
			$("#cnsrId").val(cnsrId);
		} else {
			$("#cnsrId").val("${map.userId }");
		}
		
		if(cnsrNm.length > 0) {
			$("#cnsrNm").val(cnsrNm);
		} else {
			$("#cnsrNm").val("${map.userNm }");
		}
		
		var fileTarget = $('#file'); 
		fileTarget.on('change', function(){ // 값이 변경되면
		    //var cur=$(".filebox input[type='file']").val();
		    var cur=$("#file").val();
			//$(".upload-name").val(cur);
			$("#upNm").val(cur);
		});
		
		var idCheck = "${result.caseNo }";
		if(idCheck != "") {
			$("#sBtn").css("display", "none");
			$("#uBtn").css("display", "");
			$("#dBtn").css("display", "");
			$("#pdfBtn").css("display","");
		} else {
			$("#sBtn").css("display", "");
			$("#uBtn").css("display", "none");
			$("#dBtn").css("display", "none");
			$("#pdfBtn").css("display","none");
		}
		
		var fileTarget1 = $('#file1'); 
		fileTarget1.on('change', function(){ // 값이 변경되면
		    var cur1=$("#file1").val();
			$("#upNm1").val(cur1);
		});
		
		var fileTarget2 = $('#file2'); 
		fileTarget2.on('change', function(){ // 값이 변경되면
		    var cur2=$("#file2").val();
			$("#upNm2").val(cur2);
		});
		
		var cnsMethd = "${result.cnsMethd}";
		if(cnsMethd != ""){
			$("#cnsMethd").val(cnsMethd).prop("selected", true);
		}
		var cnsDtl = "${result.cnsDtl}";
		if(cnsDtl != ""){
			$("#cnsDtl").val(cnsDtl).prop("selected", true);
		}
		
		var str;
		var name;
		
		str = "${result.olderRel}";
		name = "olderRel";
		fn_checked(str, name);
		
		str = "${result.gender}";
		name = "gender";
		fn_checked(str, name);
		
		str = "${result.majorApplCd}";
		name = "majorApplCd";
		fn_checked(str, name);
		
		str = "${result.edu}";
		name = "edu";
		fn_checked(str, name);
		
		str = "${result.decodeLvl}";
		name = "decodeLvl";
		fn_checked(str, name);
		
		str = "${result.relg}";
		name = "relg";
		fn_checked(str, name);
		
		str = "${result.livgForm}";
		name = "livgForm";
		fn_checked(str, name);
		
		str = "${result.houseForm}";
		name = "houseForm";
		fn_checked(str, name);
		
		str = "${result.merrStat}";
		name = "merrStat";
		fn_checked(str, name);
		
		str = "${result.liveForm}";
		name = "liveForm";
		fn_checked(str, name);
		
	});
	
	function fn_checked(str, name){
		var arr = str.split(",");
		for(var i in arr){
			$("input[name=" + name + "][value=" + arr[i] + "]").prop("checked", true);
		}
	}
	
	function fn_down(fileNm, sysFileNm, filePath){
		$("#fileNm").val(fileNm);
		$("#sysFileNm").val(sysFileNm);
		$("#filePath").val(filePath);
		document.downForm.action = "/gnoincoundb/fileDown.do";
       	document.downForm.submit();
	}
	
	function fn_cnsrCheck(save) {
		var token = $("meta[name='_csrf']").attr("th:content");
		var header = $("meta[name='_csrf_header']").attr("th:content");
		var param = $("#caseNo").val();
		var cnsleNm = $("#cnsleNm").val();
		if(cnsleNm == "") {
			alert("내담자 인적사항을 작성해 주세요.");
			return false;
		}
		$.ajax({
			type : "POST",
			url : "/gnoincoundb/ealyCnsleCheck.do",
			data : {caseNo:param} ,
			dataType : "json",
			beforeSend : function(xhr){
				xhr.setRequestHeader(header, token);
			},
			success : function(json) {
				var result = json.result;
				fn_reg(save,result);
			},
			error : function(e) {
				alert("서버와 통신 오류입니다.");
			}
		});
	}
	
	function fn_reg(save,result) {
		var cnsMethdNm = $("#cnsMethd option:checked").text();
		var cnsDtlNm = $("#cnsDtl option:checked").text();
		
		var olderRelIdx = $('input[name="olderRel"]:checked').val();
		var olderRelNm = $("label[for='olderRel"+olderRelIdx+"']").text();
		
		var eduIdx = $('input[name="edu"]:checked').val();
		var eduNm = $("label[for='edu"+eduIdx+"']").text();
		
		var decodeLvlIdx = $('input[name="decodeLvl"]:checked').val();
		var decodeLvlNm = $("label[for='decodeLvl"+decodeLvlIdx+"']").text();
		
		var relgIdx = $('input[name="relg"]:checked').val();
		var relgNm = $("label[for='relg"+relgIdx+"']").text();
		
		var livgFormIdx = $('input[name="livgForm"]:checked').val();
		var livgFormNm = $("label[for='livgForm"+livgFormIdx+"']").text();
		
		var houseFormIdx = $('input[name="houseForm"]:checked').val();
		var houseFormNm = $("label[for='houseForm"+houseFormIdx+"']").text();
		
		var merrStatIdx = $('input[name="merrStat"]:checked').val();
		var merrStatNm = "";
		var merrStatNmTot = "";
		$("input[name=merrStat]:checked").each(function() {
			idx = $(this).val();
			merrStatNm = $("label[for='merrStat"+idx+"']").text();
			merrStatNmTot = merrStatNmTot+" "+merrStatNm;
        });
		
		var liveFormIdx = $('input[name="liveForm"]:checked').val();
		var liveFormNm = "";
		var liveFormNmTot = "";
		$("input[name=liveForm]:checked").each(function() {
			idx = $(this).val();
			liveFormNm = $("label[for='liveForm"+idx+"']").text();
			liveFormNmTot = liveFormNmTot+" "+liveFormNm;
        });
		
		var majorApplCdIdx = $('input[name="majorApplCd"]:checked').val();
		var majorApplCdNm = "";
		var majorApplCdNmTot = "";
		$("input[name=majorApplCd]:checked").each(function() {
			idx = $(this).val();
			majorApplCd = $("label[for='majorApplCd"+idx+"']").text();
			majorApplCdNmTot = majorApplCdNmTot+" "+majorApplCd;
        });
		
		$("#cnsMethdNm").val(cnsMethdNm);
		$("#cnsDtlNm").val(cnsDtlNm);
		$("#eduNm").val(eduNm);
		$("#olderRelNm").val(olderRelNm);
		$("#decodeLvlNm").val(decodeLvlNm);
		$("#relgNm").val(relgNm);
		$("#livgFormNm").val(livgFormNm);
		$("#houseFormNm").val(houseFormNm);
		$("#merrStatNm").val(merrStatNmTot);
		$("#liveFormNm").val(liveFormNmTot);
		$("#majorApplCdNm").val(majorApplCdNmTot);
		
		if(result == "1") {
			alert("이미 초기상담신청서를 작성한 내담자입니다.");
			return false;
		}
		var frm = document.frm;
		if(frm.cnsleId.value.length < 1){
			alert('[내담자]를 선택해주세요.');
			return false;
		}else if(frm.cnsrId.value.length < 1){
			alert('[상담자]를 입력해주세요.');
			return false;
		}else if(frm.cnsDt.value.length < 8){
			alert('[상담일]을 입력해주세요.');
			return false;
		}else if(frm.mobile.value.length < 10){
			alert('[연락처]를 입력해주세요.');
			return false;
		}else if(frm.gender.value.length == 0){
			alert('[성별]을 선택해주세요.');
			return false;
		}else if(frm.emgcyTel.value.length < 1){
			alert('[긴급 연락처]를 입력해주세요.');
			return false;
		}else if(frm.addr.value.length < 1){
			alert('[주소]를 입력해주세요.');
			return false;
		}else if(frm.majorApplCd.value.length == 0){
			alert('[주호소문제]를 선택해주세요.');
			return false;
		}
		var cnsTimeHourS = $("#cnsTimeHourS").val();
		var cnsTimeMinS = $("#cnsTimeMinS").val();
		var cnsTimeHourE = $("#cnsTimeHourE").val();
		var cnsTimeMinE = $("#cnsTimeMinE").val();
		var cnsTimeTotMin = $("#cnsTimeTotMin").val();
		
		if(cnsTimeHourS.length == 0) {
			$("#cnsTimeHourS").val(0);
		}
		if(cnsTimeMinS.length == 0) {
			$("#cnsTimeMinS").val(0);
		}
		if(cnsTimeHourE.length == 0) {
			$("#cnsTimeHourE").val(0);
		}
		if(cnsTimeMinE.length == 0) {
			$("#cnsTimeMinE").val(0);
		}
		if(cnsTimeTotMin.length == 0) {
			$("#cnsTimeTotMin").val(0);
		}
		
		if(save == "S") {
			if(confirm("저장 하시겠습니까?")){
				document.frm.action = "/gnoincoundb/ealyCnsDocReg.do?mnuCd=${mnuCd}&save="+save;
		       	document.frm.submit();
			}
		} else if(save == "U") {
			if(confirm("수정 하시겠습니까?")) {
				document.frm.action = "/gnoincoundb/ealyCnsDocReg.do?mnuCd=${mnuCd}&save="+save;
		       	document.frm.submit();
			}
		}
			
	}
	
	
	function fn_delete() {
		if(confirm("해당 내담자의 초기상담신청서와 상담관리가 삭제됩니다. 삭제하시겠습니까?")) {
			document.frm.action="/gnoincoundb/ealyCnsDocDel.do?mnuCd=${mnuCd}";
			document.frm.submit();
		}
	}
	
	function fn_list(mnuCd){
		document.location.href = "/gnoincoundb/ealyCnsDocList.do?mnuCd=" + mnuCd;
	}
	
	function findUserPopup(){
		var userNm = $("#cnsleNm").val();
		userNm = encodeURI(encodeURIComponent(userNm));		
		var url = "/gnoincoundb/findUserPopup.do?userNm=" + userNm+"&cnsTargetGb=Y";
		var name = "회원 찾기";
		var option = "width = 530, height = 750, top = 50, left = 250, location = yes";
		window.open(url, name, option);
		//encodeURI(encodeURIComponent(jindan_name));
	}
	

</script>

<section id="content">

	<h2 class="h2-title"><i class="fa fa-check-square"></i>초기상담신청서 작성</h2>
		<div class="box-style1 x-scroll-auto" >
			<div class="btn" style="float: right; margin: 0;">
				<%-- <button type="button" id="pdfBtn" class="btn-basic btn-primary" onclick="javascript:fn_down('초기상담신청서.pdf', '${result.sysFileNm }', 'pdf')">PDF 다운</button> --%>
				<button type="button" class="btn-basic" onClick="javascript:fn_list('${mnuCd }');" style="background-color: green;color:white;">목록</button>
				<button type="button" id="sBtn" class="btn-basic" onClick="javascript:fn_cnsrCheck('S');" style="background-color: green;color:white;">저장</button>
				<button type="button" id="uBtn" class="btn-basic" onClick="javascript:fn_reg('U',0);" style="background-color: green;color:white;">수정</button>
				<c:if test="${authCd <= 1 }">
					<button type="button" id="dBtn" class="btn-basic" onClick="javascript:fn_delete();" style="background-color: green;color:white;">삭제</button>
				</c:if>
			</div>	
			<form name="downForm" id="downForm" method="post">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				<input type="hidden" id="fileNm" name="fileNm" value="" />
				<input type="hidden" id="sysFileNm" name="sysFileNm" value="" />
				<input type="hidden" id="filePath" name="filePath" value="" />
			</form>
			<form id="frm" name="frm" method="post" enctype="multipart/form-data">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				<input type="hidden" id="cnsleId" name="cnsleId" value="${result.cnsleId }" />
				<input type="hidden" id="caseNo" name="caseNo" value="${result.caseNo }" />
				<input type="hidden" id="caseNo" name="caseNo1" value="${result.caseNo }">
				<input type="hidden" id="cnsGb" name="cnsGb" value="${result.cnsGb }" />
				<input type="hidden" id="sigunCd" name="sigunCd" />
				
				<input type="hidden" id="cnsMethdNm" name="cnsMethdNm" />
				<input type="hidden" id="cnsDtlNm" name="cnsDtlNm" />
				<input type="hidden" id="olderRelNm" name="olderRelNm" />
				<input type="hidden" id="eduNm" name="eduNm" />
				<input type="hidden" id="decodeLvlNm" name="decodeLvlNm" />
				<input type="hidden" id="relgNm" name="relgNm" />
				<input type="hidden" id="livgFormNm" name="livgFormNm" />
				<input type="hidden" id="houseFormNm" name="houseFormNm" />
				<input type="hidden" id="merrStatNm" name="merrStatNm" />
				<input type="hidden" id="liveFormNm" name="liveFormNm" />
				<input type="hidden" id="majorApplCdNm" name="majorApplCdNm" />
				
				<table class="table-write">
					<colgroup>
						<col width="10%"></col>
						<col width="10%"></col> 
						<col width="15%"></col>
						<col width="15%"></col>
						<col width="10%"></col>
						<col width="10%"></col>
						<col width="15%"></col>
						<col width="15%"></col>
					</colgroup>
					<tr>
						<th>상담자 <span style="color: red;">*</span></th>
						<td colspan="3"><input type="text" class="wd200" id="cnsrId" name="cnsrId"  readonly /></td>
						<th>상담자성명 <span style="color: red;">*</span></th>
						<td colspan="3"><input type="text" class="wd200" id="cnsrNm" name="cnsrNm"  readonly /></td>
					</tr>
					<tr>
						<th>상담일 <span style="color: red;">*</span></th>
						<td colspan="3"><span class="form"><input type="text" class="wd200" id="datepicker1" name="cnsDt" value="${result.cnsDt }" readOnly /></span></td>
						<th>시간 <span style="color: red;">*</span></th>
						<td colspan="3"><input type="text" class="wd30" id="cnsTimeHourS" name="cnsTimeHourS" onlyNumber maxlength=2 value="${result.cnsTimeHourS }">시 
										<input type="text" class="wd30" id="cnsTimeMinS" name="cnsTimeMinS" onlyNumber maxlength=2  value="${result.cnsTimeMinS }">분 ~ 
										<input type="text" class="wd30" id="cnsTimeHourE" name="cnsTimeHourE" onlyNumber maxlength=2  value="${result.cnsTimeHourE }">시 
										<input type="text" class="wd30" id="cnsTimeMinE" name="cnsTimeMinE" onlyNumber maxlength=2  value="${result.cnsTimeMinE }">분 
										(<input type="text" class="wd30" id="cnsTimeTotMin" name="cnsTimeTotMin" onlyNumber maxlength=3  value="${result.cnsTimeTotMin }">분)</td>
					</tr>
					<tr>
						<th rowspan="2">상담형태 </th>
						<th>상담방법 <span style="color: red;">*</span></th>
						<td colspan="6">
							<select class="wd200" id="cnsMethd" name="cnsMethd">
								<c:forEach items="${cnsMethdList }" var="list">
									<option value="${list.odr }">${list.mclassNm }</option>
								</c:forEach>
							</select> 
						</td>
					</tr>
					<tr>
						<th>상담경위 <span style="color: red;">*</span></th>
						<td colspan="6">
							<select class="wd200" id="cnsDtl" name="cnsDtl">
								<c:forEach items="${cnsDtlList }" var="list">
									<option value="${list.odr }">${list.mclassNm }</option>
								</c:forEach>
							</select> 
						</td>
					</tr>
					<tr>
						<th rowspan="9">내담자<br>인적사항</th>
						<th>내담자와의관계 <span style="color: red;">*</span></th>
						<td colspan="2">
							<input type="radio" id="olderRel1" name="olderRel" value="1" /><label for="olderRel1">노인본인</label><input type="radio" id="olderRel2" name="olderRel" value="2" /><label for="olderRel2">배우자</label>
							<input type="radio" id="olderRel3" name="olderRel" value="3" /><label for="olderRel3">자녀</label><input type="radio" id="olderRel4" name="olderRel" value="4" /><label for="olderRel4">친인척</label>
							<input type="radio" id="olderRel5" name="olderRel" value="5" /><label for="olderRel5">이웃</label><input type="radio" id="olderRel6" name="olderRel" value="6" /><label for="olderRel6">유관기관</label>
						</td>
						<th>성별 <span style="color: red;">*</span></th>
						<td colspan="3"><input type="radio" id="genderM" name="gender" value="M" /><label for="genderM">남</label> <input type="radio" id="genderF" name="gender" value="F" /><label for="genderF">여</label></td>
					</tr>
					<tr>
						<th>성명 <span style="color: red;">*</span></th>
						<td colspan="2"><input type="text" class="wd200" id="cnsleNm" name="cnsleNm" value="${result.cnsleNm }" readonly/><button type="button" class="btn-basic" style="padding: 2px 6px;" onclick="javascript:findUserPopup();">찾기</button></td>
						<th>생년월일 <span style="color: red;">*</span></th>
						<td colspan="3"><span class="form"><input type="text" class="wd200" id="birthDt" name="birthDt" readonly onlyNumber maxlength=8 value="${result.birthDt }" /></span></td>
					</tr>
					<tr>
						<th>연락처 <span style="color: red;">*</span></th>
						<td colspan="2"><input type="text" class="wd200" id="mobile" name="mobile" value="${result.mobile }" readonly onlyNumber maxlength=11 /></td>
						<th>긴급연락처<span style="color: red;">*</span></th>
						<td colspan="3"><input type="text" class="wd200" name="emgcyTel" value="${result.emgcyTel }" onlyNumber maxlength=11 /></td>
					</tr>
					<tr>
						<th>주소 <span style="color: red;">*</span></th>
						<td colspan="6"><input type="text" id="addr" name="addr" readonly value="${result.addr }" /></td>
					</tr>
					<tr>
						<th>학력 </th>
						<td colspan="6">
							<input type="radio" id="edu1" name="edu" value="1" /><label for="edu1">무학</label><input type="radio" id="edu2" name="edu" value="2" /><label for="edu2">초졸</label>
							<input type="radio" id="edu3" name="edu" value="3" /><label for="edu3">중졸</label><input type="radio" id="edu4" name="edu" value="4" /><label for="edu4">고졸</label>
							<input type="radio" id="edu5" name="edu" value="5" /><label for="edu5">전문대졸</label><input type="radio" id="edu6" name="edu" value="6" /><label for="edu6">대졸</label>
							<input type="radio" id="edu7" name="edu" value="7" /><label for="edu7">석사</label><input type="radio" id="edu8" name="edu" value="8" /><label for="edu8">박사</label>
							<input type="radio" id="edu9" name="edu" value="9" /><label for="edu9">무응답</label>
						</td>
					</tr>
					<tr>
						<th>문자해독 </th>
						<td colspan="6">
							<input type="radio" id="decodeLvl1" name="decodeLvl" value="1" /><label for="decodeLvl1">문맹</label>
							<input type="radio" id="decodeLvl2" name="decodeLvl" value="2" /><label for="decodeLvl2">읽기만 가능</label>
							<input type="radio" id="decodeLvl3" name="decodeLvl" value="3" /><label for="decodeLvl3">불완전 읽고 쓰기 가능</label>
							<input type="radio" id="decodeLvl4" name="decodeLvl" value="4" /><label for="decodeLvl4">완전 읽고 쓰기 가능</label>
						</td>
					</tr>
					<tr>
						<th>종교</th>
						<td colspan="6">
							<input type="radio" id="relg1" name="relg" value="1" /><label for="relg1">무교</label><input type="radio" id="relg2" name="relg" value="2" /><label for="relg2">기독교</label>
							<input type="radio" id="relg3" name="relg" value="3" /><label for="relg3">천주교</label><input type="radio" id="relg4" name="relg" value="4" /><label for="relg4">불교</label>
							<input type="radio" id="relg5" name="relg" value="5" /><label for="relg5">원불교</label><input type="radio" id="relg6" name="relg" value="6" /><label for="relg6">기타</label>
						</td>
					</tr>
					<tr>
						<th>주거형태 </th>
						<td colspan="6">
							<input type="radio" id="livgForm1" name="livgForm" value="1" /><label for="livgForm1">자가</label>
							<input type="radio" id="livgForm2" name="livgForm" value="2" /><label for="livgForm2">전세</label>
							<input type="radio" id="livgForm3" name="livgForm" value="3" /><label for="livgForm3">월세</label>
							<input type="radio" id="livgForm4" name="livgForm" value="4" /><label for="livgForm4">시설거주</label>
							<input type="radio" id="livgForm5" name="livgForm" value="5" /><label for="livgForm5">기타</label>
						</td>
					</tr>
					<tr>
						<th>주택형태</th>
						<td colspan="6">
							<input type="radio" id="houseForm1" name="houseForm" value="1" /><label for="houseForm1">아파트</label>
							<input type="radio" id="houseForm2" name="houseForm" value="2" /><label for="houseForm2">단독주택</label>
							<input type="radio" id="houseForm3" name="houseForm" value="3" /><label for="houseForm3">다세대</label>
							<input type="radio" id="houseForm4" name="houseForm" value="4" /><label for="houseForm4">영구임대</label>
							<input type="radio" id="houseForm5" name="houseForm" value="5" /><label for="houseForm5">기타</label>
						</td>
					</tr>
					<tr>
						<th rowspan="2">가족<br>관계</th>
						<th>결혼상태 </th>
						<td colspan="6">
							<input type="checkbox" id="merrStat1" name="merrStat" value="1" /><label for="merrStat1">기혼</label>
							<input type="checkbox" id="merrStat2" name="merrStat" value="2" /><label for="merrStat2">사별</label>
							<input type="checkbox" id="merrStat3" name="merrStat" value="3" /><label for="merrStat3">별거</label>
							<input type="checkbox" id="merrStat4" name="merrStat" value="4" /><label for="merrStat4">이혼</label>
							<input type="checkbox" id="merrStat5" name="merrStat" value="5" /><label for="merrStat5">동거</label>
							<input type="checkbox" id="merrStat6" name="merrStat" value="6" /><label for="merrStat6">재혼</label>
							<input type="checkbox" id="merrStat7" name="merrStat" value="7" /><label for="merrStat7">기타</label>
							<input type="checkbox" id="merrStat8" name="merrStat" value="8" /><label for="merrStat8">미혼</label>
						</td>
					</tr>
					<tr>
						<th>동거형태 </th>
						<td colspan="6">
							<input type="checkbox" id="liveForm1" name="liveForm" value="1" /><label for="liveForm1">독거</label>
							<input type="checkbox" id="liveForm2" name="liveForm" value="2" /><label for="liveForm2">자녀 동거</label>
							<input type="checkbox" id="liveForm3" name="liveForm" value="3" /><label for="liveForm3">손자녀 동거</label>
							<input type="checkbox" id="liveForm4" name="liveForm" value="4" /><label for="liveForm4">배우자 동거</label>
							<input type="checkbox" id="liveForm5" name="liveForm" value="5" /><label for="liveForm5">부부-자녀동거</label>
							<input type="checkbox" id="liveForm6" name="liveForm" value="6" /><label for="liveForm6">부부-자녀부부 동거</label>
							<input type="checkbox" id="liveForm7" name="liveForm" value="7" /><label for="liveForm7">부부-자녀부부-손자녀 동거</label>
							<input type="checkbox" id="liveForm8" name="liveForm" value="8" /><label for="liveForm8">부부-손자녀동거</label>
							<input type="checkbox" id="liveForm9" name="liveForm" value="9" /><label for="liveForm9">친족동거</label>
							<input type="checkbox" id="liveForm10" name="liveForm" value="10" /><label for="liveForm10">비혈연동거(시설)</label>
							<input type="checkbox" id="liveForm11" name="liveForm" value="11" /><label for="liveForm11">기타</label>
						</td>
					</tr>
					<tr>
						<th>주호소문제 <span style="color: red;">*</span></th>
						<td colspan="7">
							<input type="radio" id="majorApplCd1" name="majorApplCd" value="1" /><label for="majorApplCd1">심리정서</label>
							<input type="radio" id="majorApplCd2" name="majorApplCd" value="2" /><label for="majorApplCd2">대인관계</label>
							<input type="radio" id="majorApplCd3" name="majorApplCd" value="3" /><label for="majorApplCd3">치매</label>
							<input type="radio" id="majorApplCd4" name="majorApplCd" value="4" /><label for="majorApplCd4">중독</label>
							<input type="radio" id="majorApplCd5" name="majorApplCd" value="5" /><label for="majorApplCd5">정신건강장애</label>
							<input type="radio" id="majorApplCd6" name="majorApplCd" value="6" /><label for="majorApplCd6">건강</label>
							<input type="radio" id="majorApplCd7" name="majorApplCd" value="7" /><label for="majorApplCd7">경제</label>
							<input type="radio" id="majorApplCd8" name="majorApplCd" value="8" /><label for="majorApplCd8">생활</label>
							<input type="radio" id="majorApplCd9" name="majorApplCd" value="9" /><label for="majorApplCd9">성</label>
							<input type="radio" id="majorApplCd10" name="majorApplCd" value="10" /><label for="majorApplCd10">부부</label>
							<input type="radio" id="majorApplCd11" name="majorApplCd" value="11" /><label for="majorApplCd11">가족</label>
							<input type="radio" id="majorApplCd12" name="majorApplCd" value="12" /><label for="majorApplCd12">역할상실</label>
							<input type="radio" id="majorApplCd13" name="majorApplCd" value="13" /><label for="majorApplCd13">생애진로</label>
							<input type="radio" id="majorApplCd14" name="majorApplCd" value="14" /><label for="majorApplCd14">자살</label>
							<input type="radio" id="majorApplCd15" name="majorApplCd" value="15" /><label for="majorApplCd15">기타</label>
						</td>
					</tr>
					<tr>
						<th>상담<br>내용</th>
						<td colspan="7"><textarea name="cnsCntn" style="height: 180px; width: 700px;">${result.cnsCntn }</textarea></td>
					</tr>
					<%-- <tr>
						<th>상담<br>요약</th>
						<td colspan="7"><textarea name="cnsSummary">${result.cnsSummary }</textarea></td>
					</tr> --%>
					<tr>
						<th>심리검사</th>
						<td colspan="7"><textarea name="psycExamCntn" style="height: 120px; width: 700px;">${result.psycExamCntn }</textarea></td>
					</tr>
					<tr>
						<th>서비스<br>연계</th>
						<td colspan="7"><textarea name="intrLinkCntn" style="height: 120px; width: 700px;">${result.intrLinkCntn }</textarea></td>
					</tr>
				</table>
			</form>
		</div>
		<!-- end -->
	</section>

</html>

