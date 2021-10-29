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
		var fileTarget = $('#file'); 
		fileTarget.on('change', function(){ // 값이 변경되면
		    var cur=$(".filebox input[type='file']").val();
			$(".upload-name").val(cur);
		});
		
		$("input[type=radio]").click(function(){
			if($("input[name=writeYn]:checked").val() == "Y"){
				$("#uploadTr").css("display", "none");
			}else if($("input[name=writeYn]:checked").val() == "N"){
				$("#uploadTr").css("display", "");
			}
		});
	});
	function fn_goLink(no){
		var url = "";
		
		if(no == 1){
			url = "/gnoincoundb/securityPledge.do?mnuCd=${mnuCd}";	
		}else if(no == 2){
			url = "/gnoincoundb/cnsAgreement.do?mnuCd=${mnuCd}";
		}else if(no == 3){
			url = "/gnoincoundb/privacyAgreement.do?mnuCd=${mnuCd}";
		}else{
			url = "/gnoincoundb/scScreeningScale.do?mnuCd=${mnuCd}";
		}
		document.location.href = url;
	}
	/*
	function fn_fileUpload(){
		 var form = $('#fileFrm')[0];
         var formData = new FormData(form);
         formData.append("file", $("#file")[0].files[0]);

		alert($("#file")[0].files[0]);
		alert($("input[name=file]").val());
        $.ajax({
            data : formData,
            type : "POST",
            url : "/acptFileUpload.do",
            enctype : "multipart/form-data",
            contentType : false,
            processData : false,
            success : function(data) {
				alert("문서 업로드가 완료 되었습니다.");
            }
        });
	}
	*/
	function fn_reg(){

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
			if($("#day").val()==""){
				alert("날짜를 입력해주세요.");
				$("#day").focus();
				return;
			}
			if($("#rank").val()==""){
				alert("직위를 입력해주세요.");
				$("#rank").focus();
				return;
			}
			if($("#seplName").val()==""){
				alert("성명을 입력해주세요.");
				$("#seplName").focus();
				return;
			}
			if($("#jumin1").val()==""){
				alert("주민등록번호를 입력해주세요.");
				$("#jumin1").focus();
				return;
			}
			if($("#jumin2").val()==""){
				alert("주민등록번호를 입력해주세요.");
				$("#jumin2").focus();
				return;
			}
			
			if(!ssnCheck($("#jumin1").val(), $("#jumin2").val())){
				return false;
			}
		}else{
			if(!$("#file").val()){
				alert("파일을 업로드해주세요.");
				$("#file").focus();
				return;
			}
		}
		
		if(confirm("등록 하시겠습니까?")){
			document.frm.action = "/gnoincoundb/preExamReg.do?mnuCd=${mnuCd}";
	       	document.frm.submit();
		}
	}

	function findUserPopup(){
		var userNm = $("#cnsleNm").val();
		userNm = encodeURI(encodeURIComponent(userNm));		
		var url = "/gnoincoundb/findUserPopup.do?userNm=" + userNm+"&cnsTargetGb=Y";
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
	
</script>

<section id="content">

	<h2 class="h2-title"><i class="fa fa-check-square"></i>보악서약서 등록</h2>
		<div class="box-style1 x-scroll-auto" >
			<div>
				<ul class="tabs">
					<li style="border-style: solid; border-bottom-style:none; border-width: thin; background-color: gray;">보안서약서</li>
					<li style="border-style: solid; border-bottom-style:none; border-width: thin;" onclick="fn_goLink(2);">상담동의서</li>
					<li style="border-style: solid; border-bottom-style:none; border-width: thin;" onclick="fn_goLink(3);">개인정보동의서</li>
					<li style="border-style: solid; border-bottom-style:none; border-width: thin;" onclick="fn_goLink(4);">노인상담선별척도지</li>
					<div class="txtR" style="width: 72%; display: inline-block;">
						<button type="button" class="btn-basic" onClick="javascript:fn_reg();" style="background-color: green;color:white;">등록</button>
					</div>
				</ul>
			</div>
			<div style="border-style: solid; border-width: thin; width:100%; height: auto; padding: 10px 10px 10px 10px;">
				<form id="frm" name="frm" method="post" enctype="multipart/form-data">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
					<input type="hidden" id="mnuCd" name="mnuCd" value="${mnuCd }" />
					<input type="hidden" id="caseNo" name="caseNo" value="" />
					<input type="hidden" id="examDocCd" name="examDocCd" value="1" />
					<input type="hidden" id="docGb" name="docGb" value="1" />
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
								<td>보안서약서</td>
								<th>작성여부</th>
								<td>
									<input type="radio" style="margin: 0 4px 4px 7px;" name="writeYn" id="writeY" value="Y" checked="checked" /><label for="writeY">예</label>
									<input type="radio" style="margin: 0 4px 4px 7px;" name="writeYn" id="writeN" value="N" /><label for="writeN">아니오</label>
								</td>
							</tr>
							<tr>
								<th>사용자ID</th>
								<td><input type="text" id="cnsleId" name="cnsleId" style="width: 200px;" readonly="readonly" /></td>
								<th>사용자명</th>
								<td><input type="text" id="cnsleNm" name="cnsleNm" style="width: 200px;" /><button type="button" class="btn-basic" style="padding: 2px 6px;" onclick="javascript:findUserPopup();">찾기</button></td>
							</tr>
							<tr height=33>
								<th>상담구분</th>
								<td><span data-type='cnsNm'></span></td>
								<th>권역구분</th>
								<td><span data-type='zoneNm'></span></td>
							</tr>
							<tr height=33>
								<th>센터구분</th>
								<td><span data-type='centerNm'></span></td>
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
					<div style="border-style: solid; border-width: thin; width:700px; height: auto; padding: 50px 20px 20px 20px; margin: 10px 10px 10px 450px;">
						<div>
							<h1 style="text-align: center; font-size:x-large; padding-bottom: 50px;">보 안 서 약 서</h1>
						</div>
						<font style="font-size: large;">본인은 </font><input type="text" id="year" name="year" style="width: 60px;" maxlength="4" oninput="this.value = this.value.replace(/[^0-9]/g, ''); $('#wYear').val(this.value);" /><font style="font-size: large;">년</font>
						<input type="text" id="month" name="month" style="width: 30px;" maxlength="2" oninput="this.value = this.value.replace(/[^0-9]/g, ''); $('#wMonth').val(this.value);" /><font style="font-size: large;">월</font>
						<input type="text" id="day" name="day" style="width: 30px;" maxlength="2" oninput="this.value = this.value.replace(/[^0-9]/g, ''); $('#wDay').val(this.value);" /><font style="font-size: large;">일부로 노인상담사업을 수행함에 있어 다음 사항을 준수</font>
						<br><br>
						<font style="font-size: large;">할 것을 엄숙히 서약합니다.</font>
						<br><br><br><br>
						<font style="font-size: large;">1. 본인은 개인정보보호법 및 관계법령을 준수한다.</font>
						<br><br><br>
						<font style="font-size: large;">2. 본인은 노인상담사업 관련 업무 중 알게 될 일체의 내용이 직무상 기밀 사항임을</font>
						<br><br>
						<font style="font-size: large;">인정한다.</font>
						<br><br><br>
						<font style="font-size: large;">3. 본인은 이 기밀을 누설함이 서비스 대상자 등 당해 사업의 관계자 및 국가이익에</font>
						<br><br>
						<font style="font-size: large;">위해가 될 수 있음을 인식하여 업무수행 중 지득한 제반 기밀사항을 일체 누설하거</font>
						<br><br>
						<font style="font-size: large;">나 공개하지 아니한다.</font>
						<br><br><br>
						<font style="font-size: large;">4. 본인이 이 기밀을 누설하거나 관계규정을 위반한 때에는 관련 법령 및 계약에</font>
						<br><br>
						<font style="font-size: large;">따라 어떠한 처벌 및 불이익도 감수한다.</font>
						<br><br><br><br>
						<div style="text-align: center;">
							<input type="text" id="wYear" name="wYear" style="width: 60px;" readonly="readonly" /><font style="font-size: large;">년</font>
							<input type="text" id="wMonth" name="wMonth" style="width: 30px;" readonly="readonly" /><font style="font-size: large;">월</font>
							<input type="text" id="wDay" name="wDay" style="width: 30px;" maxlength="2" readonly="readonly" /><font style="font-size: large;">일</font>
						</div>
						<br><br><br>
						<font style="font-size: large; margin-left: 120px;">서&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;약&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;자</font>
						<br><br>
						<font style="font-size: large; margin-left: 120px;">직&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;위:</font><input type="text" id="rank" name="rank" style="width: 200px; margin-left: 7px;" />
						<br><br>
						<font style="font-size: large; margin-left: 120px;">성&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;명:</font><input type="text" id="seplName" name="seplName" style="width: 200px; margin-left: 7px;" /><font style="font-size: large; margin-left: 70px;"><a href="">(서명)</a></font>
						<br><br>
						<font style="font-size: large; margin-left: 120px;">주민등록번호:</font><input type="text" id="jumin1" name="jumin1" style="width: 100px; margin-left: 7px;" maxlength="6" oninput="this.value = this.value.replace(/[^0-9]/g, '');" /> - <input type="text" id="jumin2" name="jumin2" style="width: 100px;" maxlength="7" oninput="this.value = this.value.replace(/[^0-9]/g, '');" />
					</div>
				</form>
			</div>
		</div>
		
		<!-- end -->

	</section>

</html>

