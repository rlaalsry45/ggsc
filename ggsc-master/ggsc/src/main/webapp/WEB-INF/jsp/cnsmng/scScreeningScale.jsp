<%@ page import="egovframework.rte.psl.dataaccess.util.EgovMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

    <link href="/gnoincoundb/css/style.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="/gnoincoundb/js/jquery-1.11.2.min.js" ></script>
    <script src="/gnoincoundb/js/html2canvas.min.js" ></script>
    <script src="/gnoincoundb/js/jspdf.min.js" ></script>
    <script src="/gnoincoundb/js/jquery-accordion-menu.js" ></script>
<style>
	ul.tabs{
	margin: 0px;
	padding: 0px;
	list-style: none;
	}
	ul.tabs li{
		background: none;
		color: #222;
		display: inline-block;
		padding: 10px 15px;
		cursor: pointer;
	}
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
	
	.bgcolor {
		background-color: #B2CCFF;
	}
	
</style>

<script type="text/javascript">
	$(document).ready(function() {
		$("#Ubtn").css("display", "none");
		var fileTarget = $('#file'); 
		fileTarget.on('change', function(){ // 값이 변경되면
		    var cur=$(".filebox input[type='file']").val();
			$(".upload-name").val(cur);
		}); 
		$("input[type=radio]").click(function(){
			if($("input[name=writeYn]:checked").val() == "Y"){
				$("#uploadTr").css("display", "none");
				$("#Ubtn").css("display", "none");
				$("#Ibtn").css("display", "");
			}else if($("input[name=writeYn]:checked").val() == "N"){
				$("#uploadTr").css("display", "");
				$("#Ubtn").css("display", "");
				$("#Ibtn").css("display", "none");
			}
		});
		
		var caseNo = "${caseNo}";
		var cnsleId = "${detail.cnsleId }";
		if(cnsleId != "") {
			$("#caseNo").val("${caseNo}");
			$("#Ibtn").css("display","none");
			$("#Sbtn").css("display","");
			$("#findBtn").css("display","none");
			$('input:radio[name=ansr1]:input[value=${detail.ansr1}]').attr("checked", true);
			$('input:radio[name=ansr2]:input[value=${detail.ansr2}]').attr("checked", true);
			$('input:radio[name=ansr3]:input[value=${detail.ansr3}]').attr("checked", true);
			$('input:radio[name=gender]:input[value=${detail.gender}]').attr("checked", true);
			
			$("input:radio[name=qust1Ansr]:input[value=${detail.qust1Ansr}]").attr("checked", true);
			$("input:radio[name=qust2Ansr]:input[value=${detail.qust2Ansr}]").attr("checked", true);
			$("input:radio[name=qust3Ansr]:input[value=${detail.qust3Ansr}]").attr("checked", true);
			$("input:radio[name=qust4Ansr]:input[value=${detail.qust4Ansr}]").attr("checked", true);
			$("input:radio[name=qust5Ansr]:input[value=${detail.qust5Ansr}]").attr("checked", true);
			$("input:radio[name=qust6Ansr]:input[value=${detail.qust6Ansr}]").attr("checked", true);
			$("input:radio[name=qust7Ansr]:input[value=${detail.qust7Ansr}]").attr("checked", true);
			$("input:radio[name=qust8Ansr]:input[value=${detail.qust8Ansr}]").attr("checked", true);
			$("input:radio[name=qust9Ansr]:input[value=${detail.qust9Ansr}]").attr("checked", true);
			$("input:radio[name=qust10Ansr]:input[value=${detail.qust10Ansr}]").attr("checked", true);
			$("input:radio[name=qust11Ansr]:input[value=${detail.qust11Ansr}]").attr("checked", true);
			$("input:radio[name=qust12Ansr]:input[value=${detail.qust12Ansr}]").attr("checked", true);
			$("input:radio[name=qust13Ansr]:input[value=${detail.qust13Ansr}]").attr("checked", true);
			$("input:radio[name=qust14Ansr]:input[value=${detail.qust14Ansr}]").attr("checked", true);
			$("input:radio[name=qust15Ansr]:input[value=${detail.qust15Ansr}]").attr("checked", true);
			
		} else {
			$("#Ibtn").css("display","");
			$("#Sbtn").css("display","none");
			$("#findBtn").css("display","");
		}
		
	});

	function fn_goLink(no){
		var url = "";
		
		if(no == 1){
			url = "/gnoincoundb/securityPledge.do?mnuCd=${mnuCd}&caseNo=${caseNo}";	
		}else if(no == 2){
			url = "/gnoincoundb/cnsAgreement.do?mnuCd=${mnuCd}&caseNo=${caseNo}";
		}else if(no == 3){
			url = "/gnoincoundb/privacyAgreement.do?mnuCd=${mnuCd}&caseNo=${caseNo}";
		}else{
			url = "/gnoincoundb/scScreeningScale.do?mnuCd=${mnuCd}&caseNo=${caseNo}";
		}
		document.location.href = url;
	}

	function fn_reg(save){
		
		if(save == "U") {
			var cnsleId = $("#cnsleId").val();
			if(cnsleId == "") {
				alert("사용자를 선택해 주세요.");
				return false;
			}
			
			if(confirm("파일업로드를 하시겠습니까?")) {
				
				$("#strtTime").val(1);
				$("#strtMin").val(1);
				$("#endTimeHour").val(1);
				$("#endTimeMin").val(1);
				$("#totTime").val(1);
				$("#strtTime").val(1);
				$("#yesTotScore").val(1);
				$("#noTotScore").val(1);
				$("#cnsrOptnScore").val(1);
				$("#cnsrOptnTot").val(1);
				
				document.frm.action = "/gnoincoundb/preExamReg.do?mnuCd=${mnuCd}";
		       	document.frm.submit();
			}
			return false;
		}
		
		if($("#cnsleId").val()==""){
			alert("ID를 입력해주세요.");
			$("#cnsleId").focus();
			return;
		}
		
		if($("#cnsleNm").val()==""){
			alert("사용자명을 입력해주세요.");
			$("#cnsleNm").focus();
			return;
		}
		
		if($("input[name=writeYn]:checked").val() == "Y"){
			
			if($("#rewdNo").val()==""){
				alert("사례번호를 입력해주세요.");
				$("#rewdNo").focus();
				return;
			}
			if($("#strtTime").val()==""){
				alert("시작시간(시)을 입력해주세요.");
				$("#strtTime").focus();
				return;
			}
			if($("#strtTime").val().length != 2){
				alert("시작시간(시)앞에 0을 입력해주세요.");
				$("#strtTime").focus();
				return;
			}
			if($("#strtMin").val()==""){
				alert("시작시간(분)을 입력해주세요.");
				$("#strtMin").focus();
				return;
			}
			if($("#strtMin").val().length != 2){
				alert("시작시간(분)앞에 0을 입력해주세요.");
				$("#strtMin").focus();
				return;
			}
			if($("#birthDt").val()==""){
				alert("생년월일을 입력해주세요.");
				$("#birthDt").focus();
				return;
			}
			if($('input:radio[name="gender"]').is(':checked')==false){
				alert("성별을 선택해주세요.");
				return;
			}
			if($("#year").val()==""){
				alert("날짜를 입력해주세요.");
				$("#year").focus();
				return;
			}
			if($("#month").val()==""){
				alert("날짜를 입력해주세요.");
				$("#month").focus();
				return;
			}
			if($("#month").val().length != 2){
				alert("해당 [월]앞에 0을 입력해주세요.");
				$("#month").focus();
				return;
			}
			if($("#day").val()==""){
				alert("날짜를 입력해주세요.");
				$("#day").focus();
				return;
			}
			if($("#day").val().length != 2){
				alert("해당 [일]앞에 0을 입력해주세요.");
				$("#day").focus();
				return;
			}
			if($("#endTimeHour").val()==""){
				alert("종료시간(시)을 입력해주세요.");
				$("#endTimeHour").focus();
				return;
			}
			if($("#endTimeHour").val().length != 2){
				alert("종료시간(시)앞에 0을 입력해주세요.");
				$("#endTimeHour").focus();
				return;
			}
			if($("#endTimeMin").val()==""){
				alert("종료시간(분)을 입력해주세요.");
				$("#endTimeMin").focus();
				return;
			}
			if($("#endTimeMin").val().length != 2){
				alert("종료시간(분)앞에 0을 입력해주세요.");
				$("#endTimeMin").focus();
				return;
			}
			if($("#totTime").val()==""){
				alert("총 소요시간을 입력해주세요.");
				$("#totTime").focus();
				return;
			}
			if($('input:radio[name="ansr1"]').is(':checked')==false){
				alert("응답1을 선택해주세요.");
				return;
			}
			if($('input:radio[name="ansr2"]').is(':checked')==false){
				alert("응답2을 선택해주세요.");
				return;
			}
			if($('input:radio[name="ansr3"]').is(':checked')==false){
				alert("응답3을 선택해주세요.");
				return;
			}
			if($('input:radio[name="qust1Ansr"]').is(':checked')==false){
				alert("질문1 답을 선택해주세요.");
				return;
			}
			if($('input:radio[name="qust2Ansr"]').is(':checked')==false){
				alert("질문2 답을 선택해주세요.");
				return;
			}
			if($('input:radio[name="qust3Ansr"]').is(':checked')==false){
				alert("질문3 답을 선택해주세요.");
				return;
			}
			if($('input:radio[name="qust4Ansr"]').is(':checked')==false){
				alert("질문4 답을 선택해주세요.");
				return;
			}
			if($('input:radio[name="qust5Ansr"]').is(':checked')==false){
				alert("질문5 답을 선택해주세요.");
				return;
			}
			if($('input:radio[name="qust6Ansr"]').is(':checked')==false){
				alert("질문6 답을 선택해주세요.");
				return;
			}
			if($('input:radio[name="qust7Ansr"]').is(':checked')==false){
				alert("질문7 답을 선택해주세요.");
				return;
			}
			if($('input:radio[name="qust8Ansr"]').is(':checked')==false){
				alert("질문8 답을 선택해주세요.");
				return;
			}
			if($('input:radio[name="qust9Ansr"]').is(':checked')==false){
				alert("질문9 답을 선택해주세요.");
				return;
			}
			if($('input:radio[name="qust10Ansr"]').is(':checked')==false){
				alert("질문10 답을 선택해주세요.");
				return;
			}
			if($('input:radio[name="qust11Ansr"]').is(':checked')==false){
				alert("질문11 답을 선택해주세요.");
				return;
			}
			if($('input:radio[name="qust11Ansr"]').is(':checked')==false){
				alert("질문11 답을 선택해주세요.");
				return;
			}
			if($('input:radio[name="qust12Ansr"]').is(':checked')==false){
				alert("질문12 답을 선택해주세요.");
				return;
			}
			if($('input:radio[name="qust13Ansr"]').is(':checked')==false){
				alert("질문13 답을 선택해주세요.");
				return;
			}
			if($('input:radio[name="qust14Ansr"]').is(':checked')==false){
				alert("질문14 답을 선택해주세요.");
				return;
			}
			if($('input:radio[name="qust15Ansr"]').is(':checked')==false){
				alert("질문15 답을 선택해주세요.");
				return;
			}
			if($("#yesTotScore").val()==""){
				alert("예 합계점수를 입력해주세요.");
				$("#yesTotScore").focus();
				return;
			}
			if($("#noTotScore").val()==""){
				alert("아니오 합계점수를 입력해주세요.");
				$("#noTotScore").focus();
				return;
			}
			if($("#cnsrOptnScore").val()==""){
				alert("상담자소견 점수를 입력해주세요.");
				$("#cnsrOptnScore").focus();
				return;
			}
			if($("#cnsrOptnTot").val()==""){
				alert("총점을 입력해주세요.");
				$("#cnsrOptnTot").focus();
				return;
			}
		}else{
			if(!$("#file").val()){
				alert("파일을 업로드해주세요.");
				$("#file").focus();
				return;
			}
		}
		
		if(save == "I") {
			if(confirm("등록 하시겠습니까?")){
				document.frm.action = "/gnoincoundb/preExamReg.do?mnuCd=${mnuCd}&save="+save;
		       	document.frm.submit();
			}			
		} else if(save == "S") {
			if(confirm("수정 하시겠습니까?")){
				document.frm.action = "/gnoincoundb/preExamReg.do?mnuCd=${mnuCd}&save="+save;
		       	document.frm.submit();
			}
		}
	}

	function findUserPopup(){
		var userNm = $("#cnsleNm").val();
		userNm = encodeURI(encodeURIComponent(userNm));
		var caseNo = "${caseNo}";
		var url = "/gnoincoundb/findUserPopup.do?userNm=" + userNm+"&cnsTargetGb=Y"+"&schCaseNo="+caseNo;
		var name = "회원 찾기";
		var option = "width = 530, height = 750, top = 50, left = 100, location = yes";
		window.open(url, name, option);encodeURI(encodeURIComponent(jindan_name));
	}
	
	function getGb(){
		if(document.getElementById('caseNo').value.length > 0){
			var token = $("meta[name='_csrf']").attr("th:content");
			var header = $("meta[name='_csrf_header']").attr("th:content");
			$.ajax({
				url : "/gnoincoundb/cnsAcceptDtl_ajax.do",
				type : "post",
				dataType : "json",
				data : { caseNo : document.getElementById('caseNo').value },
				beforeSend : function(xhr){
					xhr.setRequestHeader(header, token);
				}
			}).done(function(e){
				var data = e.Detail;
				var arr = [ 'cnsNm', 'zoneNm', 'centerNm' ];
				for(var i=0;i<arr.length;i++){
					$("[data-type='" + arr[i] + "']").text(eval("data." + arr[i] ));
				}
				
			}).fail(function(e){
				alert('서버 오류가 발생하였습니다.');
			})
			
		}
	}
	
	function fn_list(mnuCd){
		document.location.href = "/gnoincoundb/pretestList.do?mnuCd=" + mnuCd;
	}
	
