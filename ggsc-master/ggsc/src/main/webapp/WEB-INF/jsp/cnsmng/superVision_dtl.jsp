<%@ page import="egovframework.rte.psl.dataaccess.util.EgovMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<script src="/gnoincoundb/js/util/paging.js"></script>
<script src="/gnoincoundb/js/html2canvas.min.js" ></script>
<script src="/gnoincoundb/js/jspdf.min.js" ></script>

<script type="text/javascript">
	$(document).ready(function() {
		var page = "${page}";
		var authCd = "${authCd}";
		var cnsrId = "${detail.cnsrId}"; // 의뢰정보 등록 ID
		var userId = "${loginVo.userId}"; // Login ID
		if(page == ""){
			page = 1;
		}
		$("#replyInfo").css("display", "none");
		$("#update").css("display", "none");
		$("#replySaveBtn").css("display", "none");
		$("#replyUpdateBtn").css("display", "none");
		
		var title = "${detail.title}";
		// 상세보기
		if(title != "") {
			$("#save").css("display", "none");
			$("#stdSaveBtn").css("display", "none");
			// 권한 2이상 or 본인이 작성했을 경우 수정가능
			if(authCd < 3 || cnsrId == userId) {
				$("#update").css("display", "inline-block");				
			}
			$("#replyInfo").css("display", "inline-block");
			$("#replySaveBtn").css("display", "inline-block");
		} else {
			$("#reqCnsr").val("${loginVo.userNm}");
		}
		
		var answerYn = "${detail.answerYn}";
		if(answerYn == "Y") {
			// 권한 2이상 or 본인이 작성했을 경우 수정가능
			if(authCd < 3 || cnsrId == userId) {
				$("#replyUpdateBtn").css("display", "inline-block");
			}
			$("#replySaveBtn").css("display", "none");
			$("#stdSaveBtn").css("display", "none");
		}
		
		var fileNm = "${detail.fileNm}";
		if(fileNm != "") {
			$("#upNm1").val(fileNm);
		}
		
		var fileNm2 = "${replyDtl.fileNm}";
		if(fileNm2 != "") {
			$("#upNm2").val(fileNm2);
		}
		
		var fileTarget1 = $('#file'); 
		fileTarget1.on('change', function(){
		    var cur1=$("#file").val();
			$("#upNm1").val(cur1);
		});
		
		var fileTarget2 = $('#file2'); 
		fileTarget2.on('change', function(){
		    var cur2=$("#file2").val();
			$("#upNm2").val(cur2);
		});
		
	});

	function fn_excelDown(){
		document.location.href = "/gnoincoundb/cnsAcptExcelDown.do";
	}

	/* function fn_popup(type, caseNo){
		var url = "/cnsAcceptDtl.do?type=" + type + "&caseNo=" + caseNo;
		var name = "신청자정보";
		var option = "width = 530, height = 750, top = 50, left = 150, location = yes";
		window.open(url, name, option);
	} */
	
	function fn_reg(mnuCd,param){
		// 의뢰자정보
		var titleC = $("#titleC").val();
		var reqCnsr = $("#reqCnsr").val();
		var reqDt = $("input[name=reqDt]").val();
		// 답변정보
		var titleR = $("#titleR").val();
		var rplyCnsr = $("#rplyCnsr").val();
		var rplyDt = $("input[name=rplyDt]").val();
		
		if(param == "S") {
			if(titleC.length == 0) {
				alert("의뢰제목을 입력해주세요.");
				$("#titleC").focus();
				return;
			}
			if(reqCnsr.length == 0) {
				alert("의뢰상담사를 입력해주세요.");
				$("#reqCnsr").focus();
				return;
			}
			if(reqDt.length == 0) {
				alert("등록일자를 입력해주세요.");
				$("#reqDt").focus();
				return;
			}
			if(confirm("등록 하시겠습니까?")){
				$("#num").val(0);
				document.frm.action = "/gnoincoundb/superVisionReg.do?mnuCd=" + mnuCd +"&save=" + param;
		       	document.frm.submit();
			}			
		} else if(param == "U") {
			if(titleC.length == 0) {
				alert("의뢰제목을 입력해주세요.");
				$("#titleC").focus();
				return;
			}
			if(reqCnsr.length == 0) {
				alert("의뢰상담사를 입력해주세요.");
				$("#reqCnsr").focus();
				return;
			}
			if(reqDt.length == 0) {
				alert("등록일자를 입력해주세요.");
				$("#reqDt").focus();
				return;
			}
			if(confirm("수정 하시겠습니까?")){
				document.frm.action = "/gnoincoundb/superVisionReg.do?mnuCd=" + mnuCd +"&save=" + param;
		       	document.frm.submit();
			}	
		} else if(param == "R") {
			if(titleR.length == 0) {
				alert("답변제목을 입력해주세요.");
				$("#titleR").focus();
				return;
			}
			if(rplyCnsr.length == 0) {
				alert("답변자를 입력해주세요.");
				$("#rplyCnsr").focus();
				return;
			}
			if(rplyDt.length == 0) {
				alert("답변 등록일자를 입력해주세요.");
				$("#rplyDt").focus();
				return;
			}
			if(confirm("답변을 등록 하시겠습니까?")){
				document.frm2.action = "/gnoincoundb/superVisionReg.do?mnuCd=" + mnuCd +"&save=" + param;
		       	document.frm2.submit();
			}	
		} else if(param == "RU") {
			if(titleR.length == 0) {
				alert("답변제목을 입력해주세요.");
				$("#titleR").focus();
				return;
			}
			if(rplyCnsr.length == 0) {
				alert("답변자를 입력해주세요.");
				$("#rplyCnsr").focus();
				return;
			}
			if(rplyDt.length == 0) {
				alert("답변 등록일자를 입력해주세요.");
				$("#rplyDt").focus();
				return;
			}
			if(confirm("답변을 수정 하시겠습니까?")){
				document.frm2.action = "/gnoincoundb/superVisionReg.do?mnuCd=" + mnuCd +"&save=" + param;
		       	document.frm2.submit();
			}	
		}
	}
	
	function fn_detail(num,linkReqGb){
		var mnuCd = $("#mnuCd").val();
		document.location.href = "/gnoincoundb/linkageReqDtl.do?num=" + num +"&linkReqGb=" + linkReqGb + "&mnuCd=" + mnuCd;
	}
	
	function fn_list() {
		var mnuCd = $("#mnuCd").val();
		document.location.href = "/gnoincoundb/superVisionList.do?mnuCd=" + mnuCd;
	}
	
	/* function list() {
		// $("#currentPageNo").val(curPage);
		// var param = $("#searchForm").serialize(); //ajax로 넘길 data
		// data : param .
		$.ajax({
			type : "POST",
			url : "/psyCnsList_ajax.do",
			dataType : "json",
			success : function(json) {
				var html = '';
				$.each(json.examDocList, function(i, d) {
					var num = 0;
					num = (json.totalPageCnt - d.rnum) + 1;
					html += '<tr onclick="javascript:fn_reg(\''+ d.num +'\');">';
					html += '<td>' + num + '</td>';
					html += '<td>' + d.zoneGb + '</td>';
					html += '<td>' + d.sigunNm + '</td>';
					html += '<td>' + d.addr + '</td>';
					html += '<td>' + d.homepage + '</td>';
					html += '<td>' + d.tel + '</td>';
					html += '<td>' + d.useYn + '</td>';
					html += '<td>' + d.dbInsTm + '</td>';
					html += '</tr>';
					
				});
				if (json.examDocList.length == 0) {
					html += '<tr><td colspan="6">정보가 없습니다.</td></tr>';
				}
				$("#tby2").html(html);
	
			},
			error : function(e) {
				alert("서버와 통신 오류입니다.");
			}
		});
	} */
	
	$('input[type="text"]').keydown(function() {
		  if (event.keyCode === 13) {
		    list(1);
		  };
	});
	
	function fn_goLink(no){
		var url = "";
		
		if(no == 1){
			url = "/gnoincoundb/perCnsList.do?mnuCd=${mnuCd}";	
		}else if(no == 2){
			url = "/gnoincoundb/perCnsList.do?mnuCd=${mnuCd}";
		}else if(no == 3){
			url = "/gnoincoundb/psyCnsList.do?mnuCd=${mnuCd}";
		}else if(no == 4){
			url = "/gnoincoundb/linkageReqList.do?mnuCd=${mnuCd}";
		}else{
			url = "/gnoincoundb/superVisionList.do?mnuCd=${mnuCd}";
		}
		document.location.href = url;
	}
	
	function fn_popup() {
		var oepnwin;
		var url = "/gnoincoundb/relatedOrgan_info_list.do";
		var name = "유관기관 정보";
		var option = "width=530, height=750, left=150, location=yes";
		oepnwin = window.open(url, name, option);
	}
	
