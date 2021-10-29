<%@ page import="egovframework.rte.psl.dataaccess.util.EgovMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<link href="/gnoincoundb/css/style.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- <script src="/gnoincoundb/js/jquery-1.11.2.min.js" ></script> -->
<script src="/gnoincoundb/js/html2canvas.min.js" ></script>
<!-- <script src="/gnoincoundb/js/jspdf.min.js" ></script> -->
<script src="/gnoincoundb/js/jquery-accordion-menu.js" ></script>
<style>
	ul.tabs{
	margin: 0px;
	padding: 0px;
	list-style: none;
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
<script type="text/javascript">
	$(document).ready(function() {
		
		$("#Ubtn").css("display", "none");
		var fileTarget = $('#file'); 
		fileTarget.on('change', function(){ // 값이 변경되면
		    var cur=$(".filebox input[type='file']").val();
			$(".upload-name").val(cur);
		});
		
		$("input[type=radio]").click(function(){
			if($("input[name=writeYn]:checked").val() == "Y"){
				$("#uploadTr").css("display", "none");
				$("#Ubtn").css("display", "none");
				$("#Ibtn").css("display", "");
			}else if($("input[name=writeYn]:checked").val() == "N"){
				$("#uploadTr").css("display", "");
				$("#Ubtn").css("display", "");
				$("#Ibtn").css("display", "none");
			}
		});
		
		var caseNo = "${caseNo}";
		var cnsleId = "${detail.cnsleId}";
		if(cnsleId != "") {
			$("#caseNo").val("${caseNo}");
			$("#Ibtn").css("display","none");
			$("#Sbtn").css("display","");
			$("#findBtn").css("display","none");
			$('input:radio[name=idvlInfoCntn1Yn]:input[value=${detail.idvlInfoCntn1Yn}]').attr("checked", true);
			$('input:radio[name=idvlInfoCntn2Yn]:input[value=${detail.idvlInfoCntn2Yn}]').attr("checked", true);
		} else {
			$("#Ibtn").css("display","");
			$("#Sbtn").css("display","none");
			$("#findBtn").css("display","");
		}
		
	});
	
	function fn_goLink(no){
		var url = "";
		
		if(no == 1){
			url = "/gnoincoundb/securityPledge.do?mnuCd=${mnuCd}";	
		}else if(no == 2){
			url = "/gnoincoundb/cnsAgreement.do?mnuCd=${mnuCd}&caseNo=${caseNo}";
		}else if(no == 3){
			url = "/gnoincoundb/privacyAgreement.do?mnuCd=${mnuCd}&caseNo=${caseNo}";
		}else{
			url = "/gnoincoundb/scScreeningScale.do?mnuCd=${mnuCd}&caseNo=${caseNo}";
		}
		document.location.href = url;
	}
	
	function fn_reg(save){
		
		var writeYn = $("input[name=writeYn]:checked").val();
		
		if(save == "U") {
			var cnsleId = $("#cnsleId").val();
			if(cnsleId == "") {
				alert("사용자를 선택해 주세요.");
				return false;
			}
			
			if(confirm("파일업로드를 하시겠습니까?")) {
				document.frm.action = "/gnoincoundb/preExamReg.do?mnuCd=${mnuCd}";
		       	document.frm.submit();
			}
			return false;
		}
		
		if($("#cnsleId").val()==""){
			alert("ID를 입력해주세요.");
			$("#cnsleId").focus();
			return;
		}
		
		if($("#cnsleNm").val()==""){
			alert("사용자명을 입력해주세요.");
			$("#cnsleNm").focus();
			return;
		}
		
		if($("input[name=writeYn]:checked").val() == "Y"){
			
			if($('input:radio[name="idvlInfoCntn1Yn"]').is(':checked')==false){
				alert("정보 수집에 대한 동의여부를 선택해주세요.");
				return;
			}
			
			if($('input:radio[name="idvlInfoCntn2Yn"]').is(':checked')==false){
				alert("민감 정보 수집에 대한 동의여부를 선택해주세요.");
				return;
			}
			
			if($("#year").val()==""){
				alert("날짜를 입력해주세요.");
				$("#year").focus();
				return;
			}
			if($("#month").val()==""){
				alert("날짜를 입력해주세요.");
				$("#month").focus();
				return;
			}
			if($("#month").val().length != 2){
				alert("해당 [월]앞에 0을 입력해주세요.");
				$("#month").focus();
				return;
			}
			if($("#day").val()==""){
				alert("날짜를 입력해주세요.");
				$("#day").focus();
				return;
			}
			if($("#day").val().length != 2){
				alert("해당 [일]앞에 0을 입력해주세요.");
				$("#day").focus();
				return;
			}
			if($("#seplName").val()==""){
				alert("성명을 입력해주세요.");
				$("#seplName").focus();
				return;
			}
			if($('input:radio[name="idvlInfoCntn1Yn"]:checked').val() != 'Y'){
				alert("정보 수집에 동의해주세요.");
				return;
			}
			if($('input:radio[name="idvlInfoCntn2Yn"]:checked').val() != 'Y'){
				alert("민감 정보 수집에 동의해주세요.");
				return;
			}
		}else{
			if(!$("#file").val()){
				alert("파일을 업로드해주세요.");
				$("#file").focus();
				return;
			}
		}
		
		if(save == "I") {
			if(confirm("등록 하시겠습니까?")){
				document.frm.action = "/gnoincoundb/preExamReg.do?mnuCd=${mnuCd}&save="+save;
		       	document.frm.submit();
			}			
		} else if(save == "S") {
			if(confirm("수정 하시겠습니까?")){
				document.frm.action = "/gnoincoundb/preExamReg.do?mnuCd=${mnuCd}&save="+save;
		       	document.frm.submit();
			}
		}
	}
	
	function findUserPopup(){
		var userNm = $("#cnsleNm").val();
		userNm = encodeURI(encodeURIComponent(userNm));		
		var caseNo = "${caseNo}";
		var url = "/gnoincoundb/findUserPopup.do?userNm=" + userNm+"&cnsTargetGb=Y"+"&schCaseNo="+caseNo;
		var name = "회원 찾기";
		var option = "width = 530, height = 750, top = 50, left = 100, location = yes";
		window.open(url, name, option);encodeURI(encodeURIComponent(jindan_name));
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
				var arr = [ 'cnsNm', 'zoneNm', 'centerNm' ];
				for(var i=0;i<arr.length;i++){
					$("[data-type='" + arr[i] + "']").text(eval("data." + arr[i] ));
				}
				
			}).fail(function(e){
				alert('서버 오류가 발생하였습니다.');
			})
			
		}
	}
	
	function fn_list(mnuCd){
		document.location.href = "/gnoincoundb/pretestList.do?mnuCd=" + mnuCd;
	}
	
