<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
    <title>노인 우울 및 자살사고 척도(GDS-SI)</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
    <meta name="_csrf" th:content="${_csrf.token}"/>
	<meta name="_csrf_header" th:content="${_csrf.headerName}"/>
    <link href="/gnoincoundb/css/psyDocument/common.css" rel="stylesheet">
    <script src="/gnoincoundb/js/jquery/jquery-1.11.2.min.js"></script>
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
		if(cnsleNm.length == 0) {
			alert("내담자를 선택해주세요.");
			$("#cnsleNm").focus();
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
        font-family: 'Noto Sans KR', sans-serif;
        color: #333333;
        font-size: 16px;
        position: relative;
        top: 0px;
        font-weight: 500;
        width: 95%;
    }

    .headName {
        font-size: 16px;
        border: 2px solid #333;
        border-radius: 5px;
        width: 282px;
        padding: 0px 10px 0px 10px;
    }

    .tbl>tbody>tr {
        font-size: 16px;
        height: 30px;
        font-weight: 500;
    }

    .tbl>tbody>tr>th {
        border: 1px solid #333;
    }

    .tbl>thead>tr {
        height: 30px;
    }

    .tbl>thead>tr>th {
        font-size: 16px;
        border: 1px solid #333;
    }

    .tbl-title {
        font-family: 'Noto Sans KR', sans-serif;
        color: #333333;
        font-size: 18px;
        font-weight: 500;
    }

    .month {
        width: 20px;
        top: -3px;
    }

    .num {
        width: 20px;
        top: -2px;
    }

    .name {
        width: 45px;
        top: -3px;
    }

    .bgG {
        background-color: #D6D6D6;
    }

	.btn-basic {
    	padding: 5px;
    }

</style>

