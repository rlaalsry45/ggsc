
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

		/* if(frm.cnsGb.value.length == 0 ){
			alert('[상담구분]을 선택해주세요.');
			return false;
		}else  if(frm.zoneGb.value.length == 0 ){
			alert('[권역구분]을 선택해주세요.');
			return false;
		} else if(frm.localGb.value.length == 0 ){
			alert('[지역구분]을 선택해주세요.');
			return false;
		} 
		if($("input[name='prAtvyArea']:checked").length == 0){
			alert('[홍보활동분야]를 선택해주세요.');
			return false;
		}else if($("input[name='prAtvyRcpt']:checked").length == 0){
			alert('[대상자]를 선택해주세요.');
			return false;
		}else if(frm.prAtvyMan.value.length < 1 ){
			alert('[대상 인원]을 입력해주세요.');
			return false;
		}  */
		if($("#regDate").val().length != 8){
			alert("신청날짜를 8자리로 입력해주세요.");
			$("#regDate").focus();
			return;
		}
		
		
		var msg = "";
		if(save=="I"){
			msg = "등록 하시겠습니까?";
		}else{
			msg = "수정 하시겠습니까?";	
		}
		
		$("#save").val(save);
		if(confirm(msg)){
			document.frm.action = "/gnoincoundb/eduAppReg.do";
		   	document.frm.submit();
		}
	}
	
	function fn_list(mnuCd){
		document.location.href = "/gnoincoundb/eduAppList.do?mnuCd=" + mnuCd;
		/* document.frm.action = "/prAtvyRptList.do";
	   	document.frm.submit(); */
	}
	
</script>

<section id="content">
	<h2 class="h2-title"><i class="fa fa-check-square"></i>교육관리 등록/수정</h2>
		
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
				<input type="hidden" id="num" name="num" value="${detail.num }" />
				<input type="hidden" id="save" name="save" />
				<table class="table-write">
					<colgroup>
						<col width="25%"></col>
						<col width="75%"></col> 
					</colgroup>
					<tr>
						<th>작성자</th>
						<td>
							<input type="text" class="wd200" id="userNm"  name="userNm"  readonly value="${detail.userNm }" />
						</td>
					</tr>
					<tr>
						<th>생년월일</th>
						<td>
							<input type="text" class="wd200" id="birth"  name="birth" readonly value="${detail.birth }" />
						</td>
					</tr>
					<tr>
						<th>교육명</th>
						<td>
							<input type="text" class="wd200" id="eduName"  name="eduName"  value="${detail.eduName }" />
						</td>
					</tr>
					
					<tr>
						<th>휴대폰</th>
						<td>
							<input type="text" class="wd200" id="phone"  name="phone"  value="${detail.phone }" />
						</td>
					</tr>
					<tr>
						<th>이메일</th>
						<td>
							<input type="text" class="wd200" id="email"  name="email" value="${detail.email }" />
						</td>
					</tr>
					<tr>
						<th>기관명</th>
						<td>
							<input type="text" class="wd200" id="centerNm"  name="centerNm" value="${detail.centerNm }" />
						</td>
					</tr>
					<tr>
						<th>신청날짜</th>
						<td>
							<input type="text" class="wd200" id="regDate"  name="regDate"  value="${detail.regDate }" />
						</td>
					</tr>
					<tr>
						<th>부서</th>
						<td>
							<input type="text" class="wd200" id="depart"  name="depart" value="${detail.depart }" />
						</td>
					</tr>
				</table>
				<div class="btn" style="float: right; margin: 0;">
					<c:if test="${ detail != null && vo.authCd eq 1 }">
							<button type="button" class="btn-basic" onClick="javascript:fn_save('U');" style="background-color:#FF8224;color:white;">수정</button>
					</c:if>
					<button type="button" class="btn-basic" onClick="javascript:fn_list('${mnuCd}');"style="background-color:#FF8224;color:white;">목록</button>
					<!-- <c:if test="${detail == null}">
						<button type="button" class="btn-basic" onClick="javascript:fn_save('I');" style="background-color:#FF8224;color:white;">저장</button>
					</c:if> -->
					
					
				</div>	
			</form>
		</div>
		<!-- end -->
	</section>
</html>

