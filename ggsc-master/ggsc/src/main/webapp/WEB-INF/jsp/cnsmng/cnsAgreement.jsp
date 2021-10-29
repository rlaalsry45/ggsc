<%@ page import="egovframework.rte.psl.dataaccess.util.EgovMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<link href="/gnoincoundb/css/style.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="/gnoincoundb/js/jquery-1.11.2.min.js" ></script>
<script src="/gnoincoundb/js/html2canvas.min.js" ></script>
<script src="/gnoincoundb/js/jspdf.min.js" ></script>
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
  </head>
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
			// 수정기능이 안되므로 등록 버튼 감추기
			$("#Ibtn").css("display","none");
			$("#Sbtn").css("display","");
			$("#findBtn").css("display","none");
		} else {
			$("#Ibtn").css("display","");
			$("#Sbtn").css("display","none");
			$("#findBtn").css("display","");
		}
		
	});
	
	function fn_goLink(no){
		var url = "";
		var caseNo = "${caseNo}";
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
	
	function fn_reg(save) {
	
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
			if($("#cnsleNm2").val()==""){
				alert("내담자명을 입력해주세요.");
				$("#cnsleNm2").focus();
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

	<h2 class="h2-title"><i class="fa fa-check-square"></i>상담동의서 등록</h2>
		<div class="box-style1 x-scroll-auto" >
			<div>
				<ul class="tabs">
					<!-- <li style="border-style: solid; border-bottom-style:none; border-width: thin;" onclick="fn_goLink(1);">보안서약서</li> -->
					<li style="border-style: solid; border-bottom-style:none; border-width: thin; background-color: gray;">상담동의서</li>
					<li style="border-style: solid; border-bottom-style:none; border-width: thin;" onclick="fn_goLink(3);">개인정보동의서</li>
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
					<input type="hidden" id="sigunCd" name="sigunCd" />
					<!-- <input type="hidden" id="localGb" name="localGb" value="9"/>
					<input type="hidden" id="zoneGb" name="zoneGb" /> -->
					<input type="hidden" id="examDocCd" name="examDocCd" value="2" />
					<input type="hidden" id="docGb" name="docGb" value="1" />
					<input type="hidden" id="agrePath" name="agrePath" value="Y" />
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
								<td>상담동의서</td>
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
				<div style="border-style: solid; border-width: thin; width:700px;; height: auto; padding: 30px 20px 20px 20px; margin: 10px 10px 10px 450px;">
					<div>
						<h1 style="text-align: center; font-size:x-large; padding-bottom: 20px;">상담동의서</h1>
					</div>
					<font style="font-size: medium;">본 동의서의 목적은 노인상담센터가 제공하는 상담서비스에 관한 기본적인 정보를 드리고 이해를 높이고자하는 것입니다. 복사본을 원하시면 상담자에게 요청하시기 바랍니다.</font>
					<br><br>
					<h2><span style="font-size: 20px;">▣</span> 비밀보장</h2><br>
					<font style="font-size: medium">노인상담센터의 상담은 상담자 윤리 규정에 의거하여 비밀보장이 유지됩니다. 각 상담 회기 후 작성되는 상담일지 또한 안전하게 저장됩니다. 
					상담내용의 비밀보장에는 몇 가지 예외상황이 있습니다.</font><br>
					<font style="font-size: medium;">1. 상담사의 전문가로서 계속적인 성장을 위하여 사례에 대한 자문을 받는 경우 상담 내용을 나눌 수 있습니다.</font><br>
					<font style="font-size: medium;">2. 내담자가 자살 시도를 하려고 할 때, 혹은 다른 사람을 해칠 의도가 있을 때, 가정 폭력 등으로 가족구성원이 학대 받고 있을 때, 
					내담자가 감염 병이 있다는 것을 되었을 때에는 비밀보장이 지켜지지 않을 수 있습니다.</font><br>
					<font style="font-size: medium;">3. 법원의 요청으로 인해 상담을 받을 경우 모든 상담 내용은 관련기관에 통보될 수 있습니다.</font><br>
					<font style="font-size: medium;">4. 내담자가 상담자에게 지문이나 대화를 허가한 경우 해당되는 친지나 전문가와 상담 내용의 일부분을 나눌 수 있습니다.</font><br><br>
					<h2><span style="font-size: 20px;">▣</span> 내담자의 권리</h2><br>
					<font style="font-size: medium;">상담의 시작과 끝에 대한 결정은 내담자의 권리입니다. 내담자는 상담시작 전 혹은 상담도중에 언제든지 상담을
					거부하거나 중단할 수 있는 권리가 있습니다. 상담종결을 원할 경우 언제든지 저와 의논해 주시기 바랍니다. 또한 내담자는 자신이 받은 상담 및 심리검사의 기록을 볼 수 있는 권리가 있습니다.</font>
					<br><br>
					<h2><span style="font-size: 20px;">▣</span> 녹음동의</h2><br>
					<font style="font-size: medium;">녹음 동의는 상담자가 전문가로서의 수련과 성장을 위하여 사례에 대하여 자문을 받거나, 더 나은 상담을 제공하기 위하여 상담
					내용을 녹음을 하는 것에 대한 동의를 구하고자 하는 것입니다.</font><br>
					<font style="font-size: medium;">녹음 파일은 안전하게 저장되며 녹음 파일에도 비밀보장의 원칙이 적용됩니다. 녹음된 회기 내용은 상담자와 상담자의 수련에 관련된 
					전문가들만 들을 수 있습니다. 상담의 녹음에 관한 결정은 내담자의 권리입니다. 내담자는 언제든지 녹음을 거부하거나 중단 할 수 있습니다. 녹음이 불편한 경우 언제든지 상담자에게 
					말씀해 주시기 바랍니다.</font><br>
					<font style="font-size: medium;">위의 상담동의서 내용을 상담자로부터 충분히 설명을 들었으며 모든 사항에 동의합니다. 나는 질문이 있을 경우 상담자에게 
					언제든지 질문할 권리를 가지고 있다는 것을 알고 있습니다.</font>
					<br><br><br>
					<div style="text-align: center;">
						<font style="font-size: medium;">날&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;짜 :</font>
						<input type="text" id="year" name="year" style="width: 60px;" maxlength="4" value="${detail.year }" oninput="this.value = this.value.replace(/[^0-9]/g, '');"><font style="font-size: medium;">년</font>
						<input type="text" id="month" name="month" style="width: 30px;" maxlength="2" value="${detail.month }" oninput="this.value = this.value.replace(/[^0-9]/g, '');"><font style="font-size: medium;">월</font>
						<input type="text" id="day" name="day" style="width: 30px;" maxlength="2" value="${detail.day }" oninput="this.value = this.value.replace(/[^0-9]/g, '');"><font style="font-size: medium;">일</font><br>
						<font style="font-size: medium;">내 담 자 :</font>
						<input type="text" id="cnsleNm2" name="cnsleNm2" style="width: 130px;" value="${detail.cnsleNm }" readonly="readonly"><font style="font-size: medium;">(서명)</font>
					</div>
				</div>
				</form>
			</div>
		</div>
		
		<!-- end -->

	</section>

</html>

