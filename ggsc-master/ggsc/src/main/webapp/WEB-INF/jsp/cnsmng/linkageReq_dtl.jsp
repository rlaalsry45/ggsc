<%@ page import="egovframework.rte.psl.dataaccess.util.EgovMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script src="/gnoincoundb/js/html2canvas.min.js" ></script>
<script src="/gnoincoundb/js/jspdf.min.js" ></script>

<script type="text/javascript">
	$(document).ready(function() {
		
		var caseNo = "${detail.caseNo}";
		var linkReqGb = "${detail.linkReqGb}";
		$("#internalText").html("내부연계구분");
		$("#internalGb").css("display", "inline-block");
		$("#outernalGb").css("display", "none");
	  	if(caseNo.length > 0) {
	  		if(linkReqGb == '1') {
	  			$("#inReq").css("display", "inline-block");
	  			$("#outReq").css("display", "none");
	  			$("#internalText").html("내부연계구분");
	  			$("#internalGb").css("display", "inline-block");
	  			$("#outernalGb").css("display", "none");
	  		} else if(linkReqGb == '2') {
	  			$("#inReq").css("display", "none");
	  			$("#outReq").css("display", "inline-block");
	  			$("#internalGb").css("display", "none");
	  			$("#outernalGb").css("display", "inline-block");
	  			$("#internalText").html("외부연계구분");
	  		}
	  		$("#findBtn").css("display", "none");
	  		$("#sBtn").css("display", "none");	  			
		  	$('input:radio[name=gender]:input[value="${detail.gender}"]').attr("checked", true);
		  	$('#cnsGb').val('${detail.cnsGb}').attr('selected','selected');
		  	$('#zoneGb').val('${detail.zoneGb}').attr('selected','selected');
		  	$('#localGb').val('${detail.localGb}').attr('selected','selected');
		  	$('#centerGb').val('${detail.centerGb}').attr('selected','selected');
		  	$('#linkReqGb').val('${detail.linkReqGb}').attr('selected','selected');
		  	$('#internalGb').val('${detail.internalGb}').attr('selected','selected');
		  	$('#outernalGb').val('${detail.outernalGb}').attr('selected','selected');
		  	$("#linkReqGb option").not(":selected").attr("disabled", "disabled");
	  	} else {
	  		$('#reqDept').val('${map.centerNm}');
	  		$('#reqDeptPer').val('${map.userNm}');
	  		$("#uBtn").css("display", "none");
		  	$("#pdfDown").css("display", "none");
		  	$("#linkReqName").val("${map.userNm}");
		  	$("#linkReqNmTel").val("${map.mobile}");
		  	$("#orgName").val("${map.userNm}");
	  	}
	  	
	  	
	  	$("#linkReqGb").change(function(){
	  		var linkReqGb = $("#linkReqGb").val();
	  		if(linkReqGb == "1") {
	  			$("#inReq").css("display", "inline-block");
	  			$("#outReq").css("display", "none");
	  			$("#internalText").html("내부연계구분");
	  			$("#internalGb").css("display", "inline-block");
	  			$("#outernalGb").css("display", "none");
	  		} else if(linkReqGb == "2"){
	  			$("#inReq").css("display", "none");
	  			$("#outReq").css("display", "inline-block");
	  			$("#internalGb").css("display", "none");
	  			$("#outernalGb").css("display", "inline-block");
	  			$("#internalText").html("외부연계구분");
	  		};
		});
	});
	
	function fn_reg(param){
		
		var linkReqGb = $("#linkReqGb").val(); // 연계구분 값
		var cnsleNm = $("#cnsleNm").val();
		var datepicker1 = $("#datepicker1").val();
		var datepicker2 = $("#datepicker2").val();
		var year = $("#year").val();
		var month = $("#month").val();
		var day = $("#day").val();
		var linkReqRecvYear = $("#linkReqRecvYear").val();
		var linkReqRecvMonth = $("#linkReqRecvMonth").val();
		var linkReqRecvDay = $("#linkReqRecvDay").val();
		
		if(linkReqGb == "1") {
			if(cnsleNm.length == 0) {
				alert("내담자명을 입력해주세요.");
				return;
			}
			
			if(datepicker1.length == 0) {
				alert("의뢰일을 입력해주세요.");
				return;
			}
			
			/* if(datepicker2.length == 0) {
				alert("회신기한을 입력해주세요.");
				return;
			} */
		}
		
		if(linkReqGb == "2") {
			if(cnsleNm.length == 0) {
				alert("내담자명을 입력해주세요.");
				return;
			}
			if(year.length == 0) {
				alert("의뢰일시 날짜를 입력해주세요.");
				$("#year").focus();
				return;
			}
			if(year.length == 1) {
				alert("의뢰일시를 입력시 일자가 한자리일 경우 0을 붙여 입력해주세요 \n ex : 01");
				$("#year").focus();
				return;
			}
			if(month.length == 0) {
				alert("의뢰일시 날짜를 입력해주세요.");
				$("#month").focus();
				return;
			}
			if(month.length == 1) {
				alert("의뢰일시를 입력시 일자가 한자리일 경우 0을 붙여 입력해주세요 \n ex : 01");
				$("#month").focus();
				return;
			}
			
			if(day.length == 0) {
				alert("의뢰일시 날짜를 입력해주세요.");
				$("#day").focus();
				return;
			}
			if(day.length == 1) {
				alert("의뢰일시를 입력시 일자가 한자리일 경우 0을 붙여 입력해주세요 \n ex : 01");
				$("#day").focus();
				return;
			}
			
			/* if(linkReqRecvYear.length == 0) {
				alert("회신일자를 입력해주세요.");
				$("#linkReqRecvYear").focus();
				return;
			}
			
			if(linkReqRecvYear.length == 1) {
				alert("회신일자를 입력시 일자가 한자리일 경우 0을 붙여 입력해주세요 \n ex : 01");
				$("#linkReqRecvYear").focus();
				return;
			}
			
			if(linkReqRecvMonth.length == 0) {
				alert("회신일자를 입력해주세요.");
				$("#linkReqRecvMonth").focus();
				return;
			}
			if(linkReqRecvMonth.length == 1) {
				alert("회신일자를 입력시 일자가 한자리일 경우 0을 붙여 입력해주세요 \n ex : 01");
				$("#linkReqRecvMonth").focus();
				return;
			}
			if(linkReqRecvDay.length == 0) {
				alert("회신일자를 입력해주세요.");
				$("#linkReqRecvDay").focus();
				return;
			}
			if(linkReqRecvDay.length == 1) {
				alert("회신일자를 입력시 일자가 한자리일 경우 0을 붙여 입력해주세요 \n ex : 01");
				$("#linkReqRecvDay").focus();
				return;
			} */
			if(linkReqRecvYear.length == 0) {
				$("#linkReqRecvYear").val(0);
			}
			if(linkReqRecvMonth.length == 0) {
				$("#linkReqRecvMonth").val(0);
			}
			if(linkReqRecvDay.length == 0) {
				$("#linkReqRecvDay").val(0);
			}
		}
		
		
		if(param == "S") {
			if(confirm("등록 하시겠습니까?")){
				var psycRstMmseds = $("#psycRstMmseds").val();
				if(psycRstMmseds == "") {
					$("#psycRstMmseds").val(0);
				}
				$("#num").val(0);
				document.frm.action = "/gnoincoundb/linkageReqReg.do?save="+ param;
		        document.frm.submit();
			}
		} else {
			if(confirm("수정 하시겠습니까?")){
				// var strNum = "$detail.num";
		  		// var param = parseInt(strNum);
		  		var psycRstMmseds = $("#psycRstMmseds").val();
				if(psycRstMmseds == "") {
					$("#psycRstMmseds").val(0);
				}
				document.frm.action = "/gnoincoundb/linkageReqReg.do?save="+ param;
		       	document.frm.submit();
			}
		}
		
	}  	
	
	
	
	function fn_list(mnuCd){
		document.location.href = "/gnoincoundb/linkageReqList.do?mnuCd=" + mnuCd;
		/* document.location.href = "/counsellor_mngList.do?mnuCd=" + mnuCd; */
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
	
	function fn_popup() {
		var oepnwin;
		var url = "/gnoincoundb/relatedOrgan_info_list.do";
		var name = "유관기관 정보";
		var option = "width=530, height=750, left=150, location=yes";
		oepnwin = window.open(url, name, option);
	}
	
	function findUserPopup(){
		var userNm = $("#cnsleNm").val();
		userNm = encodeURI(encodeURIComponent(userNm));		
		var url = "/gnoincoundb/findUserPopup.do?userNm=" + userNm+"&cnsTargetGb=Y&cnsPerTargetGb=Y";
		var name = "회원 찾기";
		var option = "width = 530, height = 750, top = 50, left = 250, location = yes";
		window.open(url, name, option);encodeURI(encodeURIComponent(jindan_name));
	}
	
	function fn_pdfDown() {
		// document.downForm.action = "/fileDown.do";
		// var fileNm = "${detail.fileNm}";
		// var filePath = "${detail.filePath}";
		document.frm.action = "/gnoincoundb/fileDown.do";
        document.frm.submit();
       	// document.location.href = "/fileDown.do";
        // document.location.href = "/fileDown.do?fileNm=" + fileNm +"&filePath=" + filePath;
		// document.location.href = "/pdfWrite.do";
		
	}
	
	function fn_reqUploadBox() {
		$("#reqUploadTr").css("display", "");
	}
	function fn_gongUpload() {
		$("#gongUploadTr").css("display", "");
	}
	
	function fn_reqUpload(param) {
		
		var psycRstMmseds = $("#psycRstMmseds").val();
		if(psycRstMmseds == "") {
			$("#psycRstMmseds").val(0);
		}
		
		/* if(confirm("연계의뢰서를 업로드 하시겠습니까?")) {
		} */	
			var num = $("#num").val();
			if(num == "") {
				$("#num").val(0);
			}
			$("#offiNoteYn").val(param);
			document.frm.action = "/gnoincoundb/linkageReqPopupReg.do";
	       	document.frm.submit(); 
	       	alert("업로드가 완료됐습니다.");
	}
	
	function getGb(){
		if(document.getElementById('caseNo').value.length > 0){
			var token = $("meta[name='_csrf']").attr("th:content");
			var header = $("meta[name='_csrf_header']").attr("th:content");
			
			$.ajax({
				url : "/gnoincoundb/cnsAcceptDtl_ajax.do",
				type : "post",
				dataType : "json",
				beforeSend : function(xhr){
					xhr.setRequestHeader(header, token);
				},
				data : { caseNo : document.getElementById('caseNo').value }
			}).done(function(e){
				var data = e.Detail;
				if(data.gender == "M") {
					$("#gender").val(data.gender);
					$("#genderNm").html("남자");
				} else if(data.gender == "F") {
					$("#gender").val(data.gender);
					$("#genderNm").html("여자");
				}
				var arr = [ 'cnsNm', 'zoneNm', 'centerNm', 'localNm', 'birthDt', 'addr', 'mobile', 'tel' ];
				for(var i=0;i<arr.length;i++){
					$("[data-type='" + arr[i] + "']").text(eval("data." + arr[i] ));
				}
				
			}).fail(function(e){
				alert('서버 오류가 발생하였습니다.');
			})
			
		}
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
	
	.table-style1 input {width:150px;}
	/* td:nth-child(even){text-align:left;} */
	/* td:nth-child(odd){text-align:left;} 홀수 이벤트*/
	.box-title {
        font-size: 35px;
    }
    .tbl>tbody>tr {
        font-size: 16px;
        height: 50px;
    }
    .tbl>tbody>tr>th {
        border: 1px solid #333;
        background-color: #CCCCCC;
    }
    .h70 {
        height: 70px;
    }
    .bgG {
        background-color: #CCCCCC;
    }
    .doc-wrap {
    	font-weight: 700;
    	font-family: 'Noto Sans KR', sans-serif;
    	font-size: 16px;
        color: #333333;
    }
    .inp {
        font-family: 'Noto Sans KR', sans-serif;
        color: #333333;
        font-size: 16px;
        position: relative;
        line-height: 1.5em;
        font-weight: 500;
        width: 95%;
    }
    textarea {
        width: 95%;
        height: 100px;
        font-family: 'Noto Sans KR', sans-serif;
        color: #333333;
        font-size: 16px;
        font-weight: 500;
        border: none;
    }
    .h120 {
        height: 120px;
    }
    .h150 {
        height: 150px;
    }
    .h200 {
        height: 200px;
    }
    .sign-box {
        width: 300px;
    }
    .tbl-title {
        width: 100%;
        height: 35px;
        line-height: 35px; 
        display: inline-block;
        background-color: #CCCCCC;
        text-align: center;
        border: 1px solid #333;
        font-family: 'Noto Sans KR', sans-serif;
        color: #333333;
        font-size: 18px;
        font-weight: 500;
    }
    
    
</style>
<section id="content">
	<h2 class="h2-title"><i class="fa fa-check-square"></i>
		<c:if test="${empty detail.num }">연계의뢰서 등록</c:if>
		<c:if test="${!empty detail.num }">연계의뢰서 상세보기</c:if>
	</h2>
	<div class="box-style1 x-scroll-auto" >
		<form name="downForm" id="downForm" method="post">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			<input type="hidden" id="fileNm" name="fileNm" value="" />
			<input type="hidden" id="sysFileNm" name="sysFileNm" value="" />
			<input type="hidden" id="filePath" name="filePath" value="" />
		</form>
		<form id="frm" name="frm" method="post" enctype="multipart/form-data">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			<input type="hidden" id="currentPageNo" name="currentPageNo" value="1" />
			<input type="hidden" id="mnuCd" name="mnuCd" value="${mnuCd }" />
			<input type="hidden" id="relOrgCd" name="relOrgCd" />
			<input type="hidden" id="offiNoteYn" name="offiNoteYn" />
			<input type="hidden" id="fileNm" name="fileNm" value="${detail.fileNm }" />
			<input type="hidden" id="filePath" name="filePath" value="${detail.filePath }" />
			<input type="hidden" id="sysFileNm" name="sysFileNm" value="${detail.sysFileNm }" />
			<input type="hidden" id="num" name="num" value="${detail.num }" />
			<input type="hidden" id="gender" name="gender" />
			<input type="hidden" id="sigunCd" name="sigunCd" />
			<%-- <input type="hidden" id="caseNo" name="caseNo" value="${detail.caseNo }"/> --%>
				<%-- <input type="hidden" id="mnuCd" name="mnuCd" value="${mnuCd }" />
				<input type="hidden" id="caseNo" name="caseNo" value="" />
				<input type="hidden" id="examDocCd" name="examDocCd" value="1" />
				<input type="hidden" id="docGb" name="docGb" value="1" /> --%>
			<div style="border-style: solid; border-width: thin; width:100%; height: auto; padding: 10px 10px 10px 10px;">
				<table border="1" class="table-write" style="width: 101.2%; position: relative; left: -10px; top: -10px; border-left-style:hidden; border-right-style: hidden; border-top-style: hidden;">
					<colgroup>
						<col width="15%" >
						<col width="30%" >
						<col width="15%" >
						<col width="35%" >
					</colgroup>
					<tbody>
						<tr>
							<th>연계구분</th>
							<td>
								<select id="linkReqGb" name="linkReqGb" style="width:200px;">
									<option value="1">내부연계의뢰서</option>
									<option value="2">외부연계의뢰서</option>
								</select>
							</td>
							<th><span id="internalText"></span></th>
							<td>
								<select class="wd200" id="internalGb" name="internalGb">
									<c:forEach items="${internalGbList }" var="list">
										<option value="${list.odr }">${list.mclassNm }</option>
									</c:forEach>
								</select> 
								 <select class="wd200" id="outernalGb" name="outernalGb">
									<c:forEach items="${outernalGbList }" var="list">
										<option value="${list.odr }">${list.mclassNm }</option>
									</c:forEach>
								</select>
							</td>
							<%-- <th>연계기관</th>
							<td>
								<input type="text" name="reqDept2" id="reqDept2" style="width: 200px;" value="${detail.reqDept }" readonly/><button type="button" class="btn-basic" style="padding: 2px 6px;" onclick="javascript:fn_popup();">찾기</button>
							</td> --%>
						</tr>
						<tr>
							<th>내담자ID</th>
							<td><input type="text" id="cnsleId" name="cnsleId" style="width: 200px;" readonly="readonly" value="${detail.cnsleId }" /></td>
							<th>내담자명</th>
							<td><input type="text" id="cnsleNm" name="cnsleNm" style="width: 200px;" value="${detail.cnsleNm }" readonly /><button type="button" id="findBtn" class="btn-basic" style="padding: 2px 6px;" onclick="javascript:findUserPopup();">찾기</button></td>
						</tr>
						<tr height=33>
							<th>상담구분</th>
							<td><span data-type='cnsNm'></span></td>
							<th>권역구분</th>
							<td><span data-type='zoneNm'></span></td>
						</tr>
						<tr height=33>
							<th>지역구분</th>
							<td><span data-type='localNm'></span></td>
							<th>센터구분</th>
							<td><span data-type='centerNm'></span></td>
						</tr>
						<%-- <tr>
							<th><span id="internalText"></span></th>
							<td>
								<select class="wd200" id="internalGb" name="internalGb">
									<c:forEach items="${internalGbList }" var="list">
										<option value="${list.odr }">${list.mclassNm }</option>
									</c:forEach>
								</select> 
								 <select class="wd200" id="outernalGb" name="outernalGb">
									<c:forEach items="${outernalGbList }" var="list">
										<option value="${list.odr }">${list.mclassNm }</option>
									</c:forEach>
								</select>
							</td>
						</tr> --%>
						<%-- <tr>
							<th>외부연계구분</th>
							<td>
								<select class="wd200" id="outernalGb" name="outernalGb">
									<c:forEach items="${outernalGbList }" var="list">
										<option value="${list.odr }">${list.mclassNm }</option>
									</c:forEach>
								</select> 
							</td>
						</tr> --%>
						<tr id="reqUploadTr" style="display: none;">
							<th>연계의뢰서 업로드</th>
							<td colspan="3">
								<div> 
	 								<input type="file" id="file" name="file" style="width: 400px;"> 
									<button class="btn-basic" style="background-color: gray; color: white; line-height: 15px;" onclick="fn_reqUpload('N')">업로드</button>
								</div>
							</td>
						</tr>
						<tr id="gongUploadTr" style="display: none;">
							<th>공문 업로드</th>
							<td colspan="3">
								<div> 
	 								<input type="file" id="file2" name="file2" style="width: 400px;"> 
									<button class="btn-basic" style="background-color: gray; color: white; line-height: 15px;" onclick="fn_reqUpload('Y')">업로드</button>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
		 <!-- 내부연계의뢰서 시작 -->
			<div class="doc-wrap" style="width: 80%;margin: auto;">
				<div style="text-align: right;">
					<c:choose>
						<c:when test="${detail.fileNm2 != null and detail.fileNm2 != ''}">
							<button type="button" class="btn-basic" id="reqUpload" onClick="fn_down('${detail.fileNm2}','${detail.sysFileNm2}','${detail.filePath2 }')" style="background-color: green;color:white;">연계의뢰서 다운로드</button>							
						</c:when>
						<c:otherwise>
							<button type="button" class="btn-basic" id="reqUpload" onClick="javascript:fn_reqUploadBox();" style="background-color: green;color:white;">연계의뢰서업로드</button>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${detail.fileNm3 != null and detail.fileNm3 != ''}">
							<button type="button" class="btn-basic" id="reqUpload" onClick="fn_down('${detail.fileNm3}','${detail.sysFileNm3}','${detail.filePath3 }')" style="background-color: green;color:white;">공문 다운로드</button>							
						</c:when>
						<c:otherwise>
							<button type="button" class="btn-basic" id="gongUpload" onClick="javascript:fn_gongUpload();" style="background-color: green;color:white;">공문업로드</button>
						</c:otherwise>
					</c:choose>
					<!-- <button type="button" class="btn-basic" id="pdfDown" onClick="javascript:fn_pdfDown();" style="background-color: green;color:white;">PDF 다운로드</button> -->
				</div>	
				<div class="btn" style="text-align: right; display: block;">
					<!-- <button type="button" class="btn-basic" onClick="javascript:fn_clear();"><i class="fa fa-repeat"></i>초기화</button> -->
					<button type="button" class="btn-basic" id="uBtn" onclick="javascript:fn_reg('${detail.num}');">수정</button>
					<button type="button" class="btn-basic" id="sBtn" onclick="javascript:fn_reg('S');">저장</button>
					<!-- <button type="button" class="btn-default" onClick="javascript:fn_reg();" style="background-color:#fc692f;color:white;">저장</button> -->
					<button type="button" class="btn-basic" onClick="javascript:fn_list('${mnuCd }');" style="background-color:#fc692f;color:white;">목록</button>
				</div>		
		        <div class="doc-box mt20" id="inReq">
		            <div class="box-title noto700 txt-center mt15 mb15">연계의뢰서</div>
		            	
		            	<!-- <div style="float: left !important;width: 300px; margin-top: 60px;">
		            		<span class="label"><label>연계구분</label></span>
							<span class="label2">
								 <select name="schZoneGb" style="width:200px;">
								 	<option value="">전체</option>
									<option value="북부">북부</option>
									<option value="남부">남부</option>
								</select>
							</span>
		            		<span class="label"><label>연계기관</label></span>
							<span class="label2">
								<span class="form"><input type="text" name="relOrgGb" id="relOrgGb" value="" style="width: 200px;" /><button type="button" class="btn-basic" onclick="javascript:fn_popup();">&nbsp;&nbsp;</button></span>
							</span>
		            	</div> -->
		            	
		            	<div class="sign-box fr">
			                <table class="table-write mg-t5">
			                    <caption>연계의뢰서</caption>
			                    <colgroup>
			                        <col style="width: 15%;" />
			                        <col style="width: 25%;" />
			                        <col style="width: 25%;" />
			                        <col style="width: 25%;" />
			                    </colgroup>
			                    <tbody>
			                        <tr>
			                            <td class="bgG" rowspan="2">&nbsp;결&nbsp;제</td>
			                            <th scope="col">담당</th>
			                            <th scope="col">과장</th>
			                            <th scope="col">관장</th>
			                        </tr>
			                        <tr>
			                            <td class="h70"></td>
			                            <td class="h70"></td>
			                            <td class="h70"></td>
			                        </tr>
			                    </tbody>
			                </table>
		                </div>
		        
		            <div class="tbl-title mt20">
		                담당자 정보
		            </div>
		            <table class="table-write" style="margin-top:1px;">
		                <%-- <caption>연계의뢰서</caption> --%>
		                <colgroup>
		                    <col style="width: 13%;" />
		                    <col style="width: 22%;" />
		                    <col style="width: 10%;" />
		                    <col style="width: 18%;" />
		                    <col style="width: 13%;" />
		                    <col style="width: 22%;" />
		                </colgroup>
		                <tbody>
		                    <tr>
		                        <th scope="col">의뢰부서</th>
		                        <td>
		                            <input type="text" id="reqDept" name="reqDept" class="inp txt-center" readonly="readonly" value="${detail.reqDept }">
		                        </td>
		                        <th scope="col">담당</th>
		                        <td>
		                            <input type="text" id="reqDeptPer" name="reqDeptPer" class="inp txt-center" readonly="readonly" value="${detail.reqDeptPer }">
		                        </td>
		                        <th scope="col">의뢰일</th>
		                        <td>
		                            <input type="text" id="datepicker1" name="reqDt" class="inp txt-center" style="width:170px;" readonly="readonly" value="${detail.reqDt }">
		                        </td>
		                    </tr>
		                    <tr>
		                        <th scope="col">협조부서</th>
		                        <td>
		                            <input type="text" id="helpDept" name="helpDept" class="inp txt-center" value="${detail.helpDept }">
		                        </td>
		                        <th scope="col">담당</th>
		                        <td>
		                            <input type="text" id="helpDeptPer" name="helpDeptPer" class="inp txt-center" value="${detail.helpDeptPer }" onlyKorean oninput="this.value = this.value.replace(/[^ㄱ-힣/, '');" maxlength="8">
		                        </td>
		                        <th scope="col">회신기한</th>
		                        <td>
		                            <input type="text" id="datepicker2" name="relyTerm" class="inp txt-center" style="width:170px;" readonly="readonly" value="${detail.relyTerm }">
		                        </td>
		                    </tr>
		                </tbody>
		            </table>
		            <div class="tbl-title" style="margin-top:1px;">
		                대상자 정보
		            </div>
		            <table class="table-write" style="margin-top:1px;">
		                <%-- <caption>연계의뢰서</caption> --%>
		                <colgroup>
		                    <col style="width: 13%;" />
		                    <col style="width: 22%;" />
		                    <col style="width: 10%;" />
		                    <col style="width: 18%;" />
		                    <col style="width: 13%;" />
		                    <col style="width: 22%;" />
		                </colgroup>
		                <tbody>
		                    <tr>
		                        <th scope="col">성&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;명</th>
		                        <td>
		                            <input type="text" id="cnsleNm3" class="inp txt-center" readonly="readonly" value="${detail.cnsleNm }" >
		                        </td>
		                        <th scope="col">성별</th>
		                        <td><span id="genderNm">${detail.gender }</span></td>
		                        <th scope="col">생년월일</th>
		                        <td><span data-type='birthDt'>${detail.birthDt }</span></td>
		                    </tr>
		                    <tr height=33>
		                        <th scope="col">주&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;소</th>
		                        <td colspan="3"><span data-type='addr'>${detail.addr }</span></td>
		                        <th scope="col">연락처</th>
		                        <td><span data-type='mobile'>${detail.telNo }</span></td>
		                    </tr>
		                    <tr>
		                        <th scope="col">대상자<br>특이사항</th>
		                        <td colspan="5">
		                            <textarea id="rcptSgct" name="rcptSgct" class="h120" ><c:out value="${detail.rcptSgct }" /></textarea>
		                        </td>
		                    </tr>
		                </tbody>
		            </table>
		            <div class="tbl-title" style="margin-top:1px;">
		                요청사항
		            </div>
		            <table class="table-write" style="margin-top:1px;">
		                <%-- <caption>연계의뢰서</caption> --%>
		                <colgroup>
		                    <col style="width: 13%;" />
		                    <col style="width: 22%;" />
		                    <col style="width: 10%;" />
		                    <col style="width: 18%;" />
		                    <col style="width: 13%;" />
		                    <col style="width: 22%;" />
		                </colgroup>
		                <tbody>
		                    <tr>
		                        <th scope="col">의뢰사유<br>및<br>요청사항</th>
		                        <td colspan="5">
		                            <textarea id="reqResnCntn" name="reqResnCntn" class="h150"><c:out value="${detail.reqResnCntn }" /></textarea>
		                        </td>
		                    </tr>
		                </tbody>
		            </table>
		            <div class="tbl-title" style="margin-top:1px;">
		                연계에 대한 회신내용
		            </div>
		            <table class="table-write" style="margin-top:1px;">
		                <%-- <caption>연계의뢰서</caption> --%>
		                <colgroup>
		                    <col style="width: 13%;" />
		                    <col style="width: 22%;" />
		                    <col style="width: 10%;" />
		                    <col style="width: 18%;" />
		                    <col style="width: 13%;" />
		                    <col style="width: 22%;" />
		                </colgroup>
		                <tbody>
		                    <tr>
		                        <th scope="col">처리결과</th>
		                        <td colspan="5">
		                            <textarea id="pgrsRslt" name="pgrsRslt" class="h200"><c:out value="${detail.pgrsRslt }" /></textarea>
		                        </td>
		                    </tr>
		                    <tr>
		                        <th scope="col">비&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;고</th>
		                        <td colspan="5">
		                            <textarea id="etc" name="etc" ><c:out value="${detail.etc }" /></textarea>
		                        </td>
		                    </tr>
		                </tbody>
		            </table>
		           
		        </div>
		    </div>
    <!-- 내부연계의뢰서 끝  -->
    <!-- 외부연계의뢰서 시작  -->
	    <div class="doc-wrap" style="width: 80%;margin: auto;">
			    <div class="doc-wrap" id="outReq" style="display: none;">
			        <div class="doc-box mt20">
			            <div class="box-title noto700 txt-center mt15 mb15">연계의뢰서</div>
			            <table class="table-write" style="border-bottom: none; width: 975px;">
			                <caption>연계의뢰서</caption>
			                <colgroup>
			                    <col style="width: 11.3%;" />
			                    <col style="width: 35%;" />
			                    <col style="width: 11.3%;" />
			                    <col style="width: 35%;" />
			                </colgroup>
			                <tbody>
			                    <tr style="border-bottom: none;">
			                        <th style="border-bottom: none;" scope="col">의뢰일시</th>
			                        <td style="border-bottom: none;"><span>20<input type="text" class="inp month" id="year" name="year" maxlength="2" style="width:25px;" oninput="this.value = this.value.replace(/[^0-9]/g, ''); $('#year2').val(this.value);" value="${detail.year }" /></span>년&nbsp;&nbsp;&nbsp;<span><input type="text" class="inp month" id="month" name="month" maxlength="2" style="width:25px;" oninput="this.value = this.value.replace(/[^0-9]/g, ''); $('#month2').val(this.value);" value="${detail.month }"></span>월&nbsp;&nbsp;&nbsp;<span><input type="text" id="day" name="day" class="inp month" maxlength="2" style="width:25px;" oninput="this.value = this.value.replace(/[^0-9]/g, ''); $('#day2').val(this.value);" value="${detail.day }"></span>일</td>
			                        <th style="border-bottom: none;" scope="col">의뢰담당자</th>
			                        <td style="border-bottom: none;"><input type="text" class="inp txt-left w130" id="linkReqName" name="linkReqName" maxlength="8" style="width:120px;" oninput="$('#orgName').val(this.value);" value="${detail.linkReqName }">&nbsp;&nbsp;&nbsp;(☎&nbsp;&nbsp;<input type="text" class="inp w130 txt-left" id="linkReqNmTel" name="linkReqNmTel" style="width:120px;" maxlength="20" oninput="this.value = this.value.replace(/[^0-9]/g, '');" value="${detail.linkReqNmTel }">)</td>
			                    </tr>
			                </tbody>
			            </table>
			            <table class="table-write">
			                <%-- <caption>연계의뢰서</caption> --%>
			                <colgroup>
			                    <col style="width: 12%;" />
			                    <col style="width: 15%;" />
			                    <col style="width: 28%;" />
			                    <col style="width: 15%;" />
			                    <col style="width: 27.7%;" />
			                </colgroup>
			                <tbody>
			                    <tr>
			                        <th rowspan="4" scope="col">내담자<br>인적사항</th>
			                        <td>Case N0</td>
			                        <td colspan="3">
			                            <input type="text" class="inp txt-left" id="caseNo" name="caseNo" readonly="readonly" value="${detail.caseNo }" >
			                        </td>
			                    </tr>
			                    <tr>
			                        <td>성&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;명</td>
			                        <td>
			                            <input type="text" class="inp txt-left w130" id="cnsleNm2" name="cnsleNm2" style="width:150px;" readonly="readonly" value="${detail.cnsleNm }">(남, 여)
			                        </td>
			                        <td>연&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;령</td>
			                        <td>
			                            <input type="text" class="inp14 three" maxlength="3" id="age" name="age" style="width:50px;" value="${detail.age }" oninput="this.value = this.value.replace(/[^0-9]/g, '');"><span class="poR65">세</span>
			                        </td>
			                    </tr>
			                    <tr>
			                        <td>주&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;소</td>
			                        <td>
			                            <input type="text" class="inp txt-left" id="addr2" name="addr2" maxlength="50" value="${detail.addr }">
			                        </td>
			                        <td>연&nbsp;&nbsp;락&nbsp;&nbsp;처</td>
			                        <td style="text-align: left;">
			                            <input type="text" class="inp txt-center" id="tel" name="tel" value="${detail.telNo }" maxlength="20" oninput="this.value = this.value.replace(/[^0-9]/g, '');">
			                        </td>
			                    </tr>
			                    <tr>
			                        <td>건강상태<br>(복용약포함)</td>
			                        <td>
			                            <textarea class="h50" id="cnsleHelth" name="cnsleHelth" maxlength="350"><c:out value="${detail.cnsleHelth }"/></textarea>
			                        </td>
			                        <td>공적부조</td>
			                        <td><!-- 의료보호 1종 /<br>의료보호 2종<br>(※해당자만 체크) -->
			                        	<textarea class="h50" id="cnsleGongGb" name="cnsleGongGb" maxlength="350"><c:out value="${detail.cnsleGongGb }"/></textarea>
			                        </td>
			                    </tr>
			                    <tr>
			                        <th scope="col">심리검사<br>결과</th>
			                        <td colspan="4" class="txt-left">
			                            <!-- <span class="ml30">· GDS-KR(우울검사) : </span><span class="ml42"><input type="text" class="inp txt-right w130" id="" name="" style="width:200px;">점(30점만점기준)</span><br> -->
			                            <span class="ml30">· MMSE-DS(인지기능검사) : <input type="text" class="inp txt-left w130" id="psycRstMmseds" name="psycRstMmseds" style="width:40px;" oninput="this.value = this.value.replace(/[^0-9]/g, '');" value="${detail.psycRstMmseds }" maxlength="3">점(30점만점기준)</span><br>
			                            <span class="ml30">· 기&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;타 : <input type="text" class="inp txt-left w130" id="psycRstEtc" name="psycRstEtc" style="width:200px;" value="${detail.psycRstEtc }" maxlength="20"></span>
			                        </td>
			                    </tr>
			                    <tr>
			                        <th scope="col">내담자<br>특이<br>사항</th>
			                        <td colspan="4">
			                            <textarea class="h100" id="cnslePsycRst" name="cnslePsycRst" maxlength="500"><c:out value="${detail.cnslePsycRst }"/></textarea>
			                        </td>
			                    </tr>
			                    <tr>
			                        <th scope="col">상담사<br>의견</th>
			                        <td colspan="4">
			                            <textarea class="h100" id="cnsrOp" name="cnsrOp" maxlength="500"><c:out value="${detail.cnsrOp }"/></textarea>
			                        </td>
			                    </tr>
			                    <tr>
			                        <th class="txtGr" scope="col">연계요청<br>사항</th>
			                        <td colspan="4">
			                            <textarea class="h100" id="linkReqDesc" name="linkReqDesc" maxlength="500"><c:out value="${detail.linkReqDesc }"/></textarea>
			                        </td>
			                    </tr>
			                    <tr>
			                        <th rowspan="3" scope="col">연계에<br>대한<br>회신내용</th>
			                        <td>기관명</td>
			                        <td>
			                            <input type="text" class="inp txt-center" id="linkReqOrgNm" name="linkReqOrgNm" value="${detail.linkReqOrgNm }">
			                        </td>
			                        <td>기관연락처</td>
			                        <td>
			                            <input type="text" class="inp txt-center" id="linkReqOrgTel" name="linkReqOrgTel" maxlength="20" value="${detail.linkReqOrgTel }" oninput="this.value = this.value.replace(/[^0-9]/g, '');">
			                        </td>
			                    </tr>
			                    <tr>
			                        <td>담당자</td>
			                        <td>
			                            <input type="text" class="inp txt-center" id="linkReqRecvName" name="linkReqRecvName" value="${detail.linkReqRecvName }" maxlength="8">
			                        </td>
			                        <td>회신일자</td>
			                        <td>
			                            <span>20<input type="text" class="inp month" maxlength="2" id="linkReqRecvYear" name="linkReqRecvYear" style="width:25px;" oninput="this.value = this.value.replace(/[^0-9]/g, '');" value="${detail.linkReqRecvYear }"></span>년&nbsp;&nbsp;&nbsp;<span><input type="text" class="inp month" maxlength="2" id="linkReqRecvMonth" name="linkReqRecvMonth" style="width:25px;" oninput="this.value = this.value.replace(/[^0-9]/g, '');" value="${detail.linkReqRecvMonth }"></span>월&nbsp;&nbsp;&nbsp;<span><input type="text" class="inp month" maxlength="2" id="linkReqRecvDay" name="linkReqRecvDay" style="width:25px;" oninput="this.value = this.value.replace(/[^0-9]/g, '');" value="${detail.linkReqRecvDay }"></span>일
			                        </td>
			                    </tr>
			                    <tr>
			                        <td>요청사항에<br>대한<br>처리결과</td>
			                        <td colspan="3">
			                            <textarea class="h100" id="linkReqRecvRst" name="linkReqRecvRst" maxlength="500"><c:out value="${detail.linkReqRecvRst }"/></textarea>
			                        </td>
			                    </tr>
			                </tbody>
			            </table>
			            <div class="doc-wrap" style="width: 80%;margin: auto;">
			                <br>
			                <p class="txt-center fs20">위 사례에 대해 진행된 결과를 14일 이내 다시 통보해 주시기 바랍니다.</p>
			                <p class="txt-center mt30">
			                    <span>20<input type="text" class="inp month" maxlength="2" id="year2" name="" style="width:25px;" value="${detail.year }" readonly="readonly"></span>년&nbsp;&nbsp;&nbsp;<span><input type="text" class="inp month" maxlength="2" id="month2" name="" style="width:25px;" value="${detail.month }" readonly="readonly"></span>월&nbsp;&nbsp;&nbsp;<span><input type="text" class="inp month" maxlength="2" id="day2" name="" style="width:25px;" value="${detail.day }" readonly="readonly"></span>일
			                </p>
			                <div style="text-align:center;">
			                    <p>의&nbsp;&nbsp;&nbsp;&nbsp;뢰&nbsp;&nbsp;&nbsp;&nbsp;자&nbsp;&nbsp;&nbsp;&#58;&nbsp;&nbsp;&nbsp;
			                        <span><input type="text" class="inp long" maxlength="9" id="orgName" name="orgName" style="width:120px;" readonly="readonly" value="${detail.orgName }"  ></span>(인)
			                    </p>
			                    <p>기&nbsp;&nbsp;&nbsp;&nbsp;관&nbsp;&nbsp;&nbsp;&nbsp;명&nbsp;&nbsp;&nbsp;&#58;&nbsp;&nbsp;&nbsp;
			                        <span><input type="text" class="inp long" id="reqName" name="reqName" style="width:250px;" value="${detail.reqName }"></span>
			                    </p>
			                </div>
			            </div>
			        </div>
			    </div>
		 </div>
			<%-- <div class="btn" style="text-align: right; display: block;">
				<!-- <button type="button" class="btn-basic" onClick="javascript:fn_clear();"><i class="fa fa-repeat"></i>초기화</button> -->
				<button type="button" class="btn-basic" id="uBtn" onclick="javascript:fn_reg('${detail.num}');">수정</button>
				<button type="button" class="btn-basic" id="sBtn" onclick="javascript:fn_reg('S');">저장</button>
				<!-- <button type="button" class="btn-default" onClick="javascript:fn_reg();" style="background-color:#fc692f;color:white;">저장</button> -->
				<button type="button" class="btn-basic" onClick="javascript:fn_list('${mnuCd }');" style="background-color:#fc692f;color:white;">목록</button>
			</div> --%>	
   		</div>
	</form>
	
	<!-- 외부연계의뢰서 끝  -->	    
	</div>
	
	
	
</section>
</html>