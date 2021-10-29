<%@ page import="egovframework.rte.psl.dataaccess.util.EgovMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="_csrf" th:content="${_csrf.token}"/>
<meta name="_csrf_header" th:content="${_csrf.headerName}"/>
<title>신청자 정보 팝업</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="/gnoincoundb/css/style.css">
<script src="/gnoincoundb/js/jquery-1.11.2.min.js" ></script>
<script type="text/javascript">

	$(document).ready(function() {
		var userId = "${userId}";
		list(userId,"Y");
		var schCenterGb = "${vo.schCenterGb}";
		$("select[name=centerGb]").val(schCenterGb);
		
		$("#sBtn").css("display", "none");
		$("#nBtn").css("display", "none");
		$("#yBtn").css("display", "none");
		$("#cnsrDtl_table").css("display", "none");
		$('input:radio[name=cnsrGb]:input[value="${detail.cnsrGb}"]').attr("checked", true);
		$('input:radio[name=gender]:input[value="${detail.gender}"]').attr("checked", true);
		$('#cnsGb').val('${detail.cnsGb}').attr('selected','selected');
		$('#centerGb').val('${detail.centerGb}').attr('selected','selected');
		$('#edu').val('${detail.edu}').attr('selected','selected');
		
		// 전공 checked
		var major = "${detail.major}";
		var majorSplit = major.split(",");
		for (var idx in majorSplit) {
			$("input[name=major][value=" + majorSplit[idx] + "]").attr("checked", true);
		}
		
		// 인정자격증 checked
		var socialWorkProv = "${detail.socialWorkProv}";
		if(socialWorkProv != "") {
			var socialWorkProvSplit = socialWorkProv.split(",");
			for (var idx in socialWorkProvSplit) {
				$("input[name=socialWorkProv][value=" + socialWorkProvSplit[idx] + "]").attr("checked", true);
			}			
		}
		
		// 기타자격증 checked
		var cnsProv = "${detail.cnsProv}";
		if(cnsProv != "") {
			var cnsProvSplit = cnsProv.split(",");
			for (var idx in cnsProvSplit) {
				$("input[name=cnsProv][value=" + cnsProvSplit[idx] + "]").attr("checked", true);
			}
		}
		
	});

	/* function fn_save1() {
     
       	var arr = "2,4,5";
       	arr = arr.split(',');

       	var cnt = arr.length;

       	for(var i=0; i<cnt; i++){
       	  $('input:checkbox[name=porm]').each(function(){
       	    if( arr[i].indexOf(this.value) > -1 ){ //현재 라인 배열에 값 존재여부 조건문 수정
       	    this.checked = true;
       	    }
       	  });
       	}
        
        var checkBoxArr = [];
        $("input[name=major]:checked").each(function(i){
        	checkBoxArr.push($(this).val());
        });
		alert(checkBoxArr);
        
	} */
	
	function fn_save(param) {
		// 수정
		if(param == 'S') {
			if(confirm("상담사 정보를 수정하시겠습니까?")){
				
				var authCd = "${authCd}";
				
				var cnsGb = $("#cnsGb").val(); // 상담구분
				var centerGb = $("#centerGb").val(); // 센터구분
				var edu = $("#edu").val(); // 학력
				var mobile = $("#mobile").val().replace(/\D/g,""); // 숫자가 아닌 공백,문자 제거 (연락처)
				var userNm = $("#userNm").val().replace(/ /gi, ""); // 이름
				//var age = $("#age").val().replace(/\D/g,""); // 나이
				var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/; // 이메일 유효성검사
				var email = $("#email").val().replace(/ /gi, ""); // 이메일
				
				if(cnsGb.length == 0) {
					alert("상담구분을 선택해 주세요");
					$("#cnsGb").focus();
					return;
				}
				if(centerGb.length == 0) {
					alert("센터구분을 선택해 주세요");
					$("#centerGb").focus();
					return;
				}
				if(authCd <= 1) {
					if($("input:radio[name='cnsrGb']").is(":checked") == false) {
						alert("상담사 구분을 체크해 주세요.");
						$("#cnsrGb").focus();
						return;
					}	
				}
				if(userNm.length == 0) {
					alert("이름을 입력해 주세요.");
					$("#userNm").focus();
					return;
				}
				if($("input:radio[name='gender']").is(":checked") == false) {
					alert("성별을 체크해 주세요.");
					$("#gender").focus();
					return;
				}
				/*
				if(age.length == 0) {
					alert("연령을 입력해 주세요.");
					$("#age").focus();
					return;
				}
				*/
				if(mobile.length == 0) {
					alert("연락처를 입력해 주세요.");
					$("#mobile").focus();
					return;
				}
				if(exptext.test(email) == false) {
					alert("이메일을 옳바르게 입력해 주세요.");
					$("#email").focus();
					return;
				}
				if(edu.length == 0) {
					alert("학력을 선택해 주세요");
					$("#edu").focus();
					return;
				}
				if($("input:checkbox[name='major']").is(":checked") == false) {
					alert("전공항복을 체크해 주세요.");
					$("#major").focus();
					return;
				}
				/* if($("input:checkbox[name='socialWorkProv']").is(":checked") == false) {
					alert("인정자격증을 체크해 주세요.");
					$("#socialWorkProv").focus();
					return;
				}
				if($("input:checkbox[name='cnsProv']").is(":checked") == false) {
					alert("기타 자격증을 체크해 주세요.");
					$("#cnsProv").focus();
					return;
				} */
				
				document.frm.action = "/gnoincoundb/counsellor_mng_dtl.do?save=" + param;
		       	document.frm.submit(); 
			}			
		// 수정 페이지로 화면 이동
		} else if(param == 'U') {
			$("#tby1").html("");
			$("#cnsrView_table").css("display", "none");
			$("#cnsrDtl_table").css("display", "inline-block");
			$("#sBtn").css("display", "inline-block");
			$("#uBtn").css("display", "none");
		} 
		
	}
	
	function list(userId,useYn) {
		var param = {userId : userId, useYn : useYn};
		var token = $("meta[name='_csrf']").attr("th:content");
		var header = $("meta[name='_csrf_header']").attr("th:content");
		$.ajax({
			type : "POST",
			url : "/gnoincoundb/counsellor_mng_dtl_ajax.do",
			data : param,
			dataType : "json",
			beforeSend : function(xhr){
				xhr.setRequestHeader(header, token);
			},
			success : function(json) {
				var pwLength = json.list.pw.length;
				var viewPw = "";
				var word = "*";
				for(i=0; i<pwLength; i++) {
					viewPw = viewPw+word;
				}
				
				var html = '';
				var authCd = "${authCd}";
				// 전공
				var major = '';
				var majorResult = json.list.major;
				var majorSplit = majorResult.split(",");
				for (var idx in majorSplit) {
					if(majorSplit[idx] == "1") {
						major += "상담,";
					}else if(majorSplit[idx] == "2") {
						major += "사회복지,";
					}else if(majorSplit[idx] == "3") {
						major += "심리,";
					}else if(majorSplit[idx] == "4") {
						major += "교육,";
					}else if(majorSplit[idx] == "5") {
						major += "아동가족,";
					}else if(majorSplit[idx] == "6") {
						major += "기타,";
					}
				}
				
				major = major.substr(0, major.length -1);
				
				// 인정자격증
				var socialWork = "";
				var socialWorkProv = json.list.socialWorkProv;
				if(socialWorkProv != null) {
					var socialWorkSplit = socialWorkProv.split(",");
					for (var idx in socialWorkSplit) {
						if(socialWorkSplit[idx] == "1") {
							socialWork += "상담심리사,";
						}else if(socialWorkSplit[idx] == "2") {
							socialWork += "전문상담사,";
						}else if(socialWorkSplit[idx] == "3") {
							socialWork += "가족치료사,";
						}else if(socialWorkSplit[idx] == "4") {
							socialWork += "청소년상담사,";
						}else if(socialWorkSplit[idx] == "5") {
							socialWork += "임상심리사,";
						}else if(socialWorkSplit[idx] == "6") {
							socialWork += "전문상담교사,";
						}else if(socialWorkSplit[idx] == "7") {
							socialWork += "사회복지사,";
						}
					}
				socialWork = socialWork.substr(0, socialWork.length -1);
				} else {
					socialWork = "";
				}
				
				// 기타자격증
				var prov = "";
				var cnsProv = json.list.cnsProv;
				if(cnsProv != null) {
					var cnsProvSplit = cnsProv.split(",");
					for (var idx in cnsProvSplit) {
						if(cnsProvSplit[idx] == "1") {
							prov += "노인전문상담사,";
						}else if(cnsProvSplit[idx] == "2") {
							prov += "가정폭력전문상담원,";
						}else if(cnsProvSplit[idx] == "3") {
							prov += "성폭력전문상담원,";
						}else if(cnsProvSplit[idx] == "4") {
							prov += "미술치료사,";
						}else if(cnsProvSplit[idx] == "5") {
							prov += "자살예방 QPR Instructor,";
						}else if(cnsProvSplit[idx] == "6") {
							prov += "기타,";
						}
					}
				prov = prov.substr(0, prov.length -1);
				} else {
					prov = "";
				}
				
				if(json.list.userId != "") {
					html += '<tr>';
					html += '<th>상담구분</th>'+'<td colspan="3">' + json.list.cnsGbNm + '</td>';
					html += '</tr>';
					html += '<tr>';
					html += '<th> 센터구분 </th>'+'<td>' + json.list.centerGbNm + '</td>';
					html += '<th> 상담사구분 </th>'+'<td>' + json.list.cnsrGbNm + '</td>';
					html += '</tr>';
					html += '<tr>';
					html += '<th> ID </th>'+'<td>' + json.list.userId + '</td>';
					html += '<th> 이름 </th>'+'<td>' + json.list.userNm + '</td>';
					html += '</tr>';
					html += '<tr>';
					html += '<th> 비밀번호 </th>'+'<td>' + viewPw + '</td>';
					if(json.list.gender == 'M') {
						html += '<th> 성별 </th>'+'<td colspan="3">남자</td>';
					} else if(json.list.gender == 'F') {
						html += '<th> 성별 </th>'+'<td colspan="3">여자</td>';
					}
					html += '</tr>';
					html += '<tr>';
					html += '<th> 연령 </th>'+'<td>' + json.list.age + '</td>';
					html += '<th> 연락처 </th>'+'<td>' + json.list.mobile + '</td>';
					html += '</tr>';
					html += '<tr>';
					html += '<th> 이메일 </th>'+'<td>' + json.list.email + '</td>';
					html += '<th> 학력 </th>'+'<td>' + json.list.eduNm + '</td>';
					html += '</tr>';
					html += '<tr>';
					html += '<th> 전공 </th>'+'<td colspan="3">' + major + '</td>';
					html += '</tr>';
					html += '<tr>';
					if(socialWork != "") {
						html += '<th> 인정자격증 </th>'+'<td colspan="3">' + socialWork + '</td>';
					} else {
						html += '<th> 인정자격증 </th>'+'<td colspan="3"></td>';
					}
					html += '</tr>';
					html += '<tr>';
					if(prov != "") {
						html += '<th> 기타자격증 </th>'+'<td colspan="3">' + prov + '</td>';
					} else {
						html += '<th> 기타자격증 </th>'+'<td colspan="3"></td>';
					}
					html += '</tr>';
					html += '<tr>';
					if(json.list.apprvYn == 'Y') {
						html += '<th> 승인처리 </th>'+'<td colspan="3"><span id="apprvYn" value="' + json.list.apprvYn + '">승인</span></td>';
						$("#appBtnY").css("display", "none");
					} else if(json.list.apprvYn == 'N') {
						html += '<th> 승인처리 </th>'+'<td colspan="3"><span id="apprvYn" value="' + json.list.apprvYn + '">미승인</span></td>';
						$("#appBtnN").css("display", "none");
					}
					if(json.list.useYn == 'N') {
						if(authCd < 3) {
							$("#nBtn").css("display","none");
							$("#yBtn").css("display","");							
						}
						html += '<tr><th>탈퇴여부</th><td colspan="3">회원탈퇴</td></tr>'
					} else {
						$("#nBtn").css("display","");
						$("#yBtn").css("display","none");
					}
					html += '</tr>';
					
					if(useYn == 'N') {
						opener.location.reload();
					} else if(useYn == 'R') {
						opener.location.reload();
					}
				}
				
				$("#tby1").html(html);
			},
			error : function(e) {
				alert("서버와 통신 오류입니다.");
			}
		});
	}
	
	
	function fn_delete(param) {
		if(param == 'D') {
			if(confirm("상담사를 삭제하시겠습니까?")) {
				document.frm.action = "/gnoincoundb/counsellor_mng_dtl.do?delete=" + param;
				document.frm.submit();
				alert("삭제완료 됐습니다.");
				opener.location.reload();
			}
		} 
	}
	
	
	function fn_apprvYn(param) {
		if(param == 'Y') {
			if(confirm("상담사 가입신청을 승인 하시겠습니까?")){
				document.frm.action = "/gnoincoundb/counsellor_mng_dtl.do?apprvYn=" + param;
		       	document.frm.submit(); 
		       	alert("승인완료 됐습니다.");
		       	opener.location.reload();
			}			
		} else if(param == 'N') {
			if(confirm("상담사 가입신청을 승인취소 하시겠습니까?")){
				document.frm.action = "/gnoincoundb/counsellor_mng_dtl.do?apprvYn=" + param;
		       	document.frm.submit(); 
		       	alert("승인취소 처리 됐습니다.");
		       	opener.location.reload();
			}	
		}
	}
	
