<%@ page import="egovframework.rte.psl.dataaccess.util.EgovMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


<script src="/gnoincoundb/js/html2canvas.min.js" ></script>
<!-- <script src="/gnoincoundb/js/jquery-1.11.2.min.js" ></script> -->
<script src="/gnoincoundb/js/jspdf.min.js" ></script>
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

<script type="text/javascript">
	$(document).ready(function() {
		var fileTarget = $('#file'); 
		fileTarget.on('change', function(){ // 값이 변경되면
		    //var cur=$(".filebox input[type='file']").val();
		    var cur=$("#file").val();
			//$(".upload-name").val(cur);
			$("#upNm").val(cur);
		});
		
		var fileTarget1 = $('#file1'); 
		fileTarget1.on('change', function(){ // 값이 변경되면
		    var cur1=$("#file1").val();
			$("#upNm1").val(cur1);
		});
		
		var fileTarget2 = $('#file2'); 
		fileTarget2.on('change', function(){ // 값이 변경되면
		    var cur2=$("#file2").val();
			$("#upNm2").val(cur2);
		});
		$("#cnsrGb").val("${map.authCd}").prop("selected", true);
	});
	
	function fn_down(fileNm, filePath){
		document.location.href = "/gnoincoundb/fileDown.do?fileNm=" + fileNm + "&filePath=" + filePath;
	}  	
	
	function fn_reg() {
		
		var cnsleNm = $("#cnsleNm").val();
		var cnsCnt = $("#cnsCnt").val();
		var cnsStat = $("#cnsStat").val();
		var datepicker8 = $("#datepicker8").val(); 
		var cnsDtStdHour = $("#cnsDtStdHour").val(); 
		var cnsDtStdMin = $("#cnsDtStdMin").val(); 
		var cnsDtEndHour = $("#cnsDtEndHour").val();
		var cnsDtEndMin = $("#cnsDtEndMin").val();
		var cnsTimeTotMin = $("#cnsTimeTotMin").val();
		
		var cnsRsvtStrtHour = $("#cnsRsvtStrtHour").val();
		var cnsRsvtStrtMin = $("#cnsRsvtStrtMin").val();
		var cnsRsvtEndHour = $("#cnsRsvtEndHour").val();
		var cnsRsvtEndMin = $("#cnsRsvtEndMin").val();
		var cnsRsvtTotMin = $("#cnsRsvtTotMin").val();
		
		if(cnsleNm.length == 0) {
			alert("내담자명을 입력해 주세요");
			$("#cnsleNm").focus();
			return;
		}
		if(cnsCnt.length == 0) {
			alert("상담회기를 입력해 주세요");
			$("#cnsCnt").focus();
			return;
		}
		if(cnsStat == 2) {
			alert("종결서를 이용해주세요");
			$("#cnsStat").focus();
			return;
		}
		if(datepicker8.length == 0) {
			alert("상담일시를 입력해 주세요");
			$("#datepicker8").focus();
			return;
		}
		if(cnsDtStdHour.length == 0) {
			alert("상담일시 시간을 입력해 주세요");
			$("#cnsDtStdHour").focus();
			return;
		}
		if(cnsDtStdHour.length != 2){
			alert("상담일시 시간을 2자리로 입력해 주세요.");
			$("#cnsDtStdHour").focus();
			return;
		}
		if(cnsDtStdMin.length == 0) {
			alert("상담일시 분을 입력해 주세요");
			$("#cnsDtStdMin").focus();
			return;
		}
		if(cnsDtStdMin.length != 2){
			alert("상담일시 분을 2자리로 입력해 주세요.");
			$("#cnsDtStdMin").focus();
			return;
		}
		if(cnsDtEndHour.length == 0) {
			alert("상담일시 시간을 입력해 주세요");
			$("#cnsDtEndHour").focus();
			return;
		}
		if(cnsDtEndHour.length != 2){
			alert("상담일시 시간을 2자리로 입력해 주세요.");
			$("#cnsDtEndHour").focus();
			return;
		}
		if(cnsDtEndMin.length == 0) {
			alert("상담일시 분을 입력해 주세요");
			$("#cnsDtEndMin").focus();
			return;
		}
		if(cnsDtEndMin.length != 2){
			alert("상담일시 분을 2자리로 입력해 주세요.");
			$("#cnsDtEndMin").focus();
			return;
		}
		if(cnsTimeTotMin.length == 0) {
			alert("상담일시 총시간을 입력해 주세요");
			$("#cnsTimeTotMin").focus();
			return;
		}
		if($("input:radio[name='majorApplCd']").is(":checked") == false) {
			alert("주호소문제를 체크해 주세요.");
			return;
		}
		
		if(cnsRsvtStrtHour.length == 0) {
			$("#cnsRsvtStrtHour").val(0);
		}
		if(cnsRsvtStrtMin.length == 0) {
			$("#cnsRsvtStrtMin").val(0);
		}
		if(cnsRsvtEndHour.length == 0) {
			$("#cnsRsvtEndHour").val(0);
		}
		if(cnsRsvtEndMin.length == 0) {
			$("#cnsRsvtEndMin").val(0);
		}
		if(cnsRsvtTotMin.length == 0) {
			$("#cnsRsvtTotMin").val(0);
		}
		
		var emgcyTel = $("#emgcyTel").val();
		
		if(confirm("등록 하시겠습니까?")){
			
		var token = $("meta[name='_csrf']").attr("th:content");
		var header = $("meta[name='_csrf_header']").attr("th:content");
		var param = $("#caseNo").val();
		$.ajax({
			type : "POST",
			url : "/gnoincoundb/perCnsRegCheckAjax.do",
			data : {caseNo:param} ,
			dataType : "json",
			beforeSend : function(xhr){
				xhr.setRequestHeader(header, token);
			},
			success : function(json) {
				var result = json.result;
				/* if(result > 0) {
					alert("이미 개인상담이일지가 등록되어있습니다.");
					return false;
				} else {
					document.frm.action = "/perCnsReg.do?mnuCd=${mnuCd}";
			       	document.frm.submit();
				} */
				
				document.frm.action = "/gnoincoundb/perCnsReg.do?mnuCd=${mnuCd}";
		       	document.frm.submit();
			},
			error : function(e) {
				alert("서버와 통신 오류입니다.");
			}
		});
		}
	}
	
	/* function fn_reg(){
		
		
		if(confirm("등록 하시겠습니까?")){
			document.frm.action = "/perCnsReg.do?mnuCd=${mnuCd}";
	       	document.frm.submit();
		}
	} */
	
	function fn_list(mnuCd){
		document.location.href = "/gnoincoundb/perCnsList.do?mnuCd=" + mnuCd;
	}
	
	function findUserPopup(){
		var userNm = $("#cnsleNm").val();
		userNm = encodeURI(encodeURIComponent(userNm));		
		var url = "/gnoincoundb/findUserPopup.do?userNm=" + userNm+"&cnsTargetGb=Y&cnsPerTargetGb=Y";
		var name = "회원 찾기";
		var option = "width = 530, height = 750, top = 50, left = 100, location = yes";
		window.open(url, name, option);encodeURI(encodeURIComponent(jindan_name));
	}
	
	/* function cnsEndPopup(){
		var url = "/gnoincoundb/cnsEndPopup.do";
		var name = "상담사례 종결서";
		var option = "width = 1530, height = 950, top = 0, left = 500, location = yes";
		window.open(url, name, option);
	} */
	
	function cnsEndPopup(){
		
		var cnsEndDt = $("input[name=cnsEndDt]").val();
		var rmCnsEndDt = cnsEndDt.replaceAll(".","");
		var cnsEndCd = $("#cnsEndCd").val();
		if(cnsEndDt != "" && cnsEndCd != "") {
			document.location.href = "/gnoincoundb/cnsEndPopup.do?mnuCd=${mnuCd}&cnsEndCd="+cnsEndCd+"&cnsEndDt="+rmCnsEndDt+"&num=${result.num }";			
		} else {
			alert("종결일과 종결사유를 선택해주세요.");
		}
	}
	
	function getGb(){
		if(document.getElementById('caseNo').value.length > 0){
			var token = $("meta[name='_csrf']").attr("th:content");
			var header = $("meta[name='_csrf_header']").attr("th:content");
			
			$.ajax({
				url : "/gnoincoundb/cnsAcceptDtl_ajax.do",
				type : "post",
				dataType : "json",
				data : { caseNo : document.getElementById('caseNo').value },
				beforeSend : function(xhr){
					xhr.setRequestHeader(header, token);
				}
			}).done(function(e){
				
				var data = e.Detail;
				$('input:radio[name=gender]:input[value='+data.gender+']').attr("checked", true);
				var arr = [ 'cnsNm', 'zoneNm', 'centerNm', 'birthDt', 'gender', 'addr', 'mobile'];
				for(var i=0;i<arr.length;i++){
					$("[data-type='" + arr[i] + "']").text(eval("data." + arr[i] ));
				}
				
			}).fail(function(e){
				alert('서버 오류가 발생하였습니다.');
			})
			
		}
	}
	
