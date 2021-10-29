<%@ page import="egovframework.rte.psl.dataaccess.util.EgovMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>상담 사전·사후 기록지</title>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
    <link href="/gnoincoundb/css/psyDocument/common.css" rel="stylesheet">
    <script src="/gnoincoundb/js/jquery-1.11.2.min.js" ></script>
    <meta name="_csrf" th:content="${_csrf.token}"/>
    <meta name="_csrf_header" th:content="${_csrf.headerName}"/>
    
</head>
<script>
	if('${param.gIdx}' == ''){
		opener.location.href = '/gnoincoundb/psyCnsList.do?gIdx=${vo.gIdx}&mnuCd=${mnuCd}&caseNo=${vo.caseNo}';
		var msg = "${msg}";
	 	if(msg.length > 0) {
	  		alert(msg);
	 	}
		window.close();
	}
	$(document).ready(function() {
	  	getValues();
	});
	
	
	function getValues(){
		var token = $("meta[name='_csrf']").attr("th:content");
		var header = $("meta[name='_csrf_header']").attr("th:content");
		
		$.ajax({
			url : "/gnoincoundb/getPsyCnsDocValue.do",
			type : "post",
			data : { gIdx : '${param.gIdx}', psyIdx : '${param.psyNum}', dtlIdx : '${param.dtlIdx}' },
			dataType : "json",
			beforeSend : function(xhr){
				xhr.setRequestHeader(header, token);
			}
		}).done(function(e){
			if(e.list!=null){
				var obj = Object.entries(e.list);
				for(var i=0;i<obj.length;i++){
					var c = obj[i];
					if($("[name='" + c[0] + "']").length > 0){
					 var t = $("[name='" + c[0] + "']")[0].type;
					 
					 if(t == 'radio'){
						 $("[name='" + c[0] + "'][value='" + c[1] + "']").prop('checked',true);
					 }else if(t == 'checkbox'){
					 	if(c[1]=='Y'){
					 		$("[name='" + c[0] + "']").prop('checked',true);
					 	}
					 	
					 }else{
						$("[name='" + c[0] + "']").val(c[1]);
					 }
					}
					
				}
				
				console.log(e);
			}
		}).fail(function(e){
			alert('서버 오류가 발생하였습니다.');
		});
		
		
	}
	function fn_reg(){
		var cnsGb = $("#cnsGb").val();
		var cnsleNm = $("#cnsleNm").val();
		var year = $("#year").val();
		var year2 = $("#year2").val();
		var month = $("#month").val();
		var month2 = $("#month2").val();
		var day = $("#day").val();
		var day2 = $("#day2").val();
		
		if(cnsleNm.length == 0) {
			alert("내담자를 입력해주세요.");
			$("#cnsleNm").focus();
			return false;
		}
		if(year.length == 0) {
			alert("시작날짜를 입력해주세요.");
			$("#year").focus();
			return false;
		}
		if(year.length != 2) {
			alert("년도가 올바르지 않습니다.");
			$("#year").focus();
			return false;
		}
		if(month.length == 0) {
			alert("시작날짜를 입력해주세요.");
			$("#month").focus();
			return false;
		}
		if(month.length != 2) {
			alert("해당 [월]앞에 0을 입력해주세요.");
			$("#month").focus();
			return false;
		}
		if(day.length == 0) {
			alert("시작날짜를 입력해주세요.");
			$("#day").focus();
			return false;
		}
		if(day.length != 2) {
			alert("해당 [일]앞에 0을 입력해주세요.");
			$("#day").focus();
			return false;
		}
		
		
		if(cnsGb == "노인상담") {
			$("#cnsGbCd").val("1");
		} else if(cnsGb == "중장년층상담") {
			$("#cnsGbCd").val("2");
		}
			if(confirm("등록(수정) 하시겠습니까?")){
				/* var psycRstMmseds = $("#psycRstMmseds").val();
				if(psycRstMmseds == "") {
					$("#psycRstMmseds").val(0);
				} */
				
				$("#cnsStrtDt").val("20"+year+month+day);
				$("#cnsEndDt").val("20"+year2+month2+day2);
				
				document.frm.action = "/gnoincoundb/psyCnsDocReg.do";
		       	document.frm.submit();
			}
	}  	
	
	function findUserPopup(){
		var userNm = $("#cnsleNm").val();
		userNm = encodeURI(encodeURIComponent(userNm));		
		var url = "/gnoincoundb/findUserPopup.do?userNm=" + userNm+"&cnsTargetGb=Y&cnsPerTargetGb=Y";
		var name = "회원 찾기";
		var option = "width = 530, height = 750, top = 50, left = 250, location = yes";
		window.open(url, name, option);encodeURI(encodeURIComponent(jindan_name));
	}