</script>
<style>
	td:nth-child(odd){text-align:center;} 
</style>
</head>
<body style="background:white;">
	<div class="h3-title" style="background: #1266FF;height:30px;color:white;line-height:32px;">
		&nbsp;&nbsp;&nbsp;상담사 상세정보 및 승인처리 팝업
		<%-- <c:if test="${empty detail.cnsrCd }">센터정보 등록</c:if>
		<c:if test="${!empty detail.cnsrCd }">센터 상세보기</c:if> --%>
	</div>
	<h2 class="h2-title mg-t20 mg-l25">
		<i class="fa fa-circle"></i>상담사 상세정보 및 승인처리
	</h2>
	<div style="width:200px;height:20px;float:right;text-align:right;padding-bottom:10px;"><img src="/gnoincoundb/images/logo.png" style="width:200px; height:35px; margin-top: 10px;"></div>
	<div style="border-top:1px solid black;width:500px;margin-left:10px;margin-top:10px;"></div>
	<div id="cnsrView_table" >
		<table class="table-write wd500 h500 mg-all10">
			<colgroup> 
				<col width="15%"></col>
				<col width="35%"></col> 
				<col width="15%"></col>
				<col width="35%"></col>
			</colgroup>
			<tbody id="tby1">
			
			</tbody>
		</table>
	</div>
	<div id="cnsrDtl_table" >
	<form id="frm" name="frm" method="post">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		<input type="hidden" name="userId" value="${userId}" />
		<input type="hidden" name="cnsleId" value="${userId}" />
		<table class="table-write wd500 h500 mg-all10">
			<colgroup>
				<col width="15%" />
				<col width="35%" />
				<col width="15%" />
				<col width="35%" />		
			</colgroup>
			<tr>
				<th>상담구분</th>
				<td colspan="3">
					<span class="label">
						<select id="cnsGb" name="cnsGb" style="width:200px;">
						 	<option value="">- 선택하세요 -</option>
							<c:forEach items="${cnsGbList }" var="result">
								<option value="${result.odr }" >${result.mclassNm }</option>
							</c:forEach>
						</select>
					</span>
				</td>
			</tr>
			<tr>
				<th>센터구분</th>
				<td colspan="3">
					<span class="label">
						<select id="centerGb" name="centerGb" style="width:200px;">
						 	<option value="">- 선택하세요 -</option>
							<c:forEach items="${cnsCenterList }" var="result">
								<c:choose>
								<c:when test="${authCd > 1 }">
									<c:if test="${ result.num eq vo.schCenterGb }" >
										<option value="${result.num }" >${result.centerGb }</option>
									</c:if>
								</c:when>
								<c:when test="${authCd <= 1 }">								
									<option value="${result.num }" >${result.centerGb }</option>
								</c:when>
								</c:choose>
							</c:forEach>
						</select>
					</span>
				</td>
			</tr>
			<c:if test="${authCd eq 1 }" >
			<tr>
				<th>상담사구분</th>
				<td colspan="3">
					<input type="radio" id="cnsrGb1" name="cnsrGb" value="1" /><label for="cnsrGb1">전체운영자</label>
					<input type="radio" id="cnsrGb2" name="cnsrGb" value="2" /><label for="cnsrGb2">센터운영자</label>
					<input type="radio" id="cnsrGb3" name="cnsrGb" value="3" /><label for="cnsrGb3">전문상담사</label><br>
					<input type="radio" id="cnsrGb4" name="cnsrGb" value="4" /><label for="cnsrGb4">마음나눔봉사단</label>
					<input type="radio" id="cnsrGb5" name="cnsrGb" value="5" /><label for="cnsrGb5">실무자</label>
					<input type="radio" id="cnsrGb6" name="cnsrGb" value="6" /><label for="cnsrGb6">기타</label>
				</td>
			</tr>
			</c:if>
			<tr>
				<th>ID</th>
				<td><c:out value="${detail.userId }"/></td>
				<th>이름</th>
				<td><input type="text" id="userNm" name="userNm" value="${detail.userNm }"/></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" id="pw" name="pw" value="${detail.pw }" readOnly/></td>
				<th>성별</th>
				<td>
					<input type="radio" id="gender1" name="gender" value="M" ><label for="gender1">남</label>
					<input type="radio" id="gender2" name="gender" value="F" /><label for="gender2">여</label>
				</td>
			</tr>
			
			<tr>
				<th>연령</th>
				<td>${detail.age }</td>
				<th>연락처</th>
				<td><input type="text" id="mobile" name="mobile" oninput="this.value = this.value.replace(/[^0-9]/g, '');" value="${detail.mobile }"/></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><input type="text" id="email" name="email" value="${detail.email }"/></td>
				<th>학력</th>
				<td colspan="3">
					<span class="label">
						<select id="edu" name="edu">
						 	<option value="">- 선택하세요 -</option>
							<c:forEach items="${eduGbList }" var="result">
								<option value="${result.odr }" >${result.mclassNm }</option>
							</c:forEach>
						</select>
					</span>
				</td>
			</tr>
			<tr>
				<th>전공</th>
				<td colspan="3">
			    	<input type="checkbox" id="major1" name="major" value="1">
			    	<label for="major1">상담</label>
			    	<input type="checkbox" id="major2" name="major" value="2">
			    	<label for="major2">사회복지</label>
			    	<input type="checkbox" id="major3" name="major" value="3">
			    	<label for="major3">심리</label>
			    	<input type="checkbox" id="major4" name="major" value="4">
			    	<label for="major4">교육</label><br>
			    	<input type="checkbox" id="major5" name="major" value="5">
			    	<label for="major5">아동가족</label>
			    	<input type="checkbox" id="major6" name="major" value="6">
			    	<label for="major6">기타</label>
				</td>
			</tr>
			<tr>
				<th>인정자격증</th>
				<td colspan="3">
			    	<input type="checkbox" id="socialWorkProv1" name="socialWorkProv" value="1">
			    	<label for="socialWorkProv1">상담심리사</label>
			    	<input type="checkbox" id="socialWorkProv2" name="socialWorkProv" value="2">
			    	<label for="socialWorkProv2">전문상담사</label>
			    	<input type="checkbox" id="socialWorkProv3" name="socialWorkProv" value="3">
			    	<label for="socialWorkProv3">가족치료사</label><br>
			    	<input type="checkbox" id="socialWorkProv4" name="socialWorkProv" value="4">
			    	<label for="socialWorkProv4">청소년상담사</label>
			    	<input type="checkbox" id="socialWorkProv5" name="socialWorkProv" value="5">
			    	<label for="socialWorkProv5">임상심리사</label>
			    	<input type="checkbox" id="socialWorkProv6" name="socialWorkProv" value="6">
			    	<label for="socialWorkProv6">전문상담교사</label>
				</td>
			</tr>
			<tr>
				<th>기타자격증</th>
				<td colspan="3">
			    	<input type="checkbox" id="cnsProv1" name="cnsProv" value="1">
			    	<label for="cnsProv1">노인전문상담사</label>
			    	<input type="checkbox" id="cnsProv2" name="cnsProv" value="2">
			    	<label for="cnsProv2">가정폭력전문상담원</label><br>
			    	<input type="checkbox" id="cnsProv3" name="cnsProv" value="3">
			    	<label for="cnsProv3">성폭력전문상담원</label>
			    	<input type="checkbox" id="cnsProv4" name="cnsProv" value="4">
			    	<label for="cnsProv4">미술치료사</label><br>
			    	<input type="checkbox" id="cnsProv5" name="cnsProv" value="5">
			    	<label for="cnsProv5">자살예방 QPR Instructor</label>
			    	<input type="checkbox" id="cnsProv6" name="cnsProv" value="6">
			    	<label for="cnsProv6">기타</label>
				</td>
			</tr>
		</table>
	</form>
	</div>
	<div style="float:right;margin-right:7px;">
		<button type="button" class="btn-basic" onclick="window.close();">닫기</button>
		<button type="button" class="btn-basic" id="nBtn" onclick='javascript:list("${userId}","N");'>탈퇴</button>
		<button type="button" class="btn-basic" id="yBtn" onclick='javascript:list("${userId}","R");'>탈퇴취소</button>
		<button type="button" class="btn-basic" id="uBtn" onclick="javascript:fn_save('U');">수정</button>
		<button type="button" class="btn-basic" id="sBtn" onclick="javascript:fn_save('S');">저장</button>
		<c:choose>
			<c:when test="${authCd eq 1 }">
				<button type="button" class="btn-basic" id="dBtn" onclick="javascript:fn_delete('D');">삭제</button>
				<button type="button" class="btn-basic" id="appBtnY" onclick="javascript:fn_apprvYn('Y');">승인</button>
				<button type="button" class="btn-basic" id="appBtnN" onclick="javascript:fn_apprvYn('N');">승인취소</button>
			</c:when>
		</c:choose>
		
	</div>
</body>
</html>