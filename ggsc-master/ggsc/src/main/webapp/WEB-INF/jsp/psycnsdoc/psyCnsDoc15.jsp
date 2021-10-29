<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
    <title>문장완성검사</title>
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

    .txt {
        font-family: 'Noto Sans KR', sans-serif;
        color: #333333;
        font-size: 16px;
        border: 2px solid #333;
        padding: 10px;
        word-break: break-all;
    }

    .txt-box {
        font-family: 'Noto Sans KR', sans-serif;
        color: #333333;
        font-size: 16px;
        border-left: 2px solid #333;
        border-top: 2px solid #333;
        border-right: 2px solid #333;
        border-bottom: 1px solid #333;
    }

    .box1 {
        border-top: none;
        border-bottom: 1px solid #333;
    }

    .box2 {
        border-top: none;
        border-bottom: 2px solid #333;
    }

    .txt-left {
        text-align: left !important;
    }

    .q-box {
        width: 100%;
        padding: 30px;
    }

    .db {
        display: block;
    }

    textarea {
        width: 100%;
        height: 50px;
        font-family: 'Noto Sans KR', sans-serif;
        color: #333333;
        font-size: 16px;
        font-weight: 400;
        border: none;
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
                Case No. (20<input type="text" class="inp month" maxlength="2" name='no21'>)-(<input type="text" class="inp month" maxlength="2" name='no22'>)-(<input type="text" class="inp month" maxlength="2" name='no23'>)-(<input type="text" class="inp name" maxlength="5" name='no24'>)
            </div> -->
            <div class="box-title noto700 txt-center mt15 mb15">
                문장완성검사
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
                <caption>문장완성검사</caption>
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
                ※ 다음에 기술된 문장은 뒷부분이 빠져있습니다. 각 문장을 읽으면서 맨 먼저 떠오르는 생각으로 뒷부분을 이어 문장이 완성되도록 하면 됩니다. 시간의 제한은 없으나 가능한 신속히 하시고, 한 문항도 빠뜨리지 말고 하세요.
            </div>
            <div class="txt-box mt15">
                <div class="q-box">
                    <span class="db mb10">1. 나에게 이상한 일이 생겼을 때</span>
                    <span><textarea id="no1" name="no1"></textarea></span>
                </div>
            </div>
            <div class="txt-box box1">
                <div class="q-box">
                    <span class="db mb10">2. 내가 늘 원하기는</span>
                    <span><textarea id="no2" name="no2"></textarea></span>
                </div>
            </div>
            <div class="txt-box box1">
                <div class="q-box">
                    <span class="db mb10">3. 다른 가정과 비교해서 우리 집안은</span>
                    <span><textarea id="no3" name="no3"></textarea></span>
                </div>
            </div>
            <div class="txt-box box1">
                <div class="q-box">
                    <span class="db mb10">4. 무슨 일을 해서라도 잊고 싶은 것은</span>
                    <span><textarea id="no4" name="no4"></textarea></span>
                </div>
            </div>
            <div class="txt-box box1">
                <div class="q-box">
                    <span class="db mb10">5. 내가 정말 행복할 수 있으려면</span>
                    <span><textarea id="no5" name="no5"></textarea></span>
                </div>
            </div>
            <div class="txt-box box1">
                <div class="q-box">
                    <span class="db mb10">6. 내가 보는 나의 앞날은</span>
                    <span><textarea id="no6" name="no6"></textarea></span>
                </div>
            </div>
            <div class="txt-box box1">
                <div class="q-box">
                    <span class="db mb10">7. 내 생각에 남자들이란</span>
                    <span><textarea id="no7" name="no7"></textarea></span>
                </div>
            </div>
            <div class="txt-box box1">
                <div class="q-box">
                    <span class="db mb10">8. 결혼 생활에 대한 나의 생각은</span>
                    <span><textarea id="no8" name="no8"></textarea></span>
                </div>
            </div>
            <div class="txt-box box1">
                <div class="q-box">
                    <span class="db mb10">9. 우리 가족이 나에 대해서</span>
                    <span><textarea id="no9" name="no9"></textarea></span>
                </div>
            </div>
            <div class="txt-box box1">
                <div class="q-box">
                    <span class="db mb10">10. 다른 친구들이 모르는 나만의 두려움은</span>
                    <span><textarea id="no10" name="no10"></textarea></span>
                </div>
            </div>
            <div class="txt-box box1">
                <div class="q-box">
                    <span class="db mb10">11. 내 생각에 여자들이란</span>
                    <span><textarea id="no11" name="no11"></textarea></span>
                </div>
            </div>
            <div class="txt-box box1">
                <div class="q-box">
                    <span class="db mb10">12. 언젠가 나는</span>
                    <span><textarea id="no12" name="no12"></textarea></span>
                </div>
            </div>
            <div class="txt-box box1">
                <div class="q-box">
                    <span class="db mb10">13. 내가 저지른 가장 큰 잘못은</span>
                    <span><textarea id="no13" name="no13"></textarea></span>
                </div>
            </div>
            <div class="txt-box box1">
                <div class="q-box">
                    <span class="db mb10">14. 내가 믿고 있는 내 능력은</span>
                    <span><textarea id="no14" name="no14"></textarea></span>
                </div>
            </div>
            <div class="txt-box box1">
                <div class="q-box">
                    <span class="db mb10">15. 내가 제일 좋아하는 사람은</span>
                    <span><textarea id="no15" name="no15"></textarea></span>
                </div>
            </div>
            <div class="txt-box box1">
                <div class="q-box">
                    <span class="db mb10">16. 내가 다시(제일) 젊어진다면</span>
                    <span><textarea id="no16" name="no16"></textarea></span>
                </div>
            </div>
            <div class="txt-box box1">
                <div class="q-box">
                    <span class="db mb10">17. 나의 가장 큰 결점은</span>
                    <span><textarea id="no17" name="no17"></textarea></span>
                </div>
            </div>
            <div class="txt-box box1">
                <div class="q-box">
                    <span class="db mb10">18. 내가 잊고 싶은 두려움은</span>
                    <span><textarea id="no18" name="no18"></textarea></span>
                </div>
            </div>
            <div class="txt-box box1">
                <div class="q-box">
                    <span class="db mb10">19. 때때로 두려운 생각에 내가 휩싸일 때</span>
                    <span><textarea id="no19" name="no19"></textarea></span>
                </div>
            </div>
            <div class="txt-box box2">
                <div class="q-box">
                    <span class="db mb10">20. 나의 성생활은</span>
                    <span><textarea id="no20" name="no20"></textarea></span>
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
</html>