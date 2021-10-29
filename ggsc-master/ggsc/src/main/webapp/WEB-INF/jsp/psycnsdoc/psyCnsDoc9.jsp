<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
    <title>한국형 알코올 중독 선별 검사</title>
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
	.inp-checkbox {
		width: 95%;
		height: 20px;
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
                Case No. (20<input type="text" class="inp month" maxlength="2" name='no20'>)-(<input type="text" class="inp month" maxlength="2" name='no21'>)-(<input type="text" class="inp month" maxlength="2" name='no22'>)-(<input type="text" class="inp name" maxlength="5" name='no23'>)
            </div> -->
            <div class="box-title noto700 txt-center mt15 mb15">
                한국형 알코올 중독 선별 검사<br>
                <span class="fs24">(National Alcoholism Screening Test; NAST)</span>
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
                <caption>한국형알코올중독선별검사</caption>
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
                ※ 아래의 문항들을 읽고 자신에게 해당되는 문항에 ‘√’표 하세요.
            </div>
            <table class="tbl2 mt15">
                <caption>한국형알코올중독선별검사</caption>
                <colgroup>
                    <col style="width: 8%;" />
                    <col style="width: 60%;" />
                    <col style="width: 10%;" />
                </colgroup>
                <thead>
                    <tr>
                        <th scope="col" colspan="2">내&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;용</th>
                        <th scope="col" class="bRight-none">표시</th>
                    </tr>
                </thead>
                <tbody>
                    <tr class="bBottom2">
                        <td class="bRight-none">1.</td>
                        <td class="txt-left">자기연민에 잘 빠지며 술로 이를 해결하려 한다.</td>
                        <td class="bRight-none"><input type="checkbox" class="inp-checkbox" id="no1" name="no1" value="Y"></td>
                    </tr>
                    <tr class="bBottom2">
                        <td class="bRight-none">2.</td>
                        <td class="txt-left">혼자 술 마시는 것을 좋아한다.</td>
                        <td class="bRight-none"><input type="checkbox" class="inp-checkbox" id="no2" name="no2" value="Y"></td>
                    </tr>
                    <tr class="bBottom2">
                        <td class="bRight-none">3.</td>
                        <td class="txt-left">술 마신 다음 날 해장술을 마신다.</td>
                        <td class="bRight-none"><input type="checkbox" class="inp-checkbox" id="no3" name="no3" value="Y"></td>
                    </tr>
                    <tr class="bBottom2">
                        <td class="bRight-none">4.</td>
                        <td class="txt-left">취기가 오르면 술을 계속 마시고 싶은 생각이 지배적이다.</td>
                        <td class="bRight-none"><input type="checkbox" class="inp-checkbox" id="no4" name="no4" value="Y"></td>
                    </tr>
                    <tr class="bBottom2">
                        <td class="bRight-none">5.</td>
                        <td class="txt-left">술을 마시고 싶은 충동이 일어나면 거의 참을 수 없다.</td>
                        <td class="bRight-none"><input type="checkbox" class="inp-checkbox" id="no5" name="no5" value="Y"></td>
                    </tr>
                    <tr class="bBottom2">
                        <td class="bRight-none">6.</td>
                        <td class="txt-left">최근의 취중의 일을 기억하지 못하는 경우가 있다.
                            (최근 6개월 내 2회 이상).
                        </td>
                        <td class="bRight-none"><input type="checkbox" class="inp-checkbox" id="no6" name="no6" value="Y"></td>
                    </tr>
                    <tr class="bBottom2">
                        <td class="bRight-none">7.</td>
                        <td class="txt-left">대인관계나 사회생활에 술이 해로웠다고 느낀다.</td>
                        <td class="bRight-none"><input type="checkbox" class="inp-checkbox" id="no7" name="no7" value="Y"></td>
                    </tr>
                    <tr class="bBottom2">
                        <td class="bRight-none">8.</td>
                        <td class="txt-left">술로 인해 직업기능에 상당한 손상이 있다.</td>
                        <td class="bRight-none"><input type="checkbox" class="inp-checkbox" id="no8" name="no8" value="Y"></td>
                    </tr>
                    <tr class="bBottom2">
                        <td class="bRight-none">9.</td>
                        <td class="txt-left">술로 인해 배우자(보호자)가 나를 떠났거나 떠난다고 위협한다.</td>
                        <td class="bRight-none"><input type="checkbox" class="inp-checkbox" id="no9" name="no9" value="Y"></td>
                    </tr>
                    <tr class="bBottom2">
                        <td class="bRight-none">10.</td>
                        <td class="txt-left">술이 깨면 진땀, 손떨림, 불안이나 좌절 혹은 불면을 경험한다.</td>
                        <td class="bRight-none"><input type="checkbox" class="inp-checkbox" id="no10" name="no10" value="Y"></td>
                    </tr>
                    <tr class="bBottom2">
                        <td class="bRight-none">11.</td>
                        <td class="txt-left">술이 깨면서 공포나 몸이 심하게 떨리는 것을 경험하거나 혹은 헛것을 보거나 헛소리를 들은 적이 있다.</td>
                        <td class="bRight-none"><input type="checkbox" class="inp-checkbox" id="no11" name="no11" value="Y"></td>
                    </tr>
                    <tr class="bBottom">
                        <td class="bRight-none">12.</td>
                        <td class="txt-left">술로 인해 생긴 문제로 치료받은 적이 있다.</td>
                        <td class="bRight-none"><input type="checkbox" class="inp-checkbox" id="no12" name="no12" value="Y"></td>
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