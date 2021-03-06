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
	
	var cnsGb = "${result.cnsGb}";
	if(cnsGb != ""){
		$("#cnsGb").val(cnsGb).prop("selected", true);
	}
	var zoneGb = "${result.zoneGb}";
	if(zoneGb != ""){
		$("#zoneGb").val(zoneGb).prop("selected", true);
	}
	var centerGb = "${result.centerGb}";
	if(centerGb != ""){
		$("#centerGb").val(centerGb).prop("selected", true);
	}
	$('input:radio[name=cnsType]:input[value="${result.cnsType}"]').attr("checked", true);
	$('input:radio[name=olderRel]:input[value="${result.olderRel}"]').attr("checked", true);
	
	var leaderGb = "${result.leaderGb}";
	if(leaderGb != ""){
		$("#leaderGb").val(leaderGb).prop("selected", true);
	}
	
	var str;
	var name;
	
	str = "${result.psycQust}";
	name = "psycQust";
	fn_checked(str, name);
	
	str = "${result.perRelQust}";
	name = "perRelQust";
	fn_checked(str, name);
	
	str = "${result.psng}";
	name = "psng";
	fn_checked(str, name);
	
	str = "${result.dmta}";
	name = "dmta";
	fn_checked(str, name);
	
	str = "${result.dsm}";
	name = "dsm";
	fn_checked(str, name);
	
	str = "${result.helthQust}";
	name = "helthQust";
	fn_checked(str, name);
	
	str = "${result.econoQust}";
	name = "econoQust";
	fn_checked(str, name);
	
	str = "${result.sungQust}";
	name = "sungQust";
	fn_checked(str, name);
	
	str = "${result.lifeQust}";
	name = "lifeQust";
	fn_checked(str, name);
	
	str = "${result.coupleQust}";
	name = "coupleQust";
	fn_checked(str, name);
	
	str = "${result.familyQust}";
	name = "familyQust";
	fn_checked(str, name);
	
	str = "${result.partQust}";
	name = "partQust";
	fn_checked(str, name);
	
	str = "${result.etcQust}";
	name = "etcQust";
	fn_checked(str, name);
	
	str = "${result.cnsType}";
	name = "cnsType";
	fn_checked(str, name);
	
});
	
	
function fn_checked(str, name){
	var arr = str.split(",");
	for(var i in arr){
		$("input[name=" + name + "][value=" + arr[i] + "]").prop("checked", true);
	}
}

function fn_update(){

	var cnsleId = $("#cnsleId").val();
	var cnsleNm = $("#cnsleNm").val();
	var centerGb = $("#centerGb").val();
	var atvyStrtHour = $("#atvyStrtHour").val();
	var atvyStrtMin = $("#atvyStrtMin").val();
	var atvyEndHour = $("#atvyEndHour").val();
	var atvyEndMin = $("#atvyEndMin").val();
	var atvyTotMin = $("#atvyTotMin").val();
	var atdeCnt = $("#atdeCnt").val();
	var cnsCnt = $("#cnsCnt").val();
	var atdeNm = $("#atdeNm").val();
	var oriAtdeNm = "${result.atdeNm }";
	/* if(cnsleId.length == 0) {
		alert("?????????ID??? ????????? ?????????");
		$("#cnsleId").focus();
		return;
	}
	if(cnsleNm.length == 0) {
		alert("??????????????? ????????? ?????????");
		$("#cnsleNm").focus();
		return;
	} */
	if(centerGb.length == 0) {
		alert("??????????????? ????????? ?????????");
		$("#centerGb").focus();
		return;
	}
	
	if($("input:radio[name='olderRel']").is(":checked") == false) {
		alert("???????????????????????? ????????? ?????????.");
		return;
	}
	
	if(atvyStrtHour.length == 0) {
		$("#atvyStrtHour").val(0);
	}
	if(atvyStrtMin.length == 0) {
		$("#atvyStrtMin").val(0);
	}
	if(atvyEndHour.length == 0) {
		$("#atvyEndHour").val(0);
	}
	if(atvyEndMin.length == 0) {
		$("#atvyEndMin").val(0);
	}
	if(atvyTotMin.length == 0) {
		$("#atvyTotMin").val(0);
	}
	if(atdeCnt.length == 0) {
		$("#atdeCnt").val(0);
	}
	if(cnsCnt.length == 0) {
		$("#cnsCnt").val(0);
	}
	
	if($("input:radio[name='cnsType']").is(":checked") == false) {
		alert("??????????????? ????????? ?????????.");
		return;
	}
	
	
	if(confirm("?????? ???????????????????")){
		if(atdeNm == oriAtdeNm) {
			$("#clearYn").val("N");
		} else {
			$("#clearYn").val("Y");
		}
		document.frm.action = "/gnoincoundb/gCnsUpd.do?mnuCd=${mnuCd}";
	   	document.frm.submit();
	}
}

