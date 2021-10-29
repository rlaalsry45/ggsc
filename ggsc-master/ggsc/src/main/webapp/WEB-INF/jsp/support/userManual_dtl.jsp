<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link href="/gnoincoundb/css/style.css" rel="stylesheet">
<script src="/gnoincoundb/editor/js/summernote_0.8.3.js"></script>
<script src="/gnoincoundb/editor/js/summernote_0.8.3.min.js"></script>
<script src="/gnoincoundb/editor/lang/summernote-ko-KR.js"></script>
<script src="/gnoincoundb/editor/js/bootstrap_3.3.5.js"></script>
<link rel="stylesheet" href="/gnoincoundb/editor/css/summernote_0.8.3.css">
<link rel="stylesheet" href="/gnoincoundb/editor/css/bootstrap_3.3.5.css">

<script type="text/javascript">
	$(document).ready(function() {
	   $('#rcontent').summernote({
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
	   $("#rcontent").focus();
	   $("#downBtn").css("display", "none");
	  
	   var writer = "${detail.writer}";
	   if(writer != "") {
		   $("#saveBtn").css("display", "none");
	   } else {
		   $("#updateBtn").css("display", "none");
	   }
	  
	   var fileTarget1 = $('#file'); 
	   fileTarget1.on('change', function(){
		    var cur1=$("#file").val();
			$("#upNm1").val(cur1);
		});
		
		var fileNm = "${detail.fileNm}";
		if(fileNm != "") {
			$("#upNm1").val(fileNm);
			$("#downBtn").css("display", "inline-block");
		}
	  
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
	
	function fn_reg(param){
		
		var title = $('input[name=title]').val();
		var rcontent = $("#rcontent").val();
		if(title == "") {
			alert("제목을 입력해 주세요.");
			$("#title").focus();
			return;
		}
		if(rcontent == ""){
			alert("내용을 입력해 주세요.");
			$("#rcontent").focus();
			return;
		}
		if(rcontent.length > 500){
			alert("내용을 500자 이내로 입력해 주세요.");
			$("#rcontent").focus();
			return;
		}
		if(param == "S") {
			if(confirm("등록 하시겠습니까?")){
				$("#num").val(0);
				document.frm.action = "/gnoincoundb/userManualReg.do?save="+param;
		       	document.frm.submit();
			}
		} else if(param == "U") {
			if(confirm("수정 하시겠습니까?")){
				document.frm.action = "/gnoincoundb/userManualReg.do?save="+param;
		       	document.frm.submit();
			}
		}
		
	}  	
	function fn_list(mnuCd){
		document.location.href = "/userManualList.do?mnuCd=" + mnuCd;
	}  	
	
	function fn_down(fileNm, sysFileNm, filePath){
		$("#fileNm").val(fileNm);
		$("#sysFileNm").val(sysFileNm);
		$("#filePath").val(filePath);
		document.downForm.action = "/gnoincoundb/fileDown.do";
       	document.downForm.submit();
	}
</script>
<style>
	.filebox input[type="file"] {
	    position: absolute;
	    width: 0;
	    height: 0;
	    padding: 0;
	    overflow: hidden;
	    border: 0;
	}
	.filebox label {
	    display: inline-block;
	    padding: 2px 20px;
	    color: #999;
	    vertical-align: middle;
	    background-color: #fdfdfd;
	    cursor: pointer;
	    border: 1px solid #ebebeb;
	    border-radius: 5px;
	}
	
	/* named upload */
	.filebox .upload-name {
	    display: inline-block;
	    height: 25px;
	    font-size:18px; 
	    padding: 0 10px;
	    vertical-align: middle;
	    background-color: #f5f5f5;
	    border: 1px solid #ebebeb;
	    border-radius: 5px;
	    width: 600px;
	}
</style>
<section id="content">
	<h2 class="h2-title"><i class="fa fa-check-square"></i>
		<c:if test="${empty detail.num }">사용자매뉴얼 등록</c:if>
		<c:if test="${!empty detail.num }">사용자매뉴얼 상세 및 수정</c:if>
	</h2>
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
		<table class="table-write">
			<colgroup>
				<col width="10%" />
				<col width="*" />		
			</colgroup>
			<tr>
				<th>매뉴얼 제목</th>
				<td><input type="text" id="title" name="title" maxlength="50" value="${detail.title }"/></td>
			</tr>
			<tr>
				<th>설명</th>
				<td style="text-align: left;"><textarea id="rcontent" name="content" cols="100" rows="20"><c:out value="${detail.content }" escapeXml="false"/></textarea></td>
			</tr>
			<tr>
				<th>첨부파일</th>
				<td>
					<div class="filebox"> 
						<input type="file" id="file" name="file"> 
						<input class="upload-name" id="upNm1" value="파일선택">
						<label class="btn-basic" style="background-color: gray;color:white;" for="file">찾기</label> 
						<button type="button" id="downBtn" class="btn-basic" style="background-color: green; color: white; height: 29px;" onclick="javascript:fn_down('${detail.fileNm}', '${detail.sysFileNm }', '${detail.filePath }')">다운로드</button>
					</div>
				</td>
			</tr>
		</table>
	</form>
	<div class="btn" style="text-align: right; display: block;">
		<button type="button" class="btn-basic" id="saveBtn" onClick="javascript:fn_reg('S');" style="background-color:green;color:white;">등록</button>
		<c:if test="${ vo.authCd <= 4 && userId == detail.regId || vo.authCd eq 1 }">
			<button type="button" class="btn-basic" id="updateBtn" onClick="javascript:fn_reg('U');" style="background-color:green;color:white;">수정</button>
		</c:if>
		<button type="button" class="btn-basic" onClick="javascript:fn_list('${mnuCd}');" style="background-color:#fc692f;color:white;">목록</button>
	</div>	
</section>
</html>