</script>
<style>
    .doc-box {
        border: 2px solid #333;
    }

    .con-info {
        border-bottom: 1px solid #333;
        border-right: 1px solid #333;
        border-left: 1px solid #333;
        font-family: 'Noto Sans KR', sans-serif;
        color: #333333;
        font-size: 18px;
        padding: 15px;
    }

    .inp {
        width: 10px;
        font-family: 'Noto Sans KR', sans-serif;
        color: #333333;
        font-size: 16px;
        position: relative;
        top: -3px;
        text-align: left;
    }

    .inp14 {
        border: none;
        font-family: 'Noto Sans KR', sans-serif;
        color: #333333;
        font-size: 18px;
        width: 100%;
        font-weight: 500;
        position: relative;
        top: -3px;
    }

    .month {
        width: 20px;
    }

    .tbl th {
        background-color: #F3DBDB;
    }

    .tbl tbody>tr {
        height: 40px;
        font-size: 18px;
    }

    .tbl tbody>tr>td {
        padding: 5px;
        font-weight: 500;
    }

    .tbl thead th.bg-w {
        background-color: #fff;
        font-size: 18px;
    }

    .w21 {
        width: 21%;
    }

    .under {
        border-bottom: 1px solid #333;
    }

    .nl {
        width: 100%;
        display: inline-block;
        text-align: center;
    }

    .nl li {
        width: 9%;
        float: left;
    }

    .w100 {
        width: 100px;
    }

    .w90 {
        width: 90px;
    }

    textarea {
        width: 100%;
        height: 130px;
        font-family: 'Noto Sans KR', sans-serif;
        color: #333333;
        font-size: 18px;
        font-weight: 500;
        border: none;
    }
    
    .small {
        height: 60px;
    }
    
    .border {
        border: 1px solid #333;
        padding: 5px;
        word-break: break-all;
    }
    
    .fs16 {
        font-size: 16px;
    }
    
    .btn-basic {
    	padding: 5px;
    }

