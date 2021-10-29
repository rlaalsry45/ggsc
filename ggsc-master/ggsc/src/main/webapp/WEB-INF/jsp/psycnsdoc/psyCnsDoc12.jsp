<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
    <title>사별 스트레스 척도</title>
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
                Case No. (20<input type="text" class="inp month" maxlength="2" name='no20'>)-(<input type="text" class="inp month" maxlength="2" name='no21'>)-(<input type="text" class="inp month" maxlength="2" name='no22'>)-(<input type="text" class="inp name" maxlength="5" name='no23'>)
            </div> -->
            <div class="box-title noto700 txt-center mt15 mb15">
                사별 스트레스 척도
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
                <caption>사별스트레스척도</caption>
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
                ※ 다음은 어르신께서 배우자와 사별하고 혼자 살면서 경험할 수 있는 여러 가지 스트레스에 관한 질문입니다. 잘 읽고 해당되는 곳에 ‘√’표시 해 주시길 바랍니다.
            </div>
            <table class="tbl2 mt15">
                <caption>사별스트레스척도</caption>
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
                        <th scope="col">그렇지<br>않다</th>
                        <th scope="col">보통<br>이다</th>
                        <th scope="col">그렇다</th>
                        <th scope="col" class="bRight-none">매우<br>그렇다</th>
                    </tr>
                </thead>
                <tbody>
                    <tr class="bBottom2">
                        <td class="bRight-none">1.</td>
                        <td class="txt-left">배우자가 없어서 외롭다고 느낄 때가 많다.</td>
                        <td><input type="radio" id="no11" name="no1" value="1" /></td>
                        <td><input type="radio" id="no12" name="no1" value="2" /></td>
                        <td><input type="radio" id="no13" name="no1" value="3" /></td>
                        <td><input type="radio" id="no14" name="no1" value="4" /></td>
                        <td class="bRight-none"><input type="radio" id="no15" name="no1" value="5" /></td>
                    </tr>
                    <tr class="bBottom2">
                        <td class="bRight-none">2.</td>
                        <td class="txt-left">부부동반 모임에 가야할 때 어려움을 느낀다.</td>
                        <td><input type="radio" id="no21" name="no2" value="1" /></td>
                        <td><input type="radio" id="no22" name="no2" value="2" /></td>
                        <td><input type="radio" id="no23" name="no2" value="3" /></td>
                        <td><input type="radio" id="no24" name="no2" value="4" /></td>
                        <td class="bRight-none"><input type="radio" id="no25" name="no2" value="5" /></td>
                    </tr>
                    <tr class="bBottom2">
                        <td class="bRight-none">3.</td>
                        <td class="txt-left">배우자와 사별하고 경제적으로 어려웠다.</td>
                        <td><input type="radio" id="no31" name="no3" value="1" /></td>
                        <td><input type="radio" id="no32" name="no3" value="2" /></td>
                        <td><input type="radio" id="no33" name="no3" value="3" /></td>
                        <td><input type="radio" id="no34" name="no3" value="4" /></td>
                        <td class="bRight-none"><input type="radio" id="no35" name="no3" value="5" /></td>
                    </tr>
                    <tr class="bBottom2">
                        <td class="bRight-none">4.</td>
                        <td class="txt-left">중요한 결정을 할 때 상의할 대상이 없어서 힘들다.</td>
                        <td><input type="radio" id="no41" name="no4" value="1" /></td>
                        <td><input type="radio" id="no42" name="no4" value="2" /></td>
                        <td><input type="radio" id="no43" name="no4" value="3" /></td>
                        <td><input type="radio" id="no44" name="no4" value="4" /></td>
                        <td class="bRight-none"><input type="radio" id="no45" name="no4" value="5" /></td>
                    </tr>
                    <tr class="bBottom">
                        <td class="bRight-none">5.</td>
                        <td class="txt-left">혼자 있어서 자주 쓸쓸한 마음이 든다.</td>
                        <td><input type="radio" id="no51" name="no5" value="1" /></td>
                        <td><input type="radio" id="no52" name="no5" value="2" /></td>
                        <td><input type="radio" id="no53" name="no5" value="3" /></td>
                        <td><input type="radio" id="no54" name="no5" value="4" /></td>
                        <td class="bRight-none"><input type="radio" id="no55" name="no5" value="5" /></td>
                    </tr>
                    <tr class="bBottom2">
                        <td class="bRight-none">6.</td>
                        <td class="txt-left">혼자라고 무시하는 눈초리가 느껴진다.</td>
                        <td><input type="radio" id="no61" name="no6" value="1" /></td>
                        <td><input type="radio" id="no62" name="no6" value="2" /></td>
                        <td><input type="radio" id="no63" name="no6" value="3" /></td>
                        <td><input type="radio" id="no64" name="no6" value="4" /></td>
                        <td class="bRight-none"><input type="radio" id="no65" name="no6" value="5" /></td>
                    </tr>
                    <tr class="bBottom2">
                        <td class="bRight-none">7.</td>
                        <td class="txt-left">생계가 막막하다.</td>
                        <td><input type="radio" id="no71" name="no7" value="1" /></td>
                        <td><input type="radio" id="no72" name="no7" value="2" /></td>
                        <td><input type="radio" id="no73" name="no7" value="3" /></td>
                        <td><input type="radio" id="no74" name="no7" value="4" /></td>
                        <td class="bRight-none"><input type="radio" id="no75" name="no7" value="5" /></td>
                    </tr>
                    <tr class="bBottom2">
                        <td class="bRight-none">8.</td>
                        <td class="txt-left">배우자가 없어서 자녀들과 소통이 안될 때 힘들다.</td>
                        <td><input type="radio" id="no81" name="no8" value="1" /></td>
                        <td><input type="radio" id="no82" name="no8" value="2" /></td>
                        <td><input type="radio" id="no83" name="no8" value="3" /></td>
                        <td><input type="radio" id="no84" name="no8" value="4" /></td>
                        <td class="bRight-none"><input type="radio" id="no85" name="no8" value="5" /></td>
                    </tr>
                    <tr class="bBottom2">
                        <td class="bRight-none">9.</td>
                        <td class="txt-left">혼자 있을 때 배우자 생각이 나서 허무할 때가 있다.</td>
                        <td><input type="radio" id="no91" name="no9" value="1" /></td>
                        <td><input type="radio" id="no92" name="no9" value="2" /></td>
                        <td><input type="radio" id="no93" name="no9" value="3" /></td>
                        <td><input type="radio" id="no94" name="no9" value="4" /></td>
                        <td class="bRight-none"><input type="radio" id="no95" name="no9" value="5" /></td>
                    </tr>
                    <tr class="bBottom">
                        <td class="bRight-none">10.</td>
                        <td class="txt-left">주위사람들의 시선이 신경 쓰여 불편하다.</td>
                        <td><input type="radio" id="no101" name="no10" value="1" /></td>
                        <td><input type="radio" id="no102" name="no10" value="2" /></td>
                        <td><input type="radio" id="no103" name="no10" value="3" /></td>
                        <td><input type="radio" id="no104" name="no10" value="4" /></td>
                        <td class="bRight-none"><input type="radio" id="no105" name="no10" value="5" /></td>
                    </tr>
                    <tr class="bBottom2">
                        <td class="bRight-none">11.</td>
                        <td class="txt-left">자녀들에게 경제적으로 부담을 주고 있다.</td>
                        <td><input type="radio" id="no111" name="no11" value="1" /></td>
                        <td><input type="radio" id="no112" name="no11" value="2" /></td>
                        <td><input type="radio" id="no113" name="no11" value="3" /></td>
                        <td><input type="radio" id="no114" name="no11" value="4" /></td>
                        <td class="bRight-none"><input type="radio" id="no115" name="no11" value="5" /></td>
                    </tr>
                    <tr class="bBottom2">
                        <td class="bRight-none">12.</td>
                        <td class="txt-left">집안일을 배우자 몫까지 내가 해야만 하는 것이 힘들다.</td>
                        <td><input type="radio" id="no121" name="no12" value="1" /></td>
                        <td><input type="radio" id="no122" name="no12" value="2" /></td>
                        <td><input type="radio" id="no123" name="no12" value="3" /></td>
                        <td><input type="radio" id="no124" name="no12" value="4" /></td>
                        <td class="bRight-none"><input type="radio" id="no125" name="no12" value="5" /></td>
                    </tr>
                    <tr class="bBottom2">
                        <td class="bRight-none">13.</td>
                        <td class="txt-left">사랑을 주고받으며 살고 싶은 마음이 간절하다.</td>
                        <td><input type="radio" id="no131" name="no13" value="1" /></td>
                        <td><input type="radio" id="no132" name="no13" value="2" /></td>
                        <td><input type="radio" id="no133" name="no13" value="3" /></td>
                        <td><input type="radio" id="no134" name="no13" value="4" /></td>
                        <td class="bRight-none"><input type="radio" id="no135" name="no13" value="5" /></td>
                    </tr>
                    <tr class="bBottom2">
                        <td class="bRight-none">14.</td>
                        <td class="txt-left">배우자가 없어서 사람들을 만나는 것이 꺼려진다.</td>
                        <td><input type="radio" id="no141" name="no14" value="1" /></td>
                        <td><input type="radio" id="no142" name="no14" value="2" /></td>
                        <td><input type="radio" id="no143" name="no14" value="3" /></td>
                        <td><input type="radio" id="no144" name="no14" value="4" /></td>
                        <td class="bRight-none"><input type="radio" id="no145" name="no14" value="5" /></td>
                    </tr>
                    <tr class="bBottom">
                        <td class="bRight-none">15.</td>
                        <td class="txt-left">앞으로 살아가는데 경제적으로 더 어려울 것이다.</td>
                        <td><input type="radio" id="no151" name="no15" value="1" /></td>
                        <td><input type="radio" id="no152" name="no15" value="2" /></td>
                        <td><input type="radio" id="no153" name="no15" value="3" /></td>
                        <td><input type="radio" id="no154" name="no15" value="4" /></td>
                        <td class="bRight-none"><input type="radio" id="no155" name="no15" value="5" /></td>
                    </tr>
                    <tr class="bBottom2">
                        <td class="bRight-none">16.</td>
                        <td class="txt-left">생활고 때문에 싫어도 돈을 벌어야 하는 것이 힘들다.</td>
                        <td><input type="radio" id="no161" name="no16" value="1" /></td>
                        <td><input type="radio" id="no162" name="no16" value="2" /></td>
                        <td><input type="radio" id="no163" name="no16" value="3" /></td>
                        <td><input type="radio" id="no164" name="no16" value="4" /></td>
                        <td class="bRight-none"><input type="radio" id="no165" name="no16" value="5" /></td>
                    </tr>
                    <tr class="bBottom2">
                        <td class="bRight-none">17.</td>
                        <td class="txt-left">혼자서 잠자리에 누웠을 때 배우자가 그립다.</td>
                        <td><input type="radio" id="no171" name="no17" value="1" /></td>
                        <td><input type="radio" id="no172" name="no17" value="2" /></td>
                        <td><input type="radio" id="no173" name="no17" value="3" /></td>
                        <td><input type="radio" id="no174" name="no17" value="4" /></td>
                        <td class="bRight-none"><input type="radio" id="no175" name="no17" value="5" /></td>
                    </tr>
                    <tr class="bBottom2">
                        <td class="bRight-none">18.</td>
                        <td class="txt-left">주위의 유혹이 있을 때 힘이 든다.</td>
                        <td><input type="radio" id="no181" name="no18" value="1" /></td>
                        <td><input type="radio" id="no182" name="no18" value="2" /></td>
                        <td><input type="radio" id="no183" name="no18" value="3" /></td>
                        <td><input type="radio" id="no184" name="no18" value="4" /></td>
                        <td class="bRight-none"><input type="radio" id="no185" name="no18" value="5" /></td>
                    </tr>
                    <tr class="bBottom">
                        <td class="bRight-none">19.</td>
                        <td class="txt-left">집안의 큰 행사가 있을 때 배우자의 빈자리가 느껴진다.</td>
                        <td><input type="radio" id="no191" name="no19" value="1" /></td>
                        <td><input type="radio" id="no192" name="no19" value="2" /></td>
                        <td><input type="radio" id="no193" name="no19" value="3" /></td>
                        <td><input type="radio" id="no194" name="no19" value="4" /></td>
                        <td class="bRight-none"><input type="radio" id="no195" name="no19" value="5" /></td>
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