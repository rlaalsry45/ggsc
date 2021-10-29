<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 
<link href="/gnoincoundb/css/style.css" rel="stylesheet">
<script src="/gnoincoundb/editor/js/bootstrap_3.3.5.js"></script>
<script src="/gnoincoundb/js/jSignature.min.js"></script>
<link rel="stylesheet" href="/gnoincoundb/editor/css/bootstrap_3.3.5.css">
<script src="/gnoincoundb/editor/js/summernote_0.8.3.js"></script>
<script src="/gnoincoundb/editor/js/summernote_0.8.3.min.js"></script>
<script src="/gnoincoundb/editor/lang/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="/gnoincoundb/editor/css/summernote_0.8.3.css">

<script type="text/javascript">
	$(document).ready(function() {
		 $('#cntn').summernote({
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
	});
	
	function fn_reg(){
		
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
		

		if(confirm("등록 하시겠습니까?")){
			document.frm.action = "/gnoincoundb/mailReg.do";
	       	document.frm.submit();
		}
	}  	
	function fn_list(){
		document.location.href = "/gnoincoundb/mailList.do?mnuCd=${mnuCd}";
	}  	

	function uploadImgFile(file, editor){
		var token = $("meta[name='_csrf']").attr("th:content");
		var header = $("meta[name='_csrf_header']").attr("th:content");
		
		data = new FormData();
        data.append("file", file);
        $.ajax({
            data : data,
            type : "POST",
            url : "/gnoincoundb/ImageUpload.do",
            enctype : "multipart/form-data",
            contentType : false,
            processData : false,
            beforeSend : function(xhr){
		           xhr.setRequestHeader(header, token);
		    },
            success : function(data) {
            	 $(editor).summernote('insertImage', "/gnoincoundb/getImage.do?fileNm=" + data.url);
                 //$("#imgPath").val(data.url);

                
            }
        });
	}
</script>

<section id="content">
	<h2 class="h2-title"><i class="fa fa-check-square"></i>
		<c:if test="${empty detail.num }">메일발송관리 - 등록</c:if>
		<c:if test="${!empty detail.num }">메일발송관리 - 상세</c:if>
	</h2>
	<form id="frm" name="frm" method="post">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		<input type="hidden" id="mnuCd" name="mnuCd" value="${mnuCd }" />
		<input type="hidden" id="num" name="num" value="${detail.num }" />
		<input type="hidden" id="filePath" name="filePath" />
		<table class="table-write" >
			<colgroup>
				<col width="15%" />
				<col width="35%" />		
				<col width="15%" />		
				<col width="35%" />		
			</colgroup>
			<tr>
				<th>발송일자</th>
				<td>${curDate }</td>
				<th>발송자</th>
				<td>${loginVo.userNm }</td>
			</tr>
			<tr>
				<th>제목</th>
				<td colspan="3" style="text-align: left;"><input type="text" id="mTitle" name="title" /></td>
			</tr>
			<tr>
				<th>발송목록</th>
				<td colspan="3"><textarea id="rcpt" name="rcpt" cols="100" rows="5"></textarea></td>
			</tr>
			<tr>
				<th>첨부파일</th>
				<td colspan="3"><input type="file" /></td>
			</tr>
			<tr>
				<th>내용</th>
				<td colspan="3" style="text-align: left;"><textarea id="cntn" name="cntn" cols="100" rows="20"></textarea></td>
			</tr>
		</table>
	</form>
	<div class="btn" style="text-align: right; display: block;">
		<button type="button" class="btn-basic" id="saveBtn" onClick="javascript:fn_reg();" style="background-color:#green;color:white;">발송</button>
		<button type="button" class="btn-basic" onClick="javascript:fn_list();" style="background-color:#fc692f;color:white;">목록</button>
	</div>	
</section>
</html>