</script>
<style>
.hide { display:none; }
</style>
<script>
$(document).on('change','#cnsStat',function(){
	$("[data-type='hideClass1']").addClass('hide');
	$("[data-type='hideClass1'][data-class='" + $(this).val() + "']").removeClass('hide');
});
</script>
<section id="content">

	<h2 class="h2-title"><i class="fa fa-check-square"></i>개인상담일지 등록</h2>
		<div class="box-style1 x-scroll-auto" >
			<div class="btn" style="float: right; margin: 0;">
				<button type="button" class="btn-basic" onClick="javascript:fn_list('${mnuCd }');" style="background-color: green;color:white;">목록</button>
				<button type="button" class="btn-basic" onClick="javascript:fn_reg('${mnuCd }');" style="background-color: green;color:white;">저장</button>
			</div>	
			<form id="frm" name="frm" method="post" enctype="multipart/form-data">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				<input type="hidden" id="cnsleId" name="cnsleId" value="${result.cnsleId }" />
				<input type="hidden" id="caseNo" name="caseNo" value="${result.caseNo }" />
				<input type="hidden" id="sigunCd" name="sigunCd" />
				<input type="hidden" name="cnsrGb" value="${map.authCd }" />
				<table class="table-write">
					<colgroup>
						<col width="15%"></col>
						<col width="10%"></col> 
						<col width="25%"></col>
						<col width="15%"></col>
						<col width="35%"></col>
					</colgroup>
					<tr>
						<th><label>상담상태 <span style="color: red;">*</span></label></th>
						<td colspan="2">
							<select class="wd200" id="cnsStat" name="cnsStat">
								<c:forEach items="${cnsStatList }" var="list">
									<option value="${list.odr }">${list.mclassNm }</option>
								</c:forEach>
							</select> 
						</td>
						
						<th class='hide' data-type='hideClass1' data-class='2'><label>종결 <span style="color: red;">*</span></label></th>
						<td class='hide' data-type='hideClass1' data-class='2' colspan="2">
							<span class="form"><input type="text" class="wd100" id="datepicker1" name="cnsEndDt" value="" readonly/></span>
							<select class="wd200 mg-l25" id="cnsEndCd" name="cnsEndCd">
								<option value="" selected="selected">선택</option>
									<c:forEach items="${cnsEndCdList }" var="list">
										<option value="${list.odr }">${list.mclassNm }</option>
									</c:forEach>
							</select> 
							<a href="javascript:cnsEndPopup();" style='color:red'>&nbsp;&nbsp;▶ 종결서 작성하기</a>
						</td>
						<th class='hide' data-type='hideClass1' data-class='3'><label>보류 <span style="color: red;">*</span></label></th>
						<td class='hide' data-type='hideClass1' data-class='3'>
							<span class="form"><input type="text" class="wd200" id="datepicker2" name="defrDt" value="" readonly/></span>
							<select class="wd200 mg-l25" id="defrCd" name="defrCd">
								<option value="1" selected="selected">선택</option>
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
							</select> 
						</td>
						<th class='hide' data-type='hideClass1' data-class='4'><label>재신청 <span style="color: red;">*</span></label></th>
						<td class='hide' data-type='hideClass1' data-class='4' colspan="2">
							<span class="form"><input type="text" class="wd200" id="datepicker3" name="reReqDt" value="" readonly /></span> 
						</td>
						<th class='hide' data-type='hideClass1' data-class='5'><label>복귀</label></th>
						<td class='hide' data-type='hideClass1' data-class='5'>
							<span class="form"><input type="text" class="wd200" id="datepicker4" name="cmbkDt" value="" readonly /></span>
						</td>
						
					</tr>
					<tr>
						<th>상담구분 <span style="color: red;">*</span></th>
						<td colspan="2">
							<span data-type='cnsNm'></span>
						</td>
						<th>상담회기 <span style="color: red;">*</span></th>
						<td>
							<input type="text" class="wd200" id="cnsCnt" name="cnsCnt" value="${result.cnsCnt }" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"/>
						</td>
					</tr>
					<tr>
						<th>상담자구분 <span style="color: red;">*</span></th>
						<td colspan="2">
							<select class="wd200" id="cnsrGb">
								<c:forEach items="${cnsrGbList }" var="list">
									<option value="${list.odr }">${list.mclassNm }</option>
								</c:forEach>
							</select> 
						</td>
						<th>상담자명 <span style="color: red;">*</span></th>
						<td>
							<input type="text" class="wd200" id="cnsrNm" name="cnsrNm" value="${map.userNm }" readonly/>
						</td>
					</tr>
					<tr>
						<th>내담자명 <span style="color: red;">*</span></th>
						<td colspan="2">
							<input type="text" class="wd200" id="cnsleNm" name="cnsleNm" readonly /><button type="button" class="btn-basic" style="padding: 2px 6px;" onclick="javascript:findUserPopup();">찾기</button>
						</td>
						<th>생년월일 <span style="color: red;">*</span></th>
						<td><span data-type='birthDt'></span></td>
					</tr>
					<tr height=33>
						<th>성별 <span style="color: red;">*</span></th>
						<td colspan="2">
							<input type="radio" id="gender1" name="gender" value="M"><label for="gender1">남자</label>
							<input type="radio" id="gender2" name="gender" value="F"><label for="gender2">여자</label>
						</td>
						<th>주소 <span style="color: red;">*</span></th>
						<td><span data-type='addr'></span></td>
					</tr>
					<tr height=33>
						<th>내담자연락처 <span style="color: red;">*</span></th>
						<td colspan="2"><span data-type='mobile'></span></td>
						<th>긴급연락처 <span style="color: red;">*</span></th>
						<td><input type="text" class="wd200" id="emgcyTel" name="emgcyTel" /></td>
						
					</tr>
					<tr>
						<th>상담실시장소</th>
						<td colspan="2">
							<input type="text" class="wd200" id="cnsEfftPlace" name="cnsEfftPlace" />
						</td>
						<th>상담예약장소</th>
						<td>
							<input type="text" class="wd200" id="cnsRsvtPlace" name="cnsRsvtPlace" />
						</td>
					</tr>
					<tr>
						<th>상담일시 <span style="color: red;">*</span></th>
						<td colspan="2">
							<span class="form"><input type="text" class="wd200" id="datepicker8" name="cnsDt" value="" readonly/></span>
							<select class="wd50 mg-l25" id="cnsDtWeekCd" name="cnsDtWeekCd">
								<option value="1" selected="selected">월</option>
								<option value="2">화</option>
								<option value="3">수</option>
								<option value="4">목</option>
								<option value="5">금</option>
								<option value="6">토</option>
								<option value="7">일</option>
							</select>
							<br>
							(<input type="text" class="wd50" id="cnsDtStdHour" name="cnsDtStdHour" maxlength="2" onlynumber />시<input type="text" class="wd50" id="cnsDtStdMin" name="cnsDtStdMin" maxlength="2" onlynumber />분 ~
							<input type="text" class="wd50" id="cnsDtEndHour" name="cnsDtEndHour" maxlength="2" onlynumber />시<input type="text" class="wd50" id="cnsDtEndMin" name="cnsDtEndMin" maxlength="2" onlynumber />분)
							(총 <input type="text" class="wd50" id="cnsTimeTotMin" name="cnsTimeTotMin" maxlength="3" onlynumber />분) 
						</td>
						<th>다음상담예약일</th>
						<td>
							<span class="form"><input type="text" class="wd200" id="datepicker9" name="cnsRsvtDt" value="" readonly/></span>
							<select class="wd50 mg-l25" id="cnsRsvtWeekCd" name="cnsRsvtWeekCd">
								<option value="1" selected="selected">월</option>
								<option value="2">화</option>
								<option value="3">수</option>
								<option value="4">목</option>
								<option value="5">금</option>
								<option value="6">토</option>
								<option value="7">일</option>
							</select>
							<br>
							(<input type="text" class="wd50" id="cnsRsvtStrtHour" name="cnsRsvtStrtHour" maxlength="2" onlynumber />시<input type="text" class="wd50" id="cnsRsvtStrtMin" name="cnsRsvtStrtMin" maxlength="2" onlynumber />분 ~
							<input type="text" class="wd50" id="cnsRsvtEndHour" name="cnsRsvtEndHour" maxlength="2" onlynumber />시<input type="text" class="wd50" id="cnsRsvtEndMin" name="cnsRsvtEndMin" maxlength="2" onlynumber />분)
							(총 <input type="text" class="wd50" id="cnsRsvtTotMin" name="cnsRsvtTotMin" maxlength="3" onlynumber />분) 
						</td>
					</tr>
					<tr>
						<th>위기긴급성</th>
						<td colspan="2">
							<input type="radio" id="emgcyUrgtY" name="emgcyUrgt" value="Y" /><label for="emgcyUrgtY">예</label>
							<input type="radio" id="emgcyUrgtN" name="emgcyUrgt" value="N" /><label for="emgcyUrgtN">아니오</label>
						</td>
						<th>자살사례</th>
						<td>
							<input type="radio" id="killsOptnY" name="killsOptn" value="Y" /><label for="killsOptnY">예</label>
							<input type="radio" id="killsOptnN" name="killsOptn" value="N" /><label for="killsOptnN">아니오</label>
						</td>
					</tr>
					<tr>
						<th>항우울제지원여부</th>
						<td colspan="2">
							<input type="radio" id="ahydSuptY" name="ahydSuptYn" value="Y" /><label for="ahydSuptY">예</label>
							<input type="radio" id="ahydSuptN" name="ahydSuptYn" value="N" /><label for="ahydSuptN">아니오</label><br>
							<span class="form">게시일<input type="text" class="wd150" id="datepicker5" name="ahydAcptDt" value="" readonly /></span>
							<span class="form mg-l25">종결일<input type="text" class="wd150" id="datepicker6" name="ahydEndDt" value="" readonly /></span>
						</td>
						<th>학대사례</th>
						<td>
							<input type="radio" id="abusOptnY" name="abusOptn" value="Y" /><label for="abusOptnY">예</label>
							<input type="radio" id="abusOptnN" name="abusOptn" value="N" /><label for="abusOptnN">아니오</label>
						</td>
					</tr>
					<tr>
						<th>상담방법 <span style="color: red;">*</span></th>
						<td colspan="4">
							<select class="wd200" id="cnsMethd" name="cnsMethd">
								<c:forEach items="${cnsMethdList }" var="list">
									<option value="${list.odr }">${list.mclassNm }</option>
								</c:forEach>
							</select> 
						</td>
					</tr>
					<tr>
						<th>내담자의관계</th>
						<td colspan="4">
							<input type="radio" id="cnsleRel1" name="cnsleRel" value="1" /><label for="cnsleRel1">노인본인</label>
							<input type="radio" id="cnsleRel2" name="cnsleRel" value="2" /><label for="cnsleRel2">배우자</label>
							<input type="radio" id="cnsleRel3" name="cnsleRel" value="3" /><label for="cnsleRel3">자녀</label>
							<input type="radio" id="cnsleRel4" name="cnsleRel" value="4" /><label for="cnsleRel4">친인척</label>
							<input type="radio" id="cnsleRel5" name="cnsleRel" value="5" /><label for="cnsleRel5">이웃</label>
							<input type="radio" id="cnsleRel6" name="cnsleRel" value="6" /><label for="cnsleRel6">유관기관</label>
						</td>
					</tr>
					<tr>
						<th>주호소문제 <span style="color: red;">*</span></th>
						<td colspan="4">
							<input type="radio" id="majorApplCd1" name="majorApplCd" value="1" /><label for="majorApplCd1">심리정서</label>
							<input type="radio" id="majorApplCd2" name="majorApplCd" value="2" /><label for="majorApplCd2">대인관계</label>
							<input type="radio" id="majorApplCd3" name="majorApplCd" value="3" /><label for="majorApplCd3">치매</label>
							<input type="radio" id="majorApplCd4" name="majorApplCd" value="4" /><label for="majorApplCd4">중독</label>
							<input type="radio" id="majorApplCd5" name="majorApplCd" value="5" /><label for="majorApplCd5">정신건강장애</label>
							<input type="radio" id="majorApplCd6" name="majorApplCd" value="6" /><label for="majorApplCd6">건강</label>
							<input type="radio" id="majorApplCd7" name="majorApplCd" value="7" /><label for="majorApplCd7">경제</label>
							<input type="radio" id="majorApplCd8" name="majorApplCd" value="8" /><label for="majorApplCd8">생활</label>
							<input type="radio" id="majorApplCd9" name="majorApplCd" value="9" /><label for="majorApplCd9">성</label>
							<input type="radio" id="majorApplCd10" name="majorApplCd" value="10" /><label for="majorApplCd10">부부</label>
							<input type="radio" id="majorApplCd11" name="majorApplCd" value="11" /><label for="majorApplCd11">가족</label>
							<input type="radio" id="majorApplCd12" name="majorApplCd" value="12" /><label for="majorApplCd12">역할상실</label>
							<input type="radio" id="majorApplCd13" name="majorApplCd" value="13" /><label for="majorApplCd13">생애진로</label>
							<input type="radio" id="majorApplCd14" name="majorApplCd" value="14" /><label for="majorApplCd14">자살</label>
							<input type="radio" id="majorApplCd15" name="majorApplCd" value="15" /><label for="majorApplCd15">기타</label>
						</td>
					</tr>
					<tr>
						<th rowspan="16">상담내용(중복체크가능)</th>
						<td>자살위험성</td>
						<td colspan="3">
							<input type="checkbox" id="killsRskn1" name="killsRskn" value="1" /><label for="killsRskn1">자살생각</label> 
							<input type="checkbox" id="killsRskn2" name="killsRskn" value="2" /><label for="killsRskn2">자살의도</label> 
							<input type="checkbox" id="killsRskn3" name="killsRskn" value="3" /><label for="killsRskn3">자살계획</label> 
							<input type="checkbox" id="killsRskn4" name="killsRskn" value="4" /><label for="killsRskn4">자살시도력</label> 
							<input type="checkbox" id="killsRskn5" name="killsRskn" value="5" /><label for="killsRskn5">자살용기력</label> 
							<input type="checkbox" id="killsRskn6" name="killsRskn" value="6" /><label for="killsRskn6">자살행동</label> 
						</td>
					</tr>
					<tr>
						<td>심리문제</td>
						<td colspan="3">
							<input type="checkbox" id="psycQust1" name="psycQust" value="1" /><label for="psycQust1">우울</label> 
							<input type="checkbox" id="psycQust2" name="psycQust" value="2" /><label for="psycQust2">불안</label> 
							<input type="checkbox" id="psycQust3" name="psycQust" value="3" /><label for="psycQust3">외로움</label> 
							<input type="checkbox" id="psycQust4" name="psycQust" value="4" /><label for="psycQust4">상실감</label> 
							<input type="checkbox" id="psycQust5" name="psycQust" value="5" /><label for="psycQust5">절망감</label> 
							<input type="checkbox" id="psycQust6" name="psycQust" value="6" /><label for="psycQust6">분노(화병)</label> 
							<input type="checkbox" id="psycQust7" name="psycQust" value="7" /><label for="psycQust7">기타</label> 
						</td>
					</tr>
					<tr>
						<td>대인관계문제</td>
						<td colspan="3">
							<input type="checkbox" id="perRelQuest1" name="perRelQust" value="1" /><label for="perRelQuest1">종교인교우</label> 
							<input type="checkbox" id="perRelQuest2" name="perRelQust" value="2" /><label for="perRelQuest2">친구/동료</label> 
							<input type="checkbox" id="perRelQuest3" name="perRelQust" value="3" /><label for="perRelQuest3">이웃</label> 
							<input type="checkbox" id="perRelQuest4" name="perRelQust" value="4" /><label for="perRelQuest4">사회복지사(요양보호사, 노인돌보미 등)</label> 
							<input type="checkbox" id="perRelQuest5" name="perRelQust" value="5" /><label for="perRelQuest5">기타</label> 
						</td>
					</tr>
					<tr>
						<td>중독</td>
						<td colspan="3">
							<input type="checkbox" id="psng1" name="psng" value="1" /><label for="psng1">알코올</label> 
							<input type="checkbox" id="psng2" name="psng" value="2" /><label for="psng2">도박</label> 
							<input type="checkbox" id="psng3" name="psng" value="3" /><label for="psng3">니코틴</label> 
							<input type="checkbox" id="psng4" name="psng" value="4" /><label for="psng4">향정신성약품</label> 
							<input type="checkbox" id="psng5" name="psng" value="5" /><label for="psng5">인터넷, 게임</label> 
							<input type="checkbox" id="psng6" name="psng" value="6" /><label for="psng6">기타</label> 
						</td>
					</tr>
					<tr>
						<td>치매</td>
						<td colspan="3">
							<input type="checkbox" id="dmta1" name="dmta" value="1" /><label for="dmta1">치매염려</label> 
							<input type="checkbox" id="dmta2" name="dmta" value="2" /><label for="dmta2">경도인지 장애</label>
							<input type="checkbox" id="dmta3" name="dmta" value="3" /><label for="dmta3">주요인지 장애</label> 
							<input type="checkbox" id="dmta4" name="dmta" value="4" /><label for="dmta4">치매증상의 급격한 악화</label> 
							<input type="checkbox" id="dmta5" name="dmta" value="5" /><label for="dmta5">기타</label>
						</td>
					</tr>
					<tr>
						<td>정신장애</td>
						<td colspan="3">
							<input type="checkbox" id="dsm1" name="dsm" value="1" /><label for="dsm1">기분장애(우울증 등)</label> 
							<input type="checkbox" id="dsm2" name="dsm" value="2" /><label for="dsm2">불안장애</label> 
							<input type="checkbox" id="dsm3" name="dsm" value="3" /><label for="dsm3">인격장애</label> 
							<input type="checkbox" id="dsm4" name="dsm" value="4" /><label for="dsm4">정신분열증</label> 
							<input type="checkbox" id="dsm5" name="dsm" value="5" /><label for="dsm5">기타 정신증적 증상</label> 
						</td>
					</tr>
					<tr>
						<td>건강문제</td>
						<td colspan="3">
							<input type="checkbox" id="helthQust1" name="helthQust" value="1" /><label for="helthQust1">건강염려</label> 
							<input type="checkbox" id="helthQust2" name="helthQust" value="2" /><label for="helthQust2">질환으로 인한 신체적 증상</label> 
							<input type="checkbox" id="helthQust3" name="helthQust" value="3" /><label for="helthQust3">전체적인 건강악화</label> 
							<input type="checkbox" id="helthQust4" name="helthQust" value="4" /><label for="helthQust4">중증질환</label> <br>
							<input type="checkbox" id="helthQust5" name="helthQust" value="5" /><label for="helthQust5">신체증상의 급격한 악화(입원, 수술 등)</label> 
							<input type="checkbox" id="helthQust6" name="helthQust" value="6" /><label for="helthQust6">시한부 및 장애진단</label> 
						</td>
					</tr>
					<tr>
						<td>경제문제</td>
						<td colspan="3">
							<input type="checkbox" id="econoQust1" name="econoQust" value="1" /><label for="econoQust1">수입감소</label> 
							<input type="checkbox" id="econoQust2" name="econoQust" value="2" /><label for="econoQust2">저소득</label> 
							<input type="checkbox" id="econoQust3" name="econoQust" value="3" /><label for="econoQust3">경제지원 축소 및 탈락</label> 
							<input type="checkbox" id="econoQust4" name="econoQust" value="4" /><label for="econoQust4">부채증가</label> 
							<input type="checkbox" id="econoQust5" name="econoQust" value="5" /><label for="econoQust5">실직</label> <br>
							<input type="checkbox" id="econoQust6" name="econoQust" value="6" /><label for="econoQust6">자녀에게 경제적 지원</label> 
							<input type="checkbox" id="econoQust7" name="econoQust" value="7" /><label for="econoQust7">재산분할 갈등</label> 
							<input type="checkbox" id="econoQust8" name="econoQust" value="8" /><label for="econoQust8">사기(다단계, 보이스피싱 등)</label> 
						</td>
					</tr>
					<!-- <tr>
						<td>생활문제</td>
						<td colspan="3"><textarea name="lifeQust"></textarea></td>
					</tr> -->
					<tr style="height: 250px;">
						<td>상담내용</td>
						<td colspan="3"><textarea name="cnsCntn" style="height: 250px; width: 600px;"></textarea></td>
					</tr>
					<tr>
						<td>상담개입및연계</td>
						<td colspan="3"><textarea name="cnsItvtLink" style="width: 600px;"></textarea></td>
					</tr>
					<tr>
						<td>상담회기 평가 및 추후계획</td>
						<td colspan="3"><textarea name="cnsCntEvatCntn" style="width: 600px;"></textarea></td>
					</tr>
					<tr>
						<td>사후관리(사례관리)</td>
						<td colspan="3"><textarea name="daftMng" style="width: 600px;"></textarea></td>
					</tr>
					
					<tr>
						<td>정서적 편안함 정도</td>
						<td colspan="3">
							<input type="radio" id="emotCptvDegr1" name="emotCptvDegr" value="1" /><label for="emotCptvDegr1">1</label> 
							<input type="radio" id="emotCptvDegr2" name="emotCptvDegr" value="2" /><label for="emotCptvDegr2">2</label> 
							<input type="radio" id="emotCptvDegr3" name="emotCptvDegr" value="3" /><label for="emotCptvDegr3">3</label> 
							<input type="radio" id="emotCptvDegr4" name="emotCptvDegr" value="4" /><label for="emotCptvDegr4">4</label> 
							<input type="radio" id="emotCptvDegr5" name="emotCptvDegr" value="5" /><label for="emotCptvDegr5">5</label> 
							<input type="radio" id="emotCptvDegr6" name="emotCptvDegr" value="6" /><label for="emotCptvDegr6">6</label> 
							<input type="radio" id="emotCptvDegr7" name="emotCptvDegr" value="7" /><label for="emotCptvDegr7">7</label> 
							<input type="radio" id="emotCptvDegr8" name="emotCptvDegr" value="8" /><label for="emotCptvDegr8">8</label> 
							<input type="radio" id="emotCptvDegr9" name="emotCptvDegr" value="9" /><label for="emotCptvDegr9">9</label> 
							<input type="radio" id="emotCptvDegr10" name="emotCptvDegr" value="10" /><label for="emotCptvDegr10">10</label> 
							<input type="radio" id="emotCptvDegr11" name="emotCptvDegr" value="11" /><label for="emotCptvDegr11">11</label> 
							<input type="radio" id="emotCptvDegr12" name="emotCptvDegr" value="12" /><label for="emotCptvDegr12">12</label> 
						</td>
					</tr>
					<tr>
						<td>도움 받은 정도</td>
						<td colspan="3">
							<input type="radio" id="helpDegr1" name="helpDegr" value="1" /><label for="helpDegr1">1</label> 
							<input type="radio" id="helpDegr2" name="helpDegr" value="2" /><label for="helpDegr2">2</label> 
							<input type="radio" id="helpDegr3" name="helpDegr" value="3" /><label for="helpDegr3">3</label> 
							<input type="radio" id="helpDegr4" name="helpDegr" value="4" /><label for="helpDegr4">4</label> 
							<input type="radio" id="helpDegr5" name="helpDegr" value="5" /><label for="helpDegr5">5</label> 
							<input type="radio" id="helpDegr6" name="helpDegr" value="6" /><label for="helpDegr6">6</label>
							<input type="radio" id="helpDegr7" name="helpDegr" value="7" /><label for="helpDegr7">7</label> 
							<input type="radio" id="helpDegr8" name="helpDegr" value="8" /><label for="helpDegr8">8</label> 
							<input type="radio" id="helpDegr9" name="helpDegr" value="9" /><label for="helpDegr9">9</label> 
							<input type="radio" id="helpDegr10" name="helpDegr" value="10" /><label for="helpDegr10">10</label> 
							<input type="radio" id="helpDegr11" name="helpDegr" value="11" /><label for="helpDegr11">11</label> 
							<input type="radio" id="helpDegr12" name="helpDegr" value="12" /><label for="helpDegr12">12</label> 
						</td>
					</tr>
					<tr>
						<td>상담으로 인한 변화 정도</td>
						<td colspan="3">
							<input type="radio" id="cnsChngDegr1" name="cnsChngDegr" value="1" /><label for="cnsChngDegr1">1</label> 
							<input type="radio" id="cnsChngDegr2" name="cnsChngDegr" value="2" /><label for="cnsChngDegr2">2</label> 
							<input type="radio" id="cnsChngDegr3" name="cnsChngDegr" value="3" /><label for="cnsChngDegr3">3</label> 
							<input type="radio" id="cnsChngDegr4" name="cnsChngDegr" value="4" /><label for="cnsChngDegr4">4</label> 
							<input type="radio" id="cnsChngDegr5" name="cnsChngDegr" value="5" /><label for="cnsChngDegr5">5</label> 
							<input type="radio" id="cnsChngDegr6" name="cnsChngDegr" value="6" /><label for="cnsChngDegr6">6</label>
							<input type="radio" id="cnsChngDegr7" name="cnsChngDegr" value="7" /><label for="cnsChngDegr7">7</label> 
							<input type="radio" id="cnsChngDegr8" name="cnsChngDegr" value="8" /><label for="cnsChngDegr8">8</label> 
							<input type="radio" id="cnsChngDegr9" name="cnsChngDegr" value="9" /><label for="cnsChngDegr9">9</label> 
							<input type="radio" id="cnsChngDegr10" name="cnsChngDegr" value="10" /><label for="cnsChngDegr10">10</label> 
							<input type="radio" id="cnsChngDegr11" name="cnsChngDegr" value="11" /><label for="cnsChngDegr11">11</label> 
							<input type="radio" id="cnsChngDegr12" name="cnsChngDegr" value="12" /><label for="cnsChngDegr12">12</label> 
						</td>
					</tr>
					<%-- <tr>
						<th rowspan="3">파일첨부</th>
						<td colspan="4">
							<c:choose>
								<c:when test="${result.file != null }">
									<a></a>
								</c:when>
								<c:when test="${result.file == null }">
									<div class="filebox"> 
										<input type="file" id="file" name="file"> 
										<input class="upload-name" id="upNm" value="파일선택">
										<label class="btn-basic" style="background-color: gray;color:white;" for="file">찾기</label> 
									</div>
								</c:when>
							</c:choose>
						</td>
					</tr>
					<tr>
						<td colspan="4">
							<c:choose>
								<c:when test="${result.file1 != null }">
									<a href="javascript:fn_down('${result.fileNm }', '${result.filePath }');">${result.fileNm }</a>
								</c:when>
								<c:when test="${result.file1 == null }">
									<div class="filebox"> 
										<input type="file" id="file1" name="file1"> 
										<input class="upload-name" id="upNm1" value="파일선택">
										<label class="btn-basic" style="background-color: gray;color:white;" for="file1">찾기</label> 
									</div>
								</c:when>
							</c:choose>
						</td>
					</tr>
					<tr>
						<td colspan="4">
							<c:choose>
								<c:when test="${result.file2 != null }">
								</c:when>
								<c:when test="${result.file2 == null }">
									<div class="filebox"> 
										<input type="file" id="file2" name="file2"> 
										<input class="upload-name" id="upNm2" value="파일선택">
										<label class="btn-basic" style="background-color: gray;color:white;" for="file2">찾기</label> 
									</div>
								</c:when>
							</c:choose>
						</td>
					</tr> --%>
				</table>
			</form>
		</div>
		<!-- end -->
	</section>

</html>

