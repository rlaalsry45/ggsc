<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>신청자 정보 팝업</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="/gnoincoundb/css/style.css">
<script src="/gnoincoundb/js/jquery-1.11.2.min.js" ></script>
<meta name="_csrf" th:content="${_csrf.token}"/>
<meta name="_csrf_header" th:content="${_csrf.headerName}"/>
<script type="text/javascript">

	function fn_upLoad() {
		if(confirm("연계의뢰서를 업로드 하시겠습니까?")){
			document.frm.action = "/gnoincoundb/linkageReqPopupReg.do";
	       	document.frm.submit(); 
	       	alert("업로드가 완료됐습니다.");
	       	window.close();
		}	
	}
	
</script>
<style>
	td:nth-child(odd){text-align:center;} 
</style>
</head>
<body style="background:white;">
	<div style="background: #1266FF;height:30px;color:white;line-height:32px;font-size: 16px;">
		&nbsp;&nbsp;&nbsp;연계의뢰서 팝업
		<%-- <c:if test="${empty detail.cnsrCd }">센터정보 등록</c:if>
		<c:if test="${!empty detail.cnsrCd }">센터 상세보기</c:if> --%>
	</div>
	<h2 class="h2-title mg-t20 mg-l25">
		<i class="fa fa-circle"></i>연계의뢰서 업로드
	</h2>
	<div style="width:200px;height:20px;float:right;text-align:right;padding-bottom:10px;"><img src="/gnoincoundb/img/logo.png" style="width:120px;height:50px;"></div>
	<div style="border-top:1px solid black;width:500px;margin-left:10px;margin-top:10px;"></div>
	<form id="frm" name="frm" method="post" enctype="multipart/form-data">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		<input type="text" id="linkReqGb" name="linkReqGb" />
		<input type="text" id="reqDept2" name="reqDept2" />
		<input type="text" id="cnsleId" name="cnsleId" />
		<input type="text" id="cnsleNm" name="cnsleNm" />
		<input type="text" id="cnsGb" name="cnsGb" />
		<input type="text" id="zoneGb" name="zoneGb" />
		<input type="text" id="localGb" name="localGb" />
		<input type="text" id="centerGb" name="centerGb" />
		<div class="filebox" style="margin-left: 10px; margin-top: 15px;"> 
			<input type="file" id="file" name="file" style="width: 400px;"> 
			<!-- <input class="upload-name" id="upNm" value="파일선택"> -->
			<label class="btn-basic" style="background-color: gray;color:white;" for="file">찾기</label> 
		</div>
	</form>
	
	
	<div style="float:right;margin-right:7px;margin-top: 20px;">
		<button type="button" class="btn-basic" onclick="window.close();">닫기</button>
		<button type="button" class="btn-basic" id="uBtn" onclick="javascript:fn_upLoad();">업로드</button>
	</div>
</body>
</html>