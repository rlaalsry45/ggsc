<%@ page import="egovframework.rte.psl.dataaccess.util.EgovMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="/gnoincoundb/css/style.css">
<script src="/gnoincoundb/js/jquery-1.11.2.min.js" ></script>
<script src="/gnoincoundb/js/util/paging.js"></script>
<meta name="_csrf" th:content="${_csrf.token}"/>
<meta name="_csrf_header" th:content="${_csrf.headerName}"/>
<script type="text/javascript">

	$(document).ready(function() {
		
	});
	
	
	function fn_delete() {
		var url = "";
		
		url	= "/gnoincoundb/securityPledge_del.do";
		
		var param = $("#frm").serialize();
		var token = $("meta[name='_csrf']").attr("th:content");
		var header = $("meta[name='_csrf_header']").attr("th:content");
		
		$.ajax({
			type : "POST",
			url : url ,
			data : param,
			dataType : "json",
			beforeSend : function(xhr){
				xhr.setRequestHeader(header, token);
			},
			success : function(json) {
				if(json.msg) {
					alert(json.msg);
				} else {
					alert("삭제완료 됐습니다.");
					opener.location.reload();
					window.close();
				}
				
			},
			error : function(e) {
				alert("서버와 통신 오류입니다");
			}
		});
	}
	
	
	function fn_update() {
		
		var year = $("#year").val(); // 상담구분
		var month = $("#month").val(); // 권역구분
		var day = $("#day").val(); // 지역구분
		var rank = $("#rank").val(); // 센터구분
		var jumin1 = $("#jumin1").val().replace(/\D/g,""); // 숫자가 아닌 공백,문자 제거 (연락처)
		var jumin2 = $("#jumin2").val().replace(/\D/g,""); // 숫자가 아닌 공백,문자 제거 (연락처)
		
		if(wYear.length == 0) {
			alert("해당[년]도를 입력해주세요.");
			$("#year").focus();
			return;
		}
		if(month.length == 0) {
			alert("해당 [월]을 입력해주세요.");
			$("#month").focus();
			return;
		}
		if(month.length != 2) {
			alert("해당 [월]앞에 0을 입력해주세요.");
			$("#month").focus();
			return;
		}
		if(day.length == 0) {
			alert("해당[일]을 입력해주세요.");
			$("#day").focus();
			return;
		}
		if(day.length != 2) {
			alert("해당[일]앞에 0을 입력해주세요.");
			$("#day").focus();
			return;
		}
		if(rank.length == 0) {
			alert("[직위]를 입력해주세요.");
			$("#rank").focus();
			return;
		}
		if(jumin1.length == 0) {
			alert("[주민등록번호] 앞자리를 입력해주세요.");
			$("#jumin1").focus();
			return;
		}
		if(jumin1.length <= 5) {
			alert("[주민등록번호] 앞자리를 6자리로 입력해주세요.");
			$("#jumin1").focus();
			return;
		}
		if(jumin2.length == 0) {
			alert("[주민등록번호] 뒷자리를 입력해주세요.");
			$("#jumin2").focus();
			return;
		}
		if(jumin2.length <= 6) {
			alert("[주민등록번호] 뒷자리를 7자리로 입력해주세요.");
			$("#jumin2").focus();
			return;
		}
		if(confirm("보안서약서를 수정하시겠습니까?")) {
			
			var param = $("#frm").serialize(); //ajax로 넘길 data
			var token = $("meta[name='_csrf']").attr("th:content");
			var header = $("meta[name='_csrf_header']").attr("th:content");
			$.ajax({
				type : "POST",
				url : "/gnoincoundb/securityPledge_upd_ajax.do",
				data : param,
				dataType : "json",
				beforeSend : function(xhr){
					xhr.setRequestHeader(header, token);
				},
				success : function(json) {
					alert("보안서약서 수정이 완료됐습니다.");
					opener.location.reload();
				},
				error : function(e) {
					alert("서버와 통신 오류입니다.");
				}
			});
		}
	}
	
</script>
<style>
	td:nth-child(odd){text-align:center;} 
	#header {height: 0px;}
