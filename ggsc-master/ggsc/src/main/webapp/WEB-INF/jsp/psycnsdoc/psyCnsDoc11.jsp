<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
    <title>스트레스 척도</title>
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
        height: 50px;
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

    .bBottom2 {
        border-bottom: 1px solid #333;
    }

    .txt-Under {
        text-decoration: underline;
    }

    .txt-left {
        text-align: left !important;
    }

    .num {
        width: 106px;
        height: 28px;
        float: left;
        padding-left: 5px;
    }

    .fs24 {
        font-size: 24px;
        font-weight: 400;
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
            <!-- <div class="headName noto500">
                Case No. (20<input type="text" class="inp month" maxlength="2" name='no35'>)-(<input type="text" class="inp month" maxlength="2" name='no36'>)-(<input type="text" class="inp month" maxlength="2" name='no37'>)-(<input type="text" class="inp name" maxlength="5" name='no38'>)
            </div> -->
            <div class="box-title noto700 txt-center mt15 mb15">
                스트레스 척도
            </div>
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
            <table class="tbl">
                <caption>스트레스척도</caption>
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
                        <th scope="col">이&nbsp;&nbsp;&nbsp;&nbsp;름</th>
                        <td>
                            <input type="text" class="inp" id="cnsleNm" name="cnsleNm" style="width: 70%;" readonly><button type="button" class="btn-basic" style="padding: 2px 6px;background: skyblue;" onclick="javascript:findUserPopup();">찾기</button>
                        </td>
                        <th scope="col">연락처</th>
                        <td>
                            <input type="text" class="inp" id="mobile" name="telNo" oninput="this.value = this.value.replace(/[^0-9]/, '');" maxlength="20">
                        </td>
                        <th scope="col">검사일</th>
                        <td>
                            <input type="text" id="datepicker1" class="inp" id="writeDt" name="writeDt" style="width: 80%;" readonly>
                        </td>
                    </tr>
                </tbody>
            </table>
            <div class="txt mt15">
                ※ 다음은 어르신이 평상시 일상생활에서 경험할 수 있는 것들입니다. <span class="txt-Under">“지난 1년 동안”</span>을 돌이켜 보면서 어르신께서 경험을 통해서 마음이 얼마나 상하였는지 어르신의 느낌이나 생각과 잘 맞는 곳에 ‘√’표 해주십시오.
            </div>
            <table class="tbl2 mt15">
                <caption>스트레스척도</caption>
                <colgroup>
                    <col style="width: 5%;" />
                    <col style="width: 50%;" />
                    <col style="width: 8%;" />
                    <col style="width: 8%;" />
                    <col style="width: 8%;" />
                    <col style="width: 8%;" />
                    <col style="width: 8%;" />
                </colgroup>
                <thead>
                    <tr>
                        <th scope="col" colspan="2">내&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;용</th>
                        <th scope="col">전혀<br>그렇지<br>않다</th>
                        <th scope="col">대체로<br>그렇지<br>않다</th>
                        <th scope="col">보통<br>이다</th>
                        <th scope="col">대체로<br>그렇다</th>
                        <th scope="col" class="bRight-none">매우<br>그렇다</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td class="bRight-none">1.</td>
                        <td class="txt-left">가족(자녀, 손자녀)들이 나와 함께 대화하는 시간이 줄어들거나 대화를 회피했다.</td>
                        <td><input type="radio" id="no11" name="no1" value="1" /></td>
                        <td><input type="radio" id="no12" name="no1" value="2" /></td>
                        <td><input type="radio" id="no13" name="no1" value="3" /></td>
                        <td><input type="radio" id="no14" name="no1" value="4" /></td>
                        <td class="bRight-none"><input type="radio" id="no15" name="no1" value="5" /></td>
                    </tr>
                    <tr>
                        <td class="bRight-none">2.</td>
                        <td class="txt-left">나는 가족(아들, 딸, 며느리)들과 갈등을 일으키는 일이 있었다.(예: 제사문제, 집안 살림, 경제 등)</td>
                        <td><input type="radio" id="no21" name="no2" value="1" /></td>
                        <td><input type="radio" id="no22" name="no2" value="2" /></td>
                        <td><input type="radio" id="no23" name="no2" value="3" /></td>
                        <td><input type="radio" id="no24" name="no2" value="4" /></td>
                        <td class="bRight-none"><input type="radio" id="no25" name="no2" value="5" /></td>
                    </tr>
                    <tr>
                        <td class="bRight-none">3.</td>
                        <td class="txt-left">가족 중에 지나치게 술, 담배를 하는 사람이 있었다.</td>
                        <td><input type="radio" id="no31" name="no3" value="1" /></td>
                        <td><input type="radio" id="no32" name="no3" value="2" /></td>
                        <td><input type="radio" id="no33" name="no3" value="3" /></td>
                        <td><input type="radio" id="no34" name="no3" value="4" /></td>
                        <td class="bRight-none"><input type="radio" id="no35" name="no3" value="5" /></td>
                    </tr>
                    <tr>
                        <td class="bRight-none">4.</td>
                        <td class="txt-left">나는 집안에서의 실권이 많이 줄어들었다(예: 집안의 중요한 일 결정, 자녀관계 등).</td>
                        <td><input type="radio" id="no41" name="no4" value="1" /></td>
                        <td><input type="radio" id="no42" name="no4" value="2" /></td>
                        <td><input type="radio" id="no43" name="no4" value="3" /></td>
                        <td><input type="radio" id="no44" name="no4" value="4" /></td>
                        <td class="bRight-none"><input type="radio" id="no45" name="no4" value="5" /></td>
                    </tr>
                    <tr class="bBottom">
                        <td class="bRight-none">5.</td>
                        <td class="txt-left">나는 집안에 해결되지 못한 문제들이 있었다.</td>
                        <td><input type="radio" id="no51" name="no5" value="1" /></td>
                        <td><input type="radio" id="no52" name="no5" value="2" /></td>
                        <td><input type="radio" id="no53" name="no5" value="3" /></td>
                        <td><input type="radio" id="no54" name="no5" value="4" /></td>
                        <td class="bRight-none"><input type="radio" id="no55" name="no5" value="5" /></td>
                    </tr>
                    <tr>
                        <td class="bRight-none">6.</td>
                        <td class="txt-left">자녀들과 의견이 맞지 않는 경우가 여러 번 있었다.</td>
                        <td><input type="radio" id="no61" name="no6" value="1" /></td>
                        <td><input type="radio" id="no62" name="no6" value="2" /></td>
                        <td><input type="radio" id="no63" name="no6" value="3" /></td>
                        <td><input type="radio" id="no64" name="no6" value="4" /></td>
                        <td class="bRight-none"><input type="radio" id="no65" name="no6" value="5" /></td>
                    </tr>
                    <tr>
                        <td class="bRight-none">7.</td>
                        <td class="txt-left">죽기 전에 병들어 자식에게 고통이나 부담을 줄까봐 걱정이 되었다.</td>
                        <td><input type="radio" id="no71" name="no7" value="1" /></td>
                        <td><input type="radio" id="no72" name="no7" value="2" /></td>
                        <td><input type="radio" id="no73" name="no7" value="3" /></td>
                        <td><input type="radio" id="no74" name="no7" value="4" /></td>
                        <td class="bRight-none"><input type="radio" id="no75" name="no7" value="5" /></td>
                    </tr>
                    <tr>
                        <td class="bRight-none">8.</td>
                        <td class="txt-left">집안의 중요한 일을 결정할 때 내 의견을 묻지 않았다.</td>
                        <td><input type="radio" id="no81" name="no8" value="1" /></td>
                        <td><input type="radio" id="no82" name="no8" value="2" /></td>
                        <td><input type="radio" id="no83" name="no8" value="3" /></td>
                        <td><input type="radio" id="no84" name="no8" value="4" /></td>
                        <td class="bRight-none"><input type="radio" id="no85" name="no8" value="5" /></td>
                    </tr>
                    <tr>
                        <td class="bRight-none">9.</td>
                        <td class="txt-left">자녀와 말다툼으로 사이가 불편한 적이 있었다.</td>
                        <td><input type="radio" id="no91" name="no9" value="1" /></td>
                        <td><input type="radio" id="no92" name="no9" value="2" /></td>
                        <td><input type="radio" id="no93" name="no9" value="3" /></td>
                        <td><input type="radio" id="no94" name="no9" value="4" /></td>
                        <td class="bRight-none"><input type="radio" id="no95" name="no9" value="5" /></td>
                    </tr>
                    <tr class="bBottom">
                        <td class="bRight-none">10.</td>
                        <td class="txt-left">자녀들의 이혼이나 별거로 인해 마음이 상했다.</td>
                        <td><input type="radio" id="no101" name="no10" value="1" /></td>
                        <td><input type="radio" id="no102" name="no10" value="2" /></td>
                        <td><input type="radio" id="no103" name="no10" value="3" /></td>
                        <td><input type="radio" id="no104" name="no10" value="4" /></td>
                        <td class="bRight-none"><input type="radio" id="no105" name="no10" value="5" /></td>
                    </tr>
                    <tr>
                        <td class="bRight-none">11.</td>
                        <td class="txt-left">자녀들에게 소외감 혹은 무시를 당했다.</td>
                        <td><input type="radio" id="no111" name="no11" value="1" /></td>
                        <td><input type="radio" id="no112" name="no11" value="2" /></td>
                        <td><input type="radio" id="no113" name="no11" value="3" /></td>
                        <td><input type="radio" id="no114" name="no11" value="4" /></td>
                        <td class="bRight-none"><input type="radio" id="no115" name="no11" value="5" /></td>
                    </tr>
                    <tr>
                        <td class="bRight-none">12.</td>
                        <td class="txt-left">병원비나 약값으로 돈이 필요했었다.</td>
                        <td><input type="radio" id="no121" name="no12" value="1" /></td>
                        <td><input type="radio" id="no122" name="no12" value="2" /></td>
                        <td><input type="radio" id="no123" name="no12" value="3" /></td>
                        <td><input type="radio" id="no124" name="no12" value="4" /></td>
                        <td class="bRight-none"><input type="radio" id="no125" name="no12" value="5" /></td>
                    </tr>
                    <tr>
                        <td class="bRight-none">13.</td>
                        <td class="txt-left">노후에 경제적인 생활대책이 없었다.</td>
                        <td><input type="radio" id="no131" name="no13" value="1" /></td>
                        <td><input type="radio" id="no132" name="no13" value="2" /></td>
                        <td><input type="radio" id="no133" name="no13" value="3" /></td>
                        <td><input type="radio" id="no134" name="no13" value="4" /></td>
                        <td class="bRight-none"><input type="radio" id="no135" name="no13" value="5" /></td>
                    </tr>
                    <tr>
                        <td class="bRight-none">14.</td>
                        <td class="txt-left">용돈이 부족해서 불편했었다.</td>
                        <td><input type="radio" id="no141" name="no14" value="1" /></td>
                        <td><input type="radio" id="no142" name="no14" value="2" /></td>
                        <td><input type="radio" id="no143" name="no14" value="3" /></td>
                        <td><input type="radio" id="no144" name="no14" value="4" /></td>
                        <td class="bRight-none"><input type="radio" id="no145" name="no14" value="5" /></td>
                    </tr>
                    <tr class="bBottom">
                        <td class="bRight-none">15.</td>
                        <td class="txt-left">생활비가 적어서 힘이 들었다.</td>
                        <td><input type="radio" id="no151" name="no15" value="1" /></td>
                        <td><input type="radio" id="no152" name="no15" value="2" /></td>
                        <td><input type="radio" id="no153" name="no15" value="3" /></td>
                        <td><input type="radio" id="no154" name="no15" value="4" /></td>
                        <td class="bRight-none"><input type="radio" id="no155" name="no15" value="5" /></td>
                    </tr>
                    <tr>
                        <td class="bRight-none">16.</td>
                        <td class="txt-left">주위의 다른 노인과 비교해 볼 때 나는 경제적인 여유가 없는 편이었다.</td>
                        <td><input type="radio" id="no161" name="no16" value="1" /></td>
                        <td><input type="radio" id="no162" name="no16" value="2" /></td>
                        <td><input type="radio" id="no163" name="no16" value="3" /></td>
                        <td><input type="radio" id="no164" name="no16" value="4" /></td>
                        <td class="bRight-none"><input type="radio" id="no165" name="no16" value="5" /></td>
                    </tr>
                    <tr>
                        <td class="bRight-none">17.</td>
                        <td class="txt-left">수입이 이전에 비해 줄어들었다.</td>
                        <td><input type="radio" id="no171" name="no17" value="1" /></td>
                        <td><input type="radio" id="no172" name="no17" value="2" /></td>
                        <td><input type="radio" id="no173" name="no17" value="3" /></td>
                        <td><input type="radio" id="no174" name="no17" value="4" /></td>
                        <td class="bRight-none"><input type="radio" id="no175" name="no17" value="5" /></td>
                    </tr>
                    <tr>
                        <td class="bRight-none">18.</td>
                        <td class="txt-left">투자실패 혹은 보증으로 금전적으로 손해를 보았다.</td>
                        <td><input type="radio" id="no181" name="no18" value="1" /></td>
                        <td><input type="radio" id="no182" name="no18" value="2" /></td>
                        <td><input type="radio" id="no183" name="no18" value="3" /></td>
                        <td><input type="radio" id="no184" name="no18" value="4" /></td>
                        <td class="bRight-none"><input type="radio" id="no185" name="no18" value="5" /></td>
                    </tr>
                    <tr>
                        <td class="bRight-none">19.</td>
                        <td class="txt-left">금전적으로 어려워서 필요한 물품을 구입을 구입할 수 없었다.</td>
                        <td><input type="radio" id="no191" name="no19" value="1" /></td>
                        <td><input type="radio" id="no192" name="no19" value="2" /></td>
                        <td><input type="radio" id="no193" name="no19" value="3" /></td>
                        <td><input type="radio" id="no194" name="no19" value="4" /></td>
                        <td class="bRight-none"><input type="radio" id="no195" name="no19" value="5" /></td>
                    </tr>
                    <tr class="bBottom">
                        <td class="bRight-none">20.</td>
                        <td class="txt-left">가까운 친구가 사망해서 마음이 상했다.</td>
                        <td><input type="radio" id="no201" name="no20" value="1" /></td>
                        <td><input type="radio" id="no202" name="no20" value="2" /></td>
                        <td><input type="radio" id="no203" name="no20" value="3" /></td>
                        <td><input type="radio" id="no204" name="no20" value="4" /></td>
                        <td class="bRight-none"><input type="radio" id="no205" name="no20" value="5" /></td>
                    </tr>
                    <tr>
                        <td class="bRight-none">21.</td>
                        <td class="txt-left">배우자가 사망해서 마음이 상했다.</td>
                        <td><input type="radio" id="no211" name="no21" value="1" /></td>
                        <td><input type="radio" id="no212" name="no21" value="2" /></td>
                        <td><input type="radio" id="no213" name="no21" value="3" /></td>
                        <td><input type="radio" id="no214" name="no21" value="4" /></td>
                        <td class="bRight-none"><input type="radio" id="no215" name="no21" value="5" /></td>
                    </tr>
                    <tr>
                        <td class="bRight-none">22.</td>
                        <td class="txt-left">가족 중 누군가가 사망해서 마음이 상했다.</td>
                        <td><input type="radio" id="no221" name="no22" value="1" /></td>
                        <td><input type="radio" id="no22" name="no22" value="2" /></td>
                        <td><input type="radio" id="no223" name="no22" value="3" /></td>
                        <td><input type="radio" id="no224" name="no22" value="4" /></td>
                        <td class="bRight-none"><input type="radio" id="no225" name="no22" value="5" /></td>
                    </tr>
                    <tr>
                        <td class="bRight-none">23.</td>
                        <td class="txt-left">가까운 친구가 사망해서 마음이 상했다.</td>
                        <td><input type="radio" id="no231" name="no23" value="1" /></td>
                        <td><input type="radio" id="no232" name="no23" value="2" /></td>
                        <td><input type="radio" id="no233" name="no23" value="3" /></td>
                        <td><input type="radio" id="no234" name="no23" value="4" /></td>
                        <td class="bRight-none"><input type="radio" id="no235" name="no23" value="5" /></td>
                    </tr>
                    <tr>
                        <td class="bRight-none">24.</td>
                        <td class="txt-left">다치거나 매우 아픈 적이 있었다.</td>
                        <td><input type="radio" id="no241" name="no24" value="1" /></td>
                        <td><input type="radio" id="no242" name="no24" value="2" /></td>
                        <td><input type="radio" id="no243" name="no24" value="3" /></td>
                        <td><input type="radio" id="no244" name="no24" value="4" /></td>
                        <td class="bRight-none"><input type="radio" id="no245" name="no24" value="5" /></td>
                    </tr>
                    <tr class="bBottom">
                        <td class="bRight-none">25.</td>
                        <td class="txt-left">시력, 청력, 치아상태가 나빠져서 불편을 느꼈다.</td>
                        <td><input type="radio" id="no251" name="no25" value="1" /></td>
                        <td><input type="radio" id="no252" name="no25" value="2" /></td>
                        <td><input type="radio" id="no253" name="no25" value="3" /></td>
                        <td><input type="radio" id="no254" name="no25" value="4" /></td>
                        <td class="bRight-none"><input type="radio" id="no255" name="no25" value="5" /></td>
                    </tr>
                    <tr>
                        <td class="bRight-none">26.</td>
                        <td class="txt-left">만성적 질병이 있었다(예: 고혈압, 당뇨, 관절염 등).</td>
                        <td><input type="radio" id="no261" name="no26" value="1" /></td>
                        <td><input type="radio" id="no262" name="no26" value="2" /></td>
                        <td><input type="radio" id="no263" name="no26" value="3" /></td>
                        <td><input type="radio" id="no264" name="no26" value="4" /></td>
                        <td class="bRight-none"><input type="radio" id="no265" name="no26" value="5" /></td>
                    </tr>
                    <tr>
                        <td class="bRight-none">27.</td>
                        <td class="txt-left">건강이 악화되었다.</td>
                        <td><input type="radio" id="no2717" name="no27" value="1" /></td>
                        <td><input type="radio" id="no272" name="no27" value="2" /></td>
                        <td><input type="radio" id="no273" name="no27" value="3" /></td>
                        <td><input type="radio" id="no274" name="no27" value="4" /></td>
                        <td class="bRight-none"><input type="radio" id="no275" name="no27" value="5" /></td>
                    </tr>
                    <tr>
                        <td class="bRight-none">28.</td>
                        <td class="txt-left">피로 때문에 할 일을 제대로 못했다.</td>
                        <td><input type="radio" id="no281" name="no28" value="1" /></td>
                        <td><input type="radio" id="no282" name="no28" value="2" /></td>
                        <td><input type="radio" id="no283" name="no28" value="3" /></td>
                        <td><input type="radio" id="no284" name="no28" value="4" /></td>
                        <td class="bRight-none"><input type="radio" id="no285" name="no28" value="5" /></td>
                    </tr>
                    <tr>
                        <td class="bRight-none">29.</td>
                        <td class="txt-left">체중이 과도하게 줄거나 증가했다.</td>
                        <td><input type="radio" id="no291" name="no29" value="1" /></td>
                        <td><input type="radio" id="no292" name="no29" value="2" /></td>
                        <td><input type="radio" id="no293" name="no29" value="3" /></td>
                        <td><input type="radio" id="no294" name="no29" value="4" /></td>
                        <td class="bRight-none"><input type="radio" id="no295" name="no29" value="5" /></td>
                    </tr>
                    <tr class="bBottom">
                        <td class="bRight-none">30.</td>
                        <td class="txt-left">기력이 많이 약해졌다.</td>
                        <td><input type="radio" id="no301" name="no30" value="1" /></td>
                        <td><input type="radio" id="no302" name="no30" value="2" /></td>
                        <td><input type="radio" id="no303" name="no30" value="3" /></td>
                        <td><input type="radio" id="no304" name="no30" value="4" /></td>
                        <td class="bRight-none"><input type="radio" id="no305" name="no30" value="5" /></td>
                    </tr>
                    <tr>
                        <td class="bRight-none">31.</td>
                        <td class="txt-left">나쁜 집으로 이사를 갔다.</td>
                        <td><input type="radio" id="no311" name="no31" value="1" /></td>
                        <td><input type="radio" id="no312" name="no31" value="2" /></td>
                        <td><input type="radio" id="no313" name="no31" value="3" /></td>
                        <td><input type="radio" id="no314" name="no31" value="4" /></td>
                        <td class="bRight-none"><input type="radio" id="no315" name="no31" value="5" /></td>
                    </tr>
                    <tr>
                        <td class="bRight-none">32.</td>
                        <td class="txt-left">현재 살고 있는 집의 구조가 사용함에 불편을 느꼈다(예: 너무 높다, 난방시설, 아파트라 답답하다 등).</td>
                        <td><input type="radio" id="no321" name="no32" value="1" /></td>
                        <td><input type="radio" id="no322" name="no32" value="2" /></td>
                        <td><input type="radio" id="no323" name="no32" value="3" /></td>
                        <td><input type="radio" id="no324" name="no32" value="4" /></td>
                        <td class="bRight-none"><input type="radio" id="no325" name="no32" value="5" /></td>
                    </tr>
                    <tr>
                        <td class="bRight-none">33.</td>
                        <td class="txt-left">현재 내가 사용하고 있는 방에 대해 불편을 느꼈다(예: 너무 좁다, 환기가 안된다 등).</td>
                        <td><input type="radio" id="no331" name="no33" value="1" /></td>
                        <td><input type="radio" id="no332" name="no33" value="2" /></td>
                        <td><input type="radio" id="no333" name="no33" value="3" /></td>
                        <td><input type="radio" id="no334" name="no33" value="4" /></td>
                        <td class="bRight-none"><input type="radio" id="no335" name="no33" value="5" /></td>
                    </tr>
                    <tr class="bBottom">
                        <td class="bRight-none">34.</td>
                        <td class="txt-left">주거 및 이웃 환경이 신경에 거슬렸다.(예: 시끄럽다, 잡소리가 심하다, 이사)</td>
                        <td><input type="radio" id="no341" name="no34" value="1" /></td>
                        <td><input type="radio" id="no342" name="no34" value="2" /></td>
                        <td><input type="radio" id="no343" name="no34" value="3" /></td>
                        <td><input type="radio" id="no344" name="no34" value="4" /></td>
                        <td class="bRight-none"><input type="radio" id="no345" name="no34" value="5" /></td>
                    </tr>
                </tbody>
            </table>
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
</html>