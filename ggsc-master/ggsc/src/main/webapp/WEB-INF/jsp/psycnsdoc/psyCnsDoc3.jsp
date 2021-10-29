<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
    <title>죽음·학대 질문지</title>
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
	$(document).ready(function() {
	  	var msg = "${msg}";
	  	if(msg.length > 0) {
	  		alert(msg);
	  		window.close();
	  	}
	});
	
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
	  	var cnsleNm = $("#cnsleNm").val();
	  	if(cnsleNm == "") {
	  		$("#sBtn").css("display","none");
	  		$("#uBtn").css("display","");
	  	} else {
	  		$("#sBtn").css("display","");
	  		$("#uBtn").css("display","none");
	  	}
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
	
	function fn_reg(param){
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
		
		if(param == "S") {
			if(confirm("등록 하시겠습니까?")){
				/* var psycRstMmseds = $("#psycRstMmseds").val();
				if(psycRstMmseds == "") {
					$("#psycRstMmseds").val(0);
				} */
				/* var year = $("#year").val();
				var year2 = $("#year2").val();
				var month = $("#month").val();
				var month2 = $("#month2").val();
				var day = $("#day").val();
				var day2 = $("#day2").val();
				
				$("#cnsStrtDt").val("20"+year+month+day);
				$("#cnsEndDt").val("20"+year2+month2+day2); */
				
				document.frm.action = "/gnoincoundb/psyCnsDocReg.do?save="+ param;
		       	document.frm.submit();
			}
		} else {
			if(confirm("수정 하시겠습니까?")){
				// var strNum = "$detail.num";
		  		// var param = parseInt(strNum);
		  		/* var psycRstMmseds = $("#psycRstMmseds").val();
				if(psycRstMmseds == "") {
					$("#psycRstMmseds").val(0);
				} */
				document.frm.action = "/gnoincoundb/psyCnsDocReg.do?save="+ param;
		       	document.frm.submit();
			}
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
        	<input type='hidden' name='g_idx' value='${param.gIdx}' />
        	<input type='hidden' name='dtl_idx' value='${param.dtlIdx}' />
        	<input type='hidden' name='psy_idx' value='${param.psyNum}' />
        	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        	<input type="hidden" id="examDocCd" name="examDocCd" value="${vo.examDocCd }" />
			<input type="hidden" id="examDocNm" name="examDocNm" value="${vo.examDocNm }" />
			<input type="hidden" id="cnsDtlGbCd" name="cnsDtlGbCd" value="1" />
			<input type="hidden" id="cnsCnt" name="cnsCnt" value="3"/>
			<input type="hidden" id="cnsleId" name="cnsleId" />
			<input type="hidden" id="caseNo" name="caseNo" />
			<input type="hidden" id="cnsGb"  />
			<input type="hidden" id="cnsGbCd" name="cnsGb" />
			
            <!-- <div class="headName noto500 mt80">
                Case No. (20<input type="text" class="inp month2" maxlength="2">)-(<input type="text" class="inp month2" maxlength="2">)-(<input type="text" class="inp month2" maxlength="2">)-(<input type="text" class="inp name2" maxlength="5">)
            </div> -->
            <div class="box-title noto700 txt-center mt15 mb15">
                죽음·학대 질문지
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
                            <label for="genderM" style="margin-right: 5px;">남</label><input type="radio" id="genderM" name="no9" value="M" /> /
                            <label for="genderF" style="margin-right: 5px;">여</label><input type="radio" id="genderF" name="no9" value="F" />
                        </td>
                        <th scope="col">검사일</th>
                        <td>
                            <input type="text" class="inp" id="datepicker1" name="writeDt" style="width: 80%;" readonly>
                        </td>
                    </tr>
                    <tr>
                        <th scope="col">나&nbsp;&nbsp;이</th>
                        <td>
                            <input type="text" class="inp" id="age" name="no10" oninput="this.value = this.value.replace(/[^0-9]/g, '');" maxlength="3">
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
                <caption>죽음·학대 질문지</caption>
                <colgroup>
                    <col style="width: 8%;" />
                    <col style="width: 60%;" />
                    <col style="width: 10%;" />
                    <col style="width: 10%;" />
                </colgroup>
                <thead>
                    <tr>
                        <th scope="col" colspan="2">내&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;용</th>
                        <th scope="col">그렇다</th>
                        <th scope="col" class="bRight-none">아니다</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td class="bRight-none">1.</td>
                        <td class="txt-left">나는 살 가치가 없다.</td>
                        <td><input type="radio" id="no11" name="no1" value="Y" /></td>
                        <td class="bRight-none"><input type="radio" id="no11" name="no1" value="N" /></td>
                    </tr>
                    <tr>
                        <td class="bRight-none">2.</td>
                        <td class="txt-left">더 이상 살고 싶지 않다.</td>
                        <td><input type="radio" id="no21" name="no2" value="Y" /></td>
                        <td class="bRight-none"><input type="radio" id="no22" name="no2" value="N" /></td>
                    </tr>
                    <tr>
                        <td class="bRight-none">3.</td>
                        <td class="txt-left">자살은 아니지만 죽을 수 있다면 죽고 싶다.</td>
                        <td><input type="radio" id="no31" name="no3" value="Y" /></td>
                        <td class="bRight-none"><input type="radio" id="no32" name="no3" value="N" /></td>
                    </tr>
                    <tr>
                        <td class="bRight-none">4.</td>
                        <td class="txt-left">상황이 나빠지면 자살할 수도 있다.</td>
                        <td><input type="radio" id="no41" name="no4" value="Y" /></td>
                        <td class="bRight-none"><input type="radio" id="no42" name="no4" value="N" /></td>
                    </tr>
                    <tr>
                        <td class="bRight-none">5.</td>
                        <td class="txt-left">아무도 관심을 갖지 않아, 방치되어 있다.</td>
                        <td><input type="radio" id="no51" name="no5" value="Y" /></td>
                        <td class="bRight-none"><input type="radio" id="no52" name="no5" value="N" /></td>
                    </tr>
                    <tr>
                        <td class="bRight-none">6.</td>
                        <td class="txt-left">가끔 무시당하거나 두려움을 느끼는 상황에 처한다.</td>
                        <td><input type="radio" id="no61" name="no6" value="Y" /></td>
                        <td class="bRight-none"><input type="radio" id="no62" name="no6" value="N" /></td>
                    </tr>
                    <tr>
                        <td class="bRight-none">7.</td>
                        <td class="txt-left">경제적인 학대를 경험하고 있다.</td>
                        <td><input type="radio" id="no71" name="no7" value="Y" /></td>
                        <td class="bRight-none"><input type="radio" id="no72" name="no7" value="N" /></td>
                    </tr>
                    <tr class="bBottom">
                        <td class="bRight-none">8.</td>
                        <td class="txt-left">신체적인 학대를 경험하고 있다.</td>
                        <td><input type="radio" id="no81" name="no8" value="Y" /></td>
                        <td class="bRight-none"><input type="radio" id="no82" name="no8" value="N" /></td>
                    </tr>
                </tbody>
            </table>
            <table class="tbl mt15">
                <caption>죽음·학대 질문지</caption>
                <colgroup>
                    <col style="width: 8%;" />
                    <col style="width: 10%;" />
                    <col style="width: 8%;" />
                    <col style="width: 10%;" />
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="col">2단계 질문지 해당여부</th>
                        <td>
                        	<label for="queYn1" style="margin-right: 5px;">O</label><input type="radio" id="queYn1" name="no11" value="Y" /> /
                        	<label for="queYn2" style="margin-right: 5px;">X</label><input type="radio" id="queYn2" name="no11" value="N" />
                        </td>
                        <th scope="col">다음상담 예약일</th>
                        <td>
                            <input type="text" class="inp" id="datepicker2" name="no12" style="width: 80%;" readonly>
                        </td>
                    </tr>
                </tbody>
            </table>
            </form>
            <div class="btn" style="text-align: right; display: block; margin-top: 15px;">
            	<button type="button" class="btn-basic" onclick="window.close();" style="background-color:#fc692f;color:white;">닫기</button>
				<button type="button" class="btn-basic" id="uBtn" onclick="javascript:fn_reg('U');" style="background-color:#fc692f;color:white;">수정</button>
				<button type="button" class="btn-basic" id="sBtn" onclick="javascript:fn_reg('S');" style="background-color:#fc692f;color:white;">저장</button>
			</div>
        </div>
    </div>

</body>
</html>