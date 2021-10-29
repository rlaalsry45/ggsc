<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<link href="/gnoincoundb/css/style.css" rel="stylesheet">
<script src="/gnoincoundb/editor/js/summernote_0.8.3.js"></script>
<script src="/gnoincoundb/editor/js/summernote_0.8.3.min.js"></script>
<script src="/gnoincoundb/editor/lang/summernote-ko-KR.js"></script>
<script src="/gnoincoundb/editor/js/bootstrap_3.3.5.js"></script>
<link rel="stylesheet" href="/gnoincoundb/editor/css/summernote_0.8.3.css">
<link rel="stylesheet" href="/gnoincoundb/editor/css/bootstrap_3.3.5.css">

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
	  $("#writer").focus();
	});
	
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
	
	function fn_reg(){
		
		var writer = $("#nWriter").val().replace(/ /gi, "");
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
		}
		
		if(confirm("등록 하시겠습니까?")){
			document.frm.action = "/gnoincoundb/noticeWrite.do";
	       	document.frm.submit();
		}
		
	}  	
	function fn_list(mnuCd){
		document.location.href = "/gnoincoundb/noticeList.do?mnuCd=" + mnuCd;
	}  	
</script>
<section id="content">
	<h2 class="h2-title"><i class="fa fa-check-square"></i>공지사항 등록</h2>
	<form id="frm" name="frm" method="post" encType="multipart/form-data">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		<input type="hidden" id="mnuCd" name="mnuCd" value="${mnuCd }" />
		<table class="table-write" >
			<colgroup>
				<col width="10%" />
				<col width="*" />		
			</colgroup>
			<tr>
				<th>작성자</th>
				<td><input type="text" id="nWriter" name="writer" maxlength="20"/></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" id="nTitle" name="title" maxlength="100" /></td>
			</tr>
			<tr>
				<th>내용</th>
				<td style="text-align: left;"><textarea id="cntn" name="cntn" cols="100" rows="20"></textarea></td>
			</tr>
			<tr>
				<th>첨부</th>
				<td><input type="file" name="file" /></td>
			</tr>
		</table>
	</form>
	<div class="btn" style="text-align: right; display: block;">
		<button type="button" class="btn-default" onClick="javascript:fn_reg();" style="background-color:#fc692f;color:white;">등록</button>
		<button type="button" class="btn-default" onClick="javascript:fn_list('${mnuCd}');" style="background-color:#fc692f;color:white;">목록</button>
	</div>	
</section>
</html>