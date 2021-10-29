<%@ page import="egovframework.rte.psl.dataaccess.util.EgovMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="_csrf" th:content="${_csrf.token}"/>
	<meta name="_csrf_header" th:content="${_csrf.headerName}"/>
    <meta http-equiv="content-language" content="ko">	
    <link rel="stylesheet" href="/gnoincoundb/css/jquery-accordion-menu.css">
	<link rel="stylesheet" href="/gnoincoundb/css/jquery-ui.css">
	<link rel="stylesheet" href="/gnoincoundb/css/style.css">
	<link rel="stylesheet" href="/gnoincoundb/css/common.css">
	<link rel="stylesheet" href="/gnoincoundb/css/font-awesome.min.css">
    <script src="/gnoincoundb/js/html2canvas.min.js" ></script>	
    <script src="/gnoincoundb/js/jspdf.min.js" ></script>
	<script src="/gnoincoundb/js/jquery/jquery-1.11.2.min.js"></script>
	<script src="/gnoincoundb/js/jquery/jquery.form.js"></script>
	<script src="/gnoincoundb/js/jquery/jquery-migrate-1.4.1.js"></script>
	<script src="/gnoincoundb/js/jquery/jquery-accordion-menu.js" type="text/javascript"></script>
	<script src="/gnoincoundb/js/jquery/jquery-ui.min.js" type="text/javascript"></script>
	<script src="/gnoincoundb/js/common.js"></script>
  </head>
<script type="text/javascript">


$(document).ready(function() {
	var cnsEndCd = "${cnsEndCd}";
	var cnsEndDt = "${cnsEndDt}";
	var cnsleId = "${cnsleId}";
	if(cnsEndCd != "") {
		$('input:radio[name=cnsEndResn]:input[value='+cnsEndCd+']').attr("checked", true);
	}
	if(cnsEndDt != "") {
		$("input[name=writeDt]").val(cnsEndDt);
	}
	
	
});

function fn_save(){
	
	var cnsGb = $("#cnsGb").val();
	if(cnsGb == "노인상담") {
		$("#cnsGbR").val("1");
	} else if(cnsGb == "중장년층상담") {
		$("#cnsGbR").val("2");
	} else if(cnsGb == '24시노인ON상담') {
		$("#cnsGbR").val("3");
	}
	
	var cnsleNm = $("#cnsleNm").val();
	var cnsDtS = $("input[name=cnsDtS]").val();
	var cnsDtE = $("input[name=cnsDtE]").val();
	var cnsCnt = $("input[name=cnsCnt]").val();
	
	
	if(cnsleNm.length == 0) {
		alert("내담자를 입력해주세요.");
		$("#cnsleNm").focus();
		return;
	}
	
	if(cnsDtS.length == 0) {
		alert("상담기간 시작일을 입력해주세요.");
		$("#cnsDtS").focus();
		return;
	}
	
	if(cnsDtE.length == 0) {
		alert("상담기간 종료일을 입력해주세요.");
		$("#cnsDtE").focus();
		return;
	}
	
	if($("input:radio[name='cnsEndMethd']").is(":checked") == false) {
		alert("종결방법을 체크해 주세요.");
		$("#cnsEndMethd").focus();
		return;
	}
	
	if(cnsCnt.length == 0) {
		alert("상담회기를 선택해주세요.");
		$("#cnsCnt").focus();
		return;
	}
	
	/* if($("input:radio[name='cnsStft']").is(":checked") == false) {
		alert("내담자 상담만족도를 체크해 주세요.");
		$("#cnsStft").focus();
		return;
	} */
	if($("input:radio[name='cnsEndResn']").is(":checked") == false) {
		alert("종결사유를 체크해 주세요.");
		$("#cnsEndResn").focus();
		return;
	}
	
	if(confirm("저장 하시겠습니까?")){
		document.frm.action = "/gnoincoundb/cnsEndReg.do?mnuCd=${mnuCd}";
	   	document.frm.submit();
	}
}

function findUserPopup(){
	var userNm = $("#cnsleNm").val();
	userNm = encodeURI(encodeURIComponent(userNm));		
	var url = "/gnoincoundb/findUserPopup.do?userNm=" + userNm+"&cnsTargetGb=Y&cnsPerTargetGb=Y";
	var name = "회원 찾기";
	var option = "width = 530, height = 750, top = 50, left = 100, location = yes";
	window.open(url, name, option);encodeURI(encodeURIComponent(jindan_name));
}

