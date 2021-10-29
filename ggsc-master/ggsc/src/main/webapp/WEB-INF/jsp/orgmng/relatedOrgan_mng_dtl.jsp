<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="egovframework.rte.psl.dataaccess.util.EgovMap"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script type="text/javascript">
	$(document).ready(function() {
	});
	
	function fn_reg(relOrgCd){
		var frm = document.frm;
		var urlChk = /^(https?:\/\/)?([a-z\d\.-]+)\.([a-z\.]{2,6})([\/\w\.-]*)*\/?$/;
		
		if(frm.relOrgGb.value.length == 0){
			alert('[기관 구분]을 선택해주세요.');
			return false;
		}else if(frm.localGb.value.length == 0){
			alert('[지역 구분]을 선택해주세요.');
			return false;
		}else if(frm.relOrgNm.value.length < 1){
			alert('[기관명]을 입력해주세요.');
			return false;
		}else if(frm.url.value.length == 0){
			alert('[url]을 입력해주세요.');
			return false;
		} else if(frm.addr.value.length == 0){
			alert('[주소]를 입력해주세요.');
			return false;
		}else if(frm.tel.value.length == 0){
			alert('[전화번호]를 입력해주세요.');
			return false;
		} 
		/* else if(frm.url.search(/\s/) != -1) {
			alert("[url]을 공백 없이 입력해주세요.");
			frm.url.focus();
			return false;
		} else if(urlChk.test(frm.url) != true) { // URL 검사
			alert('[Web 입력 오류] 유효한 웹 사이트 주소를 입력해 주세요.');
			frm.url.focus();
			return false;
		} */
		if(relOrgCd.length > 0) {
			if(confirm("수정 하시겠습니까?")){
				document.frm.action = "/gnoincoundb/relatedOrgan_mng_reg.do?save=U";
		       	document.frm.submit();
				alert("수정이 완료되었습니다.");
			}
		} else {
			frm.num.value = 0;
			var param = $("#frm").serialize(); //ajax로 넘길 data
			if(confirm("등록 하시겠습니까?")){
				var token = $("meta[name='_csrf']").attr("th:content");
				var header = $("meta[name='_csrf_header']").attr("th:content");
				
				$.ajax({
					type : "POST",
					url : "/gnoincoundb/relatedOrgan_mng_dtl_ajax.do",
					data : param,
					dataType : "json",
					beforeSend : function(xhr){
						xhr.setRequestHeader(header, token);
					},
					success : function(json) {
						var relOrgNmChk = json.relOrgNmChk;
						if(relOrgNmChk == 0) {
							document.frm.action = "/gnoincoundb/relatedOrgan_mng_reg.do?save=S";
					       	document.frm.submit();
							alert("등록이 완료되었습니다.");
						} else {
							alert("이미 등록된 기관정보입니다.");
						}
					},
					error : function(e) {
						alert("서버와 통신 오류입니다.");
					}
				});
			} // ajax 끝
		}
	}  	
	function fn_list(mnuCd){
		document.location.href = "/gnoincoundb/relatedOrgan_mng_list.do?mnuCd=" + mnuCd;
	}  	
	
	function relOrgNmChk() {
		var param = $("#searchForm").serialize(); //ajax로 넘길 data
		// var schZoneGb = $('input:select[name=schZoneGb]:checked').val();
		// var schSigunNm = $('input:select[name=schSigunNm]:checked').val();
		// var param = {hworkId : hworkId , userId : userId};
		var token = $("meta[name='_csrf']").attr("th:content");
		var header = $("meta[name='_csrf_header']").attr("th:content");
		$.ajax({
			type : "POST",
			url : "/gnoincoundb/relatedOrgan_mng_dtl_ajax.do",
			data : param,
			dataType : "json",
			beforeSend : function(xhr){
				xhr.setRequestHeader(header, token);
			},
			success : function(json) {
				alert(json.relOrgNm);
			},
			error : function(e) {
				alert("서버와 통신 오류입니다.");
			}
		});
	}
	
	function fn_popup() {
		var oepnwin;
		var url = "/gnoincoundb/relatedOrgan_info_list.do";
		var name = "유관기관 정보";
		var option = "width=530, height=650, left=450, location=yes";
		oepnwin = window.open(url, name, option);
	}
	