</script>

<section id="content">

	<h2 class="h2-title"><i class="fa fa-check-square"></i>노인상담선별척도지 등록</h2>
		<div class="box-style1 x-scroll-auto" >
			<div>
				<ul class="tabs">
					<!-- <li style="border-style: solid; border-bottom-style:none; border-width: thin;" onclick="fn_goLink(1);">보안서약서</li> -->
					<li style="border-style: solid; border-bottom-style:none; border-width: thin;" onclick="fn_goLink(2);">상담동의서</li>
					<li style="border-style: solid; border-bottom-style:none; border-width: thin;" onclick="fn_goLink(3);">개인정보동의서</li>
					<li style="border-style: solid; border-bottom-style:none; border-width: thin; background-color: gray;">노인상담선별척도지</li>
					<div class="txtR" style="width: 73.2%; display: inline-block;">
						<button type="button" id="Ubtn" class="btn-basic" onClick="javascript:fn_reg('U');" style="background-color: green;color:white;">업로드</button>
						<button type="button" id="Ibtn" class="btn-basic" onClick="javascript:fn_reg('I');" style="background-color: green;color:white;">등록</button>
						<button type="button" id="Sbtn" class="btn-basic" onClick="javascript:fn_reg('S');" style="background-color: green;color:white;">수정</button>
						<button type="button" class="btn-basic" onClick='javascript:fn_list("${mnuCd}");' style="background-color: green;color:white;">목록</button>
					</div>
				</ul>
			</div>
			<div style="border-style: solid; border-width: thin; width:100%; height: auto; padding: 10px 10px 10px 10px;">
				<form id="frm" name="frm" method="post" enctype="multipart/form-data">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
					<input type="hidden" id="mnuCd" name="mnuCd" value="${mnuCd }" />
					<input type="hidden" id="caseNo" name="caseNo" value="0" />
					<input type="hidden" id="examDocCd" name="examDocCd" value="4" />
					<input type="hidden" id="docGb" name="docGb" value="1" />
					<input type="hidden" value="${userNm }" oninput="this.value = this.value.replace(/[^ㄱ-힣]/, '');"/></td>
					<input type="hidden" id="localGb" name="localGb" value="9"/>
					<input type="hidden" id="docCntnPath" name="docCntnPath" value="Y" />
					<table border="1" class="table-write" style="width: 101.2%; position: relative; left: -10px; top: -10px; border-left-style:hidden; border-right-style: hidden; border-top-style: hidden;">
						<colgroup>
							<col width="15%" >
							<col width="35%" >
							<col width="15%" >
							<col width="35%" >
						</colgroup>
						<tbody>
							<tr>
								<th>문서구분</th>
								<td>노인상담선별척도지</td>
								<th>작성여부</th>
								<td>
									<input type="radio" style="margin: 0 4px 4px 7px;" name="writeYn" id="writeY" value="Y" checked="checked" /><label for="writeY">예</label>
									<!-- <input type="radio" style="margin: 0 4px 4px 7px;" name="writeYn" id="writeN" value="N" /><label for="writeN">아니오</label> -->
								</td>
							</tr>
							<tr>
								<th>내담자ID</th>
								<td><input type="text" id="cnsleId" name="cnsleId" style="width: 200px;" value="${detail.cnsleId }" readonly="readonly" /></td>
								<th>내담자명</th>
								<td><input type="text" id="cnsleNm" name="cnsleNm" style="width: 200px;" value="${detail.inputNm }" readonly="readonly" /><button type="button" id="findBtn" class="btn-basic" style="padding: 2px 6px;" onclick="javascript:findUserPopup();">찾기</button></td>
							</tr>
							<tr height=33>
								<th>상담구분</th>
								<td><span id="cnsGbR" data-type='cnsNm'><c:out value="${detail.cnsGbNm }" /></span></td>
								<th>권역구분</th>
								<td><span id="zoneGbR" data-type='zoneNm'><c:out value="${detail.zoneGbNm }" /></span></td>
							</tr>
							<tr height=33>
								<th>센터구분</th>
								<td><span id="centerGbR" data-type='centerNm'><c:out value="${detail.centerGbNm }" /></span></td>
								<th></th>
								<td></td>
							</tr>
							<tr id="uploadTr" style="display: none;">
								<th>직접업로드</th>
								<td colspan="3">
									<div class="filebox"> 
	  									<input type="file" id="file" name="file"> 
										<input class="upload-name" value="파일선택">
										<label class="btn-basic" style="background-color: gray;color:white;" for="file">찾기</label> 
									</div>
								</td>
							</tr>
						</tbody>
					</table>
				<div style="border-style: solid; border-width: thin; width:700px; height: auto; padding: 30px 20px 20px 20px; margin: 10px 10px 10px 450px;">

					<h1 style="text-align: center; font-size:x-large; padding-bottom: 20px;">노인상담선별척도지</h1><br>
					<table border="1">
						<colgroup>
							<col width="8%"></col>
							<col width="17%"></col>
							<col width="10%"></col>
							<col width="15%"></col>
							<col width="10%"></col>
							<col width="15%"></col>
							<col width="10%"></col>
							<col width="15%"></col>
						</colgroup>
						<tr>
							<td>내담자</td>			   
							<td><input type="text" value="${detail.inputNm }" readonly /></td>
							<td>사례번호</td>
							<td><input type="text" id="rewdNo" name="rewdNo" value="${dccNum }" readonly /></td>
							<td>시작시간</td>
							<td><input type="text" style="width: 30px;" id="strtTime" name="strtTime" value="${detail.strtTime }" onlyNumber maxlength=2 />시 <input type="text" style="width: 30px;" id="strtMin" name="strtMin" value="${detail.strtMin }" onlyNumber maxlength=2/>분</td>
							<td>생년월일</td>
							<td><input type="text" id="birthDt" name="birthDt" value="${detail.birthDt }" onlyNumber maxlength=6 readonly/></td>
						</tr>
						<tr>
							<td>작성일</td>
							<td><input type="text" style="width: 45px;" id="year" name="year" value="${fn:substring(detail.writeDt,0,4) }" oninput="this.value = this.value.replace(/[^0-9]/g, '')" maxlength="4"/>년
							<input type="text" style="width: 25px;" id="month" name="month" value="${fn:substring(detail.writeDt,4,6) }" oninput="this.value = this.value.replace(/[^0-9]/g, '')" maxlength="2"/>월
							<input type="text" style="width: 25px;" id="day" name="day" value="${fn:substring(detail.writeDt,6,8) }" oninput="this.value = this.value.replace(/[^0-9]/g, '')" maxlength="2"/>일</td>
							<td>성별</td>
							<td><input type="radio" id="genderM" name="gender" value="M" />남&nbsp;&nbsp;&nbsp;<input type="radio" id="genderF" name="gender" value="F" />여</td>
							<td>종료시간</td>
							<td><input type="text" style="width: 30px;" id="endTimeHour" name="endTimeHour" value="${detail.endTimeHour }" onlyNumber maxlength=2 />시 <input type="text" style="width: 30px;" id="endTimeMin" name="endTimeMin" value="${detail.endTimeMin }" onlyNumber maxlength=2 />분</td>
							<td>총 소요시간</td>
							<td><input type="text" style="width: 50px;" id="totTime" name="totTime" value="${detail.totTime }" onlyNumber maxlength=3 />분</td>
						</tr>
					</table>
					<br>
					<font style="font-size: medium;"> ※ 상담사는 아래의 척도를 시행하기에 앞서 신체적 질병 및 인지·지각장애 사항을 점검하고, 
					그로 인하여 파생되는 어려움은 아닌지에 대하여 변별 사용하시길 바랍니다.</font><br><br>
					<table border="1">
						<colgroup>
							<col width="*"></col>
							<col width="10%"></col>
							<col width="10%"></col>
							<col width="20%"></col>
						</colgroup>
						<tr>
							<td rowspan="2">문항</td>
							<td colspan="2">응답</td>
							<td>관찰평가</td>
						</tr>
						<tr>
							<td>예</td>
							<td>아니오</td>
							<td>내용 및 특징</td>
						</tr>
						<tr>
							<td style="text-align: left; padding-left: 5px;">1. 최근(1년 이내) 다치거나 병원에 입원한 적이 있다.</td>
							<td><input type="radio" id="ansr1Y" name="ansr1" value="Y" /></td>
							<td><input type="radio" id="ansr1N" name="ansr1" value="N" /></td>
							<td><input type="text" id="ansr1Cntn" name="ansr1Cntn" maxlength="20" value="${detail.ansr1Cntn }" /></td>
						</tr>
						<tr>
							<td style="text-align: left; padding-left: 5px;">2. 만성질환으로 약물을 복용하고 있다.</td>
							<td><input type="radio" id="ansr2Y" name="ansr2" value="Y" /></td>
							<td><input type="radio" id="ansr2N" name="ansr2" value="N" /></td>
							<td><input type="text" id="ansr2Cntn" name="ansr2Cntn" maxlength="20" value="${detail.ansr2Cntn }" /></td>
						</tr>
						<tr>
							<td style="text-align: left; padding-left: 5px;">3. 신경정신 관련 진단을 받은 바 있다. (예: 치매진단을 받은 적이 있다.)</td>
							<td><input type="radio" id="ansr3Y" name="ansr3" value="Y" /></td>
							<td><input type="radio" id="ansr3N" name="ansr3" value="N" /></td>
							<td><input type="text" id="ansr3Cntn" name="ansr3Cntn" maxlength="20" value="${detail.ansr3Cntn }" /></td>
						</tr>
					</table>
					<br>
					<font style="font-size: medium;"> ※ 지시문</font><br><br>
					<table border="1" style="width: 100%;">
						<tr>
							<td style="text-align: left; padding: 5px;">"OOO 어르신에게 몇 개의 문장을 읽어드리겠습니다.<br>이에 대하여 가장 솔직한 생각을 예, 아니오의 수준에 맞도록 답변해주시면 됩니다."</td>
						</tr>
					</table>
					<br>
					<table border="1">
						<colgroup>
							<col width="20%"></col>
							<col width="*"></col>
							<col width="10%"></col>
							<col width="10%"></col>
						</colgroup>
						<thead>
							<th colspan="2">문항</th>
							<th>예</th>
							<th>아니오</th>
						</thead>
						<tbody>
							<tr>
								<td colspan="2" style="text-align: left; padding-left: 5px;">1. 나의 삶에 대해 대체로 만족하십니까?</td>
								<td><input class="radBtn2" type="radio" id="qust1AnsrY" name="qust1Ansr" value="N" /></td>
								<td class="bgcolor"><input class="radBtn" type="radio" id="qust1AnsrN" name="qust1Ansr" value="Y" /></td>
							</tr>
							<tr>
								<td colspan="2" style="text-align: left; padding-left: 5px;">2. 다른 사람에게 도움이 되는 필요한 사람이라고 생각하십니까?</td>
								<td><input class="radBtn2" type="radio" id="qust2AnsrY" name="qust2Ansr" value="N" /></td>
								<td class="bgcolor"><input class="radBtn" type="radio"  id="qust2AnsrN" name="qust2Ansr" value="Y" /></td>
							</tr>
							<tr>
								<td colspan="2" style="text-align: left; padding-left: 5px;">3. 최근 활동이나 관심거리가 많이 줄었습니까?</td>
								<td class="bgcolor"><input class="radBtn" type="radio" id="qust3AnsrY" name="qust3Ansr" value="Y" /></td>
								<td><input class="radBtn2" type="radio" id="qust3AnsrN" name="qust3Ansr" value="N" /></td>
							</tr>
							<tr>
								<td colspan="2" style="text-align: left; padding-left: 5px;">4. 손발이 떨리고 안절부절 못할 때가 있습니까?</td>
								<td class="bgcolor"><input class="radBtn" type="radio" id="qust4AnsrY" name="qust4Ansr" value="Y" /></td>
								<td><input class="radBtn2" type="radio" id="qust4AnsrN" name="qust4Ansr" value="N" /></td>
							</tr>
							<tr>
								<td colspan="2" style="text-align: left; padding-left: 5px;">5. 가까운 사람(가족, 동거인)들과 해결되지 못한 문제로 갈등이 있습니까?</td>
								<td class="bgcolor"><input class="radBtn" type="radio" id="qust5AnsrY" name="qust5Ansr" value="Y" /></td>
								<td><input class="radBtn2" type="radio" id="qust5AnsrN" name="qust5Ansr" value="N" /></td>
							</tr>
							<tr>
								<td colspan="2" style="text-align: left; padding-left: 5px;">6. 고민이나 문제가 생길 때 하소연할 사람(곳)이 있습니까?</td>
								<td><input class="radBtn2" type="radio" id="qust6AnsrY" name="qust6Ansr" value="N" /></td>
								<td class="bgcolor"><input class="radBtn" type="radio" id="qust6AnsrN" name="qust6Ansr" value="Y" /></td>
							</tr>
							<tr>
								<td colspan="2" style="text-align: left; padding-left: 5px;">7. 최근 나에게 중요한 사람, 반려동물이나 물건을 상실한 경험이 있습니까?</td>
								<td class="bgcolor"><input class="radBtn" type="radio" id="qust7AnsrY" name="qust7Ansr" value="Y" /></td>
								<td><input class="radBtn2" type="radio" id="qust7AnsrN" name="qust7Ansr" value="N" /></td>
							</tr>
							<tr>
								<td colspan="2" style="text-align: left; padding-left: 5px;">8. 쉽게 화를 내거나 참지 못할 때가 자주 있습니까?</td>
								<td class="bgcolor"><input class="radBtn" type="radio" id="qust8AnsrY" name="qust8Ansr" value="Y" /></td>
								<td><input class="radBtn2" type="radio" id="qust8AnsrN" name="qust8Ansr" value="N" /></td>
							</tr>
							<tr>
								<td colspan="2" style="text-align: left; padding-left: 5px;">9. 기분이 가라앉거나 우울할 때가 있습니까?</td>
								<td class="bgcolor"><input class="radBtn" type="radio" id="qust9AnsrY" name="qust9Ansr" value="Y" /></td>
								<td><input class="radBtn2" type="radio" id="qust9AnsrN" name="qust9Ansr" value="N" /></td>
							</tr>
							<tr>
								<td colspan="2" style="text-align: left; padding-left: 5px;">10. 최근 가까운 사람(가족, 동거인)에게 소외나 무시를 당한다고 느낀 적이 있습니까?</td>
								<td class="bgcolor"><input class="radBtn" type="radio" id="qust10AnsrY" name="qust10Ansr" value="Y" /></td>
								<td><input class="radBtn2" type="radio" id="qust10AnsrN" name="qust10Ansr" value="N" /></td>
							</tr>
							<tr>
								<td colspan="2" style="text-align: left; padding-left: 5px;">11. 최근 스스로 죽고 싶다는 생각을 한 적이 있습니까?</td>
								<td class="bgcolor"><input class="radBtn" type="radio" id="qust11AnsrY" name="qust11Ansr" value="Y" /></td>
								<td><input class="radBtn2" type="radio" id="qust11AnsrN" name="qust11Ansr" value="N" /></td>
							</tr>
							<tr>
								<td colspan="2" style="text-align: left; padding-left: 5px;">12. 자신이 헛되이 살았다고 느껴질 때가 있습니까?</td>
								<td class="bgcolor"><input class="radBtn" type="radio" id="qust12AnsrY" name="qust12Ansr" value="Y" /></td>
								<td><input class="radBtn2" type="radio" id="qust12AnsrN" name="qust12Ansr" value="N" /></td>
							</tr>
							<tr>
								<td colspan="2" style="text-align: left; padding-left: 5px;">13. 나에게 아무도 관심을 갖지 않아 혼자 된 것 같습니까?</td>
								<td class="bgcolor"><input class="radBtn" type="radio" id="qust13AnsrY" name="qust13Ansr" value="Y" /></td>
								<td><input class="radBtn2" type="radio" id="qust13AnsrN" name="qust13Ansr" value="N" /></td>
							</tr>
							<tr>
								<td colspan="2" style="text-align: left; padding-left: 5px;">14. 신체·정서·경제적 부당한 대우(학대)를 받은 적이 있습니까?</td>
								<td class="bgcolor"><input class="radBtn" type="radio" id="qust14AnsrY" name="qust14Ansr" value="Y" /></td>
								<td><input class="radBtn2" type="radio" id="qust14AnsrN" name="qust14Ansr" value="N" /></td>
							</tr>
							<tr>
								<td colspan="2" style="text-align: left; padding-left: 5px;">15. 아플 때 돌봐줄 사람이 있습니까?</td>
								<td><input class="radBtn2" type="radio" id="qust15AnsrY" name="qust15Ansr" value="N" /></td>
								<td class="bgcolor"><input class="radBtn" type="radio" id="qust15AnsrN" name="qust15Ansr" value="Y" /></td>
							</tr>
							<tr>
								<td>채점</td>
								<td style="text-align: left; padding-left: 5px;">※ 진한 색에 1점부여, 그 외 0점을 부여함</td>
								<td colspan="2"><input type="text" class="wd50" id="yesTotScore" name="yesTotScore" value="${detail.yesTotScore }" readonly onlyNumber maxlength=2>점</td>
								<td style="display:none;"><input type="text" class="wd30" id="noTotScore" name="noTotScore" value="${detail.noTotScore }" readonly onlyNumber maxlength=2>점</td>
							</tr>
							<tr>
								<td>상담자소견(5점)</td>
								<td style="text-align: left; padding-left: 5px;">※총20점(설문 15점, 상담자소견 점) 중 10점이상인 경우 상담대상자로 선정함<br>※긴급상황으로 여겨질 수 있는 11번과 14번의 답이 "예:일 경우 상담대상자로 선정</td>
								<td><input type="text" class="wd30" id="cnsrOptnScore" name="cnsrOptnScore" value="${detail.cnsrOptnScore }" onlyNumber maxlength=2>점</td>
								<td><input type="text" class="wd30" id="cnsrOptnTot" name="cnsrOptnTot" value="${detail.cnsrOptnTot }" readonly onlyNumber maxlength=2>점</td>
							</tr>
						</tbody>
					</table>
				</div>
				</form>
			</div>
		</div>
	<script>
		$(".radBtn, .radBtn2").change(function(e) {
			var y = $(".radBtn:checked").length, n= $(".radBtn2:checked").length;
			$("#yesTotScore").val(y);
			$("#noTotScore").val(n);
			var yesTotal = $("#yesTotScore").val();
			var noTotal = $("#noTotScore").val();
			var total = parseInt(yesTotal)+parseInt(noTotal);
			if(total == 15) {
				//$("#cnsrOptnScore").val(0);
			}
			var cnsrOptnScore = $("#cnsrOptnScore").val();
			var total2 = parseInt(cnsrOptnScore)+parseInt(yesTotal);
			if(total == 15) {
				//$("#cnsrOptnTot").val(total2);
			}
		});
		
		$("#cnsrOptnScore").change(function(e) {
			var a = $("#cnsrOptnScore").val();
			var b = $("#yesTotScore").val();
			var tot = parseInt(a)+parseInt(b);
			$("#cnsrOptnTot").val(tot);
			
			var q11 = $("input[name=qust11Ansr]:checked").val();
			var q14 = $("input[name=qust14Ansr]:checked").val();

			if(tot >= 10 ) {
				alert("검사 결과 10점 이상이므로  상담대상자로 선정됐습니다.");
			} else if(q11 == "Y" || q14 == "Y"){
				alert("11번 또는 14번 항목을 체크하셨으므로  상담대상자로 선정됐습니다.");
				$("#cnsrOptnTot").val(10);
			} 
		});
	</script>

		<!-- end -->
	</section>
</html>