</style>
<body>
    <div class="doc-wrap">
        <div class="title mt20">
            <span class="docNum noto700 txt-center">서식 10</span><span class="docTitle noto700 ml20">상담 사전 · 사후 기록지</span>
        </div>
        <div class="doc-box mt20">
        	<form id="frm" name="frm" method="post">
        	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        	<input type='hidden' name='g_idx' value='${param.gIdx}' />
        	<input type='hidden' name='dtl_idx' value='${param.dtlIdx}' />
        	<input type='hidden' name='psy_idx' value='${param.psyNum}' />
        	<input type="hidden" name="mnuCd" value='${param.mnuCd}'/>
        	<input type="hidden" id="cnsStrtDt" name="cnsStrtDt" />
        	<input type="hidden" id="cnsEndDt" name="cnsEndDt" />
        	<input type="hidden" id="examDocCd" name="examDocCd" value="${vo.examDocCd }" />
			<input type="hidden" id="examDocNm" name="examDocNm" value="${vo.examDocNm }" />
			<input type="hidden" id="cnsDtlGbCd" name="cnsDtlGbCd" value="1" />
			<input type="hidden" id="cnsCnt" name="cnsCnt" value="3"/>
			<input type="hidden" id="cnsleId" name="cnsleId" />
			<input type="hidden" id="caseNo" name="caseNo" />
			<input type="hidden" id="cnsGb"  />
			<input type="hidden" id="cnsGbCd" name="cnsGb" />
			
            <table class="tbl">
                <caption>상담사전·사후기록지</caption>
                <colgroup>
                    <col style="width: 10%;" />
                    <col style="width: 20%;" />
                    <col style="width: 10%;" />
                    <col style="width: 20%;" />
                </colgroup>
                <tr>
                    <th rowspan="2" scope="col">내담자</th>
                    <td rowspan="2"><input type="text" class="inp14 txt-center" id="cnsleNm" name="cnsleNm" style="width: 70%;" readonly><button type="button" class="btn-basic" style="padding: 2px 6px;background: skyblue;" onclick="javascript:findUserPopup();">찾기</button></td>
                    <th rowspan="2" scope="col">실시일자</th>
                    <td class="txt-left">
                        시작 : &nbsp;&nbsp;20<input type="text" class="inp14 month" id="year" name="no1" oninput="this.value = this.value.replace(/[^0-9]/, '');" maxlength="2">년&nbsp;&nbsp;<input type="text" class="inp14 month" id="month" name="no2" oninput="this.value = this.value.replace(/[^0-9]/, '');" maxlength="2" >월&nbsp;&nbsp;<input type="text" class="inp14 month" id="day" name="no3" oninput="this.value = this.value.replace(/[^0-9]/, '');" maxlength="2" >일
                    </td>
                </tr>
                <tr>
                    <td class="txt-left">
                        종결 : &nbsp;&nbsp;20<input type="text" class="inp14 month" id="year2" name="no4" oninput="this.value = this.value.replace(/[^0-9]/, '');"  maxlength="2">년&nbsp;&nbsp;<input type="text" class="inp14 month" id="month2" name="no5" oninput="this.value = this.value.replace(/[^0-9]/, '');" maxlength="2">월&nbsp;&nbsp;<input type="text" class="inp14 month" id="day2" name="no6" oninput="this.value = this.value.replace(/[^0-9]/, '');" maxlength="2">일
                    </td>
                </tr>
                <tr>
                    <th scope="col">주호소문제</th>
                    <td colspan="3" class="txt-left">
                        1. <input type="text" class="inp14 w21 under txt-left" id="majorAppl1" name="no7" >
                        2. <input type="text" class="inp14 w21 under txt-left" id="majorAppl2" name="no8" >
                        3. <input type="text" class="inp14 w21 under txt-left" id="majorAppl3" name="no9" >
                        4. <input type="text" class="inp14 w21 under txt-left" id="majorAppl4" name="no10" >
                    </td>
                </tr>
            </table>
            <div class="con-info">
                <div class="mt5 noto500">
                    ✿ 상담 전과 상담 후의 변화된 점을 적어주세요.
                </div>
                <div class="mt40">
                    <div class="noto500">1. 현재의 어려움 및 불편함은 어느 정도입니까? ○표해 주세요.<br>
                        &nbsp;&nbsp;&nbsp;&nbsp;(0 가장 만족상태, 10 가장 어려운 상태)</div>
                    <div class="mt10">|----------------------------------------------------------------------------------------------------------------------------------------|</div>
                    <ul class="nl mt5">
                        <li><label for="awkwState0" style="margin-right: 5px;">0</label><input type="radio" id="awkwState0" name="no11" value="0" /></li>
                        <li><label for="awkwState1" style="margin-right: 5px;">1</label><input type="radio" id="awkwState1" name="no11" value="1" /></li>
                        <li><label for="awkwState2" style="margin-right: 5px;">2</label><input type="radio" id="awkwState2" name="no11" value="2" /></li>
                        <li><label for="awkwState3" style="margin-right: 5px;">3</label><input type="radio" id="awkwState3" name="no11" value="3" /></li>
                        <li><label for="awkwState4" style="margin-right: 5px;">4</label><input type="radio" id="awkwState4" name="no11" value="4" /></li>
                        <li><label for="awkwState5" style="margin-right: 5px;">5</label><input type="radio" id="awkwState5" name="no11" value="5" /></li>
                        <li><label for="awkwState6" style="margin-right: 5px;">6</label><input type="radio" id="awkwState6" name="no11" value="6" /></li>
                        <li><label for="awkwState7" style="margin-right: 5px;">7</label><input type="radio" id="awkwState7" name="no11" value="7" /></li>
                        <li><label for="awkwState8" style="margin-right: 5px;">8</label><input type="radio" id="awkwState8" name="no11" value="8" /></li>
                        <li><label for="awkwState9" style="margin-right: 5px;">9</label><input type="radio" id="awkwState9" name="no11" value="9" /></li>
                        <li><label for="awkwState10" style="margin-right: 5px;">10</label><input type="radio" id="awkwState10" name="no11" value="10" /></li>
                    </ul>
                    <div class="noto500 mt40">2. 상담 후 문제의 대응정도 및 불편감은 어느 정도입니까? ○표해 주세요.</div>
                    <div class="mt10">|----------------------------------------------------------------------------------------------------------------------------------------|</div>
                    <ul class="nl mt5">
                        <li><label for="cnsState0" style="margin-right: 5px;">0</label><input type="radio" id="cnsState0" name="no12" value="0" /></li>
                        <li><label for="cnsState1" style="margin-right: 5px;">1</label><input type="radio" id="cnsState1" name="no12" value="1" /></li>
                        <li><label for="cnsState2" style="margin-right: 5px;">2</label><input type="radio" id="cnsState2" name="no12" value="2" /></li>
                        <li><label for="cnsState3" style="margin-right: 5px;">3</label><input type="radio" id="cnsState3" name="no12" value="3" /></li>
                        <li><label for="cnsState4" style="margin-right: 5px;">4</label><input type="radio" id="cnsState4" name="no12" value="4" /></li>
                        <li><label for="cnsState5" style="margin-right: 5px;">5</label><input type="radio" id="cnsState5" name="no12" value="5" /></li>
                        <li><label for="cnsState6" style="margin-right: 5px;">6</label><input type="radio" id="cnsState6" name="no12" value="6" /></li>
                        <li><label for="cnsState7" style="margin-right: 5px;">7</label><input type="radio" id="cnsState7" name="no12" value="7" /></li>
                        <li><label for="cnsState8" style="margin-right: 5px;">8</label><input type="radio" id="cnsState8" name="no12" value="8" /></li>
                        <li><label for="cnsState9" style="margin-right: 5px;">9</label><input type="radio" id="cnsState9" name="no12" value="9" /></li>
                        <li><label for="cnsState10" style="margin-right: 5px;">10</label><input type="radio" id="cnsState10" name="no12" value="10" /></li>
                    </ul>
                    <div class="noto500 mt40">3. 주호소 문제 검사 : <input type="text" class="inp14 w100 txt-right" id="majorApplExam" name="no13" oninput="this.value = this.value.replace(/[^0-9]/, '');" maxlength="3">&nbsp;&nbsp;점&nbsp;&nbsp;→&nbsp;&nbsp;<input type="text" class="inp14 w100 txt-right" id="" name="no14" oninput="this.value = this.value.replace(/[^0-9]/, '');" maxlength="3">&nbsp;&nbsp;점</div>
                    <div class="noto500 mt40">4. 기본 검사 : S-GDS&nbsp;&nbsp;<input type="text" class="inp14 w100 txt-right" id="sGds" name="no15" oninput="this.value = this.value.replace(/[^0-9]/, '');" maxlength="3" >&nbsp;&nbsp;점&nbsp;&nbsp;→&nbsp;&nbsp;<input type="text" class="inp14 w90 txt-right" id="" name="no16" oninput="this.value = this.value.replace(/[^0-9]/, '');" maxlength="3" >&nbsp;&nbsp;점<br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;GDS-KR&nbsp;&nbsp;<input type="text" class="inp14 w90 txt-right" id="gdsKr" name="no17" oninput="this.value = this.value.replace(/[^0-9]/, '');" maxlength="3">&nbsp;&nbsp;점&nbsp;&nbsp;→&nbsp;&nbsp;<input type="text" class="inp14 w90 txt-right" id="" name="no18" oninput="this.value = this.value.replace(/[^0-9]/, '');" maxlength="3" >&nbsp;&nbsp;점
                    </div>
                    <div class="noto500 mt40">5. 상담 후 변화된 점은 무엇입니까?</div>
                    <table class="tbl mt10">
                        <caption>상담표</caption>
                        <colgroup>
                            <col style="width: 50%;" />
                            <col style="width: 50%;" />
                        </colgroup>
                        <thead>
                            <th class="bg-w" scope="col">상담 전</th>
                            <th class="bg-w" scope="col">상담 후</th>
                        </thead>
                        <tbody>
                            <tr>
                                <td>
                                    <textarea id="cnsBefore" name="no19" ></textarea>
                                </td>
                                <td>
                                    <textarea id="cnsAfter" name="no20"> </textarea>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <div class="noto500 mt40">6. 상담에 대한 기타 건의 사항</div>
                    <textarea class="small" id="suggestions" name="no21" ></textarea>
                    <div class="noto500 mt40 border">
                        주호소문제<br>
                        <span class="fs16 txt-justify">① 심리정서&nbsp;&nbsp;② 대인관계&nbsp;&nbsp;③ 치매&nbsp;&nbsp;④ 중독&nbsp;&nbsp;⑤ 정신건강·장애&nbsp;&nbsp;⑥ 건강&nbsp;&nbsp;⑦ 경제&nbsp;&nbsp;⑧ 생활&nbsp;&nbsp;⑨ 성&nbsp;&nbsp;⑩ 부부&nbsp;&nbsp;⑪ 가족&nbsp;&nbsp;⑫ 학대&nbsp;&nbsp; ⑬ 노년생애준비&nbsp;&nbsp;⑭ 기타</span>
                    </div>
                </div>
	            <div class="btn" style="text-align: right; display: block; margin-top: 15px; padding: 5px;">
	            	<button type="button" class="btn-basic" onclick="window.close();" style="background-color:#fc692f;color:white;">닫기</button>
	            	<c:choose>
	            		<c:when test="${param.dtlIdx == 0}"> <button type="button" class="btn-basic" id="sBtn" onclick="javascript:fn_reg();" style="background-color:#fc692f;color:white;">저장</button> </c:when>
	            		<c:when test="${param.dtlIdx > 0 }"> <button type="button" class="btn-basic" id="uBtn" onclick="javascript:fn_reg();" style="background-color:#fc692f;color:white;">수정</button> </c:when>
	            	</c:choose>
					
					
				</div>
            </div>
            </form>
        </div>
    </div>

</body>
</html>