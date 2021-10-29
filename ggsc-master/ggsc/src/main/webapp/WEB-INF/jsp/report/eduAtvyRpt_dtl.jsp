<%@ page import="egovframework.rte.psl.dataaccess.util.EgovMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<script src="/gnoincoundb/js/html2canvas.min.js" ></script>
<script src="/gnoincoundb/js/jspdf.min.js" ></script>

<script type="text/javascript">
	$(document).ready(function() {
		/*
		var cnsGb = "${result.cnsGb}";
		var zoneGb = "${result.zoneGb}";
		var localGb = "${result.localGb}";
		var centerGb = "${result.centerGb}";		
		var str;
		var name;
		
		if(cnsGb != ""){
			$("#cnsGb").val(cnsGb).prop("selected", true);
		}
		if(zoneGb != ""){
			$("#zoneGb").val(zoneGb).prop("selected", true);
		}
		if(localGb != ""){
			$("#localGb").val(localGb).prop("selected", true);
		}
		if(centerGb != ""){
			$("#centerGb").val(centerGb).prop("selected", true);
		}
		
		*/
		str = "${result.eduGbCd}";
		name = "eduGbCd";
		fn_checked(str, name);
		
		str = "${result.eduTitle}";
		name = "eduTitle";
		fn_checked(str, name);
		
		str = "${result.eduWay}";
		name = "eduWay";
		fn_checked(str, name);
		
		str = "${result.eduMan}";
		name = "eduMan";
		fn_checked(str, name);
		
		str = "${result.hostGb}";
		name = "hostGb";
		fn_checked(str, name);
	});
		
	
	function fn_save(save){
		var msg = "";
		
		var frm = document.frm;
		
		/* if(frm.cnsGb.value.length == 0 ){
			alert('[상담구분]을 선택해주세요.');
			return false;
		}else  if(frm.zoneGb.value.length == 0 ){
			alert('[권역구분]을 선택해주세요.');
			return false;
		}else if(frm.localGb.value.length == 0 ){
			alert('[지역구분]을 선택해주세요.');
			return false;
		}else */if(frm.centerGb.value.length == 0 ){
			alert('[센터구분]을 선택해주세요.');
			return false;
		}/* else if(frm.eduGbCd.value.length == 0 ){
			alert('[교육구분]을 선택해주세요.');
			return false;
		} */
		else if(frm.hostGb.value.length == 0) {
			alert('[진행자]를 선택해주세요.');
			return false;
		}else if(frm.eduPeople.value.length == 0) {
			alert('[대상인원]을 작성해주세요.');
			return false;
		}else if(frm.eduDt.value.length < 8 ){
			alert('[일시]를 선택해주세요.');
			return false;
		}else if(frm.eduSttHour.value.length < 1 ){
			alert('[교육 시간]을 입력해주세요.');
			frm.eduSttHour.focus();
			return false;
		}else if(frm.eduSttMin.value.length < 1 ){
			alert('[교육 시간]을 입력해주세요.');
			frm.eduSttMin.focus();
			return false;
		}else if(frm.eduEndHour.value.length < 1 ){
			alert('[교육 시간]을 입력해주세요.');
			frm.eduEndHour.focus();
			return false;
		}else if(frm.eduEndMin.value.length < 1 ){
			alert('[교육 시간]을 입력해주세요.');
			frm.eduEndMin.focus();
			return false;
		}else if(frm.eduTitle.value.length == 0 ){
			alert('[교육주제]를 선택해주세요.');
			return false;
		}else if($("input[name='eduWay']:checked").length == 0){
			alert('[교육방법]을 선택해주세요.');
			return false;
		}else if(frm.eduMan.value.length == 0 ){
			alert('[교육 대상자]를 선택해주세요.');
			return false;
		}
		
		if(save=="I"){
			msg = "등록 하시겠습니까?";
		}else if(save == "U"){
			msg = "수정 하시겠습니까?";	
		}else if(save == "D"){
			msg = "삭제 하시겠습니까?";	
		}
		
		// validation
		$("#save").val(save);
		if(confirm(msg)){
			document.frm.action = "/gnoincoundb/eduAtvyRptSave.do";
		   	document.frm.submit();
		}

	}
	
	function fn_list(mnuCd){
		document.location.href = "/gnoincoundb/eduAtvyRptList.do?mnuCd=" + mnuCd;
		/* document.frm.action = "/eduAtvyRptList.do";
	   	document.frm.submit(); */
	}
	
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
	
	function fn_fileDelete(idx){
		if(confirm('정말 삭제하시겠습니까?')){
			
		const frm = document.frm;
		frm.fDel.value = 'Y';
		var url = "/gnoincoundb/eduAtvyRptFileDel.do";
			
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
					document.location.reload();
				},
				error : function(e) {
					alert("서버와 통신 오류입니다.");
				}
			});
		}
	}
	
