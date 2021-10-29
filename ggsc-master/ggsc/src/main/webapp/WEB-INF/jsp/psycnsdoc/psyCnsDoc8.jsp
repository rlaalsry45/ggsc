<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
    <title>대인관계 변화 척도</title>
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
        font-weight: 400;
        font-size: 16px;
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

    .txt-left {
        text-align: left !important;
    }

    .txtIn40 {
        text-indent: 40px;
    }

    .txtIn20 {
        text-indent: 20px;
    }

    .bgG {
        background-color: #D6D6D6;
    }

    .w30 {
        width: 30%;
        top: -2px;
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
                Case No. (20<input type="text" class="inp month" maxlength="2" name='no26'>)-(<input type="text" class="inp month" maxlength="2" name='no27'>)-(<input type="text" class="inp month" maxlength="2" name='no28'>)-(<input type="text" class="inp name" maxlength="5" name='no29'>)
            </div> -->
            <div class="box-title noto700 txt-center mt15 mb15">
                대인관계 변화 척도
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
                <caption>대인관계변화척도</caption>
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
                            <input type="text" id="datepicker1" class="inp" name="writeDt" style="width: 80%;" readonly>
                        </td>
                    </tr>
                </tbody>
            </table>
            <div class="txt mt15">
                ※ 아래의 문항은 여러분과 여러분의 주변 사람들과의 관계에 대해 묻는 질문입니다. 평소 자신의 모습에 비추어 볼 때, 일반적으로 그렇다고 생각되는 곳에 √표 해주십시오.
            </div>
            <table class="tbl2 mt15">
                <caption>대인관계변화척도</caption>
                <colgroup>
                    <col style="width: 10%;" />
                    <col style="width: 50%;" />
                    <col style="width: 10%;" />
                    <col style="width: 50%;" />
                </colgroup>
                <thead>
                    <tr>
                        <th scope="col" colspan="4" class="txt-left txtIn20 bgG bRight-none">1. 나는 나 자신에 대하여</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1.</td>
                        <td class="txt-left txtIn40"><input type="radio" id="no11" name="no1" value="1" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no11">매우 불만족스럽다.</label></td>
                        <td>2.</td>
                        <td class="txt-left txtIn40 bRight-none"><input type="radio" id="no12" name="no1" value="2" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no12">약간 불만족스럽다.</label></td>
                    </tr>
                    <tr>
                        <td>3.</td>
                        <td class="txt-left txtIn40"><input type="radio" id="no13" name="no1" value="3" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no13">그저 그렇다.</label></td>
                        <td>4.</td>
                        <td class="txt-left txtIn40 bRight-none"><input type="radio" id="no14" name="no1" value="4" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no14">약간 만족한다.</label></td>
                    </tr>
                    <tr class="bBottom">
                        <td>5.</td>
                        <td class="txt-left txtIn40"><input type="radio" id="no15" name="no1" value="5" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no15">매우 만족한다.</label></td>
                        <td></td>
                        <td class="txt-left txtIn40 bRight-none"></td>
                    </tr>
                </tbody>
            </table>
            <table class="tbl2 mt5">
                <caption>대인관계변화척도</caption>
                <colgroup>
                    <col style="width: 10%;" />
                    <col style="width: 50%;" />
                    <col style="width: 10%;" />
                    <col style="width: 50%;" />
                </colgroup>
                <thead>
                    <tr>
                        <th scope="col" colspan="4" class="txt-left txtIn20 bgG bRight-none">2. 나는 다른 사람에 대하여</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1.</td>
                        <td class="txt-left txtIn40"><input type="radio" id="no21" name="no2" value="1" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no21">매우 불만족스럽다.</label></td>
                        <td>2.</td>
                        <td class="txt-left txtIn40 bRight-none"><input type="radio" id="no22" name="no2" value="2" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no22">약간 불만족스럽다.</label></td>
                    </tr>
                    <tr>
                        <td>3.</td>
                        <td class="txt-left txtIn40"><input type="radio" id="no23" name="no2" value="3" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no23">그저 그렇다.</label></td>
                        <td>4.</td>
                        <td class="txt-left txtIn40 bRight-none"><input type="radio" id="no24" name="no2" value="4" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no124">약간 만족한다.</label></td>
                    </tr>
                    <tr class="bBottom">
                        <td>5.</td>
                        <td class="txt-left txtIn40"><input type="radio" id="no25" name="no2" value="5" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no25">매우 만족한다.</label></td>
                        <td></td>
                        <td class="txt-left txtIn40 bRight-none"></td>
                    </tr>
                </tbody>
            </table>
            <table class="tbl2 mt5">
                <caption>대인관계변화척도</caption>
                <colgroup>
                    <col style="width: 10%;" />
                    <col style="width: 50%;" />
                    <col style="width: 10%;" />
                    <col style="width: 50%;" />
                </colgroup>
                <thead>
                    <tr>
                        <th scope="col" colspan="4" class="txt-left txtIn20 bgG bRight-none">
                            3. 다른 사람들은 나를 (<input type="text" class="inp w30 bgG">) 사람으로 볼 것이라고 생각한다.
                        </th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1.</td>
                        <td class="txt-left txtIn40"><input type="radio" id="no31" name="no3" value="1" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no31">매우 불만족스러운</label></td>
                        <td>2.</td>
                        <td class="txt-left txtIn40 bRight-none"><input type="radio" id="no32" name="no3" value="2" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no32">약간 불만족스러운</label></td>
                    </tr>
                    <tr>
                        <td>3.</td>
                        <td class="txt-left txtIn40"><input type="radio" id="no33" name="no3" value="3" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no33">그저 그런</label></td>
                        <td>4.</td>
                        <td class="txt-left txtIn40 bRight-none"><input type="radio" id="no34" name="no3" value="4" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no34">약간 만족스러운</label></td>
                    </tr>
                    <tr class="bBottom">
                        <td>5.</td>
                        <td class="txt-left txtIn40"><input type="radio" id="no35" name="no3" value="5" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no35">매우 만족스러운</label></td>
                        <td></td>
                        <td class="txt-left txtIn40 bRight-none"></td>
                    </tr>
                </tbody>
            </table>
            <table class="tbl2 mt5">
                <caption>대인관계변화척도</caption>
                <colgroup>
                    <col style="width: 10%;" />
                    <col style="width: 50%;" />
                    <col style="width: 10%;" />
                    <col style="width: 50%;" />
                </colgroup>
                <thead>
                    <tr>
                        <th scope="col" colspan="4" class="txt-left txtIn20 bgG bRight-none">
                            4. 다른 사람들은 그 자신에 대하여 (<input type="text" class="inp w30 bgG">) 사람으로 본다.
                        </th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1.</td>
                        <td class="txt-left txtIn40"><input type="radio" id="no41" name="no4" value="1" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no41">매우 불만족스러운</label></td>
                        <td>2.</td>
                        <td class="txt-left txtIn40 bRight-none"><input type="radio" id="no42" name="no4" value="2" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no42">약간 불만족스러운</label></td>
                    </tr>
                    <tr>
                        <td>3.</td>
                        <td class="txt-left txtIn40"><input type="radio" id="no43" name="no4" value="3" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no43">그저 그런</label></td>
                        <td>4.</td>
                        <td class="txt-left txtIn40 bRight-none"><input type="radio" id="no44" name="no4" value="4" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no44">약간 만족스러운</label></td>
                    </tr>
                    <tr class="bBottom">
                        <td>5.</td>
                        <td class="txt-left txtIn40"><input type="radio" id="no45" name="no4" value="5" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no45">매우 만족스러운</label></td>
                        <td></td>
                        <td class="txt-left txtIn40 bRight-none"></td>
                    </tr>
                </tbody>
            </table>
            <table class="tbl2 mt5">
                <caption>대인관계변화척도</caption>
                <colgroup>
                    <col style="width: 10%;" />
                    <col style="width: 50%;" />
                    <col style="width: 10%;" />
                    <col style="width: 50%;" />
                </colgroup>
                <thead>
                    <tr>
                        <th scope="col" colspan="4" class="txt-left txtIn20 bgG bRight-none">5. 다른 사람과 나의 관계는</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1.</td>
                        <td class="txt-left txtIn40"><input type="radio" id="no51" name="no5" value="1" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no51">매우 원만하지 못하다.</label></td>
                        <td>2.</td>
                        <td class="txt-left txtIn40 bRight-none"><input type="radio" id="no52" name="no5" value="2" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no52">약간 원만하지 못하다.</label></td>
                    </tr>
                    <tr>
                        <td>3.</td>
                        <td class="txt-left txtIn40"><input type="radio" id="no53" name="no5" value="3" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no53">그저 그렇다.</label></td>
                        <td>4.</td>
                        <td class="txt-left txtIn40 bRight-none"><input type="radio" id="no54" name="no5" value="4" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no54">약간 원만하다.</label></td>
                    </tr>
                    <tr class="bBottom">
                        <td>5.</td>
                        <td class="txt-left txtIn40"><input type="radio" id="no55" name="no5" value="5" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no55">매우 원만하다.</label></td>
                        <td></td>
                        <td class="txt-left txtIn40 bRight-none"></td>
                    </tr>
                </tbody>
            </table>
            <table class="tbl2 mt5">
                <caption>대인관계변화척도</caption>
                <colgroup>
                    <col style="width: 10%;" />
                    <col style="width: 50%;" />
                    <col style="width: 10%;" />
                    <col style="width: 50%;" />
                </colgroup>
                <thead>
                    <tr>
                        <th scope="col" colspan="4" class="txt-left txtIn20 bgG bRight-none">6. 나는 다른 사람이 바라는 욕구를</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1.</td>
                        <td class="txt-left txtIn40"><input type="radio" id="no61" name="no6" value="1" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no61">거의 알지 못한다.</label></td>
                        <td>2.</td>
                        <td class="txt-left txtIn40 bRight-none"><input type="radio" id="no62" name="no6" value="2" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no62">약간 알지 못한다.</label></td>
                    </tr>
                    <tr>
                        <td>3.</td>
                        <td class="txt-left txtIn40"><input type="radio" id="no63" name="no6" value="3" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no63">그저 그렇다.</label></td>
                        <td>4.</td>
                        <td class="txt-left txtIn40 bRight-none"><input type="radio" id="no64" name="no6" value="4" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no64">약간 아는 편이다.</label></td>
                    </tr>
                    <tr class="bBottom">
                        <td>5.</td>
                        <td class="txt-left txtIn40"><input type="radio" id="no65" name="no6" value="5" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no65">매우 아는 편이다.</label></td>
                        <td></td>
                        <td class="txt-left txtIn40 bRight-none"></td>
                    </tr>
                </tbody>
            </table>
            <table class="tbl2 mt5">
                <caption>대인관계변화척도</caption>
                <colgroup>
                    <col style="width: 10%;" />
                    <col style="width: 50%;" />
                    <col style="width: 10%;" />
                    <col style="width: 50%;" />
                </colgroup>
                <thead>
                    <tr>
                        <th scope="col" colspan="4" class="txt-left txtIn20 bgG bRight-none">7. 나는 나 자신의 감정을</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1.</td>
                        <td class="txt-left txtIn40"><input type="radio" id="no71" name="no7" value="1" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no71">거의 이해하지 못한다.</label></td>
                        <td>2.</td>
                        <td class="txt-left txtIn40 bRight-none"><input type="radio" id="no72" name="no7" value="2" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no72">약간 이해하지 못한다.</label></td>
                    </tr>
                    <tr>
                        <td>3.</td>
                        <td class="txt-left txtIn40"><input type="radio" id="no73" name="no7" value="3" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no73">그저 그렇다.</label></td>
                        <td>4.</td>
                        <td class="txt-left txtIn40 bRight-none"><input type="radio" id="no74" name="no7" value="4" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no74">약간 이해한다.</label></td>
                    </tr>
                    <tr class="bBottom">
                        <td>5.</td>
                        <td class="txt-left txtIn40"><input type="radio" id="no75" name="no7" value="5" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no75">매우 이해한다.</label></td>
                        <td></td>
                        <td class="txt-left txtIn40 bRight-none"></td>
                    </tr>
                </tbody>
            </table>
            <table class="tbl2 mt5">
                <caption>대인관계변화척도</caption>
                <colgroup>
                    <col style="width: 10%;" />
                    <col style="width: 50%;" />
                    <col style="width: 10%;" />
                    <col style="width: 50%;" />
                </colgroup>
                <thead>
                    <tr>
                        <th scope="col" colspan="4" class="txt-left txtIn20 bgG bRight-none">8. 나는 다른 사람의 감정을</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1.</td>
                        <td class="txt-left txtIn40"><input type="radio" id="no81" name="no8" value="1" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no81">거의 이해하지 못한다.</label></td>
                        <td>2.</td>
                        <td class="txt-left txtIn40 bRight-none"><input type="radio" id="no82" name="no8" value="2" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no82">약간 이해하지 못한다.</label></td>
                    </tr>
                    <tr>
                        <td>3.</td>
                        <td class="txt-left txtIn40"><input type="radio" id="no83" name="no8" value="3" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no83">그저 그렇다.</label></td>
                        <td>4.</td>
                        <td class="txt-left txtIn40 bRight-none"><input type="radio" id="no84" name="no8" value="4" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no84">약간 이해한다.</label></td>
                    </tr>
                    <tr class="bBottom">
                        <td>5.</td>
                        <td class="txt-left txtIn40"><input type="radio" id="no85" name="no8" value="5" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no85">매우 이해한다.</label></td>
                        <td></td>
                        <td class="txt-left txtIn40 bRight-none"></td>
                    </tr>
                </tbody>
            </table>
            <table class="tbl2 mt5">
                <caption>대인관계변화척도</caption>
                <colgroup>
                    <col style="width: 10%;" />
                    <col style="width: 50%;" />
                    <col style="width: 10%;" />
                    <col style="width: 50%;" />
                </colgroup>
                <thead>
                    <tr>
                        <th scope="col" colspan="4" class="txt-left txtIn20 bgG bRight-none">9. 나는 다른 사람과 이야기를 하는 것에 대하여</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1.</td>
                        <td class="txt-left txtIn40"><input type="radio" id="no91" name="no9" value="1" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no91">매우 어려움을 느낀다.</label></td>
                        <td>2.</td>
                        <td class="txt-left txtIn40 bRight-none"><input type="radio" id="no92" name="no9" value="2" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no92">약간 어려움을 느낀다.</label></td>
                    </tr>
                    <tr>
                        <td>3.</td>
                        <td class="txt-left txtIn40"><input type="radio" id="no93" name="no9" value="3" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no93">그저 그렇다.</label></td>
                        <td>4.</td>
                        <td class="txt-left txtIn40 bRight-none"><input type="radio" id="no94" name="no9" value="4" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no94">약간 쉽게 느낀다.</label></td>
                    </tr>
                    <tr class="bBottom">
                        <td>5.</td>
                        <td class="txt-left txtIn40"><input type="radio" id="no95" name="no9" value="5" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no95">매우 쉽게 느낀다.</label></td>
                        <td></td>
                        <td class="txt-left txtIn40 bRight-none"></td>
                    </tr>
                </tbody>
            </table>
            <table class="tbl2 mt5">
                <caption>대인관계변화척도</caption>
                <colgroup>
                    <col style="width: 10%;" />
                    <col style="width: 50%;" />
                    <col style="width: 10%;" />
                    <col style="width: 50%;" />
                </colgroup>
                <thead>
                    <tr>
                        <th scope="col" colspan="4" class="txt-left txtIn20 bgG bRight-none">10. 다른 사람에 대한 나의 감수성은</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1.</td>
                        <td class="txt-left txtIn40"><input type="radio" id="no101" name="no10" value="1" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no101">매우 느리다.</label></td>
                        <td>2.</td>
                        <td class="txt-left txtIn40 bRight-none"><input type="radio" id="no102" name="no10" value="2" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no102">약간 느리다.</label></td>
                    </tr>
                    <tr>
                        <td>3.</td>
                        <td class="txt-left txtIn40"><input type="radio" id="no103" name="no10" value="3" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no103">그저 그렇다.</label></td>
                        <td>4.</td>
                        <td class="txt-left txtIn40 bRight-none"><input type="radio" id="no104" name="no10" value="4" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no104">약간 빠르다.</label></td>
                    </tr>
                    <tr class="bBottom">
                        <td>5.</td>
                        <td class="txt-left txtIn40"><input type="radio" id="no105" name="no10" value="5" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no105">매우 빠르다.</label></td>
                        <td></td>
                        <td class="txt-left txtIn40 bRight-none"></td>
                    </tr>
                </tbody>
            </table>
            <table class="tbl2 mt5">
                <caption>대인관계변화척도</caption>
                <colgroup>
                    <col style="width: 10%;" />
                    <col style="width: 50%;" />
                    <col style="width: 10%;" />
                    <col style="width: 50%;" />
                </colgroup>
                <thead>
                    <tr>
                        <th scope="col" colspan="4" class="txt-left txtIn20 bgG bRight-none">11. 다른 삶에 대한 나의 온정적인 태도는</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1.</td>
                        <td class="txt-left txtIn40"><input type="radio" id="no111" name="no11" value="1" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no111">매우 적다.</label></td>
                        <td>2.</td>
                        <td class="txt-left txtIn40 bRight-none"><input type="radio" id="no112" name="no11" value="2" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no112">약간 적다.</label></td>
                    </tr>
                    <tr>
                        <td>3.</td>
                        <td class="txt-left txtIn40"><input type="radio" id="no113" name="no11" value="3" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no113">그저 그렇다.</label></td>
                        <td>4.</td>
                        <td class="txt-left txtIn40 bRight-none"><input type="radio" id="no114" name="no11" value="4" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no114">약간 많다.</label></td>
                    </tr>
                    <tr class="bBottom">
                        <td>5.</td>
                        <td class="txt-left txtIn40"><input type="radio" id="no115" name="no11" value="5" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no115">매우 많다.</label></td>
                        <td></td>
                        <td class="txt-left txtIn40 bRight-none"></td>
                    </tr>
                </tbody>
            </table>
            <table class="tbl2 mt5">
                <caption>대인관계변화척도</caption>
                <colgroup>
                    <col style="width: 10%;" />
                    <col style="width: 50%;" />
                    <col style="width: 10%;" />
                    <col style="width: 50%;" />
                </colgroup>
                <thead>
                    <tr>
                        <th scope="col" colspan="4" class="txt-left txtIn20 bgG bRight-none">12. 다른 사람에 대한 나의 표현이나 개방성 정도는</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1.</td>
                        <td class="txt-left txtIn40"><input type="radio" id="no121" name="no12" value="1" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no121">매우 적다.</label></td>
                        <td>2.</td>
                        <td class="txt-left txtIn40 bRight-none"><input type="radio" id="no122" name="no12" value="2" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no122">약간 적다.</label></td>
                    </tr>
                    <tr>
                        <td>3.</td>
                        <td class="txt-left txtIn40"><input type="radio" id="no123" name="no12" value="3" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no123">그저 그렇다.</label></td>
                        <td>4.</td>
                        <td class="txt-left txtIn40 bRight-none"><input type="radio" id="no124" name="no12" value="4" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no124">약간 많다.</label></td>
                    </tr>
                    <tr class="bBottom">
                        <td>5.</td>
                        <td class="txt-left txtIn40"><input type="radio" id="no125" name="no12" value="5" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no125">매우 많다.</label></td>
                        <td></td>
                        <td class="txt-left txtIn40 bRight-none"></td>
                    </tr>
                </tbody>
            </table>
            <table class="tbl2 mt5">
                <caption>대인관계변화척도</caption>
                <colgroup>
                    <col style="width: 10%;" />
                    <col style="width: 50%;" />
                    <col style="width: 10%;" />
                    <col style="width: 50%;" />
                </colgroup>
                <thead>
                    <tr>
                        <th scope="col" colspan="4" class="txt-left txtIn20 bgG bRight-none">13. 나는 다른 사람의 느낌을 이해하는 것이</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1.</td>
                        <td class="txt-left txtIn40"><input type="radio" id="no131" name="no13" value="1" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no131">매우 어렵다.</label></td>
                        <td>2.</td>
                        <td class="txt-left txtIn40 bRight-none"><input type="radio" id="no132" name="no13" value="2" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no132">약간 어렵다.</label></td>
                    </tr>
                    <tr>
                        <td>3.</td>
                        <td class="txt-left txtIn40"><input type="radio" id="no133" name="no13" value="3" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no133">그저 그렇다.</label></td>
                        <td>4.</td>
                        <td class="txt-left txtIn40 bRight-none"><input type="radio" id="no134" name="no13" value="4" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no134">약간 쉽다.</label></td>
                    </tr>
                    <tr class="bBottom">
                        <td>5.</td>
                        <td class="txt-left txtIn40"><input type="radio" id="no135" name="no13" value="5" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no135">매우 쉽다.</label></td>
                        <td></td>
                        <td class="txt-left txtIn40 bRight-none"></td>
                    </tr>
                </tbody>
            </table>
            <table class="tbl2 mt5">
                <caption>대인관계변화척도</caption>
                <colgroup>
                    <col style="width: 10%;" />
                    <col style="width: 50%;" />
                    <col style="width: 10%;" />
                    <col style="width: 50%;" />
                </colgroup>
                <thead>
                    <tr>
                        <th scope="col" colspan="4" class="txt-left txtIn20 bgG bRight-none">14. 나는 다른 사람의 이야기를 듣는 것이</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1.</td>
                        <td class="txt-left txtIn40"><input type="radio" id="no141" name="no14" value="1" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no141">매우 어렵다.</label></td>
                        <td>2.</td>
                        <td class="txt-left txtIn40 bRight-none"><input type="radio" id="no142" name="no14" value="2" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no142">약간 어렵다.</label></td>
                    </tr>
                    <tr>
                        <td>3.</td>
                        <td class="txt-left txtIn40"><input type="radio" id="no143" name="no14" value="3" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no143">그저 그렇다.</label></td>
                        <td>4.</td>
                        <td class="txt-left txtIn40 bRight-none"><input type="radio" id="no144" name="no14" value="4" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no144">약간 쉽다.</label></td>
                    </tr>
                    <tr class="bBottom">
                        <td>5.</td>
                        <td class="txt-left txtIn40"><input type="radio" id="no145" name="no14" value="5" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no145">매우 쉽다.</label></td>
                        <td></td>
                        <td class="txt-left txtIn40 bRight-none"></td>
                    </tr>
                </tbody>
            </table>
            <table class="tbl2 mt5">
                <caption>대인관계변화척도</caption>
                <colgroup>
                    <col style="width: 10%;" />
                    <col style="width: 50%;" />
                    <col style="width: 10%;" />
                    <col style="width: 50%;" />
                </colgroup>
                <thead>
                    <tr>
                        <th scope="col" colspan="4" class="txt-left txtIn20 bgG bRight-none">15. 나는 다른 사람을</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1.</td>
                        <td class="txt-left txtIn40"><input type="radio" id="no151" name="no15" value="1" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no151">거의 믿지 않는다.</label></td>
                        <td>2.</td>
                        <td class="txt-left txtIn40 bRight-none"><input type="radio" id="no152" name="no15" value="2" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no152">약간 믿지 않는 편이다.</label></td>
                    </tr>
                    <tr>
                        <td>3.</td>
                        <td class="txt-left txtIn40"><input type="radio" id="no153" name="no15" value="3" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no153">그저 그렇다.</label></td>
                        <td>4.</td>
                        <td class="txt-left txtIn40 bRight-none"><input type="radio" id="no154" name="no15" value="4" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no154">약간 믿는다.</label></td>
                    </tr>
                    <tr class="bBottom">
                        <td>5.</td>
                        <td class="txt-left txtIn40"><input type="radio" id="no155" name="no15" value="5" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no155">매우 믿는다.</label></td>
                        <td></td>
                        <td class="txt-left txtIn40 bRight-none"></td>
                    </tr>
                </tbody>
            </table>
            <table class="tbl2 mt5">
                <caption>대인관계변화척도</caption>
                <colgroup>
                    <col style="width: 10%;" />
                    <col style="width: 50%;" />
                    <col style="width: 10%;" />
                    <col style="width: 50%;" />
                </colgroup>
                <thead>
                    <tr>
                        <th scope="col" colspan="4" class="txt-left txtIn20 bgG bRight-none">16. 나는 다른 사람에 대하여</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1.</td>
                        <td class="txt-left txtIn40"><input type="radio" id="no161" name="no16" value="1" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no161">매우 거리감을 느낀다.</label></td>
                        <td>2.</td>
                        <td class="txt-left txtIn40 bRight-none"><input type="radio" id="no162" name="no16" value="2" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no162">약간 거리감을 느낀다.</label></td>
                    </tr>
                    <tr>
                        <td>3.</td>
                        <td class="txt-left txtIn40"><input type="radio" id="no163" name="no16" value="3" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no163">그저 그렇다.</label></td>
                        <td>4.</td>
                        <td class="txt-left txtIn40 bRight-none"><input type="radio" id="no164" name="no16" value="4" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no164">약간 친근감을 느낀다.</label></td>
                    </tr>
                    <tr class="bBottom">
                        <td>5.</td>
                        <td class="txt-left txtIn40"><input type="radio" id="no165" name="no16" value="5" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no165">매우 친근감을 느낀다.</label></td>
                        <td></td>
                        <td class="txt-left txtIn40 bRight-none"></td>
                    </tr>
                </tbody>
            </table>
            <table class="tbl2 mt5">
                <caption>대인관계변화척도</caption>
                <colgroup>
                    <col style="width: 10%;" />
                    <col style="width: 50%;" />
                    <col style="width: 10%;" />
                    <col style="width: 50%;" />
                </colgroup>
                <thead>
                    <tr>
                        <th scope="col" colspan="4" class="txt-left txtIn20 bgG bRight-none">17. 나는 인간관계(사람들과 만나는데) 있어서 자신감이</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1.</td>
                        <td class="txt-left txtIn40"><input type="radio" id="no171" name="no17" value="1" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no171">매우 적다.</label></td>
                        <td>2.</td>
                        <td class="txt-left txtIn40 bRight-none"><input type="radio" id="no172" name="no17" value="2" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no172">약간 적다.</label></td>
                    </tr>
                    <tr>
                        <td>3.</td>
                        <td class="txt-left txtIn40"><input type="radio" id="no173" name="no17" value="3" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no173">그저 그렇다.</label></td>
                        <td>4.</td>
                        <td class="txt-left txtIn40 bRight-none"><input type="radio" id="no174" name="no17" value="4" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no174">약간 많다.</label></td>
                    </tr>
                    <tr class="bBottom">
                        <td>5.</td>
                        <td class="txt-left txtIn40"><input type="radio" id="no175" name="no17" value="5" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no175">매우 많다.</label></td>
                        <td></td>
                        <td class="txt-left txtIn40 bRight-none"></td>
                    </tr>
                </tbody>
            </table>
            <table class="tbl2 mt5">
                <caption>대인관계변화척도</caption>
                <colgroup>
                    <col style="width: 10%;" />
                    <col style="width: 50%;" />
                    <col style="width: 10%;" />
                    <col style="width: 50%;" />
                </colgroup>
                <thead>
                    <tr>
                        <th scope="col" colspan="4" class="txt-left txtIn20 bgG bRight-none">
                            18. 나는 다른 사람과 의견이 맞지 않을 경우 그것을 건설적으로(좋게)
                        </th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1.</td>
                        <td class="txt-left txtIn40"><input type="radio" id="no181" name="no18" value="1" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no181">매우 못 다룬다.</label></td>
                        <td>2.</td>
                        <td class="txt-left txtIn40 bRight-none"><input type="radio" id="no182" name="no18" value="2" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no182">약간 못 다룬다.</label></td>
                    </tr>
                    <tr>
                        <td>3.</td>
                        <td class="txt-left txtIn40"><input type="radio" id="no183" name="no18" value="3" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no183">그저 그렇다.</label></td>
                        <td>4.</td>
                        <td class="txt-left txtIn40 bRight-none"><input type="radio" id="no184" name="no18" value="4" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no184">약간 잘 다룬다.</label></td>
                    </tr>
                    <tr class="bBottom">
                        <td>5.</td>
                        <td class="txt-left txtIn40"><input type="radio" id="no185" name="no18" value="5" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no185">매우 잘 다룬다.</label></td>
                        <td></td>
                        <td class="txt-left txtIn40 bRight-none"></td>
                    </tr>
                </tbody>
            </table>
            <table class="tbl2 mt5">
                <caption>대인관계변화척도</caption>
                <colgroup>
                    <col style="width: 10%;" />
                    <col style="width: 50%;" />
                    <col style="width: 10%;" />
                    <col style="width: 50%;" />
                </colgroup>
                <thead>
                    <tr>
                        <th scope="col" colspan="4" class="txt-left txtIn20 bgG bRight-none">19. 나는 다른 사람과 이야기를 할 경우 어려움을</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1.</td>
                        <td class="txt-left txtIn40"><input type="radio" id="no191" name="no19" value="1" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no191">매우 많이 느낀다.</label></td>
                        <td>2.</td>
                        <td class="txt-left txtIn40 bRight-none"><input type="radio" id="no192" name="no19" value="2" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no192">약간 많이 느낀다.</label></td>
                    </tr>
                    <tr>
                        <td>3.</td>
                        <td class="txt-left txtIn40"><input type="radio" id="no193" name="no19" value="3" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no193">그저 그렇다.</label></td>
                        <td>4.</td>
                        <td class="txt-left txtIn40 bRight-none"><input type="radio" id="no194" name="no19" value="4" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no194">약간 안 느낀다.</label></td>
                    </tr>
                    <tr class="bBottom">
                        <td>5.</td>
                        <td class="txt-left txtIn40"><input type="radio" id="no195" name="no19" value="5" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no195">거의 안 느낀다.</label></td>
                        <td></td>
                        <td class="txt-left txtIn40 bRight-none"></td>
                    </tr>
                </tbody>
            </table>
            <table class="tbl2 mt5">
                <caption>대인관계변화척도</caption>
                <colgroup>
                    <col style="width: 10%;" />
                    <col style="width: 50%;" />
                    <col style="width: 10%;" />
                    <col style="width: 50%;" />
                </colgroup>
                <thead>
                    <tr>
                        <th scope="col" colspan="4" class="txt-left txtIn20 bgG bRight-none">20. 나는 다른 사람에 대한 긍정적인 느낌을</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1.</td>
                        <td class="txt-left txtIn40"><input type="radio" id="no201" name="no20" value="1" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no201">거의 표현하지 못한다.</label></td>
                        <td>2.</td>
                        <td class="txt-left txtIn40 bRight-none"><input type="radio" id="no202" name="no20" value="2" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no202">약간 많이 느낀다.</label></td>
                    </tr>
                    <tr>
                        <td>3.</td>
                        <td class="txt-left txtIn40"><input type="radio" id="no203" name="no20" value="3" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no203">그저 그렇다.</label></td>
                        <td>4.</td>
                        <td class="txt-left txtIn40 bRight-none"><input type="radio" id="no204" name="no20" value="4" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no204">약간 안 느낀다.</label></td>
                    </tr>
                    <tr class="bBottom">
                        <td>5.</td>
                        <td class="txt-left txtIn40"><input type="radio" id="no205" name="no20" value="5" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no205">거의 안 느낀다.</label></td>
                        <td></td>
                        <td class="txt-left txtIn40 bRight-none"></td>
                    </tr>
                </tbody>
            </table>
            <table class="tbl2 mt5">
                <caption>대인관계변화척도</caption>
                <colgroup>
                    <col style="width: 10%;" />
                    <col style="width: 50%;" />
                    <col style="width: 10%;" />
                    <col style="width: 50%;" />
                </colgroup>
                <thead>
                    <tr>
                        <th scope="col" colspan="4" class="txt-left txtIn20 bgG bRight-none">21. 나는 다른 사람에 대한 부정적인 느낌을 (건설적으로)</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1.</td>
                        <td class="txt-left txtIn40"><input type="radio" id="no211" name="no21" value="1" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no211">거의 표현하지 못한다.</label></td>
                        <td>2.</td>
                        <td class="txt-left txtIn40 bRight-none"><input type="radio" id="no212" name="no21" value="2" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no212">약간 많이 느낀다.</label></td>
                    </tr>
                    <tr>
                        <td>3.</td>
                        <td class="txt-left txtIn40"><input type="radio" id="no213" name="no21" value="3" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no213">그저 그렇다.</label></td>
                        <td>4.</td>
                        <td class="txt-left txtIn40 bRight-none"><input type="radio" id="no214" name="no21" value="4" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no214">약간 안 느낀다.</label></td>
                    </tr>
                    <tr class="bBottom">
                        <td>5.</td>
                        <td class="txt-left txtIn40"><input type="radio" id="no215" name="no21" value="5" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no215">거의 안 느낀다.</label></td>
                        <td></td>
                        <td class="txt-left txtIn40 bRight-none"></td>
                    </tr>
                </tbody>
            </table>
            <table class="tbl2 mt5">
                <caption>대인관계변화척도</caption>
                <colgroup>
                    <col style="width: 10%;" />
                    <col style="width: 50%;" />
                    <col style="width: 10%;" />
                    <col style="width: 50%;" />
                </colgroup>
                <thead>
                    <tr>
                        <th scope="col" colspan="4" class="txt-left txtIn20 bgG bRight-none">22. 나는 나의 개인적인 관심사에 대하여 다른 사람들과</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1.</td>
                        <td class="txt-left txtIn40"><input type="radio" id="no221" name="no22" value="1" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no221">거의 나누지 않는다.</label></td>
                        <td>2.</td>
                        <td class="txt-left txtIn40 bRight-none"><input type="radio" id="no222" name="no22" value="2" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no222">약간 나누지 않는다.</label></td>
                    </tr>
                    <tr>
                        <td>3.</td>
                        <td class="txt-left txtIn40"><input type="radio" id="no223" name="no22" value="3" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no223">그저 그렇다.</label></td>
                        <td>4.</td>
                        <td class="txt-left txtIn40 bRight-none"><input type="radio" id="no224" name="no22" value="4" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no224">약간 나눈다.</label></td>
                    </tr>
                    <tr class="bBottom">
                        <td>5.</td>
                        <td class="txt-left txtIn40"><input type="radio" id="no225" name="no22" value="5" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no225">매우 나눈다.</label></td>
                        <td></td>
                        <td class="txt-left txtIn40 bRight-none"></td>
                    </tr>
                </tbody>
            </table>
            <table class="tbl2 mt5">
                <caption>대인관계변화척도</caption>
                <colgroup>
                    <col style="width: 10%;" />
                    <col style="width: 50%;" />
                    <col style="width: 10%;" />
                    <col style="width: 50%;" />
                </colgroup>
                <thead>
                    <tr>
                        <th scope="col" colspan="4" class="txt-left txtIn20 bgG bRight-none">
                            23. 다른 사람이 나에 대한 느낌을 표현할 경우 그것을 믿고 받아들이는 정도는
                        </th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1.</td>
                        <td class="txt-left txtIn40"><input type="radio" id="no231" name="no23" value="1" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no231">매우 적다.</label></td>
                        <td>2.</td>
                        <td class="txt-left txtIn40 bRight-none"><input type="radio" id="no232" name="no23" value="2" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no232">약간 적다.</label></td>
                    </tr>
                    <tr>
                        <td>3.</td>
                        <td class="txt-left txtIn40"><input type="radio" id="no233" name="no23" value="3" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no233">그저 그렇다.</label></td>
                        <td>4.</td>
                        <td class="txt-left txtIn40 bRight-none"><input type="radio" id="no234" name="no23" value="4" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no234">약간 많다.</label></td>
                    </tr>
                    <tr class="bBottom">
                        <td>5.</td>
                        <td class="txt-left txtIn40"><input type="radio" id="no235" name="no23" value="5" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no235">매우 많다.</label></td>
                        <td></td>
                        <td class="txt-left txtIn40 bRight-none"></td>
                    </tr>
                </tbody>
            </table>
            <table class="tbl2 mt5">
                <caption>대인관계변화척도</caption>
                <colgroup>
                    <col style="width: 10%;" />
                    <col style="width: 50%;" />
                    <col style="width: 10%;" />
                    <col style="width: 50%;" />
                </colgroup>
                <thead>
                    <tr>
                        <th scope="col" colspan="4" class="txt-left txtIn20 bgG bRight-none">
                            24. 다른 사람이 나에 대한 부정적인 느낌을 표현할 때 내가 건설적으로 대하는 정도
                        </th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1.</td>
                        <td class="txt-left txtIn40"><input type="radio" id="no241" name="no24" value="1" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no241">매우 적다.</label></td>
                        <td>2.</td>
                        <td class="txt-left txtIn40 bRight-none"><input type="radio" id="no242" name="no24" value="2" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no242">약간 적다.</label></td>
                    </tr>
                    <tr>
                        <td>3.</td>
                        <td class="txt-left txtIn40"><input type="radio" id="no243" name="no24" value="3" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no243">그저 그렇다.</label></td>
                        <td>4.</td>
                        <td class="txt-left txtIn40 bRight-none"><input type="radio" id="no244" name="no24" value="4" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no244">약간 많다.</label></td>
                    </tr>
                    <tr class="bBottom">
                        <td>5.</td>
                        <td class="txt-left txtIn40"><input type="radio" id="no245" name="no24" value="5" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no245">매우 많다.</label></td>
                        <td></td>
                        <td class="txt-left txtIn40 bRight-none"></td>
                    </tr>
                </tbody>
            </table>
            <table class="tbl2 mt5">
                <caption>대인관계변화척도</caption>
                <colgroup>
                    <col style="width: 10%;" />
                    <col style="width: 50%;" />
                    <col style="width: 10%;" />
                    <col style="width: 50%;" />
                </colgroup>
                <thead>
                    <tr>
                        <th scope="col" colspan="4" class="txt-left txtIn20 bgG bRight-none">25. 나는 다른 사람과 앞으로 대인관계를 어떻게 해야 할 지를</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1.</td>
                        <td class="txt-left txtIn40"><input type="radio" id="no251" name="no25" value="1" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no251">거의 이해하지 못한다.</label></td>
                        <td>2.</td>
                        <td class="txt-left txtIn40 bRight-none"><input type="radio" id="no252" name="no25" value="2" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no252">약간 이해하지 못한다.</label></td>
                    </tr>
                    <tr>
                        <td>3.</td>
                        <td class="txt-left txtIn40"><input type="radio" id="no253" name="no25" value="3" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no253">그저 그렇다.</label></td>
                        <td>4.</td>
                        <td class="txt-left txtIn40 bRight-none"><input type="radio" id="no254" name="no25" value="4" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no254">약간 잘 이해한다.</label></td>
                    </tr>
                    <tr class="bBottom">
                        <td>5.</td>
                        <td class="txt-left txtIn40"><input type="radio" id="no255" name="no25" value="5" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no255">매우 잘 이해한다.</label></td>
                        <td></td>
                        <td class="txt-left txtIn40 bRight-none"></td>
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