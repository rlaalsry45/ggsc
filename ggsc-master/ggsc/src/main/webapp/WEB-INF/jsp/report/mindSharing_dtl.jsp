
<%@ page import="egovframework.rte.psl.dataaccess.util.EgovMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>


    <script src="/gnoincoundb/js/html2canvas.min.js" ></script>
    <script src="/gnoincoundb/js/jspdf.min.js" ></script>
 
<script type="text/javascript">
$(document).ready(function(){
	// $("input[name=centerGb][value=${vo.schCenterGb}]").prop("selected", true);
	
	var centerGb = "${detail.centerGb}";
	if(centerGb == "") {
		$("#centerGb").val("${vo.schCenterGb}").prop("selected", true);
	} else {
		$("#centerGb").val("${detail.centerGb}").prop("selected", true);
	}
	$("input[name=gender][value=${detail.gender}]").prop("checked", true);
});

function fn_save(save){
	
	var msg = "";
	var frm = document.frm;
	
	if(frm.centerGb.value.length == 0){
		alert('[센터구분]을 선택해주세요.');
		return false;
	}else if(frm.cnsGb.value.length == 0){
		alert('[구분]을 선택해주세요.');
		return false;
	}else if(frm.voluntGb.value.length == 0) {
		alert('[활동내용]를 선택해주세요.');
		return false;
	}else if(frm.bDate.value.length < 8){
		alert('[일자]를 입력해주세요.');
		return false;
	}else if(frm.bContent.value.length < 2){
		alert('[내용]을 입력해주세요.');
		return false;
	}
	
	if(save=="I"){
		msg = "등록 하시겠습니까?";
	}else if(save == "U"){
		msg = "수정 하시겠습니까?";	
	}else if(save == "D"){
		msg = "삭제 하시겠습니까?";	
	}
	
	$("#save").val(save);
	if(confirm(msg)){
		document.frm.action = "/gnoincoundb/mindSharing_proc.do";
		document.frm.submit();
	}
}
/* function fn_fileDelete(idx){
	if(confirm('정말 삭제하시겠습니까?')){
		const frm = document.frm;
		frm.fDel.value = 'Y';
		frm.action = "/gnoincoundb/mindSharing_proc.do";
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

/* function fn_delete(){
	if(confirm('정말 삭제하시겠습니까?')){
		const frm = document.frm;
		frm.delYn.value = 'Y';
		frm.action = "/gnoincoundb/mindSharing_proc.do";
		frm.submit();
	}
} */