<body>
    <div class="doc-wrap">
    	<form id="frm" name="frm" method="post">
    	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        <!-- <div class="headName noto500">
            Case No. (20<input type="text" class="inp month" maxlength="2" name='no23'>)-(<input type="text" class="inp month" maxlength="2" name='no24'>)-(<input type="text" class="inp month" maxlength="2" name='no25'>)-(<input type="text" class="inp name" maxlength="5" name='no26'>)
        </div> -->
        <div class="doc-box mt20">
            <div class="box-title noto700 txt-center mt15 mb15">노인 우울 및 자살사고 척도(GDS-SI)</div>
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
                <caption>노인우울및자살사고척도</caption>
                <colgroup>
                    <col style="width: 8%;" />
                    <col style="width: 10%;" />
                    <col style="width: 8%;" />
                    <col style="width: 10%;" />
                    <col style="width: 8%;" />
                    <col style="width: 10%;" />
                    <col style="width: 8%;" />
                    <col style="width: 10%;" />
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="col">이름</th>
                        <td>
                            <input type="text" class="inp txt-center" id="cnsleNm" name="cnsleNm" style="width: 65%;"><button type="button" class="btn-basic" style="padding: 2px 6px;background: skyblue;" onclick="javascript:findUserPopup();">찾기</button>
                        </td>
                        <th scope="col">성별</th>
                        <td>
                            <label for="genderM" style="margin-right: 5px;">남</label><input type="radio" id="genderM" name="no20" value="M" /> /
                            <label for="genderF" style="margin-right: 5px;">여</label><input type="radio" id="genderF" name="no20" value="F" />
                        </td>
                        <th scope="col">나이</th>
                        <td>
                            <input type="text" class="inp txt-center" id="age" name="no21" oninput="this.value = this.value.replace(/[^0-9]/g, '');">
                        </td>
                        <th scope="col">연락처</th>
                        <td>
                            <input type="text" class="inp txt-center" id="mobile" name="telNo" oninput="this.value = this.value.replace(/[^0-9]/g, '');">
                        </td>
                    </tr>
                </tbody>
            </table>
            <div class="tbl-title mt20">
                ◉ 단축형노인우울척도(S-GDS)
            </div>
            <table class="tbl mt10">
                <caption>노인상담선별척도지</caption>
                <colgroup>
                    <col style="width: 5%;" />
                    <col style="width: 60%;" />
                    <col style="width: 10%;" />
                    <col style="width: 10%;" />
                </colgroup>
                <thead>
                    <tr>
                        <th scope="col"></th>
                        <th scope="col">지난 한 주 동안의 느낌</th>
                        <th scope="col">예</th>
                        <th scope="col">아니요</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1</td>
                        <td class="txt-left">현재의 생활에 대체적으로 만족하십니까?</td>
                        <td><input type="radio" class="radBtn" id="no11" name="no1" value="Y" /></td>
                        <td class="bRight-none"><input type="radio" class="radBtn2" id="no12" name="no1" value="N" /></td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td class="txt-left">요즈음 들어 활동량이나 의욕이 많이 떨어지셨습니까?</td>
                        <td><input type="radio" class="radBtn" id="no21" name="no2" value="Y" /></td>
                        <td class="bRight-none"><input type="radio" class="radBtn2" id="no22" name="no2" value="N" /></td>
                    </tr>
                    <tr>
                        <td class="bgG">3</td>
                        <td class="txt-left">자신이 헛되이 살고 있다고 느끼십니까?</td>
                        <td><input type="radio" class="radBtn" id="no31" name="no3" value="Y" /></td>
                        <td class="bRight-none"><input type="radio" class="radBtn2" id="no32" name="no3" value="N" /></td>
                    </tr>
                    <tr>
                        <td>4</td>
                        <td class="txt-left">생활이 지루하게 느껴질 때가 많습니까?</td>
                        <td><input type="radio" class="radBtn" id="no41" name="no4" value="Y" /></td>
                        <td class="bRight-none"><input type="radio" class="radBtn2" id="no42" name="no4" value="N" /></td>
                    </tr>
                    <tr>
                        <td>5</td>
                        <td class="txt-left">평소에 기분은 상쾌한 편이십니까?</td>
                        <td><input type="radio" class="radBtn" id="no51" name="no5" value="Y" /></td>
                        <td class="bRight-none"><input type="radio" class="radBtn2" id="no52" name="no5" value="N" /></td>
                    </tr>
                    <tr>
                        <td class="bgG">6</td>
                        <td class="txt-left">자신에게 불길한 일이 닥칠 것 같아 불안하십니까?</td>
                        <td><input type="radio" class="radBtn" id="no61" name="no6" value="Y" /></td>
                        <td class="bRight-none"><input type="radio" class="radBtn2" id="no62" name="no6" value="N" /></td>
                    </tr>
                    <tr>
                        <td>7</td>
                        <td class="txt-left">대체로 마음이 즐거운 편이십니까?</td>
                        <td><input type="radio" class="radBtn" id="no71" name="no7" value="Y" /></td>
                        <td class="bRight-none"><input type="radio" class="radBtn2" id="no72" name="no7" value="N" /></td>
                    </tr>
                    <tr>
                        <td>8</td>
                        <td class="txt-left">절망적이라는 느낌이 자주 드십니까?</td>
                        <td><input type="radio" class="radBtn" id="no81" name="no8" value="Y" /></td>
                        <td class="bRight-none"><input type="radio" class="radBtn2" id="no82" name="no8" value="N" /></td>
                    </tr>
                    <tr>
                        <td>9</td>
                        <td class="txt-left">바깥에 나가기가 싫고 집에만 있고 싶습니까?</td>
                        <td><input type="radio" class="radBtn" id="no91" name="no9" value="Y" /></td>
                        <td class="bRight-none"><input type="radio" class="radBtn2" id="no92" name="no9" value="N" /></td>
                    </tr>
                    <tr>
                        <td>10</td>
                        <td class="txt-left">비슷한 나이의 다른 노인들 보다 기억력이 더 나쁘다고 느끼십니까?</td>
                        <td><input type="radio" class="radBtn" id="no101" name="no10" value="Y" /></td>
                        <td class="bRight-none"><input type="radio" class="radBtn2" id="no102" name="no10" value="N" /></td>
                    </tr>
                    <tr>
                        <td class="bgG">11</td>
                        <td class="txt-left">현재 살아 있다는 것이 즐겁게 생각되십니까?</td>
                        <td><input type="radio" class="radBtn" id="no111" name="no11" value="Y" /></td>
                        <td class="bRight-none"><input type="radio" class="radBtn2" id="no112" name="no11" value="N" /></td>
                    </tr>
                    <tr>
                        <td class="bgG">12</td>
                        <td class="txt-left">지금의 내 자신이 아무 쓸모없는 사람이라고 느끼십니까?</td>
                        <td><input type="radio" class="radBtn" id="no121" name="no12" value="Y" /></td>
                        <td class="bRight-none"><input type="radio" class="radBtn2" id="no122" name="no12" value="N" /></td>
                    </tr>
                    <tr>
                        <td>13</td>
                        <td class="txt-left">기력이 좋은 편이십니까?</td>
                        <td><input type="radio" class="radBtn" id="no131" name="no13" value="Y" /></td>
                        <td class="bRight-none"><input type="radio" class="radBtn2" id="no132" name="no13" value="N" /></td>
                    </tr>
                    <tr>
                        <td class="bgG">14</td>
                        <td class="txt-left">지금 자신의 처지가 아무런 희망도 없다고 느끼십니까?</td>
                        <td><input type="radio" class="radBtn" id="no141" name="no14" value="Y" /></td>
                        <td class="bRight-none"><input type="radio" class="radBtn2" class="radBtn2" id="no142" name="no14" value="N" /></td>
                    </tr>
                    <tr>
                        <td>15</td>
                        <td class="txt-left">자신이 다른 사람들의 처지보다 더 못하다고 생각하십니까?</td>
                        <td><input type="radio" class="radBtn" id="no151" name="no15" value="Y" /></td>
                        <td class="bRight-none"><input type="radio" class="radBtn2" id="no152" name="no15" value="N" /></td>
                    </tr>
                    <tr>
                        <td colspan="2">총점</td>
                        <td colspan="2"><input type="text" class="inp num txt-center" id="sumCnt" name="no22"  maxlength="2" readonly> / 15</td>
                    </tr>
                </tbody>
            </table>
            <div class="tbl-title mt30">
                ◉ 자살사고
            </div>
            <table class="tbl mt10">
                <caption>노인상담선별척도지</caption>
                <colgroup>
                    <col style="width: 5%;" />
                    <col style="width: 55%;" />
                    <col style="width: 10%;" />
                    <col style="width: 10%;" />
                    <col style="width: 10%;" />
                    <col style="width: 10%;" />
                </colgroup>
                <thead>
                    <tr>
                        <th scope="col"></th>
                        <th scope="col">질문사항</th>
                        <th scope="col">전혀 없다</th>
                        <th scope="col">한두번 있다</th>
                        <th scope="col">가끔있다</th>
                        <th scope="col">자주 있다</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1</td>
                        <td class="txt-left">과거에 스스로 목숨을 끊으려고 시도한 적이 있다</td>
                        <td><input type="radio" class="inp txt-center" id="no161" name="no16" value="1" /></td>
                        <td><input type="radio" class="inp txt-center" id="no162" name="no16" value="2" /></td>
                        <td><input type="radio" class="inp txt-center" id="no163" name="no16" value="3" /></td>
                        <td><input type="radio" class="inp txt-center" id="no164" name="no16" value="4" /></td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td class="txt-left">최근에 스스로 목숨을 끊고 싶다는 생각을 해 본 적이 있다</td>
                        <td><input type="radio" class="inp txt-center" id="no171" name="no17" value="1" /></td>
                        <td><input type="radio" class="inp txt-center" id="no172" name="no17" value="2" /></td>
                        <td><input type="radio" class="inp txt-center" id="no173" name="no17" value="3" /></td>
                        <td><input type="radio" class="inp txt-center" id="no174" name="no17" value="4" /></td>
                    </tr>
                    <tr>
                        <td>3</td>
                        <td class="txt-left">누군가에게 죽고 싶다는 말을 해 본 적이 있다</td>
                        <td><input type="radio" class="inp txt-center" id="no181" name="no18" value="1" /></td>
                        <td><input type="radio" class="inp txt-center" id="no182" name="no18" value="2" /></td>
                        <td><input type="radio" class="inp txt-center" id="no183" name="no18" value="3" /></td>
                        <td><input type="radio" class="inp txt-center" id="no184" name="no18" value="4" /></td>
                    </tr>
                    <tr>
                        <td>4</td>
                        <td class="txt-left">최근 들어 스스로 목숨을 끊고 싶다는 생각이 들었다면 구체적인 방법까지 계획했다</td>
                        <td colspan="4">
                            예(<input type="radio" class="inp month txt-center" id="no191" name="no19" value="1" />)&nbsp;&nbsp;&nbsp;&nbsp;
                            아니오(<input type="radio" class="inp month txt-center" id="no192" name="no19" value="2" />)
                        </td>
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
<script>
	$(".radBtn, .radBtn2").change(function(e) {
		var y = $(".radBtn:checked").length, n= $(".radBtn2:checked").length;
		$("#sumCnt").val(y);
	});
</script>
</html>