</script>

<section id="content">

	<h2 class="h2-title"><i class="fa fa-check-square"></i>개인정보동의서 등록</h2>	
		<div class="box-style1 x-scroll-auto" >
			<div>
				<ul class="tabs">
					<!-- <li style="border-style: solid; border-bottom-style:none; border-width: thin;" onclick="fn_goLink(1);">보안서약서</li> -->
					<li style="border-style: solid; border-bottom-style:none; border-width: thin;" onclick="fn_goLink(2);">상담동의서</li>
					<li style="border-style: solid; border-bottom-style:none; border-width: thin; background-color: gray;">개인정보동의서</li>
					<li style="border-style: solid; border-bottom-style:none; border-width: thin;" onclick="fn_goLink(4);">노인상담선별척도지</li>
					<div class="txtR" style="width: 73.2%; display: inline-block;">
						<button type="button" id="Ubtn" class="btn-basic" onClick="javascript:fn_reg('U');" style="background-color: green;color:white;">업로드</button>
						<button type="button" id="Ibtn" class="btn-basic" onClick="javascript:fn_reg('I');" style="background-color: green;color:white;">등록</button>
						<button type="button" id="Sbtn" class="btn-basic" onClick="javascript:fn_reg('S');" style="background-color: green;color:white;">수정</button>
						<button type="button" class="btn-basic" onClick='javascript:fn_list("${mnuCd}");' style="background-color: green;color:white;">목록</button>
					</div>
				</ul>
			</div>
			<div style="border-style: solid; border-width: thin; width:100%; height: auto; padding: 10px 10px 10px 10px;">
				<form id="frm" name="frm" method="post" enctype="multipart/form-data">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
					<input type="hidden" id="mnuCd" name="mnuCd" value="${mnuCd }" />
					<input type="hidden" id="caseNo" name="caseNo" value="0" />
					<input type="hidden" id="localGb" name="localGb" value="9"/>
					<input type="hidden" id="examDocCd" name="examDocCd" value="3" />
					<input type="hidden" id="docGb" name="docGb" value="1" />
					<input type="hidden" id="perInfoPath" name="perInfoPath" value="Y" />
					<table border="1" class="table-write" style="width: 101.2%; position: relative; left: -10px; top: -10px; border-left-style:hidden; border-right-style: hidden; border-top-style: hidden;">
						<colgroup>
							<col width="15%" >
							<col width="35%" >
							<col width="15%" >
							<col width="35%" >
						</colgroup>
						<tbody>
							<tr>
								<th>문서구분</th>
								<td>개인정보동의서</td>
								<th>작성여부</th>
								<td>
									<input type="radio" style="margin: 0 4px 4px 7px;" name="writeYn" id="writeY" value="Y" checked="checked" /><label for="writeY">예</label>
									<!-- <input type="radio" style="margin: 0 4px 4px 7px;" name="writeYn" id="writeN" value="N" /><label for="writeN">아니오</label> -->
								</td>
							</tr>
							<tr>
								<th>내담자ID</th>
								<td><input type="text" id="cnsleId" name="cnsleId" style="width: 200px;" value="${detail.cnsleId }" readonly="readonly" /></td>
								<th>내담자명</th>
								<td><input type="text" id="cnsleNm" name="cnsleNm" style="width: 200px;" value="${detail.cnsleNm }" readonly="readonly" /><button type="button" id="findBtn" class="btn-basic" style="padding: 2px 6px;" onclick="javascript:findUserPopup();">찾기</button></td>
							</tr>
							<tr height=33>
								<th>상담구분</th>
								<td><span data-type='cnsNm'><c:out value="${detail.cnsGbNm }" /></span></td>
								<th>권역구분</th>
								<td><span data-type='zoneNm'><c:out value="${detail.zoneGbNm }" /></span></td>
							</tr>
							<tr height=33>
								<th>센터구분</th>
								<td><span data-type='centerNm'><c:out value="${detail.centerGbNm }" /></span></td>
								<th></th>
								<td></td>
							</tr>
							<tr id="uploadTr" style="display: none;">
								<th>직접업로드</th>
								<td colspan="3">
									<div class="filebox"> 
	  									<input type="file" id="file" name="file"> 
										<input class="upload-name" value="파일선택">
										<label class="btn-basic" style="background-color: gray;color:white;" for="file">찾기</label> 
									</div>
								</td>
							</tr>						
						</tbody>
					</table>
				<div style="border-style: solid; border-width: thin; width:700px; height: auto; padding: 30px 20px 20px 20px; margin: 10px 10px 10px 450px;">
					<div>
						<h1 style="text-align: center; font-size:x-large; padding-bottom: 20px; border-bottom-style: solid; border-width: thin;">개인정보수집·이용·제공 동의서</h1><br>
					</div>
					<font style="font-size: small;"> 경기도노인종합상담센터와 <!-- OOO 노인상담센터 --><c:out value="${loginVo.centerNm }" />은 개인정보 보호법에 명기된 관련 법률상의 개인정보처리자가 준수하여야 할 개인정보보호 
					규정을 준수하며, 관련법령에 의거하여 이용자 권익보호에 최선을 다하고 있습니다. 또한, 본 기관은 [개인정보보호법] 제15조 및 "경기도 노인종합상담센터 설치 및 운영조례" 이하 
					'상담조례'에 의거하여 귀하의 개인정보 수집·이용함에 있어 동의를 받고 있습니다.</font><br><br>
					<h2>I. 정보 수집에 대한 동의</h2><br>
					<font style="font-size: medium; font-weight: bold;">1. 개인정보 수집항목</font><br>
					<font style="font-size: medium;">성명, 성별, 전화번호, 생년월일, 학력, 문자해독, 주소, 음주, 수면, 경제수준, 주거형태, 주택형태, 
					결혼상태, 동거상태, 경제상태, 심리상태, 노인일자리 참여 여부</font><br><br>
					<font style="font-size: medium; font-weight: bold;">2. 개인정보 수집 목적</font><br>
					<font style="font-size: medium;">경기도상담시스템 및 경기도가 운영하고 있는 취약노인정보시스템에 입력되어 보다 효율적인 서비스 이용자 관리를 위해 
					추진하고 있는 다양한 서비스 제공 및 서비스 이둉자 중복수혜 확인 등의 목적으로 활용</font><br><br>
					<font style="font-size: medium; font-weight: bold;">3. 개인정보의 보유 및 파기</font><br>
					<font style="font-size: medium;">서비스 종료 후 5년간 보존</font><br><br>
					<font style="font-size: medium; font-weight: bold;">4. 개인정보 제공 동의 거부 권리 및 동의 거부 따른 불이익 내용 또는 제한사항</font><br>
					<font style="font-size: medium;">귀하는 개인정보 제공 동의를 거부할 권리가 있으며, 동의거부에 따른 불이익은 없습니다. 다만, 일부 서비스는 그 특성에 따라 제한 될 수 있습니다.</font><br>
					<div style="border-bottom-style: dotted; border-top-style: dotted; border-width: thin; background-color: #D5D5D5; position: relative; left: -20px; width: 698px; text-align: center;">
						<font style="font-size: medium; font-weight: bold;"> 위 정보 수집에 동의하십니까? </font><input type="radio" id="idvlInfoCntn1Y" name="idvlInfoCntn1Yn" value="Y" style="width: 15px; height: 15px;"/><label style="font-size: medium;" for="idvlInfoCntn1Y"> 동의함</label>
						<input type="radio" id="idvlInfoCntn1N" name="idvlInfoCntn1Yn" value="N" style="width: 15px; height: 15px;"/><label style="font-size: medium;" for="idvlInfoCntn1N"> 동의하지 않음(작성종료)</label>
					</div><br>
					<h2>II.민감정보 수집에 대한 별도 동의</h2><br>
					<font style="font-size: medium; font-weight: bold;">1. 민감정보 수집항목(사회복지사업법 시행령 제25조의2 의거)</font><br>
					<font style="font-size: medium;">종교, 건강(건강상태, 진단병력, 복용약)</font><br><br>
					<font style="font-size: medium; font-weight: bold;">2. 개인정보 수집 목적</font><br>
					<font style="font-size: medium;">경기도상담시스템 및 경기도가 운영하고 있는 취약노인정보시스템에 입력되어 보다 효율적인 서비스 이용자 관리를 위해 정부 및 
					경기도에서 추진하고 있는 다양한 서비스 제공 및 서비스 이용자 중복수혜 확인 등의 목적으로 활용</font><br><br>
					<font style="font-size: medium; font-weight: bold;">3. 개인정보의 보유 및 파기</font><br>
					<font style="font-size: medium;">서비스 종료 후 5년간 보존</font><br><br>
					<font style="font-size: medium; font-weight: bold;">4. 개인정보 제공 동의 거부 권리 및 동의 거부 따른 불이익 내용 또는 제한사항</font><br>
					<font style="font-size: medium;">귀하는 개인정보 제공 동의를 거부할 권리가 있으며, 동의거부에 따른 불이익은 없습니다. 다만, 일부 서비스는 그 특성에 
					따라 제한 될 수 있습니다.</font><br>
					<div style="border-bottom-style: dotted; border-top-style: dotted; border-width: thin; background-color: #D5D5D5; position: relative; left: -20px; width: 698px; text-align: center;">
						<font style="font-size: medium; font-weight: bold;"> 위 민감 정보 수집에 동의하십니까? </font><input type="radio" id="idvlInfoCntn2Y" name="idvlInfoCntn2Yn" value="Y" style="width: 15px; height: 15px;"/><label style="font-size: medium;" for="idvlInfoCntn2Y"> 동의함</label>
						<input type="radio" id="idvlInfoCntn2N" name="idvlInfoCntn2Yn" value="N" style="width: 15px; height: 15px;"/><label style="font-size: medium;" for="idvlInfoCntn2N"> 동의하지 않음(작성종료)</label>
					</div><br>
					<font style="font-size: medium;">본인은 위의 내용을 충분히 숙지하였으며, 본 기관의 보다 나은 서비스 제공과 정책수립을 위해 개인정보를 수집, 활용, 제공하는 것에 동의합니다.</font><br>
					<font style="font-size: medium;">아울러 본 동의서는 서비스 제공 목적을 위한 업무 외에는 사용하지 않을 것을 약속드리며 철저히 비밀로 관리하여 타인에게 공개하거나 
					유출하지 않을 것임을 알려드립니다.</font><br>
					<font style="font-size: medium;">개인정보처리방침 세부내용은 담당자(OOOOO)의 안내를 받으시거나, 본 기관의 홈페이지(www.OOOOO.or.kr)를 통하여 확인하시기 바랍니다.</font><br><br>
					
					<div style="text-align: center;">
						<input type="text" id="year" name="year" style="width: 60px;" maxlength="4" value="${detail.year }" oninput="this.value = this.value.replace(/[^0-9]/g, '');"><font style="font-size: medium;">년</font>
						<input type="text" id="month" name="month" style="width: 30px;" maxlength="2" value="${detail.month }" oninput="this.value = this.value.replace(/[^0-9]/g, '');"><font style="font-size: medium;">월</font>
						<input type="text" id="day" name="day" style="width: 30px;" maxlength="2" value="${detail.day }" oninput="this.value = this.value.replace(/[^0-9]/g, '');"><font style="font-size: medium;">일</font><br>
						<font style="font-size: medium;">본인 확인자</font>
						<input type="text" name="myselfAgre" style="width: 130px;" maxlength="10" value="${detail.myselfAgre }" oninput="this.value = this.value.replace(/[^a-zㄱ-힣]/, '');"><font style="font-size: medium;">(인 또는 서명)</font><br>
						<font style="font-size: medium;">보호자 또는 법정대리인</font>
						<input type="text" name="guardian" style="width: 130px;" maxlength="10" value="${detail.guardian }" oninput="this.value = this.value.replace(/[^a-zㄱ-힣]/, '');"><font style="font-size: medium;">(인 또는 서명)</font>
					</div><br>
					<div style="text-align: right;">
						<h2>경기도노인종합상담센터, OOO노인상담센터 귀하 </h2><br>
					</div>
				</div>
				</form>
			</div>
		</div>
		
		<!-- end -->

	</section>

</html>

