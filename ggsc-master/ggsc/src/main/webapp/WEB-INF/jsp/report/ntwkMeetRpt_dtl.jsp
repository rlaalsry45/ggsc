
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
		
	});
	
	
	function fn_save(save){
		var frm = document.frm;
		var msg = "";
		if(save=="I"){
			msg = "등록 하시겠습니까?";
			if(frm.cnsrId.value.length < 1){
				alert('[작성자]를 선택해주세요.');
				return false;
			}
			
		}else if(save=="U") {
			msg = "수정 하시겠습니까?";	
		}
		
		/* if(frm.localGb.value.length == 0 ){
			alert('[지역]을 선택해주세요.');
			return false;
		}else  */if(frm.joinOrgCd.value.length < 1){
			alert('[참여기관]을 입력해주세요.');
			frm.joinOrgCd.focus();
			return false;
		}else if(frm.meetDt.value.length < 8){
			alert('[회의일자]을 선택해주세요.');
			return false;
		}else if(frm.joinMan.value.length < 1){
			alert('[참여인원]을 입력해주세요.');
			return false;
		}else if(frm.joinPlace.value.length < 1){
			alert('[장소]를 입력해주세요.');
			return false;
		}
		if (save=="D") {
			msg = "삭제하시겠습니까?"
		}
		
		// validation
		$("#inputNm").val($("#cnsleNm").val());
		$("#save").val(save);
		if(confirm(msg)){
			document.frm.action = "/gnoincoundb/ntwkMeetRptSave.do";
		   	document.frm.submit();
		}
	}
	
	function fn_list(mnuCd){
		document.location.href = "/gnoincoundb/ntwkMeetRptList.do?mnuCd=" + mnuCd;
		/* document.frm.action = "/ntwkMeetRptList.do";
	   	document.frm.submit(); */
	}
	
	function findUserPopup(){
		var userNm = $("#cnsleNm").val();
		userNm = encodeURI(encodeURIComponent(userNm));		
		var url = "/gnoincoundb/findUserPopup.do?userNm=" + userNm+"&cnsTargetGb=Y";
		var name = "회원 찾기";
		var option = "width = 530, height = 500, top = 50, left = 500, location = yes";
		window.open(url, name, option);
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
				var arr = [ 'zoneGb', 'centerGb', 'cnsGb' ];
				for(var i=0;i<arr.length;i++){
					$("#" + arr[i]).val(eval("data." + arr[i] ));
				}
				
			}).fail(function(e){
				alert('서버 오류가 발생하였습니다.');
			})
			
		}
	}
	
	/* function fn_fileDelete(idx){
		if(confirm('정말 삭제하시겠습니까?')){
			const frm = document.frm;
			frm.fDel.value = 'Y';
			frm.action = "/gnoincoundb/ntwkMeetRptSave.do";
			frm.submit();
		}
	} */

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
		var url = "/gnoincoundb/ntwkMeetRptFileDel.do";
			
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
	<h2 class="h2-title"><i class="fa fa-check-square"></i>네트워크구축회의 등록/수정</h2>
		
		<div class="box-style1 x-scroll-auto" >
			<form name="downForm" id="downForm" method="post">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				<input type="hidden" id="fileNm" name="fileNm" value="" />
				<input type="hidden" id="sysFileNm" name="sysFileNm" value="" />
				<input type="hidden" id="filePath" name="filePath" value="" />
			</form>
			
			<form id="frm" name="frm" method="post" encType="multipart/form-data">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				<input type="hidden" id="cnsGb" name="cnsGb" value="${result.cnsGb }" />	
				<input type="hidden" id="zoneGb" name="zoneGb" value="${map.zoneGb }" />
				<input type="hidden" id="centerGb" name="centerGb" value="${map.centerGb }" />
				<%-- <input type="hidden" id="inputNm" name="inputNm" value="${result.inputNm }" /> --%>
				<input type="hidden" id="mnuCd" name="mnuCd" value="${mnuCd }" />
				<input type="hidden" id="ntwkMeetNo" name="ntwkMeetNo" value="${result.ntwkMeetNo }" />
				<!-- 상담사 ID -->
				<%-- <input type="hidden" id="cnsleId" name="cnsleId" value="${map.userId }"/> --%>
				<input type="hidden" id="cnsrId" name="cnsrId" value="${map.userId }"/>
				<input type="hidden" id="save" name="save" />
				<input type='hidden' name='fDel' value='N' />
				<input type='hidden' name='delYn' value='N' />
				
				<table class="table-write">
					<colgroup>
						<col width="25%"></col>
						<col width="75%"></col> 
					</colgroup>
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
					<%-- <tr>
						<th>지역</th>
						<td>
							<select name="localGb" style="width:275px;">
								<option value="">선택하세요</option>
								<c:forEach items="${cnsLocalList }" var="list">
									<option value="${list.odr }" <c:if test="${ list.odr eq result.localGb }">selected</c:if> >${list.mclassNm }</option>
								</c:forEach>
							</select>
						</td>
					</tr> --%>
					<tr>
						<th>네트워크활동</th>
						<td>
							<select name="joinOrgCd" style="width:275px;">
								<option value="">선택하세요</option>
								<c:forEach items="${partiInstList }" var="list">
									<option value="${list.odr }" <c:if test="${ list.odr eq result.joinOrgCd }">selected</c:if> >${list.mclassNm }</option>
								</c:forEach>
							</select>
						</td>
					</tr>
					<tr>
						<th>회의일자</th>
						<td>
							<span class="form"><input type="text" class="wd200" id="datepicker1" name="meetDt" readOnly value="${result.meetDt }" /></span>
						</td>
					</tr>
					<tr>
						<th>참여인원</th>
						<td>
							<input type="text" id="joinMan" name="joinMan" value="${result.joinMan }" onlyNumber maxLength=3 />
						</td>
					</tr>
					<tr>
						<th>장소</th>
						<td>
							<input type="text" id="joinPlace" name="joinPlace" value="${result.joinPlace }" />
						</td>
					</tr>
					<tr>
						<th>내용</th>
						<td>
							<textarea id="joinCntn" name="joinCntn" rows="20" cols="100">${result.joinCntn }</textarea>
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
								<button type='button' onClick="fn_fileDelete(${result.ntwkMeetNo})" class="btn-basic" style='background-color: red'>삭제</button>
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
						<button type="button" id="pdfBtn" class="btn-basic btn-primary" onclick="javascript:fn_pdfDownload(26, '${result.ntwkMeetNo }')">PDF 다운</button>
					</c:if>
				</div>

			</form>
		</div>
		<!-- end -->
	</section>
</html>