function fn_fileDelete(idx){
	if(confirm('정말 삭제하시겠습니까?')){
		
	const frm = document.frm;
	frm.fDel.value = 'Y';
	var url = "/gnoincoundb/mindSharingFileDel.do";
		
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

function fn_list(mnuCd) {
	document.location.href = "/gnoincoundb/mindSharing.do?mnuCd=" + mnuCd;
}

</script>

<section id="content">
	<h2 class="h2-title"><i class="fa fa-check-square"></i>
		<c:choose>
			<c:when test="${vo.bGubun eq 1}">성인지교육사업 등록/수정</c:when>
			<c:when test="${vo.bGubun ne 1}">마음나눔봉사단 등록/수정</c:when>
		</c:choose>
	</h2>
		
		<div class="box-style1 x-scroll-auto" >
			<form name="downForm" id="downForm" method="post">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				<input type="hidden" id="fileNm" name="fileNm" value="" />
				<input type="hidden" id="sysFileNm" name="sysFileNm" value="" />
				<input type="hidden" id="filePath" name="filePath" value="" />
			</form>
			
			<form id="frm" name="frm" method="post" encType="multipart/form-data">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				<input type='hidden' name='bGubun' value='${vo.bGubun}' />
				<input type='hidden' name='num' value='<c:if test="${detail.num eq null}">${vo.num}</c:if><c:if test="${detail.num != null}">${detail.num}</c:if>' />
				<input type="hidden" id="save" name="save" />
				<input type='hidden' name='fDel' value='N' />
				<input type='hidden' name='delYn' value='N' />
				<input type='hidden' name='mnuCd' value='${mnuCd}' />		
				<table class="table-write">
					<colgroup>
						<col width="25%"></col>
						<col width="75%"></col> 
					</colgroup>
					<tr>
						<th>작성자</th>
						<td>
							<c:if test="${detail.userNum == null}">
								<!-- 상담사명 -->
								${userNm }
							</c:if>
							<c:if test="${detail.userNum != null}">
								${detail.userNum }
							</c:if>
						</td>
					</tr>
					<tr>
						<th>센터구분</th>
						<td>
							<select id="centerGb" name='centerGb' style='width:275px'>
									<c:forEach items="${cnsCenterList }" var="result">
										<c:choose>
										<c:when test="${authCd > 1 }">
											<c:if test="${ result.num eq vo.schCenterGb }" >
												<option value="${result.num }" selected >${result.centerGb }</option>
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
						<th>상담구분</th>
						<td>
							<select name='cnsGb' style='width:275px'>
								<option value=''>선택하세요</option>
								<c:forEach items="${cnsGbList }" var="result">
									<option value="${result.odr }" <c:if test="${ result.odr eq detail.cnsgb }">selected</c:if>>${result.mclassNm}</option>
								</c:forEach>
							</select>
						</td>
					</tr>
					<tr>
						<th>활동내용</th>
						<td>
							<select name='voluntGb' style='width:275px'>
								<option value=''>선택하세요</option>
								<c:forEach items="${cnsVolunList }" var="result">
									<option value="${result.odr }" <c:if test="${ result.odr eq detail.voluntGb }">selected</c:if>>${result.mclassNm}</option>
								</c:forEach>
							</select>
						</td>
					</tr>
					<tr>
						<th>상담지원봉사자명</th>
						<td>
							<input type="text" class="wd200" id="voluntNm" name="voluntNm" value="${detail.voluntNm }"/>
						</td>
					</tr>
					<tr>
						<th>일자</th>
						<td>
							<span class="form"><input type="text" class="wd200" id="datepicker2" name="bDate" value="${detail.bDate}" readonly /></span>
						</td>
					</tr>
					<tr>
						<th>내용</th>
						<td>
							<textarea id="visitCntn" name="bContent" rows="20" cols="100">${detail.bContent }</textarea>
						</td>
					</tr>
					<tr>
						<th>첨부파일</th>
						<td>
							<c:if test="${detail.fileNm == null}">
								<input type='file' name='file' id='file' style='margin:10px 0; height:auto'/>
							</c:if>
							<c:if test="${detail.fileNm != null}">
								${detail.fileNm}
								<button type='button' onClick="fn_down('${detail.fileNm}','${detail.sysFileName}','${detail.filePath}')" class="btn-basic">다운로드</button>
								<button type='button' onClick="fn_fileDelete(${detail.num})" class="btn-basic" style='background-color: red'>삭제</button>
							</c:if>
						</td>
					</tr>
					
				</table>
				<div class="btn" style="float: right; margin: 0;">
					<button type="button" class="btn-basic" onClick="javascript:fn_list('${mnuCd}');" style="background-color: green;color:white;">목록</button>
					<c:if test="${ vo.num ne 0 && ( authCd <= 3 || authCd > 3 && userId == detail.cnsrId) }">
							<button type="button" class="btn-basic" onClick="javascript:fn_save('U');" style="background-color: green;color:white;">수정</button>	
					</c:if>
					<c:if test="${ vo.num eq 0 && ( authCd <= 3 || authCd > 3 && userId == detail.cnsrId) }">
							<button type="button" class="btn-basic" onClick="javascript:fn_save('I');" style="background-color: green;color:white;">저장</button>	
					</c:if>
					
					<c:if test="${ vo.num ne 0 && (authCd <= 1 || ( authCd > 1 && userId == detail.cnsrId )) }">
						<button type="button" class="btn-basic"  onClick="javascript:fn_save('D');">삭제</button>
					</c:if>
					
				</div>	
			</form>
		</div>
		<!-- end -->
	</section>
</html>

