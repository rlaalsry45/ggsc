<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
    <title>치매 선별용 한국어판 간이정신상태검사</title>
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
        font-weight: 700;
        font-size: 18px;
        border: 1px solid #333;
        height: 50px;
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

    .bgGf {
        background-color: #F2F2F2;
    }

    .bgGt {
        background-color: #E5E5E5;
    }

    .bRight-none {
        border-right: none !important;
    }

    .bLeft-none {
        border-left: none !important;
    }

    .bRight {
        border-right: 2px solid #333 !important;
    }

    .bRight2 {
        border-right: 1px solid #333 !important;
    }

    .bLeft {
        border-left: 2px solid #333;
    }

    .bTop {
        border-top: 2px solid #333;
    }

    .bBot-none {
        border-bottom: none !important;
    }

    .bBottom {
        border-bottom: 2px solid #333 !important;
    }

    .bBottom2 {
        border-bottom: 1px solid #333;
    }

    .bBottom3 {
        border-bottom: 3px double #333;
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
                Case No. (20<input type="text" class="inp month" maxlength="2" name='no31'>)-(<input type="text" class="inp month" maxlength="2" name='no32'>)-(<input type="text" class="inp month" maxlength="2" name='no33'>)-(<input type="text" class="inp name" maxlength="5" name='no34'>)
            </div> -->
            <div class="box-title noto700 txt-center mt15 mb15">
                치매 선별용 한국어판 간이정신상태검사<br>
                <span class="fs24">(Korean version of MMSE for Dementia Screening: MMSE-K)</span>
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
                <caption>치매선별용한국어판간이정신상태검사</caption>
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
            <table class="tbl2 mt15">
                <caption>치매선별용한국어판간이정신상태검사</caption>
                <colgroup>
                    <col style="width: 8%;" />
                    <col style="width: 5%;" />
                    <col style="width: 55%;" />
                    <col style="width: 7%;" />
                    <col style="width: 7%;" />
                </colgroup>
                <thead>
                    <tr class="bTop bLeft bRight bBottom">
                        <th scope="col" colspan="3" class="bRight2 bgGt">질문항목</th>
                        <th scope="col" class="bgGf">오답</th>
                        <th scope="col" class="bgGt">정답</th>
                    </tr>
                </thead>
                <tbody>
                    <tr class="bLeft bRight">
                        <td class="bRight2" rowspan="5">시<br>간<br>지<br>남<br>력</td>
                        <td class="bRight-none noto400">1.</td>
                        <td class="txt-left bRight2 noto400">올해는 몇 년도 입니까?</td>
                        <td class="bRight2 bgGf"><input type="radio" id="no11" name="no1" value="N" /></td>
                        <td class="bgGt"><input type="radio" id="no12" name="no1" value="Y" /></td>
                    </tr>
                    <tr class="bLeft bRight">
                        <td class="bRight-none noto400">2.</td>
                        <td class="txt-left bRight2 noto400">지금은 무슨 계절입니까?</td>
                        <td class="bRight2 bgGf"><input type="radio" id="no21" name="no2" value="N" /></td>
                        <td class="bgGt"><input type="radio" id="no22" name="no2" value="Y" /></td>
                    </tr>
                    <tr class="bLeft bRight">
                        <td class="bRight-none noto400">3.</td>
                        <td class="txt-left bRight2 noto400">오늘은 며칠입니까?</td>
                        <td class="bRight2 bgGf"><input type="radio" id="no31" name="no3" value="N" /></td>
                        <td class="bgGt"><input type="radio" id="no32" name="no3" value="Y" /></td>
                    </tr>
                    <tr class="bLeft bRight">
                        <td class="bRight-none noto400">4.</td>
                        <td class="txt-left bRight2 noto400">오늘은 무슨 요일입니까?</td>
                        <td class="bRight2 bgGf"><input type="radio" id="no41" name="no4" value="N" /></td>
                        <td class="bgGt"><input type="radio" id="no42" name="no4" value="Y" /></td>
                    </tr>
                    <tr class="bLeft bRight">
                        <td class="bRight-none noto400">5.</td>
                        <td class="txt-left bRight2 noto400">지금은 몇 월입니까?</td>
                        <td class="bRight2 bgGf"><input type="radio" id="no51" name="no5" value="N" /></td>
                        <td class="bgGt"><input type="radio" id="no52" name="no5" value="Y" /></td>
                    </tr>
                    <tr class="bLeft bRight">
                        <td class="bRight2" rowspan="5">장<br>소<br>지<br>남<br>력</td>
                        <td class="bRight-none noto400">6.</td>
                        <td class="txt-left bRight2 noto400">우리가 있는 이곳은 무슨 도/특별시/광역시입니까?</td>
                        <td class="bRight2 bgGf"><input type="radio" id="no61" name="no6" value="N" /></td>
                        <td class="bgGt"><input type="radio" id="no62" name="no6" value="Y" /></td>
                    </tr>
                    <tr class="bLeft bRight">
                        <td class="bRight-none noto400">7.</td>
                        <td class="txt-left bRight2 noto400">여기는 무슨 시/군입니까?</td>
                        <td class="bRight2 bgGf"><input type="radio" id="no71" name="no7" value="N" /></td>
                        <td class="bgGt"><input type="radio" id="no72" name="no7" value="Y" /></td>
                    </tr>
                    <tr class="bLeft bRight">
                        <td class="bRight-none noto400">8.</td>
                        <td class="txt-left bRight2 noto400">여기는 무슨 구/동/읍/면입니까?</td>
                        <td class="bRight2 bgGf"><input type="radio" id="no81" name="no8" value="N" /></td>
                        <td class="bgGt"><input type="radio" id="no82" name="no8" value="Y" /></td>
                    </tr>
                    <tr class="bLeft bRight">
                        <td class="bRight-none noto400">9.</td>
                        <td class="txt-left bRight2 noto400">우리는 지금 이 건물의 몇 층에 있습니까?</td>
                        <td class="bRight2 bgGf"><input type="radio" id="no91" name="no9" value="N" /></td>
                        <td class="bgGt"><input type="radio" id="no92" name="no9" value="Y" /></td>
                    </tr>
                    <tr class="bLeft bRight">
                        <td class="bRight-none noto400">10.</td>
                        <td class="txt-left bRight2 noto400">이 장소의 이름이 무엇입니까?</td>
                        <td class="bRight2 bgGf"><input type="radio" id="no101" name="no10" value="N" /></td>
                        <td class="bgGt"><input type="radio" id="no102" name="no10" value="1" /></td>
                    </tr>
                    <tr class="bLeft bRight">
                        <td class="bRight2" rowspan="5">기<br>억<br>력<br>&#8214;<br>기<br>억<br>등<br>록</td>
                        <td class="bRight-none noto400 bBot-none">11.</td>
                        <td class="txt-left bRight2 noto400 bBot-none">제가 세 가지 물건의 이름을 말씀드리겠습니다. 끝가지 다 들으신 다음에 세 가지 물건의 이름을 모두 말씀해 보십시오. 그리고 몇 분 후에는 그 세 가지 물건의 이름들을 다시 물어볼 것이니 들으신 물건의 이름을 잘 기억하고 계십시오. 나무 – 자동차 – 모자</td>
                        <td class="bRight2 bgGf" rowspan="2"></td>
                        <td class="bgGt" rowspan="2"></td>
                    </tr>
                    <tr class="bLeft bRight">
                        <td class="bRight-none noto400 bBot-none"></td>
                        <td class="txt-left bRight2 noto400 bBot-none">이제 OOO님께서 방금 들으신 3가지 물건 이름을 모두 말씀해 보세요.</td>
                    </tr>
                    <tr class="bLeft bRight">
                        <td class="bRight-none noto400 bBot-none"></td>
                        <td class="bRight2 noto700 bBot-none">나무</td>
                        <td class="bRight2 bgGf"><input type="radio" id="no111" name="no11" value="N" /></td>
                        <td class="bgGt"><input type="radio" id="no112" name="no11" value="Y" /></td>
                    </tr>
                    <tr class="bLeft bRight">
                        <td class="bRight-none noto400 bBot-none"></td>
                        <td class="bRight2 noto700 bBot-none">자동차</td>
                        <td class="bRight2 bgGf"><input type="radio" id="no121" name="no12" value="N" /></td>
                        <td class="bgGt"><input type="radio" id="no122" name="no12" value="Y" /></td>
                    </tr>
                    <tr class="bLeft bRight">
                        <td class="bRight-none noto400"></td>
                        <td class="bRight2 noto700">모자</td>
                        <td class="bRight2 bgGf"><input type="radio" id="no131" name="no13" value="N" /></td>
                        <td class="bgGt"><input type="radio" id="no132" name="no13" value="Y" /></td>
                    </tr>
                    <tr class="bLeft bRight">
                        <td class="bRight2" rowspan="5">주<br>의<br>집<br>중<br>력</td>
                        <td class="bRight-none noto400 bBot-none">12.</td>
                        <td class="txt-left bRight2 noto400 bBot-none">100에서 7을 빼면 얼마가 됩니까?</td>
                        <td class="bRight2 bgGf"><input type="radio" id="no141" name="no14" value="N" /></td>
                        <td class="bgGt"><input type="radio" id="no142" name="no14" value="Y" /></td>
                    </tr>
                    <tr class="bLeft bRight">
                        <td class="bRight-none noto400 bBot-none"></td>
                        <td class="txt-left bRight2 noto400 bBot-none">거기에서 7을 빼면 얼마가 됩니까?</td>
                        <td class="bRight2 bgGf"><input type="radio" id="no151" name="no15" value="N" /></td>
                        <td class="bgGt"><input type="radio" id="no152" name="no15" value="Y" /></td>
                    </tr>
                    <tr class="bLeft bRight">
                        <td class="bRight-none noto400 bBot-none"></td>
                        <td class="txt-left bRight2 bBot-none noto400">거기에서 7을 빼면 얼마가 됩니까?</td>
                        <td class="bRight2 bgGf"><input type="radio" id="no161" name="no16" value="N" /></td>
                        <td class="bgGt"><input type="radio" id="no162" name="no16" value="Y" /></td>
                    </tr>
                    <tr class="bLeft bRight">
                        <td class="bRight-none noto400 bBot-none"></td>
                        <td class="txt-left bRight2 bBot-none noto400">거기에서 7을 빼면 얼마가 됩니까?</td>
                        <td class="bRight2 bgGf"><input type="radio" id="no171" name="no17" value="N" /></td>
                        <td class="bgGt"><input type="radio" id="no172" name="no17" value="Y" /></td>
                    </tr>
                    <tr class="bLeft bRight">
                        <td class="bRight-none"></td>
                        <td class="txt-left bRight2 noto400">거기에서 7을 빼면 얼마가 됩니까?</td>
                        <td class="bRight2 bgGf"><input type="radio" id="no181" name="no18" value="N" /></td>
                        <td class="bgGt"><input type="radio" id="no182" name="no18" value="Y" /></td>
                    </tr>
                    <tr class="bLeft bRight">
                        <td class="bRight2" rowspan="8">기<br>억<br>력<br>&#8214;<br>기<br>억<br>회<br>상</td>
                        <td class="bRight-none noto400 bBot-none">13.</td>
                        <td class="txt-left bRight2 noto400 bBot-none">조금 전에 제가 기억하려고 말씀드렸던 세 가지 물건의 이름이 무엇인지 말씀하여 주십시오.</td>
                        <td class="bRight2 bgGf"></td>
                        <td class="bgGt"></td>
                    </tr>
                    <tr class="bLeft bRight">
                        <td class="bRight-none noto400 bBot-none"></td>
                        <td class="bRight2 noto700 bBot-none">나무</td>
                        <td class="bRight2 bgGf"><input type="radio" id="no191" name="no19" value="N" /></td>
                        <td class="bgGt"><input type="radio" id="no192" name="no19" value="Y" /></td>
                    </tr>
                    <tr class="bLeft bRight">
                        <td class="bRight-none noto400 bBot-none"></td>
                        <td class="bRight2 noto700 bBot-none">자동차</td>
                        <td class="bRight2 bgGf"><input type="radio" id="no201" name="no20" value="N" /></td>
                        <td class="bgGt"><input type="radio" id="no202" name="no20" value="Y" /></td>
                    </tr>
                    <tr class="bLeft bRight">
                        <td class="bRight-none noto400"></td>
                        <td class="bRight2 noto700">모자</td>
                        <td class="bRight2 bgGf"><input type="radio" id="no211" name="no21" value="N" /></td>
                        <td class="bgGt"><input type="radio" id="no212" name="no21" value="Y" /></td>
                    </tr>
                    <tr class="bLeft bRight">
                        <td class="bRight-none bBot-none">14.</td>
                        <td class="bRight2 noto400 bBot-none">(실제 시계를 보여주며) 이것을 무엇이라고 합니까?</td>
                        <td class="bRight2 bgGf"><input type="radio" id="no221" name="no22" value="N" /></td>
                        <td class="bgGt"><input type="radio" id="no222" name="no22" value="Y" /></td>
                    </tr>
                    <tr class="bLeft bRight">
                        <td class="bRight-none"></td>
                        <td class="bRight2 noto400">(실제 연필을 보여주며) 이것을 무엇이라고 합니까?</td>
                        <td class="bRight2 bgGf"><input type="radio" id="no231" name="no23" value="N" /></td>
                        <td class="bgGt"><input type="radio" id="no232" name="no23" value="Y" /></td>
                    </tr>
                    <tr class="bLeft bRight">
                        <td class="bRight-none bBot-none">15.</td>
                        <td class="txt-left bRight2 noto400 bBot-none">제가 하는 말을 끝가지 듣고 따라해 보십시오. 한번만 말씀드릴 것이니 잘 듣고 따라 하십시오.</td>
                        <td class="bRight2 bgGf" rowspan="2"><input type="radio" id="no241" name="no24" value="N" /></td>
                        <td class="bgGt" rowspan="2"><input type="radio" id="no242" name="no24" value="Y" /></td>
                    </tr>
                    <tr class="bLeft bRight">
                        <td class="bRight-none"></td>
                        <td class="bRight2">간장공장공장장</td>
                    </tr>
                    <tr class="bLeft bRight">
                        <td class="bRight2" rowspan="5">실<br>행<br>능<br>력</td>
                        <td class="bRight-none noto400 bBot-none">16.</td>
                        <td class="txt-left bRight2 noto400 bBot-none">지금부터 제가 말씀드리는 대로 해 보십시오. 한 번만 말씀드릴 것이니 잘 들으시고 그대로 해 보십시오.(지시를 끝낸 후에 종이를 건네준다. 지시를 반복하거나 옆에서 도와주면 안 된다.)</td>
                        <td class="bRight2 bgGf bBot-none"></td>
                        <td class="bgGt bBot-none"></td>
                    </tr>
                    <tr class="bLeft bRight">
                        <td class="bRight-none bBot-none"></td>
                        <td class="txt-left bRight2 noto400 bBot-none">제가 종이를 한 장 드릴 것입니다. 그러면 그 종이를 오른손으로 받아, 반으로 접은 다음, 무릎 위에 올려놓으십시오.</td>
                        <td class="bRight2 bgGf"></td>
                        <td class="bgGt"></td>
                    </tr>
                    <tr class="bLeft bRight">
                        <td class="bRight-none noto400 bBot-none"></td>
                        <td class="bRight2 noto700 bBot-none">오른손으로 받는다.</td>
                        <td class="bRight2 bgGf"><input type="radio" id="no251" name="no25" value="N" /></td>
                        <td class="bgGt bBot"><input type="radio" id="no252" name="no25" value="Y" /></td>
                    </tr>
                    <tr class="bLeft bRight">
                        <td class="bRight-none noto400 bBot-none"></td>
                        <td class="bRight2 noto700 bBot-none">반으로 접는다.</td>
                        <td class="bRight2 bgGf"><input type="radio" id="no261" name="no26" value="N" /></td>
                        <td class="bgGt"><input type="radio" id="no262" name="no26" value="Y" /></td>
                    </tr>
                    <tr class="bLeft bRight">
                        <td class="bRight-none noto400"></td>
                        <td class="bRight2 noto700">무릎 위에 놓는다.</td>
                        <td class="bRight2 bgGf"><input type="radio" id="no271" name="no27" value="N" /></td>
                        <td class="bgGt"><input type="radio" id="no272" name="no27" value="Y" /></td>
                    </tr>
                    <tr class="bLeft bRight">
                        <td class="bRight2" rowspan="2">시<br>공<br>간<br>구<br>성<br>능<br>력</td>
                        <td class="bRight-none noto400 bBot-none">17.</td>
                        <td class="txt-left bRight2 noto400 bBot-none">(겹친 오각형 그림을 가리키며) 여기에 오각형이 겹쳐져 있는 그림이 있습니다.
                            이 그림을 아래 빈 곳에 그대로 그려보십시오.</td>
                        <td class="bRight2 bgGf" rowspan="2"><input type="radio" id="no281" name="no28" value="N" /></td>
                        <td class="bgGt" rowspan="2"><input type="radio" id="no282" name="no28" value="Y" /></td>
                    </tr>
                    <tr class="bLeft bRight">
                        <td class="bRight-none noto400"></td>
                        <td class="bRight2 noto700"><img src="/gnoincoundb/img/img.png"></td>
                    </tr>
                    <tr class="bLeft bRight">
                        <td class="bRight2 bBottom" rowspan="2">판<br>단<br>및<br>추<br>상<br>적<br>사<br>고<br>력</td>
                        <td class="bRight-none noto400">18.</td>
                        <td class="txt-left bRight2 noto400">옷은 왜 빨아서 입습니까?</td>
                        <td class="bRight2 bgGf"><input type="radio" id="no291" name="no29" value="N" /></td>
                        <td class="bgGt"><input type="radio" id="no292" name="no29" value="Y" /></td>
                    </tr>
                    <tr class="bLeft bRight">
                        <td class="bRight-none bBottom">19.</td>
                        <td class=" txt-left bRight2 noto400 bBottom">티끌 모아 태산은 무슨 뜻입니까?</td>
                        <td class="bRight2 bgGf bBottom"><input type="radio" id="no301" name="no30" value="N" /></td>
                        <td class="bgGt bBottom"><input type="radio" id="no302" name="no30" value="Y" /></td>
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