function fn_delete() {
	if(confirm("??????????????? ?????? ???????????? ??????????????? ???????????????. ?????????????????????????")) {
		document.frm.action = "/gnoincoundb/gCnsDel.do?mnuCd=${mnuCd}";
		document.frm.submit();
	}
}

function fn_list(mnuCd){
	document.location.href = "/gnoincoundb/gCnsList.do?mnuCd=" + mnuCd;
}

/* function findUserPopup(){
	var userNm = $("#cnsleNm").val();
	userNm = encodeURI(encodeURIComponent(userNm));		
	var url = "/gnoincoundb/findUserPopup.do?userNm=" + userNm+"&cnsTargetGb=Y";
	var name = "?????? ??????";
	var option = "width = 530, height = 750, top = 50, left = 250, location = yes";
	window.open(url, name, option);encodeURI(encodeURIComponent(jindan_name));
} */

function findUserPopup(){
	var userNm = $("#cnsleNm").val();
	userNm = encodeURI(encodeURIComponent(userNm));		
	var url = "/gnoincoundb/userSelPopup.do?userNm=" + userNm+"&cnsTargetGb=Y&cnsPerTargetGb=Y";
	var name = "?????? ??????";
	var option = "width = 620, height = 750, top = 50, left = 100, location = yes";
	window.open(url, name, option);encodeURI(encodeURIComponent(jindan_name));
}

</script>

