<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="_csrf" th:content="${_csrf.token}"/>
<meta name="_csrf_header" th:content="${_csrf.headerName}"/>
<title>상담사 등록</title>
</head>

<script type="text/javascript">
	$(document).ready(function() {
	  	var cnsrCd = "${detail.cnsrCd}";
	  	if(cnsrCd.length > 0) {
	  		$("input:radio[name=pdsrYn]").removeAttr('checked');
			$('input:radio[name=pdsrYn]:radio[value=' + '${detail.pdsrYn}' + ']').prop("checked", true);
	  	}
	});
	/* $(document).ready(function() {
	  $('#brdContent').summernote({
	        minHeight: 400,
	        maxHeight: null,
	        focus: true, 
	        lang : 'ko-KR',
	        callbacks: {	//이미지 첨부하는 부분
	        	onImageUpload : function(files) {
	        		for (var i = files.length - 1; i >= 0; i--) {
	        			uploadImgFile(files[i], this);
	                  }
	        	}
	        }
	  });
	  $("#brdWriter").focus();
	});
	
	function uploadImgFile(file, editor){
		data = new FormData();
        data.append("file", file);
        $.ajax({
            data : data,
            type : "POST",
            url : "/uploadImgFile.do",
            enctype : "multipart/form-data",
            contentType : false,
            processData : false,
            success : function(data) {
            	 $(editor).summernote('insertImage', "/getImage.do?fileNm=" + data.url);
                 //$("#imgPath").val(data.url);


            }
        });
	} */
	
	function fn_reg(cnsrCd){
		
		/* var writer = $("#brdWriter").val().replace(/ /gi, "");
		var title = $("#brdTitle").val().replace(/ /gi, "");
		var contents = $("#brdContent").val().replace(/ /gi, ""); */
		
		/* if(writer.length == 0){
			alert("작성자를 입력해 주세요.");
			$("#brdWriter").focus();
			return;
		}
		if(title.length == 0){
			alert("제목을 입력해 주세요.");
			$("#brdTitle").focus();
			return;
		}
		if(contents.length == 0){
			alert("내용을 입력해 주세요.");
			$("#brdContent").focus();
			return;
		} */
		
		if(confirm("등록 하시겠습니까?")){
			document.frm.action = "/gnoincoundb/counsellor_mngWrite.do?cnsrCd=" +cnsrCd;
	       	document.frm.submit();
		}
		
	}  	
	function fn_list(mnuCd){
		document.location.href = "/gnoincoundb/counsellor_mng_list.do?mnuCd=" + mnuCd;
		/* document.location.href = "/counsellor_mngList.do?mnuCd=" + mnuCd; */
	}  	
	
	function fn_clear() {
		/* $(':text:not([id=searchText])').val('');
		$("#hMnuCd").html("<option value='' selected='selected' >선택</option>");
		$("#mnuNo").val(0);
		$('select').each(function() {
			$(this).find('option:first').attr('selected', 'true');
		}); */
		$("#centerGb").val("");
		$("#cnsrNm").val("");
		$("#birthDt").val("");
		$("#emplType").val("");
		$("#contTermStd").val("");
		$("#contTermEnd").val("");
		$("#edu").val("");
		$("#major").val("");
		$("#pdsrYn").val("");
		$("#acptPaystep").val("");
		$("#mtncStndRigt").val("");
		$("#joinDt").val("");
		$("#emplDt").val("");
		$("#oneOrgCareer").val("");
		$("#socialWorkProv").val("");
		$("#cnsProv").val("");
		$("input:radio[name=pdsrYn]").removeAttr('checked');
	}
	
</script>
<style>
	.table-style1 input {width:150px;}
	td:nth-child(even){text-align:left;}
	/* td:nth-child(odd){text-align:left;} 홀수 이벤트*/
