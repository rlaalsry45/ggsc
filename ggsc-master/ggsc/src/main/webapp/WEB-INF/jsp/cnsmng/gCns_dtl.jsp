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
		alert("내담자ID을 입력해 주세요");
		$("#cnsleId").focus();
		return;
	}
	if(cnsleNm.length == 0) {
		alert("내담자명을 입력해 주세요");
		$("#cnsleNm").focus();
		return;
	} */
	if(centerGb.length == 0) {
		alert("센터구분을 입력해 주세요");
		$("#centerGb").focus();
		return;
	}
	
	if($("input:radio[name='olderRel']").is(":checked") == false) {
		alert("내담자와의관계를 체크해 주세요.");
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
		alert("상담종류를 체크해 주세요.");
		return;
	}
	
	
	if(confirm("수정 하시겠습니까?")){
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
	if(confirm("집단상담과 해당 참석자의 개인상담이 삭제됩니다. 삭제하시겠습니까?")) {
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
	var name = "회원 찾기";
	var option = "width = 530, height = 750, top = 50, left = 250, location = yes";
	window.open(url, name, option);encodeURI(encodeURIComponent(jindan_name));
} */

function findUserPopup(){
	var userNm = $("#cnsleNm").val();
	userNm = encodeURI(encodeURIComponent(userNm));		
	var url = "/gnoincoundb/userSelPopup.do?userNm=" + userNm+"&cnsTargetGb=Y&cnsPerTargetGb=Y";
	var name = "회원 찾기";
	var option = "width = 620, height = 750, top = 50, left = 100, location = yes";
	window.open(url, name, option);encodeURI(encodeURIComponent(jindan_name));
}

</script>

<section id="content">

	<h2 class="h2-title"><i class="fa fa-check-square"></i>집단상담일지 상세</h2>
		<div class="box-style1 x-scroll-auto" >
			<div class="btn" style="float: right; margin: 0;">
				<button type="button" class="btn-basic" onClick="javascript:fn_list('${mnuCd }');" style="background-color: green;color:white;">목록</button>
				<button type="button" class="btn-basic" onClick="javascript:fn_update();" style="background-color: green;color:white;">수정</button>
				<c:if test="${authCd <= 1 }">
					<button type="button" id="dBtn" class="btn-basic" onClick="javascript:fn_delete();" style="background-color: green;color:white;">삭제</button>
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
						<th>내담자ID <span style="color: red;">*</span></th>
						<td colspan="2"><input type="text" class="wd200" id="cnsleId" name="cnsleId" readonly="readonly" value="${result.cnsleId }" /></td>
						<th>내담자명 <span style="color: red;">*</span></th>
						<td><input type="text" class="wd200" id="cnsleNm" name="cnsleNm" value="${result.cnsleNm }" readonly /><!-- <button type="button" class="btn-basic" style="padding: 2px 6px;" onclick="javascript:findUserPopup();">찾기</button> --></td>
					</tr> --%>
					<tr>
						<th>상담구분 <span style="color: red;">*</span></th>
						<td colspan="2">
							<select class="wd300" id="cnsGb" name="cnsGb">
								<c:forEach items="${cnsGbList }" var="rs">
									<option value="${rs.odr }">${rs.mclassNm }</option>
								</c:forEach>
							</select>
						</td>
						<%-- <th>권역구분 <span style="color: red;">*</span></th>
						<td>
							<select class="wd300" id="zoneGb" name="zoneGb">
								<c:forEach items="${zoneGbList }" var="rs">
									<option value="${rs.odr }">${rs.mclassNm }</option>
								</c:forEach>
							</select>
						</td> --%>
						<th>센터구분 <span style="color: red;">*</span></th>
						<td>
							<select class="wd300" id="centerGb" name="centerGb">
								<option value="">전체</option>
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
						<th>프로그램명</th>
						<td colspan="2">
							<input type="text" class="wd300" id="pgrmNm" name="pgrmNm" value="${result.pgrmNm }" />
							&nbsp;&nbsp;/&nbsp;&nbsp;<input type="text" class="wd50" id="cnsCnt" name="cnsCnt" value="${result.cnsCnt }" onlyNumber maxlength="2"/>회기 
						</td>
						<th>활동일시</th>
						<td>
							<span class="form"><input type="text" class="wd200" id="datepicker1" name="atvyDt" value="${result.atvyDt }" readonly /></span><br>
							(<input type="text" class="wd50" id="atvyStrtHour" name="atvyStrtHour" value="${result.atvyStrtHour }" maxlength="2" onlyNumber />시
							<input type="text" class="wd50" id="atvyStrtMin" name="atvyStrtMin" value="${result.atvyStrtMin }" maxlength="2" onlyNumber />분 ~
							<input type="text" class="wd50" id="atvyEndHour" name="atvyEndHour" value="${result.atvyEndHour }" maxlength="2" onlyNumber />시
							<input type="text" class="wd50" id="atvyEndMin" name="atvyEndMin" value="${result.atvyEndMin }" maxlength="2" onlyNumber />분)
							(총 <input type="text" class="wd50" id="atvyTotMin" name="atvyTotMin" value="${result.atvyTotMin }" maxlength="3" onlyNumber />분) 
						</td>
					</tr>
					<tr>
						<th>활동장소</th>
						<td colspan="2">
							 <input type="text" id="atvyPlace" name="atvyPlace" value="${result.atvyPlace }" style="width: 400px;"/>
						</td>
						<th>내담자와의관계 <span style="color: red;">*</span></th>
						<td>
							<input type="radio" id="olderRel1" name="olderRel" value="1" /><label for="olderRel1">노인본인</label><input type="radio" id="olderRel2" name="olderRel" value="2" /><label for="olderRel2">배우자</label>
							<input type="radio" id="olderRel3" name="olderRel" value="3" /><label for="olderRel3">자녀</label><input type="radio" id="olderRel4" name="olderRel" value="4" /><label for="olderRel4">친인척</label>
							<input type="radio" id="olderRel5" name="olderRel" value="5" /><label for="olderRel5">이웃</label><input type="radio" id="olderRel6" name="olderRel" value="6" /><label for="olderRel6">유관기관</label>
						</td>
					</tr>
					<tr>
						<th>리더구분</th>
						<td colspan="4">
							<select class="wd200" id="leaderGb" name="leaderGb">
								<c:forEach items="${leaderGbList }" var="rs">
									<option value="${rs.odr }">${rs.mclassNm }</option>
								</c:forEach>
							</select>
						</td>
					</tr>
					<tr>
						<th>진행자</th>
						<td colspan="2">
							 <input type="text" class="wd200" id="anchor" name="anchor" value="${result.anchor }" />
						</td>
						<th>작성자</th>
						<td>
							<input type="text" class="wd200" id="inputNm" name="inputNm" value="${result.inputNm }" readonly /> 
						</td>
					</tr>
					<tr>
						<th>참석자</th>
						<td colspan="2">
							<input type="text" class="wd200" id="atdeCnt" name="atdeCnt" value="${result.atdeCnt }" onlyNumber maxlength="3" />명 
						</td>
						<th>참석자명</th>
						<td>
							<%-- <input type="text" id="atdeNm" name="atdeNm" value="${result.atdeNm }" readonly style="width: 88%" /><button type="button" class="btn-basic" style="padding: 2px 6px;" onclick="javascript:findUserPopup();">찾기</button> --%>
							<textarea id="atdeNm" name="atdeNm" style="width: 89%;" readonly><c:out value="${result.atdeNm }"/></textarea><button type="button" class="btn-basic" style="padding: 2px 6px;" onclick="javascript:findUserPopup();">찾기</button>
						</td>
					</tr>
					<tr>
						<th>활동주제</th>
						<td colspan="2">
							<input type="text" id="atvyTitle" name="atvyTitle" value="${result.atvyTitle }" />
						</td>
						<th>상담종류 <span style="color: red;">*</span></th>
						<td>
							<input type="radio" id="cnsType1" name="cnsType" value="1" /><label for="cnsType1">사별애도</label>
							<input type="radio" id="cnsType2" name="cnsType" value="2" /><label for="cnsType2">죽음준비</label>
							<input type="radio" id="cnsType3" name="cnsType" value="3" /><label for="cnsType3">관계개선·의사소통</label>
							<input type="radio" id="cnsType4" name="cnsType" value="4" /><label for="cnsType4">심리·정서</label>
							<input type="radio" id="cnsType5" name="cnsType" value="5" /><label for="cnsType5">자아통합</label><br>
							<input type="radio" id="cnsType6" name="cnsType" value="6" /><label for="cnsType6">치매예방</label>
							<input type="radio" id="cnsType7" name="cnsType" value="7" /><label for="cnsType7">기타</label>
						</td>
					</tr>
					<tr>
						<th>활동목표</th>
						<td colspan="4">
							<textarea id="atvyGoal" name="atvyGoal">${result.atvyGoal }</textarea>
						</td>
					</tr>
					<tr>
						<th>프로그램내용</th>
						<td colspan="4">
							<textarea id="pgrmCntn" name="pgrmCntn">${result.pgrmCntn }</textarea>
						</td>
					</tr>
					<tr>
						<th>평가</th>
						<td colspan="4">
							<textarea id="evat" name="evat">${result.evat }</textarea>
						</td>
					</tr>
					<tr>
						<th>향후계획</th>
						<td colspan="4">
							<textarea id="afterPlan" name="afterPlan">${result.afterPlan }</textarea>
						</td>
					</tr>
					<tr>
						<th>비고</th>
						<td colspan="4">
							<textarea id="etc" name="etc">${result.etc }</textarea> 
						</td>
					</tr>
					<!-- <tr>
						<th>심리문제</th>
						<td colspan="4">
							<input type="checkbox" id="psycQust1" name="psycQust" value="1" /><label for="psycQust1">우울</label> 
							<input type="checkbox" id="psycQust2" name="psycQust" value="2" /><label for="psycQust2">불안</label> 
							<input type="checkbox" id="psycQust3" name="psycQust" value="3" /><label for="psycQust3">외로움</label> 
							<input type="checkbox" id="psycQust4" name="psycQust" value="4" /><label for="psycQust4">상실감</label> 
							<input type="checkbox" id="psycQust5" name="psycQust" value="5" /><label for="psycQust5">절망감</label> 
							<input type="checkbox" id="psycQust6" name="psycQust" value="6" /><label for="psycQust6">분노(화병)</label> 
							<input type="checkbox" id="psycQust7" name="psycQust" value="7" /><label for="psycQust7">기타</label> 
						</td>
					</tr>
					<tr>
						<th>대인관계문제</th>
						<td colspan="4">
							<input type="checkbox" id="perRelQuest1" name="perRelQust" value="1" /><label for="perRelQuest1">종교인교우</label> 
							<input type="checkbox" id="perRelQuest2" name="perRelQust" value="2" /><label for="perRelQuest2">친구/동료</label> 
							<input type="checkbox" id="perRelQuest3" name="perRelQust" value="3" /><label for="perRelQuest3">이웃</label> 
							<input type="checkbox" id="perRelQuest4" name="perRelQust" value="4" /><label for="perRelQuest4">사회복지사(요양보호사, 노인돌보미 등)</label> 
							<input type="checkbox" id="perRelQuest5" name="perRelQust" value="5" /><label for="perRelQuest5">기타</label> 
						</td>
					</tr>
					<tr>
						<th>중독</th>
						<td colspan="4">
							<input type="checkbox" id="psng1" name="psng" value="1" /><label for="psng1">알코올</label> 
							<input type="checkbox" id="psng2" name="psng" value="2" /><label for="psng2">도박</label> 
							<input type="checkbox" id="psng3" name="psng" value="3" /><label for="psng3">니코틴</label> 
							<input type="checkbox" id="psng4" name="psng" value="4" /><label for="psng4">향정신성약품</label> 
							<input type="checkbox" id="psng5" name="psng" value="5" /><label for="psng5">인터넷, 게임</label> 
							<input type="checkbox" id="psng6" name="psng" value="6" /><label for="psng6">기타</label>
						</td>
					</tr>
					<tr>
						<th>치매</th>
						<td colspan="4">
							<input type="checkbox" id="dmta1" name="dmta" value="1" /><label for="dmta1">치매염려</label> 
							<input type="checkbox" id="dmta2" name="dmta" value="2" /><label for="dmta2">치매증상</label> 
							<input type="checkbox" id="dmta3" name="dmta" value="3" /><label for="dmta3">치매증상의 급격한 악화</label> 
							<input type="checkbox" id="dmta4" name="dmta" value="4" /><label for="dmta4">기타</label>
						</td>
					</tr>
					<tr>
						<th>정신장애</th>
						<td colspan="4">
							<input type="checkbox" id="dsm1" name="dsm" value="1" /><label for="dsm1">기분장애(우울증 등)</label> 
							<input type="checkbox" id="dsm2" name="dsm" value="2" /><label for="dsm2">불안장애</label> 
							<input type="checkbox" id="dsm3" name="dsm" value="3" /><label for="dsm3">인격장애</label> 
							<input type="checkbox" id="dsm4" name="dsm" value="4" /><label for="dsm4">정신분열증</label> 
							<input type="checkbox" id="dsm5" name="dsm" value="5" /><label for="dsm5">기타 정신증적 증상</label> 
						</td>
					</tr>
					<tr>
						<th>건강문제</th>
						<td colspan="4">
							<input type="checkbox" id="helthQust1" name="helthQust" value="1" /><label for="helthQust1">건강염려</label> 
							<input type="checkbox" id="helthQust2" name="helthQust" value="2" /><label for="helthQust2">질환으로 인한 신체적 증상</label> 
							<input type="checkbox" id="helthQust3" name="helthQust" value="3" /><label for="helthQust3">전체적인 건강악화</label> 
							<input type="checkbox" id="helthQust4" name="helthQust" value="4" /><label for="helthQust4">중증질환</label> <br>
							<input type="checkbox" id="helthQust5" name="helthQust" value="5" /><label for="helthQust5">신체증상의 급격한 악화(입원, 수술 등)</label> 
							<input type="checkbox" id="helthQust6" name="helthQust" value="6" /><label for="helthQust6">시한부 및 장애진단</label>
						</td>
					</tr>
					<tr>
						<th>경제문제</th>
						<td colspan="4">
							<input type="checkbox" id="econoQust1" name="econoQust" value="1" /><label for="econoQust1">급격한 수입감소</label> 
							<input type="checkbox" id="econoQust2" name="econoQust" value="2" /><label for="econoQust2">저소득</label> 
							<input type="checkbox" id="econoQust3" name="econoQust" value="3" /><label for="econoQust3">경제지원 축소 및 탈락</label> 
							<input type="checkbox" id="econoQust4" name="econoQust" value="4" /><label for="econoQust4">부채증가</label> 
							<input type="checkbox" id="econoQust5" name="econoQust" value="5" /><label for="econoQust5">실직</label> <br>
							<input type="checkbox" id="econoQust6" name="econoQust" value="6" /><label for="econoQust6">자녀에게 경제적 지원</label> 
							<input type="checkbox" id="econoQust7" name="econoQust" value="7" /><label for="econoQust7">재산분할 갈등</label> 
							<input type="checkbox" id="econoQust8" name="econoQust" value="8" /><label for="econoQust8">사기(다단계, 보이스피싱 등)</label> 
						</td>
					</tr>
					<tr>
						<th>생활문제</th>
						<td colspan="4">
							<input type="checkbox" id="lifeQust1" name="lifeQust" value="1" /><label for="lifeQust1">거주지불안정(주택)</label>
							<input type="checkbox" id="lifeQust2" name="lifeQust" value="2" /><label for="lifeQust2">일상생활 문제(의식주, 생활환경 어려움)</label>
							<input type="checkbox" id="lifeQust3" name="lifeQust" value="3" /><label for="lifeQust3">외출어려움(병원등 동행필요)</label>
						</td>
					</tr>
					<tr>
						<th>성문제</th>
						<td colspan="4">
							<input type="checkbox" id="sungQust1" name="sungQust" value="1" /><label for="sungQust1">이성교재</label>
							<input type="checkbox" id="sungQust2" name="sungQust" value="2" /><label for="sungQust2">재혼</label>
							<input type="checkbox" id="sungQust3" name="sungQust" value="3" /><label for="sungQust3">성기능저하</label>
							<input type="checkbox" id="sungQust4" name="sungQust" value="4" /><label for="sungQust4">성병</label>
							<input type="checkbox" id="sungQust5" name="sungQust" value="5" /><label for="sungQust5">성폭력</label>
						</td>
					</tr>
					<tr>
						<th>부부문제</th>
						<td colspan="4">
							<input type="checkbox" id="coupleQust1" name="coupleQust" value="1" /><label for="coupleQust1">가정폭력</label>
							<input type="checkbox" id="coupleQust2" name="coupleQust" value="2" /><label for="coupleQust2">별거/이혼</label>
							<input type="checkbox" id="coupleQust3" name="coupleQust" value="3" /><label for="coupleQust3">사별의 어려움</label>
							<input type="checkbox" id="coupleQust4" name="coupleQust" value="4" /><label for="coupleQust4">성갈등</label>
							<input type="checkbox" id="coupleQust5" name="coupleQust" value="5" /><label for="coupleQust5">부부갈등</label>
							<input type="checkbox" id="coupleQust6" name="coupleQust" value="6" /><label for="coupleQust6">외도</label>
						</td>
					</tr>
					<tr>
						<th>가족문제</th>
						<td colspan="4">
							<input type="checkbox" id="familyQust1" name="familyQust" value="1" /><label for="familyQust1">가족노인학대</label>
							<input type="checkbox" id="familyQust2" name="familyQust" value="2" /><label for="familyQust2">부양기피</label>
							<input type="checkbox" id="familyQust3" name="familyQust" value="3" /><label for="familyQust3">자녀와갈등</label>
							<input type="checkbox" id="familyQust4" name="familyQust" value="4" /><label for="familyQust4">시부모와갈등</label>
							<input type="checkbox" id="familyQust5" name="familyQust" value="5" /><label for="familyQust5">며느리 사위와 갈등</label>
							<input type="checkbox" id="familyQust6" name="familyQust" value="6" /><label for="familyQust6">자녀문제(자녀의 이혼, 실직문제)</label>
							<input type="checkbox" id="familyQust7" name="familyQust" value="7" /><label for="familyQust7">손자녀양육및손자녀와 갈등</label>
							<input type="checkbox" id="familyQust8" name="familyQust" value="8" /><label for="familyQust8">기타</label>
						</td>
					</tr>
					<tr>
						<th>학대</th>
						<td colspan="4">
							<input type="checkbox" id="partQust1" name="partQust" value="1" /><label for="partQust1">은퇴</label>
							<input type="checkbox" id="partQust2" name="partQust" value="2" /><label for="partQust2">사회적소외</label>
							<input type="checkbox" id="partQust3" name="partQust" value="3" /><label for="partQust3">노인차별</label>
						</td>
					</tr>
					<tr>
						<th>기타</th>
						<td colspan="4">
							<input type="checkbox" id="etcQust1" name="etcQust" value="1" /><label for="etcQust1">노인범죄</label>
							<input type="checkbox" id="etcQust2" name="etcQust" value="2" /><label for="etcQust2">가족외 노인학대</label>
							<input type="checkbox" id="etcQust3" name="etcQust" value="3" /><label for="etcQust3">독거노인전수조사</label>
							<input type="checkbox" id="etcQust4" name="etcQust" value="4" /><label for="etcQust4">기타</label>
						</td>
					</tr> -->
				</table>
			</form>
		</div>
		<!-- end -->
	</section>
</html>

