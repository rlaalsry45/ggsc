<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
    <title>DUKE-AD</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
	<meta name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, target-densitydpi=medium-dpi" />
	<meta http-equiv="content-type" content="text/html; charset=utf-8">
	<meta http-equiv="content-language" content="ko">
	<meta name="_csrf" th:content="${_csrf.token}"/>
	<meta name="_csrf_header" th:content="${_csrf.headerName}"/>
    <link href="/gnoincoundb/css/psyDocument/common.css" rel="stylesheet">
	<link rel="stylesheet" href="/gnoincoundb/css/jquery-accordion-menu.css">
	<link rel="stylesheet" href="/gnoincoundb/css/jquery-ui.css">
	
	<script src="/gnoincoundb/js/jquery/jquery-1.11.2.min.js"></script>
	<script src="/gnoincoundb/js/jquery/jquery.form.js"></script>
	<script src="/gnoincoundb/js/jquery/jquery-migrate-1.4.1.js"></script>
	<script src="/gnoincoundb/js/jquery/jquery-accordion-menu.js" type="text/javascript"></script>
	<script src="/gnoincoundb/js/jquery/jquery-ui.min.js" type="text/javascript"></script>
	<script src="/gnoincoundb/js/common.js"></script>
</head>
<script>
	if('${param.gIdx}' == ''){
		opener.location.reload();
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
		if(cnsGb == "노인상담") {
			$("#cnsGbCd").val("1");
		} else if(cnsGb == "중장년층상담") {
			$("#cnsGbCd").val("2");
		}
		
		var cnsleNm = $("#cnsleNm").val();
		var writeDt = $('input[name=writeDt]').val();
		if(cnsleNm.length == 0) {
			alert("내담자를 선택해주세요.");
			$("#cnsleNm").focus();
			return false;
		}
		
		if(writeDt.length == 0) {
			alert("검사일을 입력해주세요.");
			$("input[name=writeDt]").focus();
			return false;
		}
		
		if(confirm("등록(수정) 하시겠습니까?")){				
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
    .box-title {
        font-size: 35px;
    }

    .inp {
        width: 95%;
        font-family: 'Noto Sans KR', sans-serif;
        color: #333333;
        font-size: 16px;
        position: relative;
        top: 0px;
        font-weight: 500;
    }

    .month {
        width: 20px;
        top: -3px;
    }

    .name {
        width: 45px;
        top: -3px;
    }

    .month2 {
        width: 20px;
        top: -2px;
    }

    .name2 {
        width: 45px;
        top: -2px;
    }

    .headName {
        font-size: 16px;
        border: 2px solid #333;
        border-radius: 5px;
        width: 282px;
        padding: 0px 10px 0px 10px;
    }

    .tbl {
        border: 2px solid #333;
    }

    .tbl tbody>tr {
        padding: 5px;
        font-weight: 500;
        font-size: 16px;
    }

    .tbl2 thead>tr>th {
        padding: 5px;
        font-weight: 500;
        font-size: 16px;
    }

    .tbl2 tbody>tr {
        padding: 5px;
        font-weight: 500;
        font-size: 16px;
    }

    .fs24 {
        font-size: 24px;
        font-weight: 400;
    }

    .txt {
        font-family: 'Noto Sans KR', sans-serif;
        color: #333333;
        font-size: 16px;
        border: 2px solid #333;
        padding: 10px;
        word-break: break-all;
    }

    .bRight-none {
        border-right: none !important;
    }

    .bBottom {
        border-bottom: 2px solid #333;
    }

    .txt-Under {
        text-decoration: underline;
    }

    .txt-left {
        text-align: left !important;
    }

    .total {
        border: 2px solid #333;
        width: 205px;
        height: 32px;
        font-family: 'Noto Sans KR', sans-serif;
        color: #333333;
        font-size: 16px;
    }

    .tot {
        width: 95px;
        height: 28px;
        border-right: 1px solid #333;
        text-align: center;
        float: left;
    }

    .num {
        width: 106px;
        height: 28px;
        float: left;
        padding-left: 5px;
    }

    .num2 {
        width: 95%;
        top: -2px;
    }

    .mt80 {
        margin-top: 80px;
    }

	.btn-basic {
    	padding: 5px;
    }
</style>

<body>
    <div class="doc-wrap">
        <div class="doc-box mt20">
        	<form id="frm" name="frm" method="post">
        	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        	<input type='hidden' name='g_idx' value='${param.gIdx}' />
        	<input type='hidden' name='dtl_idx' value='${param.dtlIdx}' />
        	<input type='hidden' name='psy_idx' value='${param.psyNum}' />
			<input type="hidden" id="examDocCd" name="examDocCd" value="${vo.examDocCd }" />
			<input type="hidden" id="examDocNm" name="examDocNm" value="${vo.examDocNm }" />
			<input type="hidden" id="cnsDtlGbCd" name="cnsDtlGbCd" value="1" />
			<input type="hidden" id="cnsCnt" name="cnsCnt" value="3"/>
			<input type="hidden" id="cnsleId" name="cnsleId" />
			<input type="hidden" id="caseNo" name="caseNo" />
			<input type="hidden" id="cnsGb"  />
			<input type="hidden" id="cnsGbCd" name="cnsGb" />
			
            <!-- <div class="headName noto500">
                Case No. (20<input type="text" class="inp month" maxlength="2" name='no1'>)-(<input type="text" class="inp month" maxlength="2" name='no2'>)-(<input type="text" class="inp month" maxlength="2" name='no3'>)-(<input type="text" class="inp name" maxlength="5" name='no4'>)
            </div> -->
            <div class="box-title noto700 txt-center mt15 mb15">
                DUKE-AD<br>
                <span class="fs24">(Duke Anxiety-Depression Scale)</span>
            </div>
            <table class="tbl">
                <caption>DUKE-AD</caption>
                <colgroup>
                    <col style="width: 8%;" />
                    <col style="width: 10%;" />
                    <col style="width: 8%;" />
                    <col style="width: 10%;" />
                    <col style="width: 8%;" />
                    <col style="width: 10%;" />
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="col">이&nbsp;&nbsp;름</th>
                        <td>
                            <input type="text" class="inp" id="cnsleNm" name="cnsleNm" style="width: 70%;" readonly><button type="button" class="btn-basic" style="padding: 2px 6px;background: skyblue;" onclick="javascript:findUserPopup();">찾기</button>
                        </td>
                        <th scope="col">성별</th>
                        <td>
                            <label for="genderM" style="margin-right: 5px;">남</label><input type="radio" id="genderM" name="no5" value="M" /> /
                            <label for="genderF" style="margin-right: 5px;">여</label><input type="radio" id="genderF" name="no5" value="F" />
                        </td>
                        <th scope="col">검사일</th>
                        <td>
                            <input type="text" class="inp" id="datepicker1" name="writeDt" style="width: 80%;" readonly>
                        </td>
                    </tr>
                    <tr>
                        <th scope="col">나&nbsp;&nbsp;이</th>
                        <td>
                            <input type="text" class="inp" id="age" name="no6" oninput="this.value = this.value.replace(/[^0-9]/g, '');" maxlength="3">
                        </td>
                        <th scope="col">연 락 처</th>
                        <td colspan="3">
                            <input type="text" class="inp" id="mobile" name="telNo" oninput="this.value = this.value.replace(/[^0-9]/g, '');" maxlength="20">
                        </td>
                    </tr>
                </tbody>
            </table>
            <div class="txt mt15">
                ※ 다음은 당신의 건강과 느낌에 대한 질문입니다. 각 문항을 자세히 읽고 당신이 느끼는 가장 적합한 곳에 ‘√’표 해 주십시오.<br>
                다음 문항에 맞거나 틀린 답은 없습니다.
            </div>
            <table class="tbl2 mt15">
                <caption>DUKE-AD</caption>
                <colgroup>
                    <col style="width: 8%;" />
                    <col style="width: 50%;" />
                    <col style="width: 10%;" />
                    <col style="width: 10%;" />
                    <col style="width: 10%;" />
                </colgroup>
                <thead>
                    <tr>
                        <th scope="col" colspan="2">내&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;용</th>
                        <th scope="col">매우 그렇다</th>
                        <th scope="col">보통이다 </th>
                        <th scope="col" class="bRight-none">매우 아니다</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td class="bRight-none">1.</td>
                        <td class="txt-left">나는 쉽게 포기한다.</td>
                        <td><input type="radio" class="radBtn" id="no11" name="no7" value="1" /></td>
                        <td><input type="radio" class="radBtn2" id="no12" name="no7" value="2" /></td>
                        <td class="bRight-none"><input type="radio" class="radBtn3" id="no13" name="no7" value="3" /></td>
                    </tr>
                    <tr>
                        <td class="bRight-none">2.</td>
                        <td class="txt-left">나는 집중하는 것이 어렵다.</td>
                        <td><input type="radio" class="radBtn" id="no21" name="no8" value="1" /></td>
                        <td><input type="radio" class="radBtn2" id="no22" name="no8" value="2" /></td>
                        <td class="bRight-none"><input type="radio" class="radBtn3" id="no23" name="no8" value="3" /></td>
                    </tr>
                    <tr class="bBottom">
                        <td class="bRight-none">3.</td>
                        <td class="txt-left">나는 사람들이 주변에 있는 것이 편안하다.</td>
                        <td><input type="radio" class="radBtn" id="no31" name="no9" value="1" /></td>
                        <td><input type="radio" class="radBtn2" id="no32" name="no9" value="2" /></td>
                        <td class="bRight-none"><input type="radio" class="radBtn3" id="no33" name="no9" value="3" /></td>
                    </tr>
                </tbody>
            </table>
            <table class="tbl2 mt25">
                <caption>DUKE-AD</caption>
                <colgroup>
                    <col style="width: 8%;" />
                    <col style="width: 50%;" />
                    <col style="width: 10%;" />
                    <col style="width: 10%;" />
                    <col style="width: 10%;" />
                </colgroup>
                <thead>
                    <tr>
                        <th scope="col" colspan="2" class="txt-left">&nbsp;&nbsp;지난 <span class="txt-Under">일주일 동안...</span></th>
                        <th scope="col">매우 그렇다</th>
                        <th scope="col">보통이다 </th>
                        <th scope="col" class="bRight-none">매우 아니다</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td class="bRight-none">4.</td>
                        <td class="txt-left">잠을 자는 것이 어렵다.</td>
                        <td><input type="radio" class="radBtn" id="no41" name="no10" value="1" /></td>
                        <td><input type="radio" class="radBtn2" id="no42" name="no10" value="2" /></td>
                        <td class="bRight-none"><input type="radio" class="radBtn3" id="no43" name="no10" value="3" /></td>
                    </tr>
                    <tr>
                        <td class="bRight-none">5.</td>
                        <td class="txt-left">쉽게 피로해진다.</td>
                        <td><input type="radio" class="radBtn"id="no51" name="no11" value="1" /></td>
                        <td><input type="radio" class="radBtn2" id="no52" name="no11" value="2" /></td>
                        <td class="bRight-none"><input type="radio" class="radBtn3" id="no53" name="no11" value="3" /></td>
                    </tr>
                    <tr>
                        <td class="bRight-none">6.</td>
                        <td class="txt-left">슬프거나 우울한 기분이 든다.</td>
                        <td><input type="radio" class="radBtn" id="no61" name="no12" value="1" /></td>
                        <td><input type="radio" class="radBtn2" id="no62" name="no12" value="2" /></td>
                        <td class="bRight-none"><input type="radio" class="radBtn3" id="no63" name="no12" value="3" /></td>
                    </tr>
                    <tr class="bBottom">
                        <td class="bRight-none">7.</td>
                        <td class="txt-left">불안한 기분이 든다.</td>
                        <td><input type="radio" class="radBtn" id="no71" name="no13" value="1" /></td>
                        <td><input type="radio" class="radBtn2" id="no72" name="no13" value="2" /></td>
                        <td class="bRight-none"><input type="radio" class="radBtn3" id="no73" name="no13" value="3" /></td>
                    </tr>
                </tbody>
            </table>
            <div style="height: 50px;">
	            <div class="total fr mt15">
	                <div class="tot">
	                    총 점
	                </div>
	                <div class="num">
	                    <input type="text" class="inp num2" id="sumCnt" name="no14" style="margin-top: 5px;" readonly>
              	 	</div>
	            </div>
	        </div>
            </form>
            <div class="btn" style="text-align: right; display: block; margin-top: 15px;">
            	<button type="button" class="btn-basic" onclick="window.close();" style="background-color:#fc692f;color:white;">닫기</button>
				<c:choose>
	            		<c:when test="${param.dtlIdx == 0}"> <button type="button" class="btn-basic" id="sBtn" onclick="javascript:fn_reg();" style="background-color:#fc692f;color:white;">저장</button> </c:when>
	            		<c:when test="${param.dtlIdx > 0 }"> <button type="button" class="btn-basic" id="uBtn" onclick="javascript:fn_reg();" style="background-color:#fc692f;color:white;">수정</button> </c:when>
	            </c:choose>
			</div>
        </div>
    </div>
</body>
<script>
	$(".radBtn, .radBtn2, .radBtn3").change(function(e) {
		var y = $(".radBtn:checked").length*2, n= $(".radBtn2:checked").length;
		$("#sumCnt").val(y+n);
	});
</script>
</html>