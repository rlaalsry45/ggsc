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
		var visitOrgGb = "${result.visitOrgGb}";
		if(visitOrgGb != ""){
			$("#visitOrgGb").val(visitOrgGb).prop("selected", true);
		}
	});
		
	
	function fn_save(save){
		var frm = document.frm;
		var msg = "";
		if(save=="I"){
			msg = "등록 하시겠습니까?";
			if(frm.cnsrNm.value.length < 1){
				alert('[방문자]를 선택해주세요.');
				return false;
			}
		}else if(save=="U") {
			msg = "수정 하시겠습니까?";	
		}
		
		/* if(frm.localGb.value.length == 0 ){
			alert('[지역]을 선택해주세요.');
			return false;
		}else  */if(frm.visitOrgNm.value.length < 1){
			alert('[방문기관]을 입력해주세요.');
			frm.visitOrgNm.focus();
			return false;
		}else if(frm.visitOrgGb.value.length == 0){
			alert('[방문기관구분]을 선택해주세요.');
			return false;
		}else if(frm.visitDt.value.length < 8){
			alert('[방문일자]을 선택해주세요.');
			return false;
		}else if(frm.visitManCnt.value.length < 1){
			alert('[방문인원]을 입력해주세요.');
			return false;
		}
		if (save=="D") {
			msg = "삭제하시겠습니까?"
		}
		
		
		// validation
		$("#visitr").val($("#cnsrNm").val());
		$("#save").val(save);
		if(confirm(msg)){
			document.frm.action = "/gnoincoundb/linkOrgRptSave.do";
		   	document.frm.submit();
		}
	}
	
	function fn_list(mnuCd){
		document.location.href = "/gnoincoundb/linkOrgRptList.do?mnuCd=" + mnuCd;
		/* document.frm.action = "/linkOrgRptList.do";
	   	document.frm.submit(); */
	}
	
	function findCnsrPopup(){
		var userNm = $("#cnsleNm").val();
		userNm = encodeURI(encodeURIComponent(userNm));		
		var url = "/gnoincoundb/findCnsrPopup.do?userNm=" + userNm+"&cnsTargetGb=Y";
		var name = "회원 찾기";
		var option = "width = 530, height = 750, top = 50, left = 250, location = yes";
		window.open(url, name, option);
		//encodeURI(encodeURIComponent(jindan_name));
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
		var url = "/gnoincoundb/linkOrgRptFileDel.do";
			
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
	<h2 class="h2-title"><i class="fa fa-check-square"></i>연계기관방문 등록/수정</h2>
		
		<div class="box-style1 x-scroll-auto" >
		
			<form name="downForm" id="downForm" method="post">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				<input type="hidden" id="fileNm" name="fileNm" value="" />
				<input type="hidden" id="sysFileNm" name="sysFileNm" value="" />
				<input type="hidden" id="filePath" name="filePath" value="" />
			</form>
		
			<form id="frm" name="frm" method="post" encType="multipart/form-data">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				<!-- <input type="hidden" id="cnsleId" name="cnsleId" /> -->
				<input type="hidden" id="caseNo" name="caseNo" value="0" />
				<input type="hidden" id="cnsGb" name="cnsGb" value="${result.cnsGb }" />
				<input type="hidden" id="zoneGb" name="zoneGb"  />
				<input type="hidden" id="centerGb" name="centerGb" />
				<input type="hidden" id="visitr" name="visitr" value="${result.visitr }" />
				<input type="hidden" id="mnuCd" name="mnuCd" value="${mnuCd }" />
				<input type="hidden" id="linkOrgNo" name="linkOrgNo" value="${result.linkOrgNo }" />
				<input type="hidden" id="save" name="save" />
				<input type='hidden' name='fDel' value='N' />
				<input type='hidden' name='delYn' value='N' />
				
				<table class="table-write">
					<colgroup>
						<col width="25%"></col>
						<col width="75%"></col> 
					</colgroup>

					<tr>
						<th>시군</th>
						<td>
							<%-- <select name="localGb" style="width:275px;">
								<option value="">선택하세요</option>
								<c:forEach items="${cnsLocalList }" var="list">
									<option value="${list.odr }" <c:if test="${ list.odr eq result.localGb }">selected</c:if> >${list.mclassNm }</option>
								</c:forEach>
							</select> --%>
							<select class="wd200" id="sigunCd" name="sigunCd">
								<c:forEach items="${sigunGbList }" var="result">
									<c:choose>
										<c:when test="${authCd > 1 }">
											<c:if test="${ result.odr eq map.sigunCd }" >
												<option value="${result.odr }">${result.mclassNm }</option>
											</c:if>
										</c:when>
										<c:when test="${authCd <= 1 }">								
											<option value="${result.odr }">${result.mclassNm }</option>
										</c:when>
									</c:choose>
								</c:forEach>
							</select>
						</td>
					</tr>
					
					<tr>
						<th>방문기관명</th>
						<td>
							<input type="text" class="wd200" id="visitOrgNm" name="visitOrgNm"  value="${result.visitOrgNm }" />
						</td>
					</tr>
					<tr>
						<th>방문기관구분</th>
						<td>
							<select class="wd200" id="visitOrgGb" name="visitOrgGb">
								<option value="">선택하세요</option>
								<c:forEach items="${cnsVisitCenterList }" var="list">
									<option value="${list.odr }" <c:if test="${ list.odr eq result.visitOrgGb }">selected</c:if> >${list.mclassNm }</option>
								</c:forEach>
							</select> 
						</td>
					</tr>
					<tr>
						<th>방문일자</th>
						<td>
							<span class="form"><input type="text" class="wd200" id="datepicker2" readOnly name="visitDt" value="${result.visitDt }" /></span>
						</td>
					</tr>
					<tr>
						<th>방문인원</th>
						<td>
							<input type="text" class="wd50" id="visitManCnt" name="visitManCnt" value="${result.visitManCnt }" onlyNumber maxLength=3/>명
						</td>
					</tr>
					<tr>
						<th>방문자</th>
						<td>
							<c:if test="${result == null}">
								<input type="text" class="wd200" id="cnsrNm" name="cnsleNm" readonly /><button type="button" class="btn-basic" style="padding: 2px 6px;" onclick="javascript:findCnsrPopup();">찾기</button>
							</c:if>
							<c:if test="${result != null}">
								${result.visitr }
							</c:if>
						</td>
					</tr>
					<tr>
						<th>내용</th>
						<td>
							<textarea id="visitCntn" name="visitCntn" rows="20" cols="100">${result.visitCntn }</textarea>
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
								<button type='button' onClick="fn_fileDelete(${result.linkOrgNo})" class="btn-basic" style='background-color: red'>삭제</button>
							</c:if>
						</td>
					</tr>
				</table>
				<div class="btn" style="float: right; margin: 0;">
					<button type="button" class="btn-basic" onClick="javascript:fn_list('${mnuCd}');" style="background-color: green;color:white;">목록</button>
					<c:if test="${ result != null && (authCd <= 3 || ( authCd > 3 && userId == result.cnsrId ) ) }">
							<button type="button" class="btn-basic" onClick="javascript:fn_save('U');" style="background-color: green;color:white;">수정</button>	
					</c:if>
					<c:if test="${result == null}">
						<button type="button" class="btn-basic" onClick="javascript:fn_save('I');" style="background-color: green;color:white;">저장</button>
					</c:if>
					<c:if test="${ result != null && (authCd <= 1 || ( authCd > 1 && userId == result.cnsrId )) }">
						<button type="button" class="btn-basic"  onClick="javascript:fn_save('D');">삭제</button>
					</c:if>
				</div>	
			</form>
		</div>
		<!-- end -->
	</section>
</html>