function fn_close(){
	window.close();
}
</script>
<section id="content">
	<h2 class="h2-title"><i class="fa fa-check-square"></i>상담사례 종결서</h2>
		<div class="btn" style="float: right; margin: 0;">
			<button type="button" class="btn-basic" onClick="javascript:fn_close();" style="background-color: green;color:white;">닫기</button>
			<button type="button" class="btn-basic" onClick="javascript:fn_save();" style="background-color: green;color:white;">저장</button>
		</div>	
		<div class="box-style1 x-scroll-auto" >
			<form id="frm" name="frm" method="post">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				<input type="hidden" id="cnsleId" name="cnsleId" />
				<input type="hidden" id="caseNo" name="caseNo" />
				<input type="hidden" id="cnsGb" />
				<input type="hidden" id="cnsGbR" name="cnsGb" />
				<input type="hidden" id="cnsEndCd" name="cnsEndCd" value="${cnsEndCd }" />
				<input type="hidden" id="cnsEndDt" name="cnsEndDt" value="${cnsEndDt }" />
				<table class="table-write">
					<colgroup>
						<col width="5%"></col>
						<col width="5%"></col> 
						<col width="40%"></col>
						<col width="10%"></col>
						<col width="40%"></col>
					</colgroup>
					<tr>
						<th colspan="2">상담사ID</th>
						<td>
							<!-- <input type="text" class="wd200" id="clientNm" name="clientNm" value="" /> -->
							<input type="text" class="wd200" id="cnsrId" name="cnsrId" value="${map.userId }" readonly />
						</td>
						<th>상담사</th>
						<td><input type="text" class="wd200" id="cnsrNm" name="cnsrNm" value="${map.userNm }" readonly /></td>
					</tr>
					<tr>
						<th colspan="2">내담자</th>
						<td>
							<input type="text" class="wd200" id="cnsleNm" name="cnsleNm" readonly />
							<button type="button" class="btn-basic" style="padding: 2px 6px;" onclick="javascript:findUserPopup();">찾기</button>
						</td>
						<th>생년월일</th>
						<td>
							<span class="form"><input type="text" class="wd200" id="birthDt" name="birthDt" readonly/></span>
						</td>
					</tr>
					<tr>
						<th rowspan="2"colspan="2">연락처</th>
						<td>
							Home. <input type="text" class="wd200" id="tel" name="tel" value="" onlyNumber />
						</td>
						<th rowspan="2">주소</th>
						<td rowspan="2">
							<input type="text" id="addr" name="addr" value="" readonly />
						</td>
					</tr>
					<tr>
						<td>
							 H . P &nbsp;&nbsp;&nbsp;<input type="text" class="wd200" id="mobile" name="mobile" value="" readonly />
						</td>
					</tr>
					<tr>
						<th colspan="2">상담기간</th>
						<td colspan="3">
							<span class="form"><input type="text" class="wd200" id="datepicker2" name="cnsDtS" readonly /></span>
							 &nbsp;&nbsp;&nbsp;&nbsp; ~ &nbsp; 
							 <span class="form"><input type="text" class="wd200" id="datepicker3" name="cnsDtE" readonly /></span>
						</td>
					</tr>
					<tr>
						<th colspan="2">종결방법</th>
						<td colspan="3">
							<input type="radio" id="cnsEndMethd1" name="cnsEndMethd" value="1" /><label for="cnsEndMethd1">면접</label>
							<input type="radio" id="cnsEndMethd2" name="cnsEndMethd" value="2" /><label for="cnsEndMethd2">전화</label>
							<input type="radio" id="cnsEndMethd3" name="cnsEndMethd" value="3" /><label for="cnsEndMethd3">기타</label> 
						</td>
					</tr>
					<tr>
						<th colspan="2">종결처리 하실 상담회기</th>
						<td colspan="3">
							<input type="text" class="wd200" id="cnsCnt" name="cnsCnt" value="" onlyNumber />
						</td>
					</tr>
					<tr>
						<th rowspan="2" colspan="2">내담자 상담만족도</th>
						<td colspan="3">
							<input type="radio" id="cnsStft1" name="cnsStft" value="1" /><label for="cnsStft1">1</label>
							<input type="radio" id="cnsStft2" name="cnsStft" value="2" /><label for="cnsStft2">2</label>
							<input type="radio" id="cnsStft3" name="cnsStft" value="3" /><label for="cnsStft3">3</label>
							<input type="radio" id="cnsStft4" name="cnsStft" value="4" /><label for="cnsStft4">4</label>
							<input type="radio" id="cnsStft5" name="cnsStft" value="5" /><label for="cnsStft5">5</label>
							<input type="radio" id="cnsStft6" name="cnsStft" value="6" /><label for="cnsStft6">6</label>
							<input type="radio" id="cnsStft7" name="cnsStft" value="7" /><label for="cnsStft7">7</label>
							<input type="radio" id="cnsStft8" name="cnsStft" value="8" /><label for="cnsStft8">8</label>
							<input type="radio" id="cnsStft9" name="cnsStft" value="9" /><label for="cnsStft9">9</label>
							<input type="radio" id="cnsStft10" name="cnsStft" value="10" /><label for="cnsStft10">10</label>
						</td>
					</tr>
					<tr>
						<td colspan="3">
							도움된 내용<br>
							<textarea id="helpCntn" name="helpCntn" maxlength="1000"></textarea>
						</td>
					</tr>
					<tr>
						<th colspan="2">종결사유</th> 
						<td colspan="3">
							 <input type="radio" id="cnsEndResn1" name="cnsEndResn" value="1" /><label for="cnsEndResn1">합의종결</label>
							 <input type="radio" id="cnsEndResn2" name="cnsEndResn" value="2" /><label for="cnsEndResn2">이사</label>
							 <input type="radio" id="cnsEndResn3" name="cnsEndResn" value="3" /><label for="cnsEndResn3">장기입원</label>
							 <input type="radio" id="cnsEndResn4" name="cnsEndResn" value="4" /><label for="cnsEndResn4">사망</label>
							 <input type="radio" id="cnsEndResn5" name="cnsEndResn" value="5" /><label for="cnsEndResn5">시설입소</label>
							 <input type="radio" id="cnsEndResn6" name="cnsEndResn" value="6" /><label for="cnsEndResn6">청력,언어장애</label>
							 <input type="radio" id="cnsEndResn7" name="cnsEndResn" value="7" /><label for="cnsEndResn7">치매 및 정신장애 등</label>
							 <input type="radio" id="cnsEndResn8" name="cnsEndResn" value="8" /><label for="cnsEndResn8">내담자의 일방적 종결(거부)</label>
							 <input type="radio" id="cnsEndResn9" name="cnsEndResn" value="9" /><label for="cnsEndResn9">연락두절</label>
							 <input type="radio" id="cnsEndResn10" name="cnsEndResn" value="10" /><label for="cnsEndResn10">자살</label>
							 <input type="radio" id="cnsEndResn11" name="cnsEndResn" value="11" /><label for="cnsEndResn11">자살시도</label>
							 <input type="radio" id="cnsEndResn12" name="cnsEndResn" value="12" /><label for="cnsEndResn12">타 기관연계</label>
							 <input type="radio" id="cnsEndResn13" name="cnsEndResn" value="13" /><label for="cnsEndResn13">기타</label>
						</td>
					</tr>
					<tr>
						<th rowspan="2">상담사의견</th>
						<th>상담사</th>
						<td colspan="3">
							<textarea id="cntn" name="cntn"></textarea>
						</td>
					</tr>
					<tr>
						<th>자원봉사자</th>
						<td colspan="3">
							<textarea id="vltrCntn" name="vltrCntn"></textarea>
						</td>
					</tr>
				</table>
				<div style='width: 100%;'>
		        <br/>
		        <div style='width: 100%; text-align: center; font-size: 20px;'>위 <span>상담을</span> 종결합니다.</div>
		       		<div style='text-align: right; font-size: 20px;'>
			       		<p style="margin: 15px;">작성일 : <span class="form"><input type="text" class="wd130" id="datepicker4" name="writeDt" readonly/></span></p>
			        	<p style="margin: 50px 68px;">상담사 : ${map.userNm } (인)</p>
		        	</div>
		        </div>  
			</form>
		</div>
		
		<!-- end -->
	</section>
</html>

