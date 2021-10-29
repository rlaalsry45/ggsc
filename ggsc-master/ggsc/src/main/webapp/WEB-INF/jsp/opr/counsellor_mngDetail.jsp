<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="_csrf" th:content="${_csrf.token}"/>
<meta name="_csrf_header" th:content="${_csrf.headerName}"/>
<link href="/gnoincoundb/css/style.css" rel="stylesheet">
<script src="/gnoincoundb/js/jquery-1.11.2.min.js" ></script>
<script src="/gnoincoundb/editor/js/summernote_0.8.3.js"></script>
<script src="/gnoincoundb/editor/js/summernote_0.8.3.min.js"></script>
<script src="/gnoincoundb/editor/lang/summernote-ko-KR.js"></script>
<script src="/gnoincoundb/editor/js/bootstrap_3.3.5.js"></script>
<link rel="stylesheet" href="/gnoincoundb/editor/css/summernote_0.8.3.css">
<link rel="stylesheet" href="/gnoincoundb/editor/css/bootstrap_3.3.5.css">
<title>상담사 등록</title>
</head>

<script type="text/javascript">
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
	
	function fn_reg(){
		
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
			document.frm.action = "/gnoincoundb/counsellor_mngWrite.do";
	       	document.frm.submit();
		}
		
	}  	
	function fn_list(){
		document.location.href = "/gnoincoundb/counsellor_mngList.do"
		/* document.location.href = "/counsellor_mngList.do?mnuCd=" + mnuCd; */
	}  	
</script>
<style>
	.table-style1 input {width:150px;}
	td:nth-child(even){text-align:left;}
	/* td:nth-child(odd){text-align:left;} 홀수 이벤트*/
</style>
<section id="content">
	<h2 class="h2-title"><i class="fa fa-check-square"></i>상담사 상세보기</h2>
	<form id="frm" name="frm" method="post">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		<%-- <input type="hidden" id="mnuCd" name="mnuCd" value="${mnuCd }" /> --%>
		<table class="table-style1" >
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
				<td><input type="text" id="cnsrNm" name="cnsrNm" maxlength="20" value="${detail.centerGb }"/></td>
			</tr>
			<tr>
				<td>생년월일</td>
				<td><input type="text" id="birthDt" name="birthDt" maxlength="20" value="${detail.centerGb }"/></td>
				<td>연령</td><!-- 연령 컬럼이 뭔지 모르겠음  -->
				<td><!-- <input type="text" id="birthDt" name="birthDt" maxlength="20"/> --></td>
			</tr>
			<tr>
				<td>고용형태</td>
				<td style="text-align: left;"><input type="text" id="emplType" name="emplType" maxlength="1" value="${detail.centerGb }"/></td>
				<td>계약기간</td>
				<td>
					<input type="text" id="contTermStd" name="contTermStd" maxlength="16" value="${detail.centerGb }"/> ~
					<input type="text" id="contTermEnd" name="contTermEnd" maxlength="16" value="${detail.centerGb }"/>
				</td>
			</tr>
			<tr>
				<td>학력</td>
				<td><input type="text" id="edu" name="edu" maxlength="10" value="${detail.centerGb }"/></td>
				<td>전공</td>
				<td><input type="text" id="major" name="major" maxlength="20" value="${detail.centerGb }"/></td>
			</tr>
			<tr>
				<td>선임유무</td>
				<td style="text-align: left;"><input type="text" id="pdsrYn" name="pdsrYn" maxlength="1" value="${detail.centerGb }"/></td>
				<td>인정호봉<br>(2020년 2월기준)</td>
				<td><input type="text" id="acptPaystep" name="acptPaystep" maxlength="11" value="${detail.centerGb }"/></td>
			</tr>
			<tr>
				<td>운용보고기준 채용자격</td>
				<td style="text-align: left;"><input type="text" id="mtncStndRigt" name="mtncStndRigt" maxlength="30" value="${detail.centerGb }"/></td>
				<td>입사년월일</td>
				<td><input type="text" id="joinDt" name="joinDt" maxlength="20" value="${detail.centerGb }"/></td>
			</tr>
			<tr>
				<td>고용일자<br>(날짜수정시 근무경력 자동계산)</td>
				<td style="text-align: left;"><input type="text" id="emplDt" name="emplDt" maxlength="20" value="${detail.centerGb }"/></td>
				<td>한기관 근무경력</td>
				<td><input type="text" id="oneOrgCareer" name="oneOrgCareer" maxlength="20" value="${detail.centerGb }"/></td>
			</tr>
			<tr>
				<td>사회복지사자격증</td>
				<td style="text-align: left;" colspan="3"><input type="text" id="socialWorkProv" name="socialWorkProv" maxlength="20" value="${detail.centerGb }"/></td>
			</tr>
			<tr>
				<td>상담자격증<br>(상담전문확회및국가자격기준)</td>
				<td style="text-align: left;" colspan="3"><input type="text" id="cnsProv" name="cnsProv" maxlength="20" value="${detail.centerGb }"/></td>
			</tr>
		</table>
	</form>
	<div class="btn" style="text-align: right; display: block;">
		<button type="button" class="btn-default" onClick="javascript:fn_reg();" style="background-color:#fc692f;color:white;">등록</button>
		<button type="button" class="btn-default" onClick="javascript:fn_list();"<%-- onClick="javascript:fn_list('${mnuCd}');" --%> style="background-color:#fc692f;color:white;">목록</button>
	</div>	
</section>
</html>