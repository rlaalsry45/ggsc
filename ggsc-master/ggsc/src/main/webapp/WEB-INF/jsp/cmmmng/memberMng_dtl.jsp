<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/javascript">
	$(document).ready(function() {
		var authCd = "${detail.authCd}";
		if(authCd != ""){
			$("#authCd").val(authCd).prop("selected", true);
		}
		
		var str;
		var name;
		
		str = "${detail.gender}";
		name = "gender";
		fn_checked(str, name);
		
		str = "${detail.useYn}";
		name = "useYn";
		fn_checked(str, name);
	  
	});
	
	function fn_upd(){
		
		var tel = $("#tel").val().replace(/ /gi, "");
		var mobile = $("#mobile").val().replace(/ /gi, "");
		var birthDt = $("#datepicker1").val().replace(/ /gi, "");
		var addr = $("#addr").val().replace(/ /gi, "");		
		var acptDt = $("#datepicker2").val().replace(/ /gi, "");		
		
		if(tel.length == 0){
			alert("전화번호를 입력해 주세요.");
			$("#tel").focus();
			return;
		}
		if(mobile.length == 0){
			alert("휴대폰번호를 입력해 주세요.");
			$("#mobile").focus();
			return;
		}
		if(birthDt.length == 0){
			alert("생년월일을 입력해 주세요.");
			$("#birthDt").focus();
			return;
		}
		if(addr.length == 0){
			alert("주소를 입력해 주세요.");
			$("#addr").focus();
			return;
		}
		if(acptDt.length == 0){
			alert("가입일자 입력해 주세요.");
			$("#acptDt").focus();
			return;
		}

		if(confirm("수정 하시겠습니까?")){
			document.frm.action = "/gnoincoundb/memberMngUpd.do";
	       	document.frm.submit();
		}
	}  	
	
	function fn_list(mnuCd){
		document.location.href = "/gnoincoundb/memberMngList.do?mnuCd=" + mnuCd;
	}  
	
	function fn_checked(str, name){
		if(str != ""){
			var arr = str.split(",");
			for(var i in arr){
				$("input[name=" + name + "][value=" + arr[i] + "]").prop("checked", true);
			}	
		}
	}
	
	function fn_clearPw(param) {
		if(confirm("비밀번호를 초기화 하시겠습니까?")) {
			
		} else {
			return false;
		}
		
		// $("#currentPageNo").val(curPage);
		var param = $("#frm").serialize(); //ajax로 넘길 data
		var token = $("meta[name='_csrf']").attr("th:content");
		var header = $("meta[name='_csrf_header']").attr("th:content");
		 
		$.ajax({
			type : "POST",
			url : "/gnoincoundb/memberPwClearAjax.do",
			data : param,
			dataType : "json",
			beforeSend : function(xhr){
				xhr.setRequestHeader(header, token);
			},
			success : function(json) {
				var userId = json.userId;
				alert(userId+"님의 비밀번호가 초기화됐습니다.");
			},
			error : function(e) {
				alert("서버와 통신 오류입니다.");
			}
		});
	}
	
</script>
<section id="content">
	<h2 class="h2-title" style="float: left;"><i class="fa fa-check-square"></i>
		회원관리 상세 및 수정
	</h2>
	<div class="btn" style="text-align: right; display: block;">
		<button type="button" class="btn-basic" onClick="javascript:fn_clearPw('C');" style="background-color:#fc692f;color:white;">비밀번호 초기화</button>
	</div>	
	<form id="frm" name="frm" method="post">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		<input type="hidden" id="mnuCd" name="mnuCd" value="${mnuCd }" />
		<input type="hidden" id="userId" name="userId" value="${detail.userId }" />		
		
		<table class="table-write" >
			<colgroup>
				<col width="10%" />
				<col width="40%" />		
				<col width="10%" />		
				<col width="40%" />		
			</colgroup>
			<tr>
				<th>ID</th>
				<td>${detail.userId }</td>
				<th>회원명</th>
				<td>${detail.userNm }</td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td><input type="text" class="wd200" id="tel" name="tel" value="${detail.tel }" /></td>
				<th>휴대폰</th>
				<td><input type="text" class="wd200" id="mobile" name="mobile" value="${detail.mobile }" /></td>
			</tr>
			<tr>
				<th>생일</th>
				<td><span class="form"><input type="text" class="wd200" id="datepicker1" name="birthDt" value="${detail.birthDt }" readonly="readonly" /></span></td>
				<th>성별</th>
				<td>
					<input type="radio" id="genderM" name="gender" value="M" /> <label for="genderM">남</label>
					<input type="radio" id="genderF" name="gender" value="F" /> <label for="genderF">여</label>
				</td>
			</tr>
			<tr>
				<th>주소</th>
				<td><input type="text"  id="addr" name="addr" value="${detail.addr }" /></td>
				<th>상세주소</th>
				<td><input type="text"  id="addrDtl" name="addrDtl" value="${detail.addrDtl }" /></td>
			</tr>
			<tr>
				<th>권한</th>
				<td>
					<select class="wd200" id="authCd" name="authCd">
						<c:forEach items="${authorityGbList }" var="result">
					 		<option value="${result.odr }">${result.mclassNm }</option>
					 	</c:forEach>
					</select> 
				</td>
				<th>사용여부</th>
				<td>
					<input type="radio" id="useY" name="useYn" value="Y" /> <label for="useY">사용</label>
					<input type="radio" id="useN" name="useYn" value="N" /> <label for="useN">미사용</label>
				</td>
			</tr>
			<tr>
				<th>가입일자</th>
				<td><span class="form"><input type="text" class="wd200" id="datepicker2" name="acptDt" value="${detail.acptDt }" readonly="readonly" /></span></td>
				<th>탈퇴일자</th>
				<td><span class="form"><input type="text" class="wd200" id="datepicker3" name="outDt" value="${detail.outDt }" /></span></td>
			</tr>
		</table>
	</form>
	<div class="btn" style="text-align: right; display: block;">
		<button type="button" class="btn-basic" onClick="javascript:fn_upd();" style="background-color:#fc692f;color:white;">수정</button>
		<button type="button" class="btn-basic" onClick="javascript:fn_list('${mnuCd}');" style="background-color:#fc692f;color:white;">목록</button>
	</div>	
</section>
