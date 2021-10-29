<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="_csrf" th:content="${_csrf.token}"/>
<meta name="_csrf_header" th:content="${_csrf.headerName}"/>
<title>센터정보 등록</title>
</head>

<script type="text/javascript">
	$(document).ready(function() {
	  	var cnsrCd = "${detail.cnsrCd}";
	  	if(cnsrCd.length > 0) {
	  		$("input:radio[name=pdsrYn]").removeAttr('checked');
			$('input:radio[name=pdsrYn]:radio[value=' + '${detail.pdsrYn}' + ']').prop("checked", true);
	  	}
	  	
	  	$('#zoneGb').val('${detail.zoneGb}').attr('selected','selected');
	  	$('#localGb').val('${detail.localGb}').attr('selected','selected');
		$('input:radio[name=useYn]:input[value="${detail.useYn}"]').attr("checked", true);
	  	
	});

	
	function fn_reg(num){
		// url 유효성 검사
		var url = /^(https?:\/\/)?([a-z\d\.-]+)\.([a-z\.]{2,6})([\/\w\.-]*)*\/?$/;
		homepage = $('#homepage');
		centerCheck = $('#centerCheck').val();
		var centerNmResult = "${detail.centerNm}";
		var frm = document.frm;
		
		var zoneGb = $("#zoneGb").val();
		var localGb = $("#localGb").val();
		var centerNm = $("#centerNm").val();
		var addr = $("#addr").val();
		var homepage = $("#homepage").val();
		var tel = $("#tel").val();
		
		if(zoneGb.length == 0) {
			alert('[권역구분]을 선택해주세요.');
			return false;
		} else if(localGb.length == 0) {
			alert('[시∙군]을 선택해주세요.');
			return false;
		} else if(centerNm.length == 0) {
			alert('[센터명]을 입력해주세요.');
			frm.centerNm.focus();
			return false;
		} else if(addr.length == 0){
			alert('[주소]를 입력해주세요.');
			frm.addr.focus();
			return false;
		} else if(homepage.search(/\s/) != -1) {
			alert("홈페이지는 공백 없이 입력해주세요.");
			$("#homepage").focus();
			return false;
		} else if(url.test(homepage) != true) { // URL 검사
			alert('[Web 입력 오류] 유효한 웹 사이트 주소를 입력해 주세요.');
			homepage.focus();
			return false;
		} else if(tel.length < 4){
			alert('[전화번호]를 입력해주세요.');
			frm.tel.focus();
			return false;
		}  else if(frm.useYn.value.length == 0){
			alert('[사용여부]를 체크해주세요.');
			return false;
		} else if(centerCheck != "Y") {
			if(centerNmResult != centerNm) {
				alert('[중복확인]을 체크해주세요');
				return false;
			}
		}
		
		if(num == "S") {
			if(confirm("등록 하시겠습니까?")){
				document.frm.action = "/gnoincoundb/center_mng_write.do";
		       	document.frm.submit();
			}
		} else {
			if(confirm("수정 하시겠습니까?")){
				document.frm.action = "/gnoincoundb/center_mng_write.do?num="+num;
		       	document.frm.submit();
			}
		}
		
	}  	
	function fn_list(mnuCd){
		document.location.href = "/gnoincoundb/center_mng_list.do?mnuCd=" + mnuCd;
		/* document.location.href = "/counsellor_mngList.do?mnuCd=" + mnuCd; */
	}  	
	
	function fn_clear() {
		/* $(':text:not([id=searchText])').val('');
		$("#hMnuCd").html("<option value='' selected='selected' >선택</option>");
		$("#mnuNo").val(0);
		$('select').each(function() {
			$(this).find('option:first').attr('selected', 'true');
		}); */
		/* $("#zoneGb").val("");
		$("#localGb").val("");
		$("#centerNm").val("");
		$("#addr").val("");
		$("#homepage").val("");
		$("#tel").val("");
		$("#ctDesc").val("");
		$("#etc").val("");
		$("#centerCheck").val("");
		$("input:radio[name=useYn]").removeAttr('checked'); */
		
		location.href = "/gnoincoundb/center_mng_dtl.do?mnuCd=M0102";
		
	}
	
	function zoneList() {
		var param = $("#searchForm").serialize(); //ajax로 넘길 data
		var token = $("meta[name='_csrf']").attr("th:content");
		var header = $("meta[name='_csrf_header']").attr("th:content");
		// var schZoneGb = $('input:select[name=schZoneGb]:checked').val();
		// var schSigunNm = $('input:select[name=schSigunNm]:checked').val();
		// var param = {hworkId : hworkId , userId : userId};
		$.ajax({
			type : "POST",
			url : "/gnoincoundb/center_mng_dtl_ajax.do",
			data : param,
			dataType : "json",
			beforeSend : function(xhr){
				xhr.setRequestHeader(header, token);
			},
			success : function(json) {
				var html = '';
				$.each(json.list, function(i, d) {
					html += '<tr>';
					html += '<td>' + d.zoneGb + '</td>';
					html += '<td>' + d.sigunNm + '</td>';
					html += '</tr>';
				});
				if (json.list.length == 0) {
					html += '<tr><td colspan="2">정보가 없습니다.</td></tr>';
				}
				$("#tby1").html(html);
	
				/* var p = json.paginationInfo;
	        	var pageView = Paging(p.totalRecordCount,10,10,
	        			p.currentPageNo ,'list' ,1);
	        	$("#page1").empty().html(pageView); */
			},
			error : function(e) {
				alert("서버와 통신 오류입니다.");
			}
		});
	}
	
	// 센터명 중복확인
	function fn_centerCheck() {
		var param = $("#centerNm").val();
		var token = $("meta[name='_csrf']").attr("th:content");
		var header = $("meta[name='_csrf_header']").attr("th:content");
		if(param.replace(/ /gi, "").length == 0){
			alert("센터명을 입력해주세요.");
			return;
		}
		$.ajax({
			type : "POST",
			url : "/gnoincoundb/centerCheck_ajax.do",
			data : {centerNm:param},
			dataType : "json",
			beforeSend : function(xhr){
				xhr.setRequestHeader(header, token);
			},
			success : function(json) {
				var msg = json.msg;
				centerCheck = json.centerCheck;
				alert(msg);
				if(centerCheck == "Y") {
					$("#centerCheck").val("Y");
					$("#centerNm").attr("readonly",true);
				}
			},
			error : function(e) {
				alert("서버와 통신 오류입니다.");
			}
		});
		
	}
	