<section id="content">

	<h2 class="h2-title"><i class="fa fa-check-square"></i>?????????????????? ??????</h2>
		<div class="box-style1 x-scroll-auto" >
			<div class="btn" style="float: right; margin: 0;">
				<button type="button" class="btn-basic" onClick="javascript:fn_list('${mnuCd }');" style="background-color: green;color:white;">??????</button>
				<button type="button" class="btn-basic" onClick="javascript:fn_update();" style="background-color: green;color:white;">??????</button>
				<c:if test="${authCd <= 1 }">
					<button type="button" id="dBtn" class="btn-basic" onClick="javascript:fn_delete();" style="background-color: green;color:white;">??????</button>
				</c:if>
			</div>	
			<form id="frm" name="frm" method="post">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				<input type="hidden" id="caseNo" name="caseNo" value="${result.caseNo }" />
				<input type="hidden" id="num" name="num" value="${result.num }" />
				<input type="hidden" id="atdeId" name="atdeId" value="${result.atdeId }" />
				<input type="hidden" id="clearYn" name="clearYn" />
				<input type="hidden" id="oriAtdeId" name="oriAtdeId" value="${result.atdeId }" />
				<input type="hidden" id="oriAtdeNm" name="oriAtdeNm" value="${result.atdeNm }" />
				<table class="table-write">
					<colgroup>
						<col width="15%"></col>
						<col width="10%"></col> 
						<col width="25%"></col>
						<col width="15%"></col>
						<col width="35%"></col>
					</colgroup>
					<%-- <tr>
						<th>?????????ID <span style="color: red;">*</span></th>
						<td colspan="2"><input type="text" class="wd200" id="cnsleId" name="cnsleId" readonly="readonly" value="${result.cnsleId }" /></td>
						<th>???????????? <span style="color: red;">*</span></th>
						<td><input type="text" class="wd200" id="cnsleNm" name="cnsleNm" value="${result.cnsleNm }" readonly /><!-- <button type="button" class="btn-basic" style="padding: 2px 6px;" onclick="javascript:findUserPopup();">??????</button> --></td>
					</tr> --%>
					<tr>
						<th>???????????? <span style="color: red;">*</span></th>
						<td colspan="2">
							<select class="wd300" id="cnsGb" name="cnsGb">
								<c:forEach items="${cnsGbList }" var="rs">
									<option value="${rs.odr }">${rs.mclassNm }</option>
								</c:forEach>
							</select>
						</td>
						<%-- <th>???????????? <span style="color: red;">*</span></th>
						<td>
							<select class="wd300" id="zoneGb" name="zoneGb">
								<c:forEach items="${zoneGbList }" var="rs">
									<option value="${rs.odr }">${rs.mclassNm }</option>
								</c:forEach>
							</select>
						</td> --%>
						<th>???????????? <span style="color: red;">*</span></th>
						<td>
							<select class="wd300" id="centerGb" name="centerGb">
								<option value="">??????</option>
								<%-- <c:forEach items="${cnsCenterList }" var="list">
									<option value="${list.num }" <c:if test="${ list.num eq vo.schCenterGb }">selected</c:if> >${list.centerGb }</option>
								</c:forEach> --%>
								<c:forEach items="${cnsCenterList }" var="result">
									<c:choose>
									<c:when test="${authCd > 1 }">
										<c:if test="${ result.num eq vo.schCenterGb }" >
											<option value="${result.num }" >${result.centerGb }</option>
										</c:if>
									</c:when>
									<c:when test="${authCd <= 1 }">								
										<option value="${result.num }" >${result.centerGb }</option>
									</c:when>
									</c:choose>
								</c:forEach>
							</select>
						</td>
					</tr>
					<tr>
						<th>???????????????</th>
						<td colspan="2">
							<input type="text" class="wd300" id="pgrmNm" name="pgrmNm" value="${result.pgrmNm }" />
							&nbsp;&nbsp;/&nbsp;&nbsp;<input type="text" class="wd50" id="cnsCnt" name="cnsCnt" value="${result.cnsCnt }" onlyNumber maxlength="2"/>?????? 
						</td>
						<th>????????????</th>
						<td>
							<span class="form"><input type="text" class="wd200" id="datepicker1" name="atvyDt" value="${result.atvyDt }" readonly /></span><br>
							(<input type="text" class="wd50" id="atvyStrtHour" name="atvyStrtHour" value="${result.atvyStrtHour }" maxlength="2" onlyNumber />???
							<input type="text" class="wd50" id="atvyStrtMin" name="atvyStrtMin" value="${result.atvyStrtMin }" maxlength="2" onlyNumber />??? ~
							<input type="text" class="wd50" id="atvyEndHour" name="atvyEndHour" value="${result.atvyEndHour }" maxlength="2" onlyNumber />???
							<input type="text" class="wd50" id="atvyEndMin" name="atvyEndMin" value="${result.atvyEndMin }" maxlength="2" onlyNumber />???)
							(??? <input type="text" class="wd50" id="atvyTotMin" name="atvyTotMin" value="${result.atvyTotMin }" maxlength="3" onlyNumber />???) 
						</td>
					</tr>
					<tr>
						<th>????????????</th>
						<td colspan="2">
							 <input type="text" id="atvyPlace" name="atvyPlace" value="${result.atvyPlace }" style="width: 400px;"/>
						</td>
						<th>????????????????????? <span style="color: red;">*</span></th>
						<td>
							<input type="radio" id="olderRel1" name="olderRel" value="1" /><label for="olderRel1">????????????</label><input type="radio" id="olderRel2" name="olderRel" value="2" /><label for="olderRel2">?????????</label>
							<input type="radio" id="olderRel3" name="olderRel" value="3" /><label for="olderRel3">??????</label><input type="radio" id="olderRel4" name="olderRel" value="4" /><label for="olderRel4">?????????</label>
							<input type="radio" id="olderRel5" name="olderRel" value="5" /><label for="olderRel5">??????</label><input type="radio" id="olderRel6" name="olderRel" value="6" /><label for="olderRel6">????????????</label>
						</td>
					</tr>
					<tr>
						<th>????????????</th>
						<td colspan="4">
							<select class="wd200" id="leaderGb" name="leaderGb">
								<c:forEach items="${leaderGbList }" var="rs">
									<option value="${rs.odr }">${rs.mclassNm }</option>
								</c:forEach>
							</select>
						</td>
					</tr>
					<tr>
						<th>?????????</th>
						<td colspan="2">
							 <input type="text" class="wd200" id="anchor" name="anchor" value="${result.anchor }" />
						</td>
						<th>?????????</th>
						<td>
							<input type="text" class="wd200" id="inputNm" name="inputNm" value="${result.inputNm }" readonly /> 
						</td>
					</tr>
					<tr>
						<th>?????????</th>
						<td colspan="2">
							<input type="text" class="wd200" id="atdeCnt" name="atdeCnt" value="${result.atdeCnt }" onlyNumber maxlength="3" />??? 
						</td>
						<th>????????????</th>
						<td>
							<%-- <input type="text" id="atdeNm" name="atdeNm" value="${result.atdeNm }" readonly style="width: 88%" /><button type="button" class="btn-basic" style="padding: 2px 6px;" onclick="javascript:findUserPopup();">??????</button> --%>
							<textarea id="atdeNm" name="atdeNm" style="width: 89%;" readonly><c:out value="${result.atdeNm }"/></textarea><button type="button" class="btn-basic" style="padding: 2px 6px;" onclick="javascript:findUserPopup();">??????</button>
						</td>
					</tr>
					<tr>
						<th>????????????</th>
						<td colspan="2">
							<input type="text" id="atvyTitle" name="atvyTitle" value="${result.atvyTitle }" />
						</td>
						<th>???????????? <span style="color: red;">*</span></th>
						<td>
							<input type="radio" id="cnsType1" name="cnsType" value="1" /><label for="cnsType1">????????????</label>
							<input type="radio" id="cnsType2" name="cnsType" value="2" /><label for="cnsType2">????????????</label>
							<input type="radio" id="cnsType3" name="cnsType" value="3" /><label for="cnsType3">??????????????????????????</label>
							<input type="radio" id="cnsType4" name="cnsType" value="4" /><label for="cnsType4">??????????????</label>
							<input type="radio" id="cnsType5" name="cnsType" value="5" /><label for="cnsType5">????????????</label><br>
							<input type="radio" id="cnsType6" name="cnsType" value="6" /><label for="cnsType6">????????????</label>
							<input type="radio" id="cnsType7" name="cnsType" value="7" /><label for="cnsType7">??????</label>
						</td>
					</tr>
					<tr>
						<th>????????????</th>
						<td colspan="4">
							<textarea id="atvyGoal" name="atvyGoal">${result.atvyGoal }</textarea>
						</td>
					</tr>
					<tr>
						<th>??????????????????</th>
						<td colspan="4">
							<textarea id="pgrmCntn" name="pgrmCntn">${result.pgrmCntn }</textarea>
						</td>
					</tr>
					<tr>
						<th>??????</th>
						<td colspan="4">
							<textarea id="evat" name="evat">${result.evat }</textarea>
						</td>
					</tr>
					<tr>
						<th>????????????</th>
						<td colspan="4">
							<textarea id="afterPlan" name="afterPlan">${result.afterPlan }</textarea>
						</td>
					</tr>
					<tr>
						<th>??????</th>
						<td colspan="4">
							<textarea id="etc" name="etc">${result.etc }</textarea> 
						</td>
					</tr>
					<!-- <tr>
						<th>????????????</th>
						<td colspan="4">
							<input type="checkbox" id="psycQust1" name="psycQust" value="1" /><label for="psycQust1">??????</label> 
							<input type="checkbox" id="psycQust2" name="psycQust" value="2" /><label for="psycQust2">??????</label> 
							<input type="checkbox" id="psycQust3" name="psycQust" value="3" /><label for="psycQust3">?????????</label> 
							<input type="checkbox" id="psycQust4" name="psycQust" value="4" /><label for="psycQust4">?????????</label> 
							<input type="checkbox" id="psycQust5" name="psycQust" value="5" /><label for="psycQust5">?????????</label> 
							<input type="checkbox" id="psycQust6" name="psycQust" value="6" /><label for="psycQust6">??????(??????)</label> 
							<input type="checkbox" id="psycQust7" name="psycQust" value="7" /><label for="psycQust7">??????</label> 
						</td>
					</tr>
					<tr>
						<th>??????????????????</th>
						<td colspan="4">
							<input type="checkbox" id="perRelQuest1" name="perRelQust" value="1" /><label for="perRelQuest1">???????????????</label> 
							<input type="checkbox" id="perRelQuest2" name="perRelQust" value="2" /><label for="perRelQuest2">??????/??????</label> 
							<input type="checkbox" id="perRelQuest3" name="perRelQust" value="3" /><label for="perRelQuest3">??????</label> 
							<input type="checkbox" id="perRelQuest4" name="perRelQust" value="4" /><label for="perRelQuest4">???????????????(???????????????, ??????????????? ???)</label> 
							<input type="checkbox" id="perRelQuest5" name="perRelQust" value="5" /><label for="perRelQuest5">??????</label> 
						</td>
					</tr>
					<tr>
						<th>??????</th>
						<td colspan="4">
							<input type="checkbox" id="psng1" name="psng" value="1" /><label for="psng1">?????????</label> 
							<input type="checkbox" id="psng2" name="psng" value="2" /><label for="psng2">??????</label> 
							<input type="checkbox" id="psng3" name="psng" value="3" /><label for="psng3">?????????</label> 
							<input type="checkbox" id="psng4" name="psng" value="4" /><label for="psng4">??????????????????</label> 
							<input type="checkbox" id="psng5" name="psng" value="5" /><label for="psng5">?????????, ??????</label> 
							<input type="checkbox" id="psng6" name="psng" value="6" /><label for="psng6">??????</label>
						</td>
					</tr>
					<tr>
						<th>??????</th>
						<td colspan="4">
							<input type="checkbox" id="dmta1" name="dmta" value="1" /><label for="dmta1">????????????</label> 
							<input type="checkbox" id="dmta2" name="dmta" value="2" /><label for="dmta2">????????????</label> 
							<input type="checkbox" id="dmta3" name="dmta" value="3" /><label for="dmta3">??????????????? ????????? ??????</label> 
							<input type="checkbox" id="dmta4" name="dmta" value="4" /><label for="dmta4">??????</label>
						</td>
					</tr>
					<tr>
						<th>????????????</th>
						<td colspan="4">
							<input type="checkbox" id="dsm1" name="dsm" value="1" /><label for="dsm1">????????????(????????? ???)</label> 
							<input type="checkbox" id="dsm2" name="dsm" value="2" /><label for="dsm2">????????????</label> 
							<input type="checkbox" id="dsm3" name="dsm" value="3" /><label for="dsm3">????????????</label> 
							<input type="checkbox" id="dsm4" name="dsm" value="4" /><label for="dsm4">???????????????</label> 
							<input type="checkbox" id="dsm5" name="dsm" value="5" /><label for="dsm5">?????? ???????????? ??????</label> 
						</td>
					</tr>
					<tr>
						<th>????????????</th>
						<td colspan="4">
							<input type="checkbox" id="helthQust1" name="helthQust" value="1" /><label for="helthQust1">????????????</label> 
							<input type="checkbox" id="helthQust2" name="helthQust" value="2" /><label for="helthQust2">???????????? ?????? ????????? ??????</label> 
							<input type="checkbox" id="helthQust3" name="helthQust" value="3" /><label for="helthQust3">???????????? ????????????</label> 
							<input type="checkbox" id="helthQust4" name="helthQust" value="4" /><label for="helthQust4">????????????</label> <br>
							<input type="checkbox" id="helthQust5" name="helthQust" value="5" /><label for="helthQust5">??????????????? ????????? ??????(??????, ?????? ???)</label> 
							<input type="checkbox" id="helthQust6" name="helthQust" value="6" /><label for="helthQust6">????????? ??? ????????????</label>
						</td>
					</tr>
					<tr>
						<th>????????????</th>
						<td colspan="4">
							<input type="checkbox" id="econoQust1" name="econoQust" value="1" /><label for="econoQust1">????????? ????????????</label> 
							<input type="checkbox" id="econoQust2" name="econoQust" value="2" /><label for="econoQust2">?????????</label> 
							<input type="checkbox" id="econoQust3" name="econoQust" value="3" /><label for="econoQust3">???????????? ?????? ??? ??????</label> 
							<input type="checkbox" id="econoQust4" name="econoQust" value="4" /><label for="econoQust4">????????????</label> 
							<input type="checkbox" id="econoQust5" name="econoQust" value="5" /><label for="econoQust5">??????</label> <br>
							<input type="checkbox" id="econoQust6" name="econoQust" value="6" /><label for="econoQust6">???????????? ????????? ??????</label> 
							<input type="checkbox" id="econoQust7" name="econoQust" value="7" /><label for="econoQust7">???????????? ??????</label> 
							<input type="checkbox" id="econoQust8" name="econoQust" value="8" /><label for="econoQust8">??????(?????????, ??????????????? ???)</label> 
						</td>
					</tr>
					<tr>
						<th>????????????</th>
						<td colspan="4">
							<input type="checkbox" id="lifeQust1" name="lifeQust" value="1" /><label for="lifeQust1">??????????????????(??????)</label>
							<input type="checkbox" id="lifeQust2" name="lifeQust" value="2" /><label for="lifeQust2">???????????? ??????(?????????, ???????????? ?????????)</label>
							<input type="checkbox" id="lifeQust3" name="lifeQust" value="3" /><label for="lifeQust3">???????????????(????????? ????????????)</label>
						</td>
					</tr>
					<tr>
						<th>?????????</th>
						<td colspan="4">
							<input type="checkbox" id="sungQust1" name="sungQust" value="1" /><label for="sungQust1">????????????</label>
							<input type="checkbox" id="sungQust2" name="sungQust" value="2" /><label for="sungQust2">??????</label>
							<input type="checkbox" id="sungQust3" name="sungQust" value="3" /><label for="sungQust3">???????????????</label>
							<input type="checkbox" id="sungQust4" name="sungQust" value="4" /><label for="sungQust4">??????</label>
							<input type="checkbox" id="sungQust5" name="sungQust" value="5" /><label for="sungQust5">?????????</label>
						</td>
					</tr>
					<tr>
						<th>????????????</th>
						<td colspan="4">
							<input type="checkbox" id="coupleQust1" name="coupleQust" value="1" /><label for="coupleQust1">????????????</label>
							<input type="checkbox" id="coupleQust2" name="coupleQust" value="2" /><label for="coupleQust2">??????/??????</label>
							<input type="checkbox" id="coupleQust3" name="coupleQust" value="3" /><label for="coupleQust3">????????? ?????????</label>
							<input type="checkbox" id="coupleQust4" name="coupleQust" value="4" /><label for="coupleQust4">?????????</label>
							<input type="checkbox" id="coupleQust5" name="coupleQust" value="5" /><label for="coupleQust5">????????????</label>
							<input type="checkbox" id="coupleQust6" name="coupleQust" value="6" /><label for="coupleQust6">??????</label>
						</td>
					</tr>
					<tr>
						<th>????????????</th>
						<td colspan="4">
							<input type="checkbox" id="familyQust1" name="familyQust" value="1" /><label for="familyQust1">??????????????????</label>
							<input type="checkbox" id="familyQust2" name="familyQust" value="2" /><label for="familyQust2">????????????</label>
							<input type="checkbox" id="familyQust3" name="familyQust" value="3" /><label for="familyQust3">???????????????</label>
							<input type="checkbox" id="familyQust4" name="familyQust" value="4" /><label for="familyQust4">??????????????????</label>
							<input type="checkbox" id="familyQust5" name="familyQust" value="5" /><label for="familyQust5">????????? ????????? ??????</label>
							<input type="checkbox" id="familyQust6" name="familyQust" value="6" /><label for="familyQust6">????????????(????????? ??????, ????????????)</label>
							<input type="checkbox" id="familyQust7" name="familyQust" value="7" /><label for="familyQust7">?????????????????????????????? ??????</label>
							<input type="checkbox" id="familyQust8" name="familyQust" value="8" /><label for="familyQust8">??????</label>
						</td>
					</tr>
					<tr>
						<th>??????</th>
						<td colspan="4">
							<input type="checkbox" id="partQust1" name="partQust" value="1" /><label for="partQust1">??????</label>
							<input type="checkbox" id="partQust2" name="partQust" value="2" /><label for="partQust2">???????????????</label>
							<input type="checkbox" id="partQust3" name="partQust" value="3" /><label for="partQust3">????????????</label>
						</td>
					</tr>
					<tr>
						<th>??????</th>
						<td colspan="4">
							<input type="checkbox" id="etcQust1" name="etcQust" value="1" /><label for="etcQust1">????????????</label>
							<input type="checkbox" id="etcQust2" name="etcQust" value="2" /><label for="etcQust2">????????? ????????????</label>
							<input type="checkbox" id="etcQust3" name="etcQust" value="3" /><label for="etcQust3">????????????????????????</label>
							<input type="checkbox" id="etcQust4" name="etcQust" value="4" /><label for="etcQust4">??????</label>
						</td>
					</tr> -->
				</table>
			</form>
		</div>
		<!-- end -->
	</section>
</html>

