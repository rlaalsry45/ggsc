<%@ page import="egovframework.rte.psl.dataaccess.util.EgovMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<script type="text/javascript">
	$(document).ready(function() {
		
	   var num = "${detail.num}";
	   if(num != "") {
		   $("#regBtn").css("display", "none");
	   } else {
		   $("#updBtn").css("display", "none");
	   }
	   
	   $('#authGrpGb').val('${detail.authGrpGb}').attr('selected','selected');
	   $('input:radio[name=useYn]:input[value="${detail.useYn}"]').attr("checked", true);
		
		/* var authGrpCd = "${detail.authGrpCd}";
		if(authGrpCd != ""){
			$("#authGrpCd").val(authGrpCd).prop("selected", true);
		}
		
		var str;
		var name;

		str = "${detail.useYn}";
		name = "useYn";
		fn_checked(str, name); */
		
	  
	});
	
	function fn_authCheck() {
		var param = $("#authNm").val();
		// var param = $("#searchForm").serialize(); //ajax로 넘길 data
		var token = $("meta[name='_csrf']").attr("th:content");
		var header = $("meta[name='_csrf_header']").attr("th:content");
		
		$.ajax({
			type : "POST",
			url : "/gnoincoundb/authMngCheckAjax.do",
			data : {authNm:param},
			dataType : "json",
			beforeSend : function(xhr){
				xhr.setRequestHeader(header, token);
			},
			success : function(json) {
				var msg = json.msg;
				var authCheck = json.authCheck;
				alert(msg);
				if(authCheck == "Y") {
					$("#authCheck").val("Y");
					$("#authNm").attr("readonly",true);
				}
				
			},
			error : function(e) {
				alert("서버와 통신 오류입니다.");
			}
		});
	}
	
	/* function fn_codeCheck(){
		var param = $("#authCd").val();
		if(param.length == 0){
			alert("개별권한코드를 입력해주세요.");
			return;
		}
		var token = $("meta[name='_csrf']").attr("th:content");
		var header = $("meta[name='_csrf_header']").attr("th:content");
		$.ajax({
			type : "POST",
			url : "/authMngCodeCheck_ajax.do",
			data : {authCd:param},
			dataType : "json",
			beforeSend : function(xhr){
				xhr.setRequestHeader(header, token);
			},
			success : function(json) {
				var msg = json.msg;
				$("#codeCheck").val(json.codeCheck);
				alert(msg);
				$("#authCd").focus();
			},
			error : function(e) {
				alert("서버와 통신 오류입니다.");
			}
		});
	} */
	
	function fn_save(save){
		/* $("#save").val(save);
		var authNm = $("#authNm").val().replace(/ /gi, "");
		var cntn = $("#cntn").val().replace(/ /gi, "");
		var authGrpNm = $("#authGrpNm").val();
		var useYn = $("#useYn").val();
		
		if(authNm.length == 0){
			alert("개별권한코드를 입력해 주세요.");
			$("#authCd").focus();
			return;
		}
		if(authGrpNm.length == 0){
			alert("개별권한명을 입력해 주세요.");
			$("#authNm").focus();
			return;
		}
		if(cntn.length == 0){
			alert("설명을 입력해 주세요.");
			$("#cntn").focus();
			return;
		}
		if(useYn.length == 0){
			alert("정렬순서를 입력해 주세요.");
			$("#useYn").focus();
			return;
		}
		
		if($("#codeCheck").val()!= "Y"){
			alert("개별권한코드 중복체크를 해주세요");
			return;
		} */
		 
		if(save == "S") {
			if(confirm("등록 하시겠습니까?")){
				document.frm.action = "/gnoincoundb/authMngReg.do?save="+save;
		       	document.frm.submit();
			}
		} else {
			if(confirm("수정 하시겠습니까?")){
				document.frm.action = "/gnoincoundb/authMngReg.do?save="+save;
		       	document.frm.submit();
			}
		}
	}  	
	
	function fn_list(mnuCd){
       	location.href = "/gnoincoundb/authMngList.do?mnuCd="+mnuCd;
	}  	
	
	function fn_checked(str, name){
		if(str != ""){
			var arr = str.split(",");
			for(var i in arr){
				$("input[name=" + name + "][value=" + arr[i] + "]").prop("checked", true);
			}	
		}
	}
	
</script>

<section id="content">
	<h2 class="h2-title"><i class="fa fa-check-square"></i>
		권한관리 등록 및 수정
	</h2>
	<input type="hidden" id="authCheck" />
	<form id="frm" name="frm" method="post">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		<input type="hidden" id="mnuCd" name="mnuCd" value="${mnuCd }" />
		<input type="hidden" id="num" name="num" value="${num }" />
		<table class="table-write" style="width:1100px;">
			<colgroup>
				<col width="10%" />
				<col width="40%" />		
				<col width="10%" />		
				<col width="40%" />		
			</colgroup>
			<tr>
				<%-- <th>권한코드</th>
				<td><input type="text" class="wd200" id="authCd" name="authCd" value="${detail.authCd }" /><button type="button" class="btn-basic" onclick="javascript:fn_codeCheck()">중복확인</button></td> --%>
				<th>권한명</th>
				<td colspan="3"><input type="text" id="authNm" name="authNm" value="${detail.authNm }" maxlength="50" style="width: 250px;" /><button type="button" class="btn-basic" onclick="javascript:fn_authCheck()">중복확인</button></td>
			</tr>
			<tr>
				<th>그룹권한명</th>
				<td>
					<select class="wd200" id="authGrpGb" name="authGrpGb">
						<option value="">전체</option>
						<c:forEach items="${authorityGbList }" var="result">
					 		<option value="${result.odr }">${result.mclassNm }</option>
					 	</c:forEach>
					</select>
				</td>
				<th>설명</th>
				<td><input type="text" id="cntn" name="cntn" value="${detail.cntn }" maxlength="100" /></td>
			</tr>
			<tr>
				<th>정렬순서</th>
				<td><input type="text" class="wd200" id="odr" name="odr" value="${detail.odr }" readonly/></td>
				<th>사용여부</th>
				<td>
					<input type="radio" id="useY" name="useYn" value="Y" /> <label for="useY">사용</label>
					<input type="radio" id="useN" name="useYn" value="N" /> <label for="useN">미사용</label>
				</td>
			</tr>
		</table>
	</form>
	<div class="btn" style="text-align: right; display: block; width: 68.8%;">
		<button type="button" class="btn-basic" id="regBtn" onClick="javascript:fn_save('S');" style="background-color:#fc692f;color:white;">등록</button>
		<button type="button" class="btn-basic" id="updBtn" onClick="javascript:fn_save('U');" style="background-color:#fc692f;color:white;">수정</button>
		<button type="button" class="btn-basic" onClick="javascript:fn_list('${mnuCd }');" style="background-color:#fc692f;color:white;">목록</button>
	</div>	
</section>