</script>
<style>
	.table-style1 input {width:150px;}
	/* td:nth-child(even){text-align:left;} */
	/* td:nth-child(odd){text-align:left;} 홀수 이벤트*/
</style>
<section id="content">
	<h2 class="h2-title"><i class="fa fa-check-square"></i>
		<c:if test="${empty detail.centerNm }">센터정보 등록</c:if>
		<c:if test="${!empty detail.centerNm }">센터 상세보기</c:if>
	</h2>
	<div class="box-style1 x-scroll-auto" >
		<input type="hidden" id="centerCheck" value=""/>
		<form id="frm" name="frm" method="post">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			<input type="hidden" id="mnuCd" name="mnuCd" value="${mnuCd }" />
			<table class="table-write mg-t5" style="width:800px;">
				<colgroup>
					<col width="20%" />
					<col width="*" />
				</colgroup>
				<tr>
					<th>권역구분</th>
					<td>
						 <select id="zoneGb" name="zoneGb" style="width:275px;">
						 	<option value="">전체</option>
						 	<c:forEach items="${zoneGbList }" var="result">
						 		<option value="${result.odr }">${result.mclassNm }</option>
						 	</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<th>시∙군</th>
					<td>
						<select id="localGb" name="localGb" style="width:275px;">
							<option value="">전체</option>
						 	<c:forEach items="${localGbList }" var="result">
						 		<option value="${result.odr }">${result.mclassNm }</option>
						 	</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<th>센터명</th>
					<td>
						<input type="text" id="centerNm" name="centerNm" maxlength="20" style="width:350px;" oninput="this.value = this.value.replace(/[^ㄱ-힣a-zA-Z]/, '');" value="${detail.centerNm }" />
						<button type="button" class="btn-basic" style="line-height: 17px;" onclick="fn_centerCheck()">중복확인</button>
					</td>
				</tr>
				<tr>
					<th>주소</th>
					<td><input type="text" id="addr" name="addr" maxlength="40" value="${detail.addr }"/></td>
				</tr>
				<tr>
					<th>홈페이지</th>
					<td style="text-align: left;">
						<input type="text" id="homepage" name="homepage" maxlength="150" style="width:350px;" value="${detail.homepage }"/>
						<c:if test="${!empty detail.centerNm }">
							<button type="button" class="btn-basic" style="line-height: 17px;" onclick="location.href='https://${detail.homepage}';">새창열기</button>
						</c:if>
					</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td><input type="text" id="email" name="email" maxlength="30" value="${detail.email }"/></td>
				</tr>				
				<tr>
					<th>전화번호</th>
					<td><input type="text" id="tel" name="tel" maxlength="12" onlyNumber value="${detail.tel }"/></td>
				</tr>
				<tr>
					<th>FAX</th>
					<td><input type="text" id="fax" name="fax" maxlength="20" onlyNumber value="${detail.fax }"/></td>
				</tr>
				<tr>
					<th>설명</th>
					<td><input type="text" id="desc" name="ctDesc" maxlength="500" value="${detail.ctDesc }"/></td>
				</tr>
				<tr>
					<th>기타</th>
					<td><input type="text" id="etc" name="etc" maxlength="500" value="${detail.etc }"/></td>
				</tr>
				<tr>
					<th>사용여부</th>
					<td>
						<input type="radio" id="useYn1" name="useYn" value="Y"><label for="useYn1" style="margin-left: 5px; margin-right: 5px;">사용</label>
						<input type="radio" id="useYn2" name="useYn" value="N"><label for="useYn2" style="margin-left: 5px; margin-right: 5px;">미사용</label>
					</td>
				</tr>
			</table>
		</form>
		<div class="btn" style="text-align: right; display: block; width: 49.9%;">
			<button type="button" class="btn-basic" onClick="javascript:fn_clear();"><i class="fa fa-repeat"></i>초기화</button>
			<c:choose>
				<c:when test="${empty detail.centerNm }">
					<button type="button" class="btn-basic" onClick="javascript:fn_reg('S');" style="background-color:#fc692f;color:white;">저장</button>					
				</c:when>
				<c:when test="${!empty detail.centerNm }">
					<button type="button" class="btn-basic" onClick="javascript:fn_reg('${num }');" style="background-color:#fc692f;color:white;">수정</button>					
				</c:when>
			</c:choose>
			<button type="button" class="btn-basic" onClick="javascript:fn_list('${mnuCd }');"<%-- onClick="javascript:fn_list('${mnuCd}');" --%> style="background-color:#fc692f;color:white;">목록</button>
		</div>	
	</div>
</section>
</html>