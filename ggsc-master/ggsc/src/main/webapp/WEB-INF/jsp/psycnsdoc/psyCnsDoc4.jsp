<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
    <title>노인우울척도(GDS-KR)</title>
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
                노인우울척도(GDS-KR)
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
                <caption>노인우울척도(GDS-KR)</caption>
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
                            <input type="text" class="inp" id="mobile" name="telNo" oninput="this.value = this.value.replace(/[^0-9]/g, '');" maxlength="20">
                        </td>
                        <th scope="col">검사일</th>
                        <td>
                            <input type="text" class="inp" id="datepicker1" name="writeDt" style="width: 80%;" readonly>
                        </td>
                    </tr>
                </tbody>
            </table>
            <div class="txt mt15">
                ※ 다음의 문항들을 자세히 읽어보시고 당신이 일상생활에서 느끼고 있는 바를 가장 잘 나타내 주는 문항은 ‘예’, 그렇지 않은 문항에는 ‘아니오’에 ‘√’표 해 주십시오.
            </div>
            <table class="tbl2 mt15">
                <caption>노인우울척도(GDS-KR)</caption>
                <colgroup>
                    <col style="width: 8%;" />
                    <col style="width: 60%;" />
                    <col style="width: 10%;" />
                    <col style="width: 10%;" />
                </colgroup>
                <thead>
                    <tr>
                        <th scope="col" colspan="2">내&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;용</th>
                        <th scope="col">예</th>
                        <th scope="col" class="bRight-none">아니요</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td class="bRight-none">1.</td>
                        <td class="txt-left">당신의 삶에 대체로 만족하십니까?</td>
                        <td><input type="radio" id="no11" name="no1" value="Y" /></td>
                        <td class="bRight-none"><input type="radio" id="no12" name="no1" value="N" /></td>	
                    </tr>
                    <tr>
                        <td class="bRight-none">2.</td>
                        <td class="txt-left">활동이나 관심거리가 많이 줄었습니까?</td>
                        <td><input type="radio" id="no21" name="no2" value="Y" /></td>
                        <td class="bRight-none"><input type="radio" id="no22" name="no2" value="N" /></td>
                    </tr>
                    <tr>
                        <td class="bRight-none">3.</td>
                        <td class="txt-left">삶이 공허하다고 느끼십니까?</td>
                        <td><input type="radio" id="no31" name="no3" value="Y" /></td>
                        <td class="bRight-none"><input type="radio" id="no32" name="no3" value="N" /></td>
                    </tr>
                    <tr>
                        <td class="bRight-none">4.</td>
                        <td class="txt-left">지루하거나 따분할 때가 많습니까?</td>
                        <td><input type="radio" id="no41" name="no4" value="Y" /></td>
                        <td class="bRight-none"><input type="radio" id="no42" name="no4" value="N" /></td>
                    </tr>
                    <tr class="bBottom2">
                        <td class="bRight-none">5.</td>
                        <td class="txt-left">앞날이 희망적이라고 생각하십니까?</td>
                        <td><input type="radio" id="no51" name="no5" value="Y" /></td>
                        <td class="bRight-none"><input type="radio" id="no52" name="no5" value="N" /></td>
                    </tr>
                    <tr>
                        <td class="bRight-none">6.</td>
                        <td class="txt-left">떨쳐버릴 수 없는 생각들 때문에 괴롭습니까?</td>
                        <td><input type="radio" id="no61" name="no6" value="Y" /></td>
                        <td class="bRight-none"><input type="radio" id="no62" name="no6" value="N" /></td>
                    </tr>
                    <tr>
                        <td class="bRight-none">7.</td>
                        <td class="txt-left">대체로 활기차게 사시는 편입니까?</td>
                        <td><input type="radio" id="no71" name="no7" value="Y" /></td>
                        <td class="bRight-none"><input type="radio" id="no72" name="no7" value="N" /></td>
                    </tr>
                    <tr>
                        <td class="bRight-none">8.</td>
                        <td class="txt-left">당신에게 좋지 않은 일이 생길 것 같아 걱정스럽습니까?</td>
                        <td><input type="radio" id="no81" name="no8" value="Y" /></td>
                        <td class="bRight-none"><input type="radio" id="no82" name="no8" value="N" /></td>
                    </tr>
                    <tr>
                        <td class="bRight-none">9.</td>
                        <td class="txt-left">대체로 행복하다고 느끼십니까?</td>
                        <td><input type="radio" id="no91" name="no9" value="Y" /></td>
                        <td class="bRight-none"><input type="radio" id="no92" name="no9" value="N" /></td>
                    </tr>
                    <tr class="bBottom">
                        <td class="bRight-none">10.</td>
                        <td class="txt-left">아무것도 할 수 없을 것 같은 무력감이 자주 듭니까?</td>
                        <td><input type="radio" id="no101" name="no10" value="Y" /></td>
                        <td class="bRight-none"><input type="radio" id="no102" name="no10" value="N" /></td>
                    </tr>
                    <tr>
                        <td class="bRight-none">11.</td>
                        <td class="txt-left">불안해지거나 안절부절 못 할 때가 자주 있습니까?</td>
                        <td><input type="radio" id="no111" name="no11" value="Y" /></td>
                        <td class="bRight-none"><input type="radio" id="no112" name="no11" value="N" /></td>
                    </tr>
                    <tr>
                        <td class="bRight-none">12.</td>
                        <td class="txt-left">바깥에 나가는 것보다 그냥 집에 있는 것이 더 좋습니까?</td>
                        <td><input type="radio" id="no121" name="no12" value="Y" /></td>
                        <td class="bRight-none"><input type="radio" id="no122" name="no12" value="N" /></td>
                    </tr>
                    <tr>
                        <td class="bRight-none">13.</td>
                        <td class="txt-left">앞날에 대한 걱정을 자주 하십니까?</td>
                        <td><input type="radio" id="no131" name="no13" value="Y" /></td>
                        <td class="bRight-none"><input type="radio" id="no132" name="no13" value="N" /></td>
                    </tr>
                    <tr>
                        <td class="bRight-none">14.</td>
                        <td class="txt-left">다른 사람들보다 기억력에 문제가 더 많다고 생각하십니까?</td>
                        <td><input type="radio" id="no141" name="no14" value="Y" /></td>
                        <td class="bRight-none"><input type="radio" id="no142" name="no14" value="N" /></td>
                    </tr>
                    <tr class="bBottom2">
                        <td class="bRight-none">15.</td>
                        <td class="txt-left">살아 있다는 사실이 기쁘고 즐겁습니까?</td>
                        <td><input type="radio" id="no151" name="no15" value="Y" /></td>
                        <td class="bRight-none"><input type="radio" id="no152" name="no15" value="N" /></td>
                    </tr>
                    <tr>
                        <td class="bRight-none">16.</td>
                        <td class="txt-left">기분이 가라앉거나 우울해질 때가 자주 있습니까?</td>
                        <td><input type="radio" id="no161" name="no16" value="Y" /></td>
                        <td class="bRight-none"><input type="radio" id="no162" name="no16" value="N" /></td>
                    </tr>
                    <tr>
                        <td class="bRight-none">17.</td>
                        <td class="txt-left">요즘 자신이 아무 쓸모없는 사람처럼 느껴지십니까?</td>
                        <td><input type="radio" id="no171" name="no17" value="Y" /></td>
                        <td class="bRight-none"><input type="radio" id="no172" name="no17" value="N" /></td>
                    </tr>
                    <tr>
                        <td class="bRight-none">18.</td>
                        <td class="txt-left">지난 일에 대해 걱정을 많이 하십니까?</td>
                        <td><input type="radio" id="no181" name="no18" value="Y" /></td>
                        <td class="bRight-none"><input type="radio" id="no182" name="no18" value="N" /></td>
                    </tr>
                    <tr>
                        <td class="bRight-none">19.</td>
                        <td class="txt-left">산다는 것이 매우 신나고 즐겁습니까?</td>
                        <td><input type="radio" id="no191" name="no19" value="Y" /></td>
                        <td class="bRight-none"><input type="radio" id="no192" name="no19" value="N" /></td>
                    </tr>
                    <tr class="bBottom">
                        <td class="bRight-none">20.</td>
                        <td class="txt-left">새로운 일을 시작하는 것이 어렵습니까?</td>
                        <td><input type="radio" id="no201" name="no20" value="Y" /></td>
                        <td class="bRight-none"><input type="radio" id="no202" name="no20" value="N" /></td>
                    </tr>
                    <tr>
                        <td class="bRight-none">21.</td>
                        <td class="txt-left">생활에 활력이 넘치십니까?</td>
                        <td><input type="radio" id="no211" name="no21" value="Y" /></td>
                        <td class="bRight-none"><input type="radio" id="no212" name="no21" value="N" /></td>
                    </tr>
                    <tr>
                        <td class="bRight-none">22.</td>
                        <td class="txt-left">당신의 처지가 절망적이라고 느끼십니까?</td>
                        <td><input type="radio" id="no222" name="no22" value="Y" /></td>
                        <td class="bRight-none"><input type="radio" id="no222" name="no22" value="N" /></td>
                    </tr>
                    <tr>
                        <td class="bRight-none">23.</td>
                        <td class="txt-left">다른 사람들이 대체로 당신보다 낫다고 느끼십니까?</td>
                        <td><input type="radio" id="no231" name="no23" value="Y" /></td>
                        <td class="bRight-none"><input type="radio" id="no232" name="no23" value="N" /></td>
                    </tr>
                    <tr>
                        <td class="bRight-none">24.</td>
                        <td class="txt-left">사소한 일에도 속상할 때가 많습니까?</td>
                        <td><input type="radio" id="no241" name="no24" value="Y" /></td>
                        <td class="bRight-none"><input type="radio" id="no242" name="no24" value="N" /></td>
                    </tr>
                    <tr class="bBottom2">
                        <td class="bRight-none">25.</td>
                        <td class="txt-left">울고 싶을 때가 자주 있습니까?</td>
                        <td><input type="radio" id="no251" name="no25" value="Y" /></td>
                        <td class="bRight-none"><input type="radio" id="no252" name="no25" value="N" /></td>
                    </tr>
                    <tr>
                        <td class="bRight-none">26.</td>
                        <td class="txt-left">집중하기가 어렵습니까?</td>
                        <td><input type="radio" id="no261" name="no26" value="Y" /></td>
                        <td class="bRight-none"><input type="radio" id="no262" name="no26" value="N" /></td>
                    </tr>
                    <tr>
                        <td class="bRight-none">27.</td>
                        <td class="txt-left">아침에 기분 좋게 일어나십니까?</td>
                        <td><input type="radio" id="no271" name="no27" value="Y" /></td>
                        <td class="bRight-none"><input type="radio" id="no272" name="no27" value="N" /></td>
                    </tr>
                    <tr>
                        <td class="bRight-none">28.</td>
                        <td class="txt-left">사람들과 어울리는 자리를 피하는 편이십니까?</td>
                        <td><input type="radio" id="no281" name="no28" value="Y" /></td>
                        <td class="bRight-none"><input type="radio" id="no282" name="no28" value="N" /></td>
                    </tr>
                    <tr>
                        <td class="bRight-none">29.</td>
                        <td class="txt-left">쉽게 결정하는 편이십니까?</td>
                        <td><input type="radio" id="no291" name="no29" value="Y" /></td>
                        <td class="bRight-none"><input type="radio" id="no292" name="no29" value="N" /></td>
                    </tr>
                    <tr class="bBottom">
                        <td class="bRight-none">30.</td>
                        <td class="txt-left">예전처럼 정신이 맑습니까?</td>
                        <td><input type="radio" id="no301" name="no30" value="Y" /></td>
                        <td class="bRight-none"><input type="radio" id="no302" name="no30" value="N" /></td>
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