</style>
<section id="content">
	<h2 class="h2-title"><i class="fa fa-check-square"></i>
		<c:if test="${empty detail.cnsrCd }">상담사 등록</c:if>
		<c:if test="${!empty detail.cnsrCd }">상담사 상세보기</c:if>
	</h2>
	<form id="frm" name="frm" method="post">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		<%-- <input type="hidden" id="cnsrCd" name="cnsrCd" value="${cnsrCd}"> --%>
		<input type="hidden" id="mnuCd" name="mnuCd" value="${mnuCd }" />
		<table class="table-write mg-t5">
			<colgroup>
				<col width="10%" />
				<col width="*" />
				<col width="10%" />
				<col width="*" />		
			</colgroup>
			<tr>
				<td>센터구분</td>
				<td><input type="text" id="centerGb" name="centerGb" maxlength="20" value="${detail.centerGb }"/></td>
				<td>담당자</td>
				<td><input type="text" id="cnsrNm" name="cnsrNm" maxlength="20" value="${detail.cnsrNm }"/></td>
			</tr>
			<tr>
				<td>생년월일</td>
				<td><input type="text" id="birthDt" name="birthDt" maxlength="20" value="${detail.birthDt }"/></td>
				<td>연령</td><!-- 연령 컬럼이 뭔지 모르겠음  -->
				<td><!-- <input type="text" id="birthDt" name="birthDt" maxlength="20"/> --></td>
			</tr>
			<tr>
				<td>고용형태</td>
				<td style="text-align: left;"><input type="text" id="emplType" name="emplType" maxlength="1" value="${detail.emplType }"/></td>
				<td>계약기간</td>
				<td>
					<input type="text" id="datepicker1" name="contTermStd" class="input-datepicker1" value="${detail.contTermStd }"> ~
					<input type="text" id="datepicker2" name="contTermEnd" class="input-datepicker2" value="${detail.contTermEnd }">
				</td>
			</tr>
			<tr>
				<td>학력</td>
				<td><input type="text" id="edu" name="edu" maxlength="10" value="${detail.edu }"/></td>
				<td>전공</td>
				<td><input type="text" id="major" name="major" maxlength="20" value="${detail.major }"/></td>
			</tr>
			<tr>
				<td>선임유무</td>
				<td style="text-align: left;">
					<input type="radio" id="pdsrYn" name="pdsrYn" value="Y"/> 유
					<input type="radio" id="pdsrYn" name="pdsrYn" value="N"/> 무
				</td>
				<td>인정호봉<br>(2020년 2월기준)</td>
				<td><input type="text" id="acptPaystep" name="acptPaystep" maxlength="11" value="${detail.acptPaystep }"/></td>
			</tr>
			<tr>
				<td>운용보고기준 채용자격</td>
				<td style="text-align: left;"><input type="text" id="mtncStndRigt" name="mtncStndRigt" maxlength="30" value="${detail.mtncStndRigt }"/></td>
				<td>입사년월일</td>
				<td><input type="text" id="datepicker3" name="joinDt" class="input-datepicker2" value="${detail.joinDt }"></td>
			</tr>
			<tr>
				<td>고용일자<br>(날짜수정시 근무경력 자동계산)</td>
				<td style="text-align: left;"><input type="text" id="emplDt" name="emplDt" maxlength="20" value="${detail.emplDt }"/></td>
				<td>한기관 근무경력</td>
				<td><input type="text" id="oneOrgCareer" name="oneOrgCareer" maxlength="20" value="${detail.oneOrgCareer }"/></td>
			</tr>
			<tr>
				<td>사회복지사자격증</td>
				<td style="text-align: left;" colspan="3"><input type="text" id="socialWorkProv" name="socialWorkProv" maxlength="20" value="${detail.socialWorkProv }"/></td>
			</tr>
			<tr>
				<td>상담자격증<br>(상담전문확회및국가자격기준)</td>
				<td style="text-align: left;" colspan="3"><input type="text" id="cnsProv" name="cnsProv" maxlength="20" value="${detail.cnsProv }"/></td>
			</tr>
		</table>
	</form>
	<div class="btn" style="text-align: right; display: block;">
		<button type="button" class="btn-basic" onClick="javascript:fn_clear();"><i class="fa fa-repeat"></i>초기화</button>
		<button type="button" class="btn-default" onClick="javascript:fn_reg('${cnsrCd}');" style="background-color:#fc692f;color:white;">저장</button>
		<button type="button" class="btn-default" onClick="javascript:fn_list('${mnuCd }');"<%-- onClick="javascript:fn_list('${mnuCd}');" --%> style="background-color:#fc692f;color:white;">목록</button>
	</div>	
</section>
</html>