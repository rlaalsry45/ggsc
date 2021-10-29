<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link href="/gnoincoundb/css/style.css" rel="stylesheet">
<script src="/gnoincoundb/js/util/paging.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
		/*
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
	  */
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
		}
	  
	});
	/*
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
	}
	*/
	
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
				document.frm.action = "/gnoincoundb/surveyMngReg.do?save="+param;
		       	document.frm.submit();
			}
		} else if(param == "U") {
			if(confirm("수정 하시겠습니까?")){
				document.frm.action = "/gnoincoundb/surveyMngReg.do?save="+param;
		       	document.frm.submit();
			}
		}
		
	}  	
	function fn_list(mnuCd){
		document.location.href = "/gnoincoundb/surveyMngList.do?mnuCd=" + mnuCd;
	}  	
	
	var count = 1;
	function fn_appendTr() {
	    var time = new Date().toLocaleTimeString();
	    count ++;
	    $("#survTb > tbody:last").append("<tr><th>항목"+count+"</th><td><input type='text' style='width: 250px;' />&nbsp;&nbsp;<button type='button' class='btn-default' id='addBtn' onClick='javascript:fn_removeTr();' style='background-color:#FF2424;color:white;'>제거</button></td></tr>");
	}
	
	function fn_removeTr() {
		count --;
	    $("#survTb tr:last").remove();		
	}
	  
</script>
<section id="content">
	<h2 class="h2-title"><i class="fa fa-check-square"></i>
		<c:if test="${empty detail.num }">설문관리 등록</c:if>
		<c:if test="${!empty detail.num }">설문관리 상세 및 수정</c:if>
	</h2>
	<form id="frm" name="frm" method="post" encType="multipart/form-data">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		<input type="hidden" id="mnuCd" name="mnuCd" value="${mnuCd }" />
		<input type="hidden" id="num" name="num" value="${detail.num }" />
		<table class="table-write" id="survTb">
			<colgroup>
				<col width="10%" />
				<col width="*" />		
			</colgroup>
			<tbody>
				<tr>
					<th>제목</th>
					<td><input type="text" id="title" name="title" maxlength="50" value="${detail.title }"/></td>
				</tr>
				<tr>
					<th>작성자</th>
					<td><c:out value="${writer }"/></td>
				</tr>
				<tr>
					<th>설문기간</th>
					<td>
						<input type="text" name="srvPriStd" id="datepicker1" value="${detail.srvPriStd }" style="width: 100px;" readonly/> &nbsp;&nbsp;&nbsp; ~ &nbsp;<input type="text" name="srvPriEnd" id="datepicker2" value="${detail.srvPriEnd }" style="width: 100px;" readonly/>
					</td>
				</tr>
				<tr>
					<th>설명</th>
					<td style="text-align: left;"><textarea id="rcontent" name="cntn" cols="100" rows="20"><c:out value="${detail.cntn }" escapeXml="false"/></textarea></td>
				</tr>
				<!-- <tr>
					<th>항목</th>
					<td><input type="text" id="" name="" style="width: 250px;"/>&nbsp;&nbsp;<button type="button" class="btn-default" id="addBtn" onClick="javascript:fn_appendTr();" style="background-color:#fc692f;color:white;">추가</button></td>
				</tr> -->
			</tbody>
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