</style>
<section>
	<div class="h3-title" style="background: #1266FF;height:30px;color:white;line-height:32px;">
		&nbsp;&nbsp;&nbsp;상담사 보안서약서 등록 팝업
		<%-- <c:if test="${empty detail.cnsrCd }">센터정보 등록</c:if>
		<c:if test="${!empty detail.cnsrCd }">센터 상세보기</c:if> --%>
	</div>
	<h2 class="h2-title mg-t20 mg-l25">
		<i class="fa fa-circle"></i>상담사 보안서약서
	</h2>
	<div style="width:240px;height:20px;float:right;text-align:right;padding-top:10px;"><img src="/gnoincoundb/images/logo.png" style="width:240px;height:35px;"></div>
	<div style="border-top:1px solid black;width:700px;margin-left:10px;margin-top:10px;"></div>
	<div id="cnsrDtl_table" >
	<form id="frm" name="frm" method="post">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		<input type="hidden" name="cnsGb" value="${detail.cnsGb}" />
		<input type="hidden" name="zoneGb" value="${detail.zoneGb}" />
		<input type="hidden" name="localGb" value="${detail.localGb}" />
		<input type="hidden" name="cnsleNm" value="${detail.cnsrNm}" />
		<input type="hidden" name="cnsleId" value="${detail.cnsleId}" />
		<input type="hidden" name="centerGb" value="${detail.centerGb }" />
		<input type="hidden" name="docGb" value="1" />
		
		<div style="border-style: solid; border-width: thin; width:700px; height: auto; padding: 10px 20px 20px 20px; margin: 10px 10px 10px 10px;">
			<div>
				<h1 style="text-align: center; font-size:x-large; padding-bottom: 50px;">보 안 서 약 서</h1>
			</div>
			<font style="font-size: large;">본인은 </font><input type="text" id="year" name="year" style="width: 60px;" maxlength="4" oninput="this.value = this.value.replace(/[^0-9]/g, ''); $('#wYear').val(this.value);" value="${detail.year}" /><font style="font-size: large;">년</font>
			<input type="text" id="month" name="month" style="width: 30px;" maxlength="2" oninput="this.value = this.value.replace(/[^0-9]/g, ''); $('#wMonth').val(this.value);" value="${detail.month}" /><font style="font-size: large;">월</font>
			<input type="text" id="day" name="day" style="width: 30px;" maxlength="2" oninput="this.value = this.value.replace(/[^0-9]/g, ''); $('#wDay').val(this.value);" value="${detail.day}" /><font style="font-size: large;">일부로 노인상담사업을 수행함에 있어 다음 사항을</font>
			<br><br>
			<font style="font-size: large;">준수할 것을 엄숙히 서약합니다.</font>
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
			<font style="font-size: large; margin-left: 120px;">직&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;위:</font><input type="text" id="rank" name="rank" style="width: 200px; margin-left: 7px;" oninput="this.value = this.value.replace(/[^ㄱ-힣a-zA-Z]/, '');" value="${detail.rank}" />
			<br><br>
			<font style="font-size: large; margin-left: 120px;">성&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;명:</font><input type="text" id="seplName" name="seplName" style="width: 200px; margin-left: 7px;" value="${detail.cnsrNm}" readonly/><font style="font-size: large; margin-left: 70px;"><a href="">(서명)</a></font>
			<br><br>
			<font style="font-size: large; margin-left: 120px;">주민등록번호:</font><input type="text" id="jumin1" name="jumin1" style="width: 100px; margin-left: 7px;" maxlength="6" oninput="this.value = this.value.replace(/[^0-9]/g, '');" value="${detail.jumin1}" /> - <input type="password" id="jumin2" name="jumin2" style="width: 100px;" maxlength="7" oninput="this.value = this.value.replace(/[^0-9]/g, '');" value="${detail.jumin2}" />
		</div>
	</form>
	</div>
	<div style="float:right;margin-right:7px;">
		<button type="button" class="btn-basic" id="uBtn" onclick="javascript:fn_update();">수정</button>
		<button type="button" class="btn-basic" id="dBtn" onclick="javascript:fn_delete();">삭제</button>
		<button type="button" class="btn-basic" onclick="window.close();">닫기</button>
	</div>		
</section>
</html>