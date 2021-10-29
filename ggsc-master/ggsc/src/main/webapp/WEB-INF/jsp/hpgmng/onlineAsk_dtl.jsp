<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="/gnoincoundb/css/style.css" rel="stylesheet">
<%-- <script src="/gnoincoundb/editor/js/summernote_0.8.3.js"></script>
<script src="/gnoincoundb/editor/js/summernote_0.8.3.min.js"></script>
<script src="/gnoincoundb/editor/lang/summernote-ko-KR.js"></script>
<script src="/gnoincoundb/editor/js/bootstrap_3.3.5.js"></script>
<link rel="stylesheet" href="/gnoincoundb/editor/css/summernote_0.8.3.css">
<link rel="stylesheet" href="/gnoincoundb/editor/css/bootstrap_3.3.5.css"> --%>

<script type="text/javascript">
	$(document).ready(function() {
	   var ansCntn = "${detail.ansCntn}";
	   if(ansCntn != "") {
		   $("#saveBtn").css("display", "none");
	   } else {
		   $("#updateBtn").css("display", "none");
	   }
	  
	});
	
	function fn_reg(param){
		
		/* var writer = $("#nWriter").val().replace(/ /gi, "");
		var title = $("#nTitle").val().replace(/ /gi, "");
		var cntn = $("#cntn").val().replace(/ /gi, "");
		
		if(writer.length == 0){
			alert("작성자를 입력해 주세요.");
			$("#nWriter").focus();
			return;
		}
		if(title.length == 0){
			alert("제목을 입력해 주세요.");
			$("#nTitle").focus();
			return;
		}
		if(cntn.length == 0){
			alert("내용을 입력해 주세요.");
			$("#cntn").focus();
			return;
		} */
		if(param == "S") {
			if(confirm("등록 하시겠습니까?")){
				document.frm.action = "/gnoincoundb/onlineAskReg.do?save=" +param;
		       	document.frm.submit();
			}
		} else if(param == "U") {
			if(confirm("수정 하시겠습니까?")){
				document.frm.action = "/gnoincoundb/onlineAskReg.do?save=" +param;
		       	document.frm.submit();
			}
		}
		
	}  	
	function fn_list(mnuCd){
		document.location.href = "/gnoincoundb/onlineAskList.do?mnuCd=" + mnuCd;
	}  	
</script>
<section id="content">
	<h2 class="h2-title"><i class="fa fa-check-square"></i>
		온라인상담 상세 및 답변 등록
	</h2>
	<form id="frm" name="frm" method="post">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		<input type="hidden" id="mnuCd" name="mnuCd" value="${mnuCd }" />
		<input type="hidden" id="currentPageNo" name="currentPageNo" value="${currentPageNo }" />
		<input type="hidden" id="num" name="num" value="${detail.num }" />
		<table class="table-write" >
			<colgroup>
				<col width="10%" />
				<col width="*" />		
			</colgroup>
			<tr>
				<th>작성자</th>
				<td>${detail.writer }</td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" id="title" name="title" maxlength="50" value="${detail.title }"/></td>
			</tr>
			<tr>
				<th>내용</th>
				<td style="text-align: left;"><textarea id="rcontent" name="cntn" cols="100" rows="20"><c:out value="${detail.cntn}" escapeXml="false" /></textarea></td>
				
			</tr>
			<tr>
				<th>답변</th>
				<td style="text-align: left;"><textarea id="ansCntn" name="ansCntn" cols="100" rows="20"><c:out value="${detail.ansCntn}" escapeXml="false" /></textarea></td>
			</tr>
		</table>
	</form>
	<div class="btn" style="text-align: right; display: block;">
		<button type="button" class="btn-basic" id="saveBtn" onClick="javascript:fn_reg('S');" style="background-color:#fc692f;color:white;">등록</button>
		<c:if test="${ vo.authCd <= 3 }">
			<button type="button" class="btn-basic" id="updateBtn" onClick="javascript:fn_reg('U');" style="background-color:#fc692f;color:white;">수정</button>
		</c:if>
		<button type="button" class="btn-basic" onClick="javascript:fn_list('${mnuCd}');" style="background-color:#fc692f;color:white;">목록</button>
	</div>	
</section>
</html>