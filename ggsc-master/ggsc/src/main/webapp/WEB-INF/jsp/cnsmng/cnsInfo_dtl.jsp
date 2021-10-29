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
<script type="text/javascript">

	$(document).ready(function() {
		if("${authCd}" > 1) {
			var centerGb = "${vo.schCenterGb}";
			$("select[name=centerGb]").val(centerGb);
			$("select[name=sigunGb]").val("${loginVo.sigunCd}");
			$("select[name=zoneGb]").val("${loginVo.zoneGb}");
		}
		
	});
	var idCheck;

	function fn_save(type){
		var url = "";
		
		// 공백제거
		$("#birthDt").val($("#birthDt").val().replace(/\D/g,""));
		var mobile = $("#mobile").val();
		
		var userId = $("#userId").val(); // 아이디
		var pw = $("#pw").val(); // 비밀번호
		var cnsCnt = $("#cnsCnt").val();
		var datepicker8 = $("#datepicker8").val(); 
		var cnsDtStdHour = $("#cnsDtStdHour").val(); 
		var cnsDtStdMin = $("#cnsDtStdMin").val(); 
		var cnsDtEndHour = $("#cnsDtEndHour").val();
		var cnsDtEndMin = $("#cnsDtEndMin").val();
		var cnsTimeTotMin = $("#cnsTimeTotMin").val();
		
		var centerGb = $("#centerGb").val();
		
		if(centerGb == "" || centerGb == null){
			alert("센터구분을 선택해주세요.");
			$("#centerGb").focus();
			return;
		}
	
		if(type == "R") {
			
			if(userId.length < 6) {
				alert("아이디를 6자 이상으로 입력해 주세요.");
				$("#userId").focus();
				return;
			}
			if(idCheck != "Y" && type == "R"){
				alert("ID 중복확인을 해주세요.");
				return;
			}
			var num = pw.search(/[0-9]/g);
			var eng = pw.search(/[a-z]/ig);
			var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
	
			if(pw.length < 8 || pw.length > 20){
				alert("8자리 ~ 20자리 이내로 입력해주세요.");
				$("#pw").focus();
				return false;
			} else if(pw.search(/\s/) != -1){
				alert("비밀번호는 공백 없이 입력해주세요.");
				$("#pw").focus();
				return false;
			} else if(num < 0 || eng < 0 || spe < 0){
			  alert("영문,숫자,특수문자를 혼합하여 입력해주세요.");
			  $("#pw").focus();
	  		  return false;
			}
		}
		
		if($("#userNm").val()==""){
			alert("이름을 입력해주세요.");
			$("#userNm").focus();
			return;
		}
		
		if($('input:radio[name="gender"]').is(':checked')==false){
			alert("성별을 선택해주세요.");
			return;
		}
		
		if($("#birthDt").val()==""){
			alert("생년월일을 입력해주세요.");
			$("#birthDt").focus();
			return;
		}
		
		if($("#birthDt").val().length != 8){
			alert("생년월일을 8자리로 적어주세요.");
			$("#birthDt").focus();
			return;
		}
		
		if(mobile == ""){
			alert("핸드폰번호를 입력해주세요.");
			$("#mobile").focus();
			return;
		}
		
		if($("#cnsMethdList").val()==""){
			alert("상담방법을 선택해주세요.");
			$("#cnsMethdList").focus();
			return;
		}
		
		if($("#cnsDtl").val()==""){
			alert("상담경위를 선택해주세요.");
			$("#cnsDtl").focus();
			return;
		}
		
		if($('input:radio[name="majorApplCd"]').is(':checked')==false){
			alert("주호소문제를 선택해주세요.");
			return;
		}
		
		if(datepicker8.length == 0) {
			alert("상담일시를 입력해 주세요");
			$("#datepicker8").focus();
			return;
		}
		if(cnsDtStdHour.length == 0) {
			alert("상담일시 시간을 입력해 주세요");
			$("#cnsDtStdHour").focus();
			return;
		}
		if(cnsDtStdMin.length == 0) {
			alert("상담일시 시간을 입력해 주세요");
			$("#cnsDtStdMin").focus();
			return;
		}
		if(cnsDtEndHour.length == 0) {
			alert("상담일시 시간을 입력해 주세요");
			$("#cnsDtEndHour").focus();
			return;
		}
		if(cnsDtEndMin.length == 0) {
			alert("상담일시 시간을 입력해 주세요");
			$("#cnsDtEndMin").focus();
			return;
		}
		if(cnsTimeTotMin.length == 0) {
			alert("상담일시 총시간을 입력해 주세요");
			$("#cnsTimeTotMin").focus();
			return;
		}
		
		if(type == "R"){
			url = "/gnoincoundb/cnsInfoReg_ajax.do?mnuCd=${mnuCd}";
		}else if(type == "D"){
			url = "/gnoincoundb/cnsInfoUpd_ajax.do?mnuCd=${mnuCd}";
		}
		var param = $("#frm").serialize();
		var token = $("meta[name='_csrf']").attr("th:content");
		var header = $("meta[name='_csrf_header']").attr("th:content");
		
		$.ajax({
			type : "POST",
			url : url,
			data : param,
			dataType : "json",
			beforeSend : function(xhr){
				xhr.setRequestHeader(header, token);
			},
			success : function(json) {
				if(json.msg){
					alert(json.msg);
				}else{
					if(type == "R") {
						alert("정보제공상담접수가 완료 되었습니다.");
					} else if(type == "D") {
						alert("정보제공상담접수가 수정 되었습니다.");
					}
				}
				document.location.href = "/gnoincoundb/cnsInfoList.do?mnuCd=${mnuCd}";

			},
			error : function(e) {
				alert("서버와 통신 오류입니다.");
			}
		});
	}
	
	function fn_delete() {
		if(confirm("해당 회원의 정보처리상담과 회원이 삭제됩니다. 삭제하시겠습니까?")) {
			document.frm.action = "/gnoincoundb/cnsInfoDel.do?mnuCd=${mnuCd}";
	       	document.frm.submit();
		}
	}
	
	function fn_list(mnuCd){
		document.location.href = "/gnoincoundb/cnsInfoList.do?mnuCd=" + mnuCd;
	}
	
	function fn_idCheck() {
		var param = $("#userId").val();
		if(param.length == 0){
			alert("ID를 입력해주세요.");
			return false;
		}
		if(param.length <= 5){
			alert("ID를 6자 이상으로 입력해주세요.");
			return false;
		}
		var token = $("meta[name='_csrf']").attr("th:content");
		var header = $("meta[name='_csrf_header']").attr("th:content");
		
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
					$("#userId").attr("readOnly","false");		
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
	
</script>

<section id="content">

	<h2 class="h2-title"><i class="fa fa-check-square"></i>정보제공상담 작성</h2>
		<div class="box-style1 x-scroll-auto" >
			<div class="btn" style="float: right; margin: 0;">
				<button type="button" class="btn-basic" onClick="javascript:fn_list('${mnuCd }');" style="background-color: green;color:white;">목록</button>
				<c:if test="${result == null}">
					<button type="button" id="sBtn" class="btn-basic" onclick="javascript:fn_save('R');">저장</button>
				</c:if>
				<c:if test="${ result != null && (authCd <= 3 || ( authCd > 3 && userId == result.cnsrId )) }">
					<button type="button" id="uBtn" class="btn-basic" onclick="javascript:fn_save('D');">수정</button>
				</c:if>
				<c:if test="${authCd <= 1 }">
					<button type="button" id="dBtn" class="btn-basic" onClick="javascript:fn_delete();" style="background-color: green;color:white;">삭제</button>
				</c:if>
			</div>	
			<form id="frm" name="frm" method="post" enctype="multipart/form-data">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				<c:if test="${result != null}">
					<input type="hidden" name="userId" value="${result.userId }" />
					<input type="hidden" name="num" value="${result.num }" />
				</c:if>
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
					<th>상담구분<span style="color: red;">*</span></th>
					<td colspan="3">
						<select class="wd200" id="cnsGb" name="cnsGb">
							<c:forEach items="${cnsGbList }" var="list">
								<option value="${list.odr }" <c:if test="${list.odr == result.cnsGb }">selected</c:if> >${list.mclassNm }</option>
							</c:forEach>
						</select>
					</td>
					<th>권역구분 <span style="color: red;">*</span></th>
					<td colspan="3">
						<select class="wd200" id="zoneGb" name="zoneGb">
							<c:forEach items="${zoneGbList }" var="list">
								<c:choose>
									<c:when test="${authCd > 1 }">
										<c:if test="${ list.odr eq loginVo.zoneGb }" >
											<option value="${list.odr }">${list.mclassNm }</option>
										</c:if>
									</c:when>
									<c:when test="${authCd <= 1 }">								
										<option value="${list.odr }" <c:if test="${list.odr == result.zoneGb }">selected</c:if> >${list.mclassNm }</option>
									</c:when>
								</c:choose>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<th>센터구분 <span style="color: red;">*</span></th>
					<td colspan="3">
						<select class="wd200" id="centerGb" name="centerGb">
							<c:forEach items="${cnsCenterList }" var="list">
								<c:choose>
								<c:when test="${authCd > 1 }">
									<c:if test="${ list.num eq vo.schCenterGb }" >
										<option value="${list.num }" >${list.centerGb }</option>
									</c:if>
								</c:when>
								<c:when test="${authCd <= 1 }">								
									<option value="${list.num }" <c:if test="${list.num == result.centerGb }">selected</c:if> >${list.centerGb }</option>
								</c:when>
								</c:choose>
							</c:forEach>
						</select>
					</td>
					<th>시군구분 <span style="color: red;">*</span></th>
					<td colspan="3">
						<select class="wd200"id="sigunCd" name="sigunCd">
							<c:forEach items="${sigunList }" var="list">
								<c:choose>
									<c:when test="${authCd > 1 }">
										<c:if test="${ list.odr eq loginVo.sigunCd }" >
											<option value="${list.odr }">${list.mclassNm }</option>
										</c:if>
									</c:when>
									<c:when test="${authCd <= 1 }">								
										<option value="${list.odr }" <c:if test="${list.odr == result.sigunCd }">selected</c:if> >${list.mclassNm }</option>
									</c:when>
								</c:choose>
							</c:forEach>
						</select>
					</td>
				</tr>
				<c:if test="${result == null}">
					<tr>
						<th>아이디 <span style="color: red;">*</span></th>
						<td colspan="3"><input type="text" class="wd200" id="userId" name="userId" oninput="this.value = this.value.replace(/[^a-z0-9]/, '');" maxlength=20/>&emsp;<button type="button" class="btn-basic" onclick="javascript:fn_idCheck();">중복확인</button></td>
						<th>비밀번호 <span style="color: red;">*</span></th>
						<td colspan="3"><input type="password" class="wd200" id="pw" name="pw" oninput="this.value = this.value.replace(/[^a-z0-9~!@@#$%^&*]/, '');" maxlength=20/></td>
					</tr>
				</c:if>
				<tr>
					<th rowspan="3">인적사항</th>
					<th>이름 <span style="color: red;">*</span></th>
					<td colspan="2"><input type="text" class="wd200" id="userNm" name="userNm" value="${result.userNm }" oninput="this.value = this.value.replace(/[^a-zㄱ-힣]/, '');" maxlength=8/></td>
					<th>성별 <span style="color: red;">*</span></th>
					<td colspan="3">
						<input type="radio" id="male" name="gender" value="M" <c:if test="${result.gender == 'M' }">checked="checked"</c:if> /><label for="male">남 </label>
						<input type="radio" id="female" name="gender" value="F" <c:if test="${result.gender == 'F' }">checked="checked"</c:if> /><label for="female">여</label>
					</td>
				</tr>
				<tr>
					<th>생년월일 <span style="color: red;">*</span></th>
					<td colspan="2"><input type="text" class="wd200" id="birthDt" name="birthDt" value="${result.birthDt }" onlyNumber maxlength=8/></td>
					<th>핸드폰</th>
					<td colspan="3"><input type="text" class="wd200" id="mobile" name="mobile" value="${result.mobile }" onlyNumber maxlength=11 /></td>
				</tr>
				<tr>
					<th>주소</th>
					<td colspan="6"><input type="text" id="addr" name="addr" value="${result.addr }"/></td>
				</tr>
				<tr>
					<th rowspan="2">상담형태 </th>
					<th>상담방법 <span style="color: red;">*</span></th>
					<td colspan="6">
						<select class="wd200" id="cnsMethd" name="cnsMethd">
							<c:forEach items="${cnsMethdList }" var="list">
								<option value="${list.odr }" <c:if test="${list.odr == result.cnsMethd }">selected</c:if> >${list.mclassNm }</option>
							</c:forEach>
						</select> 
					</td>
				</tr>
				<tr>
					<th>상담경위 <span style="color: red;">*</span></th>
					<td colspan="6">
						<select class="wd200" id="cnsDtl" name="cnsDtl">
							<c:forEach items="${cnsDtlList }" var="list">
								<option value="${list.odr }" <c:if test="${list.odr == result.cnsDtl }">selected</c:if> >${list.mclassNm }</option>
							</c:forEach>
						</select> 
					</td>
				</tr>
				<tr>
					<th>주호소문제 <span style="color: red;">*</span></th>
					<td colspan="7">
						<c:forEach items="${mApplCdList}" var="list" varStatus="index">
							<input type="radio" id="majorApplCd${index.count}" name="majorApplCd" value="${list.odr}" <c:if test="${result.majorApplCd eq list.odr }">checked="checked"</c:if> /><label for="majorApplCd${index.count }">${list.mclassNm }</label>
						</c:forEach>
					</td>
				</tr>
				<tr>
					<th>상담일시 <span style="color: red;">*</span></th>
					<td colspan="7">
						<span class="form"><input type="text" class="wd200" id="datepicker8" name="cnsDt" value="${result.cnsDt }" readonly /></span>
						<select class="wd50 mg-l25" id="cnsDtWeekCd" name="cnsDtWeekCd">
							<option value="1" selected="selected">월</option>
							<option value="2">화</option>
							<option value="3">수</option>
							<option value="4">목</option>
							<option value="5">금</option>
							<option value="6">토</option>
							<option value="7">일</option>
						</select>
						(<input type="text" class="wd50" id="cnsDtStdHour" name="cnsDtStdHour" value="${result.cnsDtStdHour }" />시
						<input type="text" class="wd50" id="cnsDtStdMin" name="cnsDtStdMin" value="${result.cnsDtStdMin }" />분 ~
						<input type="text" class="wd50" id="cnsDtEndHour" name="cnsDtEndHour" value="${result.cnsDtEndHour }" />시
						<input type="text" class="wd50" id="cnsDtEndMin" name="cnsDtEndMin" value="${result.cnsDtEndMin }" />분)
						(총 <input type="text" class="wd50" id="cnsTimeTotMin" name="cnsTimeTotMin" value="${result.cnsTimeTotMin }" />분) 
					</td>
				</tr>
				<tr>	
					<th>상담내용</th>
					<td colspan="7">
						<textarea name="cnsCntn" style="height: 250px; width: 900px;">${result.cnsCntn }</textarea>
					</td>
				</tr>
				</table>
			</form>
		</div>
		<!-- end -->
	</section>

</html>