</script>

<section id="content">
	<h2 class="h2-title"><i class="fa fa-check-square"></i>교육활동보고서 등록/수정</h2>
		
		<div class="box-style1 x-scroll-auto" >
			<form name="downForm" id="downForm" method="post">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				<input type="hidden" id="fileNm" name="fileNm" value="" />
				<input type="hidden" id="sysFileNm" name="sysFileNm" value="" />
				<input type="hidden" id="filePath" name="filePath" value="" />
			</form>
			
			<form id="frm" name="frm" method="post" encType="multipart/form-data">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				<input type="hidden" id="mnuCd" name="mnuCd" value="${mnuCd }" />
				<input type="hidden" id="eduAtvyNo" name="eduAtvyNo" value="${result.eduAtvyNo }" />
				<input type="hidden" id="save" name="save" />
				<input type='hidden' name='fDel' value='N' />
				<input type='hidden' name='delYn' value='N' />
				<table class="table-write">
					<colgroup>
						<col width="25%"></col>
						<col width="75%"></col> 
					</colgroup>
					<%-- <tr>
						<th>상담구분</th>
						<td>
							<select class="wd200" id="cnsGb" name="cnsGb">
								<option value=''>선택하세요</option>
								<c:forEach items="${cnsGbList }" var="list">
									<option value="${list.odr }" <c:if test="${list.odr == result.cnsGb}">selected</c:if>>${list.mclassNm }</option>
								</c:forEach>
							</select> 
						</td>
					</tr>
					<tr>
						<th>권역구분</th>
						<td>
							<select class="wd200" id="zoneGb" name="zoneGb">
								<option value=''>선택하세요</option>
								<c:forEach items="${cnsZoneList }" var="list">
									<option value="${list.odr }" <c:if test="${list.odr == result.zoneGb}">selected</c:if>>${list.mclassNm }</option>
								</c:forEach>
							</select> 
						</td>
					</tr>
					<tr>
						<th>지역구분</th>
						<td>
							<select class="wd200" id="localGb" name="localGb">
								<option value=''>선택하세요</option>
								<c:forEach items="${cnsLocalList }" var="list">
									<option value="${list.odr }" <c:if test="${list.odr == result.localGb}">selected</c:if>>${list.mclassNm }</option>
								</c:forEach>
							</select> 
						</td>
					</tr> --%>
					<tr>
						<th>작성자</th>
						<td>
							<c:if test="${result.inputNm == null}">
								<!-- 상담사명 -->
								${map.userNm }
							</c:if>
							<c:if test="${result.inputNm != null}">
								${result.inputNm }
							</c:if>
						</td>
					</tr>
					<tr>
						<th>센터구분</th>
						<td>
							<select class="wd200" id="centerGb" name="centerGb">
								<option value="">선택하세요</option>
								<c:forEach items="${cnsCenterList }" var="list">
									<c:choose>
									<c:when test="${authCd > 1 }">
										<c:if test="${ list.num eq centerGb }" >
											<option value="${list.num }" <c:if test="${ list.num eq centerGb }">selected</c:if> >${list.centerGb }</option>
										</c:if>
									</c:when>
									<c:when test="${authCd <= 1 }">	
										<option value="${list.num }" <c:if test="${ list.num eq result.centerGb }">selected</c:if> >${list.centerGb }</option>		
									</c:when>
									</c:choose>
								</c:forEach>
							</select> 
						</td>
					</tr>
					<%-- <tr>
						<th>교육구분</th>
						<td>
							<c:forEach items="${cnsEduList }" var="list">
								<input type="radio" id="eduGbCd${list.odr}" name="eduGbCd" value="${list.odr}" <c:if test="${list.odr == result.eduGbCd}">checked</c:if> /><label for="eduGbCd${list.odr}">${list.mclassNm}</label>
							</c:forEach>
						</td>
					</tr> --%>
					<tr>
						<th>진행자</th>
						<td>
							<select class="wd200" id="hostGb" name="hostGb">
								<option value=''>선택하세요</option>
								<c:forEach items="${hostList }" var="list">
									<option value="${list.odr }" <c:if test="${list.odr == result.hostGb}">selected</c:if>>${list.mclassNm }</option>
								</c:forEach>
							</select> 
						</td>
					</tr>
					<tr>
						<th>대상인원</th>
						<td><input type="text" id="eduPeople" name="eduPeople" maxlength="3" onlyNumber style="width: 70px;" value="${result.eduPeople }" />명</td>
					</tr>
					<tr>
						<th>일시</th>
						<td>
							<span class="form"><input type="text" class="wd100" id="datepicker1" name="eduDt" value="${result.eduDt }" readOnly/></span>
							<input type="text" class="wd50 mg-l25" maxlength="2" id="eduSttHour" name="eduSttHour" value="${result.eduSttHour }" onlyNumber/>시
							<input type="text" class="wd50" maxlength="2" id="eduSttMin" name="eduSttMin" value="${result.eduSttMin }" onlyNumber/>분 ~
							<input type="text" class="wd50" maxlength="2" id="eduEndHour" name="eduEndHour" value="${result.eduEndHour }" onlyNumber/>시
							<input type="text" class="wd50" maxlength="2" id="eduEndMin" name="eduEndMin" value="${result.eduEndMin }" onlyNumber/>분
						</td>
					</tr>
					<tr>
						<th>교육주제</th>
						<td>
							<c:forEach items="${cnsEdu2List }" var="list">
								<input type="radio" id="eduTitle${list.odr}" name="eduTitle" value="${list.odr}" <c:if test="${list.odr == result.eduTitle}">checked</c:if> /><label for="eduTitle${list.odr}">${list.mclassNm}</label>
							</c:forEach>
						</td>
					</tr>
					<tr>
						<th>교육방법<br>(중복체크)</th>
						<td>
							<c:forEach items="${cnsEdu3List }" var="list">
								<input type="checkbox" id="eduWay${list.odr}" name="eduWay" value="${list.odr}" <c:if test="${fn:contains(result.eduWay, list.odr)}">checked</c:if> /><label for="eduWay${list.odr}">${list.mclassNm}</label>
							</c:forEach>
						</td>
					</tr>
					<tr>
						<th>대상자</th>
						<td>
							<c:forEach items="${cnsEdu4List }" var="list">
								<input type="radio" id="eduMan${list.odr}" name="eduMan" value="${list.odr}" <c:if test="${list.odr == result.eduMan}">checked</c:if> /><label for="eduMan${list.odr}">${list.mclassNm}</label>
							</c:forEach>
						</td>
					</tr>
					<tr>
						<th>심리검사 추가</th>
						<td>
							<input type="text" id="psycExamCntn" name="psycExamCntn" value="${result.psycExamCntn }" />
						</td>
					</tr>
					<tr>
						<th>주요내용</th>
						<td>
							<textarea id="majorCntn" name="majorCntn" rows="15" cols="100">${result.majorCntn }</textarea>
						</td>
					</tr>
					<tr>
						<th>첨부파일</th>
						<td>
							<c:if test="${result.fileNm == null}">
								<input type='file' name='file' id='file' style='margin:10px 0; height:auto'/>
							</c:if>
							<c:if test="${result.fileNm != null}">
								${result.fileNm}
								<button type='button' onClick="fn_down('${result.fileNm}','${result.sysFileNm}','${result.filePath}')" class="btn-basic">다운로드</button>
								<button type='button' onClick="fn_fileDelete(${result.eduAtvyNo})" class="btn-basic" style='background-color: red'>삭제</button>
							</c:if>
						</td>
					</tr>
				</table>
				<div class="btn" style="float: right; margin: 0;">
					<button type="button" class="btn-basic" onClick="javascript:fn_list('${mnuCd}');" style="background-color: green;color:white;">목록</button>
					<c:if test="${ result != null && (authCd <= 3 || ( authCd > 3 && userId == result.cnsrId )) }">
							<button type="button" class="btn-basic" onClick="javascript:fn_save('U');" style="background-color: green;color:white;">수정</button>	
					</c:if>
					<c:if test="${result == null}">
						<button type="button" class="btn-basic" onClick="javascript:fn_save('I');" style="background-color: green;color:white;">저장</button>
					</c:if>
					<c:if test="${ result != null && (authCd <= 1 || ( authCd > 1 && userId == result.cnsrId )) }">
						<button type="button" class="btn-basic"  onClick="javascript:fn_save('D');">삭제</button>
					</c:if>
					<c:if test="${result != null}">
						<button type="button" id="pdfBtn" class="btn-basic btn-primary" onclick="javascript:fn_pdfDownload(27, '${result.eduAtvyNo }')">PDF 다운</button>
					</c:if>
				</div>	
			</form>
		</div>
		<!-- end -->
	</section>
</html>

