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
		var title = "${detail.title}";
		var rplyCntn = "${detail.rplyCntn}";
		
		if(title == "") {
			$("#reply").css("display", "none");
		}
		if(rplyCntn != "") {
			$("#title").attr("readonly",true);
		}	
		
	});
	
	function fn_reg(num){
		
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
		
		if(confirm("저장 하시겠습니까?")){
			document.frm.action = "/gnoincoundb/faqReg.do?num=${detail.num}";
	       	document.frm.submit();
		}
		
	}  	
	function fn_list(mnuCd){
		document.location.href = "/gnoincoundb/faqList.do?mnuCd=" + mnuCd;
	}  	
	
</script>
<style>
	.table-style1 input {width:150px;}
	/* td:nth-child(even){text-align:left;} */
	/* td:nth-child(odd){text-align:left;} 홀수 이벤트*/
</style>
<section id="content">
	<h2 class="h2-title"><i class="fa fa-check-square"></i>
		<c:if test="${detail.num == 0}">FAQ 등록</c:if>
		<c:if test="${detail.num > 0 }">FAQ 상세보기 및 수정</c:if>
	</h2>
	<div class="box-style1 x-scroll-auto" >
		<form id="frm" name="frm" method="post">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			<input type="hidden" id="currentPageNo" name="currentPageNo" value="1" />
			<input type="hidden" id="mnuCd" name="mnuCd" value="${mnuCd }" />
			<table class="table-write mg-t5" style="width:800px;">
				<colgroup>
					<col width="20%" />
					<col width="*" />
				</colgroup>
				<tr>
					<td style="text-align:center;">FAQ질문</td>
					<td><input type="text" id="title" name="title" value="${detail.title }"/></td>
				</tr>
				<tr id="reply">
					<td style="text-align:center;">답변</td>
					<td>
						<textarea class="h120" id="rplyCntn" name="rplyCntn"><c:out value="${detail.rplyCntn }" escapeXml="false"/></textarea>
					</td>
				</tr>
			</table>
		</form>
		<div class="btn" style="text-align: right; display: block; width: 49.9%;">
			<button type="button" class="btn-basic" onClick="javascript:fn_reg();" style="background-color:green;color:white;">저장</button>
			<button type="button" class="btn-basic" onClick="javascript:fn_list('${mnuCd }');" style="background-color:#fc692f;color:white;">목록</button>
		</div>	
	</div>
</section>
</html>