</script>
 <style>
	ul.tabs{
	margin : 30px 0 30px 0;
	padding: 0px;
	list-style: none;
	border-bottom-style: solid;
	border-width: thin;
	}
	ul.tabs li{
		background: none;
		color: #222;
		display: inline-block;
		padding: 10px 15px;
		cursor: pointer;
	}
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

	<h2 class="h2-title"><i class="fa fa-check-square"></i>수퍼비전</h2>
		
		<div class="box-style1 x-scroll-auto" >
			<%-- 
			<h3 class="h3-title" style="display: inline-block;"><i class="fa fa-star"></i>상담내용</h3>

			<table class="table-style1" style="margin-bottom: 5px;">
				<colgroup> 
					<col width="5%"></col>
					<col width="7%"></col> 
					<col width="7%"></col>
					<col width="7%"></col>
					<col width="7%"></col>
					<col width="7%"></col>
					<col width="7%"></col>
					<col width="7%"></col>
					<col width="7%"></col>
					<col width="7%"></col>
					<col width="7%"></col>
					<col width="7%"></col>
					<col width="7%"></col>
					<col width="7%"></col>
				</colgroup>
							
				<thead>
					<tr>
						<th scope="col">순번</th>
						<th scope="col">case.No</th>
						<th scope="col">내담자명</th>
						<th scope="col">상담구분</th> 
						<th scope="col">총상담회기</th>
						<th scope="col">최근상담일</th>
						<th scope="col">상담진행상태</th>
						<th scope="col">상담자</th>
						<th scope="col">성별</th>
						<th scope="col">현재연령</th>
						<th scope="col">학력</th>
						<th scope="col">초기위험도</th>
						<th scope="col">자살위험도</th>
						<th scope="col">상담일지</th>
					</tr>
				</thead>
				<tbody id="tby1">
					<c:if test="${list.size() == 0 }">
						<tr>
							<td colspan="13">정보가 없습니다.</td>
						</tr>
					</c:if>
					<c:if test="${list.size() > 0 }">
						<c:forEach items="${list }" var="result">
							<tr onclick="javascript:fn_detail('${result.caseNo}');">
								<td>${result.rnum }</td>
								<td>${result.caseNo }</td>
								<td>${result.cnsleNm }</td>
								<c:if test="${result.cnsGb == '1' }"><td>개인상담</td></c:if>
								<c:if test="${result.cnsGb == '2' }"><td>집단상담</td></c:if>
								<td>${result.cnsCnt }</td>
								<td>${result.cnsDt }</td>
								<td>${result.cnsStat }</td>
								<td>${result.cnsrNm }</td>
								<td>${result.gender }</td>
								<td>현재연령</td>
								<td>${result.edu }</td>
								<td>상</td>
								<td>${result.killsRskn }</td>
								<td>수정</td>
							</tr>
						</c:forEach>
					</c:if>
				</tbody>
			</table> --%>
			
			<%-- <h3 class="h3-title" style="display: inline-block;"><i class="fa fa-star"></i>슈퍼비전</h3>
			<div style="float: right; display: inline-block;">
				<button type="button" class="btn-basic" onClick="javascript:fn_reg('${mnuCd }');" style="background-color: green;color:white;">신규등록</button>
			</div> --%>
			
			<form id="frm" name="frm" method="post" enctype="multipart/form-data">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				<input type="hidden" id="currentPageNo" name="currentPageNo" value="1" />
				<input type="hidden" id="mnuCd" name="mnuCd" value="${mnuCd }" />
				<input type="hidden" id="num" name="num" value="${detail.num }" />
				<input type="hidden" id="caseNo" name="caseNo" value="0" />
				
			<div class="doc-wrap" style="width: 100%; margin: auto;">
		        <div class="doc-box mt20" id="reqInfo">
		            <!-- <div class="box-title noto700 txt-center mt15 mb15">연계의뢰서</div> -->
		             <!-- 의뢰정보 영역 시작  -->
		            <div class="tbl-title mt20">
		             	  <h3 class="h3-title" style="display: inline-block;"><i class="fa fa-star"></i>의뢰정보</h3>
		            </div>
		            <table class="table-write" style="margin-top:1px;">
		                <colgroup>
		                    <col style="width: 10%;" />
		                    <col style="width: 35%;" />
		                    <col style="width: 10%;" />
		                    <col style="width: 35%;" />
		                </colgroup>
		                <tbody>
		                    <tr>
		                        <th scope="col">제목</th>
		                        <td colspan="3">
		                            <input type="text" id="titleC" name="title" style="width: 450px;" value="${detail.title }" maxlength="50">
		                        </td>
		                    </tr>
		                    <tr>
		                        <th scope="col">의뢰상담사</th>
		                        <td>
		                            <input type="text" id="reqCnsr" name="reqCnsr" style="width: 250px;" value="${detail.reqCnsr }" onlyKorean oninput="this.value = this.value.replace(/[^ㄱ-힣/, '');" maxlength="8">
		                        </td>
		                        <c:choose>
									<c:when test="${fn:length(detail.relOrgNm) > 0 }">
										<td colspan="2">
											 센터 <input type="text" name="relOrgNm" readonly="readonly" style="width: 250px;" value="${loginVo.centerNm }">
				                        </td>
									</c:when>
									<c:otherwise>
										<td colspan="2">
											 센터 <input type="text" id="reqName" name="relOrgNm" readonly="readonly" style="width: 250px;" value="${loginVo.centerNm }"> <!-- <button type="button" class="btn-basic" style="padding: 2px 6px;" onclick="javascript:fn_popup();">찾기</button> -->
				                        </td>
									</c:otherwise>
								</c:choose>
		                    </tr>
		                    <tr>
		                        <th scope="col">등록일자</th>
		                        <td colspan="3">
		                            <input type="text" id="datepicker1" name="reqDt" style="width:170px;" value="${detail.reqDt }" readonly>
		                        </td>
		                    </tr>
		                    <tr>
		                        <th scope="col">내용</th>
		                        <td colspan="3">
		                            <textarea id="reqCntn" name="reqCntn" class="h120" ><c:out value="${detail.reqCntn }" /></textarea>
		                        </td>
		                    </tr>
		                    <tr style="display: none;">
		                    	<th scope="col">파일 업로드</th>
		                    	<td colspan="3" class="filebox">
		                    		<!-- <input type="file" id="file" name="file" style="width: 400px;"> 
									<button class="btn-basic" style="background-color: gray; color: white; line-height: 15px;" onclick="fn_reqUpload('N')">업로드</button> -->
									<input type="file" id="file" name="file"> 
									<input class="upload-name" id="upNm1" value="파일선택">
									<label class="btn-basic" style="background-color: gray;color:white;" for="file">찾기</label>
									<button type="button" id="downBtn" class="btn-basic" style="background-color: green; color: white; height: 29px;" onclick="javascript:fn_down('${detail.fileNm}', '${detail.sysFileNm }', '${detail.filePath }')">다운로드</button>
		                    	</td>
		                    </tr>
		                </tbody>
		            </table>
			      </div>
		      </div>
	         </form>
	         <div style="text-align: right;">
	         	<button type="button" class="btn-basic" onClick="javascript:fn_list('${mnuCd }');" style="background-color:#fc692f;color:white;">목록</button>
	         	<button type="button" class="btn-basic" id="save" onClick="javascript:fn_reg('${mnuCd}','S');" style="background-color: green;color:white;">저장</button>
				<button type="button" class="btn-basic" id="update" onClick="javascript:fn_reg('${mnuCd}','U');" style="background-color: green;color:white;">수정</button>
			</div>
		      <!-- 의뢰정보 영역 끝  -->
		         
		      <!-- 답변정보 영역  시작 -->
		      <div class="doc-wrap" style="width: 100%;margin: auto;">
		          <div class="doc-box mt20" id="replyInfo" style="width: 100%;">
			         <form id="frm2" name="frm2" method="post">
			         	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			         	<input type="hidden" id="num" name="num" value="${detail.num }" /> 
			             <div class="tbl-title mt20">
			             	  <h3 class="h3-title" style="display: inline-block;"><i class="fa fa-star"></i>답변정보</h3>
			            </div>
			            <table class="table-write" style="margin-top:1px;">
			                <colgroup>
			                    <col style="width: 10%;" />
			                    <col style="width: 35%;" />
			                    <col style="width: 10%;" />
			                    <col style="width: 35%;" />
			                </colgroup>
			                <tbody>
			                    <tr>
			                        <th scope="col">제목</th>
			                        <td colspan="3">
			                            <input type="text" id="titleR" name="title" style="width: 450px;" maxlength="50" value="${replyDtl.title }">
			                        </td>
			                    </tr>
			                    <tr>
			                        <th scope="col">답변자</th>
			                        <td>
			                            <input type="text" id="rplyCnsr" name="rplyCnsr" style="width: 250px;" value="${replyDtl.rplyCnsr }" onlyKorean oninput="this.value = this.value.replace(/[^ㄱ-힣/, '');" maxlength="8">
			                        </td>
			                        <td colspan="2">
										 센터 <input type="text" id="reqDept2" name="relOrgNm" readonly="readonly" style="width: 250px;" value="경기도노인종합상담센터"> <!-- <button type="button" class="btn-basic" style="padding: 2px 6px;" onclick="javascript:fn_popup();">찾기</button> -->
			                        </td>
			                    </tr>
			                    <tr>
			                        <th scope="col">등록일자</th>
			                        <td colspan="3">
			                            <input type="text" id="datepicker2" name="rplyDt" style="width:170px;" value="${replyDtl.rplyDt }" readonly>
			                        </td>
			                    </tr>
			                    <tr>
			                        <th scope="col">내용</th>
			                        <td colspan="3">
			                            <textarea id="rplyCntn" name="rplyCntn" class="h120" ><c:out value="${replyDtl.rplyCntn }" /></textarea>
			                        </td>
			                    </tr>
			                    <tr style="display: none;">
		                    	<th scope="col">파일 업로드</th>
		                    	<td colspan="3" class="filebox">
		                    		<!-- <input type="file" id="file" name="file" style="width: 400px;"> 
									<button class="btn-basic" style="background-color: gray; color: white; line-height: 15px;" onclick="fn_reqUpload('N')">업로드</button> -->
									<%-- <input type="file" id="file2" name="file2"> 
									<input class="upload-name" id="upNm2" value="파일선택">
									<label class="btn-basic" style="background-color: gray;color:white;" for="file2">찾기</label>
									<button type="button" id="downBtn" class="btn-basic" style="background-color: green; color: white; height: 29px;" onclick="javascript:fn_down('${detail.fileNm}', '${detail.sysFileNm }', '${detail.filePath }')">다운로드</button> --%>
		                    	</td>
		                    </tr>
			                </tbody>
			            </table>
					</form>
		           	<div style="text-align: right;">
		           		<c:if test="${loginVo.authCd < 3 }">
							<button type="button" class="btn-basic" id="replySaveBtn" onClick="javascript:fn_reg('${mnuCd}','R');" style="background-color: green;color:white;">저장</button>
							<button type="button" class="btn-basic" id="replyUpdateBtn" onClick="javascript:fn_reg('${mnuCd}','RU');" style="background-color: green;color:white;">수정</button>										
		           		</c:if>
					</div>		
				</div>
			</div>
			 <!-- 답변정보 영역  끝 -->
        </div>
		<!-- end -->

	</section>

</html>