</script>
<style>
	.table-style1 input {width:150px;}
	/* td:nth-child(even){text-align:left;} */
	/* td:nth-child(odd){text-align:left;} 홀수 이벤트*/
</style>
<section id="content">
	<h2 class="h2-title"><i class="fa fa-check-square"></i>
		<c:if test="${empty detail.relOrgCd }">유관기관 등록</c:if>
		<c:if test="${!empty detail.relOrgCd }">유관기관 상세보기</c:if>
	</h2>
	<div class="box-style1 x-scroll-auto">
		<input type="hidden" id="reqDept" name="reqDept"/>
		<input type="hidden" id="reqDept2" name="reqDept2"/>
		
		<form id="frm" name="frm" method="post">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			<input type="hidden" id="num" name="num" value="${detail.num }"/>
			<input type="hidden" id="currentPageNo" name="currentPageNo" value="1" />
			<input type="hidden" id="mnuCd" name="mnuCd" value="${mnuCd }" />
			<table class="table-write mg-t5" style="width:1235px;">
				<colgroup>
					<col width="15%" />
					<col width="35%" />
					<col width="15%" />
					<col width="35%" />
				</colgroup>
				<tr>
					<td style="text-align:center;">기관구분</td>
					<td>
					<select id="relOrgGb" name="relOrgGb" style="width:275px;">
						<option value="">선택하세요</option>
					 	<c:forEach items="${organGbList }" var="list">
					 		<option value="${list.odr }" <c:if test="${fn:replace(detail.relOrgGb,'gb','') == list.odr }">selected</c:if>>${list.mclassNm }</option>
					 	</c:forEach>
					</select>
					</td>
					<td style="text-align:center;">지역구분</td>
					<td>
						<select name="localGb" style="width:275px;">
							<option value="">선택하세요</option>
						 	<c:forEach items="${localGbList }" var="list">
						 		<option value="${list.odr }" <c:if test="${list.odr == detail.localGb}">selected</c:if>>${list.mclassNm }</option>
						 	</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td style="text-align:center;">기관명</td>
					<td><input type="text" id="reqName" name="relOrgNm" maxlength="20" value="${detail.relOrgNm }"/></td>
					<td style="text-align:center;">URL</td>
					<td style="text-align: left;"><input type="text" id="url" name="url" maxlength="50" value="${detail.url }"/></td>
				</tr>
				<tr>
					<td style="text-align:center;">주소</td>
					<td colspan="3"><input type="text" id="addr" name="addr" maxlength="30" value="${detail.addr }"/></td>
					<%-- <td style="text-align:center;">상세주소</td>
					<td><input type="text" id="addrDtl" name="addrDtl" maxlength="30" value="${detail.addrDtl }"/></td> --%>
				</tr>
				<tr>
					<td style="text-align:center;">전화번호</td>
					<td><input type="text" id="tel" name="tel" maxlength="12" value="${detail.tel }" onlyNumber maxlength=12/></td>
					<td style="text-align:center;">팩스번호</td>
					<td><input type="text" id="fax" name="fax" maxlength="20" value="${detail.fax }" onlyNumber maxlength=12/></td>
				</tr>
			</table>
		</form>
		<div class="btn" style="text-align: right; display: block; width: 77.4%;">
			<button type="button" class="btn-basic" onClick="javascript:fn_reg('${detail.relOrgCd }');" style="background-color:#fc692f;color:white;">
				<c:if test="${empty detail.relOrgCd }">저장</c:if>
				<c:if test="${!empty detail.relOrgCd }">수정</c:if>
			</button>
			<button type="button" class="btn-basic" onClick="javascript:fn_list('${mnuCd }');" style="background-color:#7f7f7f;color:white;">목록</button>
		</div>	
	</div>
</section>
</html>