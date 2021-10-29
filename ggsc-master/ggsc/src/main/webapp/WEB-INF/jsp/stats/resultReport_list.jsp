<%@ page import="egovframework.rte.psl.dataaccess.util.EgovMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<script src="/gnoincoundb/js/util/paging.js"></script>

<script type="text/javascript">
	$(function(){
		list();
	});
	function fn_excelDown(){
		document.location.href = "/gnoincoundb/center_ExcelDown.do";
	}

	function list() {
		var token = $("meta[name='_csrf']").attr("th:content");
		var header = $("meta[name='_csrf_header']").attr("th:content");
		$.ajax({
			type : "POST",
			url : "/gnoincoundb/resultReportList_ajax.do",
			data : $("#searchForm").serialize(),
			dataType : "json",
			beforeSend : function(xhr){
				xhr.setRequestHeader(header, token);
			}
		}).done(function(json){
			var d = json.list[0];
			var obj = Object.entries(d);
			for(var i=0;i<obj.length;i++){
				var c = obj[i];
				$("td[data-class='" + c[0] + "']").text(c[1]);
			}
			
			var html = '';
			var m = json.map.centerList1;
			
			
			/* $.each(json.map, function(i, d) {
				console.log(d.centerList3);
				html += '<tr>';
				for(var i=0; i<171; i++) {
					html += '<td>' + d.C+i+ '</td>';					
				}
				
				html += '</tr>';
				
			});  */
		}).fail(function(e){
			alert("서버와 통신 오류입니다.");
		});
	}
	
	function fn_excelTest() {
		
		document.searchForm.action = "/gnoincoundb/excelTestArea.do";
		document.searchForm.submit();
	}
	

	
</script>
<style>
	.search-group select{width:200px;}
	.label {margin-right:15px;}
	.label2 {display:inline-block;width:120px;color:#333;padding-right:5px;margin-bottom:2px;letter-spacing:-0.5px;text-align:right;}
</style>
<section id="content">

	<h2 class="h2-title"><i class="fa fa-check-square"></i>실적보고서</h2>
		
		<div class="box-style1 x-scroll-auto" >
				<!-- 검색영역 -->
		<form name="searchForm" id="searchForm" action="/bbsList.do" method="post" onsubmit="return false">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			<input type="hidden" id="currentPageNo" name="currentPageNo" value="1" />
			<input type="hidden" id="mnuCd" name="mnuCd" value="${mnuCd }" />
			<div class="search-box">
				<div class="search-group" style="margin-left:70px;">
					<span class="label"><label>상담구분</label></span>
					<span class="label2">
						 <select name="schCnsGb" style="width:259.5px;">
						 	<option value="">전체</option>
							<c:forEach items="${cnsGbList }" var="result">
							<option value="${result.odr }">${result.mclassNm }</option>
							</c:forEach>
						</select>
					</span>
					<!-- <span class="form"><input type="text" name="schText" id="schText" value="" /></span> -->
				</div>
				<div class="search-group" style="margin-left:180px;">
					<span class="label"><label>센터구분</label></span>
					<span class="label2">
						<select name="schCenterGb" style="width:275px;">
							<option value="">전체</option>
							<c:forEach items="${cnsCenterList}" var="list">
								<c:choose>
									<c:when test="${authCd > 1}">
										<c:if test="${ list.num eq vo.schCenterGb }" >
											<option value="${list.num}" selected >${list.centerGb}</option>
										</c:if>
									</c:when>
									<c:when test="${authCd <= 1 }">								
										<option value="${list.num}" >${list.centerGb}</option>
									</c:when>
								</c:choose>
							</c:forEach>
						</select>
					</span>
				</div>
				<br>
				<div class="btn" style="padding-bottom:15px;padding-right:80px;">
					<button type="button" class="btn-search" id="searchBtn" onclick="javascript:list(1);">
						<i class="fa fa-search"></i>검색
					</button>
				</div>
				<div class="search-group" style="margin-left:70px;">
					<span class="label">등록일</span> <input type="text" name="schStartDate" id="datepicker1" value="${vo.schStartDate }" style="width: 100px;" readOnly/> &nbsp;&nbsp;&nbsp; ~ &nbsp;<input type="text" name="schEndDate" id="datepicker2" value="${vo.schEndDate}" style="width: 100px;" readOnly/>
				</div>
		</div>
		</form>
			<%-- <h3 class="h3-title" style="margin-top: 15px; margin-bottom:15px;">1. 내담자 현황
			<div class="btn" style="float: right; margin: 0;">
				<!-- <button type="button" class="btn-basic" onclick="fn_excelDownload(15, document.searchForm)" style="background-color:green;color:white;">Excel 다운로드</button> -->		
				<button type="button" class="btn-basic" onclick="fn_excelTest()" style="background-color:green;color:white;">Excel TEST</button>
			</div>
			</h3>
			<table class="table-style1" style="margin-top:1px;">
                <colgroup>
                    <col style="width: 6%;" />
                    <col style="width: 6%;" />
                    <col style="width: 6%;" />
                    <col style="width: 6%;" />
                    <col style="width: 6%;" />
                    <col style="width: 6%;" />
                    <col style="width: 6%;" />
                    <col style="width: 6%;" />
                    <col style="width: 6%;" />
                    <col style="width: 6%;" />
                    <col style="width: 6%;" />
                    <col style="width: 6%;" />
                    <col style="width: 6%;" />
                    <col style="width: 6%;" />
                    <col style="width: 6%;" />
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="col" colspan="2">계</th>
                        <th scope="col" colspan="6">1-1 성별</th>
                        <th scope="col">계</th>
                        <th scope="col" colspan="6">1-2 내담자와 관계</th>
                    </tr>
                    <tr>
                        <td rowspan="3">명<br>(실인원)</td>
                        <td rowspan="3">건<br>(연인원)</td>
                        <td colspan="2">계</td>
                        <td colspan="2">남</td>
                        <td colspan="2">여</td>
                        <td rowspan="3">건<br>(연인원)</td>
                        <td rowspan="2">본인</td>
                        <td colspan="5">본인 외</td>
                    </tr>
                    <tr>
                    	<td rowspan="2">명</td>
                    	<td rowspan="2">건</td>
                    	<td rowspan="2">명</td>
                    	<td rowspan="2">건</td>
                    	<td rowspan="2">명</td>
                    	<td rowspan="2">건</td>
                    	<td>배우자</td>
                    	<td>자녀</td>
                    	<td>친인척</td>
                    	<td>이웃</td>
                    	<td>유관기관</td>
                    </tr>
                    <tr>
                    	<td>건</td>
                    	<td>건</td>
                    	<td>건</td>
                    	<td>건</td>
                    	<td>건</td>
                    	<td>건</td>
                    </tr>
                    <tr>
                    	<td data-class='cntPersonal'>&nbsp;</td>
                    	<td data-class='cntNumber'>&nbsp;</td>
                    	<td data-class='cntPersonal'>&nbsp;</td>
                    	<td data-class='cntNumber'>&nbsp;</td>
                    	<td data-class='cntPersonalMale'>&nbsp;</td>
                    	<td data-class='cntNumberMale'>&nbsp;</td>
                    	<td data-class='cntPersonalFemale'>&nbsp;</td>
                    	<td data-class='cntNumberFemale'>&nbsp;</td>
                    	<td data-class='cntNumberCnsle'>&nbsp;</td>
                    	<td data-class='cntNumberMyself'>&nbsp;</td>
                    	<td data-class='cntNumberSpouse'>&nbsp;</td>
                    	<td data-class='cntNumberChildren'>&nbsp;</td>
                    	<td data-class='cntNumberRelatives'>&nbsp;</td>
                    	<td data-class='cntNumberNeighbor'>&nbsp;</td>
                    	<td data-class='cntNumberRelorg'>&nbsp;</td>
                    </tr>
                </tbody>
            </table>
            
            <h3 class="h3-title">2. 연령별 현황</h3>
			<table class="table-style1" style="margin-top:1px;">
                <colgroup>
                    <col style="width: 7%;" />
                    <col style="width: 7%;" />
                   	<col style="width: 7%;" />
                    <col style="width: 7%;" />
                   	<col style="width: 7%;" />
                    <col style="width: 7%;" />
                   	<col style="width: 7%;" />
                    <col style="width: 7%;" />
                   	<col style="width: 7%;" />
                    <col style="width: 7%;" />
                   	<col style="width: 7%;" />
                    <col style="width: 7%;" />
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="col" colspan="2">계</th>
                        <th scope="col" colspan="10">1-3 나이</th>
                    </tr>
                    <tr>
                        <td rowspan="2">명<br>(실인원)</td>
                        <td rowspan="2">건<br>(연인원)</td>
                        <td colspan="2">60대</td>
                        <td colspan="2">70대</td>
                        <td colspan="2">80대</td>
                        <td colspan="2">90대</td>
                        <td colspan="2">60대 미만</td>
                    </tr>
                    <tr>
                    	<td>명</td>
                    	<td>건</td>
                    	<td>명</td>
                    	<td>건</td>
                    	<td>명</td>
                    	<td>건</td>
                    	<td>명</td>
                    	<td>건</td>
                    	<td>명</td>
                    	<td>건</td>
                    </tr>
                    <tr>
                    	<td data-class='cntPersonal'>&nbsp;</td>
                    	<td data-class='cntNumber'>&nbsp;</td>
                    	<td data-class='cntPersonalAge6069'>&nbsp;</td>
                    	<td data-class='cntNumberAge6069'>&nbsp;</td>
                    	<td data-class='cntPersonalAge7079'>&nbsp;</td>
                    	<td data-class='cntNumberAge7079'>&nbsp;</td>
                    	<td data-class='cntPersonalAge8089'>&nbsp;</td>
                    	<td data-class='cntNumberAge8089'>&nbsp;</td>
                    	<td data-class='cntPersonalAge9099'>&nbsp;</td>
                    	<td data-class='cntNumberAge9099'>&nbsp;</td>
                    	<td data-class='cntPersonalAge0159'>&nbsp;</td>
                    	<td data-class='cntNumberAge0159'>&nbsp;</td>
                    </tr>
                </tbody>
            </table>
			
			<h3 class="h3-title">3. 상담 방법</h3>
			<table class="table-style1" style="margin-top:1px;">
                <colgroup>
                    <col style="width: 6%;" />
                    <col style="width: 6%;" />
                    <col style="width: 6%;" />
                    <col style="width: 6%;" />
                    <col style="width: 6%;" />
                    <col style="width: 6%;" />
                    <col style="width: 6%;" />
                    <col style="width: 6%;" />
                    <col style="width: 6%;" />
                    <col style="width: 6%;" />
                    <col style="width: 6%;" />
                    <col style="width: 6%;" />
                    <col style="width: 6%;" />
                    <col style="width: 6%;" />
                    <col style="width: 6%;" />
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="col">계</th>
                        <th scope="col" colspan="8">개인상담(건)</th>
                        <th scope="col" colspan="8">집단상담(건)</th>
                    </tr>
                    <tr>
                        <td>계(건)</td>
                        <td>소계</td>
                        <td>내방</td>
                        <td>방문</td>
                        <td>면접상담</td>
                        <td>전화상담</td>
                        <td>홈페이지</td>
                        <td>모바일</td>
                        <td>기타</td>
                        <td>소계</td>
                        <td>사별애도</td>
                        <td>죽음준비</td>
                        <td>관계개선<br>의사소통</td>
                        <td>심리정서</td>
                        <td>자아통합</td>
                        <td>치매예방</td>
                        <td>기타</td>
                    </tr>
                    <tr>
                    	<td data-class='cntCnsTotal'></td>
                    	<td data-class='cntCnsPerMethd'></td>
                    	<td data-class='cntCnsNumNebang'>&nbsp;</td>
                    	<td data-class='cntCnsNumVisit'>&nbsp;</td>
                    		<td data-class='cntCnsNumItvcns'>&nbsp;</td>
                    		<td data-class='cntCnsNumCall'>&nbsp;</td>
                    		<td data-class='cntCnsNumHom'>&nbsp;</td>
                    		<td data-class='cntCnsNumMob'>&nbsp;</td>
                    		<td data-class='cntCnsNumEtc'>&nbsp;</td>
                   		<td data-class='cntGcsnMethd'>&nbsp;</td>
                    	<td data-class='cntGcnsBervmo'>&nbsp;</td>
                    	<td data-class='cntGcnsDieready'>&nbsp;</td>
                    	<td data-class='cntGcnsRelimprov'>&nbsp;</td>
                    	<td data-class='cntGcnsPsyemot'>&nbsp;</td>
                    	<td data-class='cntGcnsSelfinteg'>&nbsp;</td>
                    	<td data-class='cntGcnsDementiaprev'>&nbsp;</td>
                    	<td data-class='cntGcnsEtc'>&nbsp;</td>
                    </tr>
                </tbody>
            </table>
            
            <h3 class="h3-title">4. 상담내용 : 주호소 문제</h3>
            <h3 class="h3-title" style="margin-top: 10px;">○ 상담(중복 가능)</h3>
			<table class="table-style1" style="margin-top:1px;">
                <colgroup>
                    <col style="width: 9%;" />
                    <col style="width: 9%;" />
                    <col style="width: 9%;" />
                    <col style="width: 9%;" />
                    <col style="width: 9%;" />
                    <col style="width: 9%;" />
                    <col style="width: 9%;" />
                    <col style="width: 9%;" />
                    <col style="width: 9%;" />
                    <col style="width: 9%;" />
                    <col style="width: 9%;" />
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="col" colspan="11">4-1 상담</th>
                    </tr>
                    <tr>
                        <td>계(건)</td>
                        <td>심리정서</td>
                        <td>대인관계</td>
                        <td>건강</td>
                        <td>자살</td>
                        <td>경제,생활</td>
                        <td>치매</td>
                        <td>성</td>
                        <td>학대</td>
                        <td>가족</td>
                        <td>기타</td>
                    </tr>
                    <tr>
                    	<td data-class='cntCnsTotal'>&nbsp;</td>
                    	<td data-class='cntCnsPsyemotion'>&nbsp;</td>
                    	<td data-class='cntCnsPerrel'>&nbsp;</td>
                    	<td data-class='cntCnsHealth'>&nbsp;</td>
                    	<td data-class='cntCnsSuicide'>&nbsp;</td>
                    	<td data-class='cntCnsEcolife'>&nbsp;</td>
                    	<td data-class='cntCnsDementia'>&nbsp;</td>
                    	<td data-class='cntCnsSung'>&nbsp;</td>
                    	<td data-class='cntCnsRolose'>&nbsp;</td>
                    	<td data-class='cntCnsFamily'>&nbsp;</td>
                    	<td data-class='cntCnsEtc'>&nbsp;</td>
                    </tr>
                </tbody>
            </table>
            
            <table class="table-style1" style="margin-top:15px;">
                <colgroup>
                	<col style="width: 12%;" />
                    <col style="width: 12%;" />
                    <col style="width: 12%;" />
                    <col style="width: 12%;" />
                    <col style="width: 12%;" />
                    <col style="width: 12%;" />
                    <col style="width: 12%;" />
                    <col style="width: 12%;" />
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="col" colspan="8">4-2 연계(내부)</th>
                    </tr>
                    <tr>
                        <td rowspan="2">계(건)<br>(내부+외부)</td>
                        <td colspan="7">내부연계(수행기관)</td>
                    </tr>
                    <tr>
                    	<td>내부연계소계</td>
                    	<td>여가</td>
                    	<td>법률,세무</td>
                    	<td>경제후원</td>
                    	<td>취업,일자리</td>
                    	<td>생활,식생활,주거</td>
                    	<td>기타</td>
                    </tr>
                    <tr>
                    	<td data-class='cntLinkTotal'>&nbsp;</td>
                    	<td data-class='cntLinkInTotal'>&nbsp;</td>
                    	<td data-class='cntLinkFreetm'>&nbsp;</td>
                    	<td data-class='cntLinkEcospon'>&nbsp;</td>
                    	<td data-class='cntLinkLawtax'>&nbsp;</td>
                    	<td data-class='cntLinkWork'>&nbsp;</td>
                    	<td data-class='cntLinkLife'>&nbsp;</td>
                    	<td data-class='cntLinkEtc'>&nbsp;</td>
                    </tr>
                </tbody>
            </table>
            
            <table class="table-style1" style="margin-top:15px;">
                <colgroup>
                	<col style="width: 8%;" />
                	<col style="width: 8%;" />
                	<col style="width: 8%;" />
                	<col style="width: 8%;" />
                	<col style="width: 8%;" />
                	<col style="width: 8%;" />
                	<col style="width: 8%;" />
                	<col style="width: 8%;" />
                	<col style="width: 8%;" />
                	<col style="width: 8%;" />
                	<col style="width: 8%;" />
                	<col style="width: 8%;" />
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="col" colspan="12">4-3 외부연계</th>
                    </tr>
                    <tr>
                        <td rowspan="2">외부연계소계</td>
                        <td colspan="11">외부연계(수행기관)</td>
                    </tr>
                    <tr>
                    	<td>정신보건자살예방센터</td>
                    	<td>노인보호전문기관</td>
                    	<td>보건소방문간호</td>
                    	<td>일자리관련기관</td>
                    	<td>무한돌봄센터긴급지원</td>
                    	<td>법률기관</td>
                    	<td>성폭력,가정폭력상담소</td>
                    	<td>치매안심센터</td>
                    	<td>건강가정다문화가정지원센터</td>
                    	<td>행정기관주민센터 </td>
                    	<td>기타</td>
                    </tr>
                    <tr>
                    	<td data-class='cntLinkOutTotal'>&nbsp;</td>
                    	<td data-class='cntLinkSuicprect'>&nbsp;</td>
                    	<td data-class='cntLinkOldprotorg'>&nbsp;</td>
                    	<td data-class='cntLinkHealvisit'>&nbsp;</td>
                    	<td data-class='cntLinkWorkorg'>&nbsp;</td>
                    	<td data-class='cntLinkInficare'>&nbsp;</td>
                    	<td data-class='cntLinkLaworg'>&nbsp;</td>
                    	<td data-class='cntLinkSungcns'>&nbsp;</td>
                    	<td data-class='cntLinkHealfmct'>&nbsp;</td>
                    	<td data-class='cntLinkAdministrorg'>&nbsp;</td>
                    	<td data-class='cntLinkOutAdmincenter'>&nbsp;</td>
                    	<td data-class='cntLinkOutEtc'>&nbsp;</td>
                    </tr>
                </tbody>
            </table>
            
            <h3 class="h3-title">○ 상담진행현황</h3>
            <table class="table-style1" style="margin-top:1px;">
                <colgroup>
                	<col style="width: 11%;" />
                	<col style="width: 11%;" />
                	<col style="width: 11%;" />
                	<col style="width: 11%;" />
                	<col style="width: 11%;" />
                	<col style="width: 11%;" />
                	<col style="width: 11%;" />
                	<col style="width: 11%;" />
                	<col style="width: 11%;" />
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="col" rowspan="2">계(건)</th>
                        <th scope="col" colspan="3">단회기 상담(1회 종결)</th>
                        <th scope="col" colspan="5">지속상담</th>
                    </tr>
                    <tr>
                        <td>소계</td>
                        <td>단순 정보 상담</td>
                        <td>복지서비스 안내</td>
                        <td>소계</td>
                        <td>10회기 이내</td>
                        <td>20회기 이내</td>
                        <td>20회기 이상<br>30회기 미만</td>
                        <td>30회기 이상</td>
                    </tr>
                    <tr>
                    	<td data-class='cntCnsEndTotal'>&nbsp;</td>
                    	<td data-class='cntCnsEndStotal'>&nbsp;</td>
                    	<td data-class='cntCnsEndSimcns'>&nbsp;</td>
                    	<td data-class='cntCnsEndServigui'>&nbsp;</td>
                    	<td data-class='cntCnsEndLtotal'>&nbsp;</td>
                    	<td data-class='cntCnsContiTenlow'>&nbsp;</td>
                    	<td data-class='cntCnsContiTwolow'>&nbsp;</td>
                    	<td data-class='cntCnsContiThreelow'>&nbsp;</td>
                    	<td data-class='cntCnsContiThreehigh'>&nbsp;</td>
                    </tr>
                </tbody>
            </table>
            <div>
            	* 단회기 상담 : 단순 정보상담 및 복지서비스 안내  <br> 
				* 지속상담 : 초기 상담 후 지속적인 상담이 필요한 경우
            </div>
            
            <h3 class="h3-title" style="margin-top: 15px;">○ 심리검사</h3>
            <table class="table-style1" style="margin-top:1px;">
                <colgroup>
                	<col style="width: 9%;" />
                	<col style="width: 9%;" />
                	<col style="width: 9%;" />
                	<col style="width: 9%;" />
                	<col style="width: 9%;" />
                	<col style="width: 9%;" />
                	<col style="width: 9%;" />
                	<col style="width: 9%;" />
                	<col style="width: 9%;" />
                	<col style="width: 9%;" />
                	<col style="width: 9%;" />
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="col" rowspan="2">계(건)</th>
                        <th scope="col" colspan="10">심리검사</th>
                    </tr>
                    <tr>
                        <td>DUKE-AD 간략우울</td>
                        <td>GDS-KR 노인우울</td>
                        <td>GDS-SI 노인우울 자살사고</td>
                        <td>불안</td>
                        <td>스트레스</td>
                        <td>사별스트레스</td>
                        <td>대인관계변화</td>
                        <td>부부의사소통</td>
                        <td>MMSE-K 치매선별</td>
                        <td>기타</td>
                    </tr>
                    <tr>
                    	<td data-class='cntPsyTotal'>&nbsp;</td>
                    	<td data-class='cntPsyDukead'>&nbsp;</td>
                    	<td data-class='cntPsyGdskr'>&nbsp;</td>
                    	<td data-class='cntPsyGdssi'>&nbsp;</td>
                    	<td data-class='cntPsyAnxiety'>&nbsp;</td>
                    	<td data-class='cntPsyStress'>&nbsp;</td>
                    	<td data-class='cntPsyPersonrel'>&nbsp;</td>
                    	<td data-class='cntPsyBervstress'>&nbsp;</td>
                    	<td data-class='cntPsyCoupletk'>&nbsp;</td>
                    	<td data-class='cntPsyMmsek'>&nbsp;</td>
                    	<td data-class='cntPsyEtc'>&nbsp;</td>
                    </tr>
                </tbody>
            </table>
            
            <h3 class="h3-title" style="margin-top: 15px;">5. 상담지원봉사자 활동</h3>
            <table class="table-style1" style="margin-top:1px;">
                <colgroup>
                	<col style="width: 13%;" />
                	<col style="width: 13%;" />
                	<col style="width: 13%;" />
                	<col style="width: 13%;" />
                	<col style="width: 13%;" />
                	<col style="width: 13%;" />
                	<col style="width: 13%;" />
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="col" rowspan="2">계(건)</th>
                        <th scope="col" colspan="6">상담지원봉사자(건)</th>
                    </tr>
                    <tr>
                        <td>사후관리<br>안부확인(방문)</td>
                        <td>사후관리<br>안부확인(전화)</td>
                        <td>심리검사</td>
                        <td>연계상담 시 동행</td>
                        <td>홍보활동</td>
                        <td>기타</td>
                    </tr>
                    <tr>
                    	<td data-class='cntEduTotal'>&nbsp;</td>
                    	<td data-class='cntEduAftermng'>&nbsp;</td>
                    	<td data-class='cntEduAftermngtel'>&nbsp;</td>
                    	<td data-class='cntEduPsychk'>&nbsp;</td>
                    	<td data-class='cntEduLinkcns'>&nbsp;</td>
                    	<td data-class='cntEduPromactv'>&nbsp;</td>
                    	<td data-class='cntEduEtc'>&nbsp;</td>
                    </tr>
                </tbody>
            </table>
            <div>
            	* 상담지원봉사자 활동 : 전문상담사 상담 후 사후관리(방문, 전화), 연계상담 시 동행, 홍보활동 등
            </div>
            
            <h3 class="h3-title" style="margin-top: 15px;">6. 네트워크 활동</h3>
            <table class="table-style1" style="margin-top:1px;">
                <colgroup>
                	<col style="width: 13%;" />
                	<col style="width: 13%;" />
                	<col style="width: 13%;" />
                	<col style="width: 13%;" />
                	<col style="width: 13%;" />
                	<col style="width: 13%;" />
                	<col style="width: 13%;" />
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="col" rowspan="2">계(건)</th>
                        <th scope="col" colspan="6">네트워크 활동(건)</th>
                    </tr>
                    <tr>
                        <td>권역네트워크회의</td>
                        <td>네트워킹회의(구.권역장회의)</td>
                        <td>실무회의</td>
                        <td>기관내부사레회의</td>
                        <td>지역사회 네트워크회의</td>
                        <td>기타</td>
                    </tr>
                    <tr>
                    	<td data-class='cntNtwkTotal'>&nbsp;</td>
                    	<td data-class='cntNtwkZonentwk'>&nbsp;</td>
                    	<td data-class='cntNtwkNtwkorking'>&nbsp;</td>
                    	<td data-class='cntNtwkWkmeeting'>&nbsp;</td>
                    	<td data-class='cntNtwkOrgintn'>&nbsp;</td>
                    	<td data-class='cntNtwkLocalntwk'>&nbsp;</td>
                    	<td data-class='cntNtwkEtc'>&nbsp;</td>
                    </tr>
                </tbody>
            </table>
            <div>
            	* 실무회의 : 경기도노인종합상담센터에서 소집하는 사안별 각종 회의
            </div>
            
            <h3 class="h3-title" style="margin-top: 15px;">7. 교육</h3>
            <h3 class="h3-title" style="margin-top: 15px;">○ 대상</h3>
            <table class="table-style1" style="margin-top:1px;">
                <colgroup>
                	<col style="width: 8%;" />
                	<col style="width: 8%;" />
                	<col style="width: 8%;" />
                	<col style="width: 8%;" />
                	<col style="width: 8%;" />
                	<col style="width: 8%;" />
                	<col style="width: 8%;" />
                	<col style="width: 8%;" />
                	<col style="width: 8%;" />
                	<col style="width: 8%;" />
                	<col style="width: 8%;" />
                	<col style="width: 8%;" />
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="col" colspan="2">계</th>
                        <th scope="col" colspan="2">노인</th>
                        <th scope="col" colspan="2">일반주민</th>
                        <th scope="col" colspan="2">소속기관</th>
                        <th scope="col" colspan="2">유관기관</th>
                        <th scope="col" colspan="2">기타</th>
                    </tr>
                    <tr>
                        <td>회</td>
                        <td>명</td>
                        <td>회</td>
                        <td>명</td>
                        <td>회</td>
                        <td>명</td>
                        <td>회</td>
                        <td>명</td>
                        <td>회</td>
                        <td>명</td>
                        <td>회</td>
                        <td>명</td>
                    </tr>
                    <tr>
                    	<td>&nbsp;</td>
                    	<td data-class='cntEduPersonalTotal'>&nbsp;</td>
                    	<td>&nbsp;</td>
                    	<td data-class='cntEduPersonalOld'>&nbsp;</td>
                    	<td>&nbsp;</td>
                    	<td data-class='cntEduPersonalNormalrd'>&nbsp;</td>
                    	<td>&nbsp;</td>
                    	<td data-class='cntEduPersonalAffiorg'>&nbsp;</td>
                    	<td>&nbsp;</td>
                    	<td data-class='cntEduPersonalRelorg'>&nbsp;</td>
                    	<td>&nbsp;</td>
                    	<td data-class='cntEduPersonalEtc'>&nbsp;</td>
                    </tr>
                </tbody>
            </table>
            
            <h3 class="h3-title" style="margin-top: 15px;">○ 진행형태</h3>
            <table class="table-style1" style="margin-top:1px;">
                <colgroup>
                	<col style="width: 15%;" />
                	<col style="width: 15%;" />
                	<col style="width: 15%;" />
                	<col style="width: 15%;" />
                	<col style="width: 15%;" />
                	<col style="width: 15%;" />
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="col" colspan="2">계</th>
                        <th scope="col" colspan="4">진행형태</th>
                    </tr>
                    <tr>
                        <td rowspan="2">회</td>
                        <td rowspan="2">명</td>
                        <td colspan="2">상담사</td>
                        <td colspan="2">강사</td>
                    </tr>
                    <tr>
                    	<td>회</td>
                    	<td>명</td>
                    	<td>회</td>
                    	<td>명</td>
                    </tr>
                    <tr>
                    	<td>&nbsp;</td>
                    	<td>&nbsp;</td>
                    	<td>&nbsp;</td>
                    	<td>&nbsp;</td>
                    	<td>&nbsp;</td>
                    	<td>&nbsp;</td>
                    </tr>
                </tbody>
            </table>
            
            <h3 class="h3-title" style="margin-top: 15px;">○ 내용</h3>
            <table class="table-style1" style="margin-top:1px;">
                <colgroup>
                	<col style="width: 6%;" />
                	<col style="width: 6%;" />
                	<col style="width: 6%;" />
                	<col style="width: 6%;" />
                	<col style="width: 6%;" />
                	<col style="width: 6%;" />
                	<col style="width: 6%;" />
                	<col style="width: 6%;" />
                	<col style="width: 6%;" />
                	<col style="width: 6%;" />
                	<col style="width: 6%;" />
                	<col style="width: 6%;" />
                	<col style="width: 6%;" />
                	<col style="width: 6%;" />
                	<col style="width: 6%;" />
                	<col style="width: 6%;" />
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="col" colspan="2">계</th>
                        <th scope="col" colspan="14">내용</th>
                    </tr>
                    <tr>
                        <td rowspan="2">회</td>
                        <td rowspan="2">명</td>
                        <td colspan="2">심리정서</td>
                        <td colspan="2">관계계선</td>
                        <td colspan="2">사별애도</td>
                        <td colspan="2">죽음준비</td>
                        <td colspan="2">치매예방</td>
                        <td colspan="2">학대예방</td>
                        <td colspan="2">기타</td>
                    </tr>
                    <tr>
                    	<td>회</td>
                    	<td>명</td>
                    	<td>회</td>
                    	<td>명</td>
                    	<td>회</td>
                    	<td>명</td>
                    	<td>회</td>
                    	<td>명</td>
                    	<td>회</td>
                    	<td>명</td>
                    	<td>회</td>
                    	<td>명</td>
                    	<td>회</td>
                    	<td>명</td>
                    </tr>
                    <tr>
                    	<td>&nbsp;</td>
                    	<td>&nbsp;</td>
                    	<td>&nbsp;</td>
                    	<td>&nbsp;</td>
                    	<td>&nbsp;</td>
                    	<td>&nbsp;</td>
                    	<td>&nbsp;</td>
                    	<td>&nbsp;</td>
                    	<td>&nbsp;</td>
                    	<td>&nbsp;</td>
                    	<td>&nbsp;</td>
                    	<td>&nbsp;</td>
                    	<td>&nbsp;</td>
                    	<td>&nbsp;</td>
                    	<td>&nbsp;</td>
                    	<td>&nbsp;</td>
                    </tr>
                </tbody>
            </table>
            
             <h3 class="h3-title" style="margin-top: 15px;">8. 홍보</h3>
            <table class="table-style1" style="margin-top:1px;">
                <colgroup>
                	<col style="width: 7%;" />
                	<col style="width: 7%;" />
                	<col style="width: 7%;" />
                	<col style="width: 7%;" />
                	<col style="width: 7%;" />
                	<col style="width: 7%;" />
                	<col style="width: 7%;" />
                	<col style="width: 7%;" />
                	<col style="width: 7%;" />
                	<col style="width: 7%;" />
                	<col style="width: 7%;" />
                	<col style="width: 7%;" />
                	<col style="width: 7%;" />
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="col" colspan="2">계</th>
                        <th scope="col" colspan="14">홍보활동</th>
                    </tr>
                    <tr>
                        <td rowspan="2">회</td>
                        <td rowspan="2">명</td>
                        <td rowspan="2">개(매)</td>
                        <td colspan="2">행사</td>
                        <td colspan="2">방문홍보</td>
                        <td>대중매체</td>
                        <td>인터넷</td>
                        <td>설치물</td>
                        <td colspan="2">홍보물품</td>
                        <td>기타</td>
                    </tr>
                    <tr>
                    	<td>회</td>
                    	<td>명</td>
                    	<td>회</td>
                    	<td>명</td>
                    	<td>회</td>
                    	<td>회</td>
                    	<td>회</td>
                    	<td>회</td>
                    	<td>개(매)</td>
                    	<td>회(건)</td>
                    </tr>
                    <tr>
                    	<td>&nbsp;</td>
                    	<td data-class='cntPrPersonalTotal'>&nbsp;</td>
                    	<td>&nbsp;</td>
                    	<td>&nbsp;</td>
                    	<td data-class='cntPrPersonalEvent'>&nbsp;</td>
                    	<td>&nbsp;</td>
                    	<td data-class='cntPrPersonalVisitevt'>&nbsp;</td>
                    	<td data-class='cntPrNumberPublicmd'>&nbsp;</td>
                    	<td data-class='cntPrNumberInternet'>&nbsp;</td>
                    	<td data-class='cntPrNumberInstall'>&nbsp;</td>
                    	<td data-class='cntPrNumberPromprd'>&nbsp;</td>
                    	<td>&nbsp;</td>
                    	<td data-class='cntPrNumberEct'>&nbsp;</td>
                    </tr>
                </tbody>
            </table> --%>
            <h3 class="h3-title" style="margin-top: 15px; margin-bottom:15px;">실적보고서
				<div class="btn" style="float: right; margin: 0;">
					<!-- <button type="button" class="btn-basic" onclick="fn_excelDownload(15, document.searchForm)" style="background-color:green;color:white;">Excel 다운로드</button> -->		
					<c:if test="${authCd eq 1 }">
						<button type="button" class="btn-basic" onclick="fn_excelTest()" style="background-color:green;color:white;">Excel TEST</button>
					</c:if>
				</div>
			</h3>
			<table class="table-style1" style="margin-top:1px; width: 10500px;">
                <colgroup>
                    <%
                    	for(int i=0; i<174; i++) {
                    		%><col style="width: 0.3%;" /><%
                    	}
                    %>
                </colgroup>
                <tbody>
                	<tr>
                		<th scope="col" rowspan="4">구분</th>
                    	<th scope="col" rowspan="4">상담센터</th>
                    	<th scope="col" colspan="8">1-1. 성별</th>
                    	<th scope="col" colspan="8">1-2. 내담자와 관계</th>
                    	<th scope="col" colspan="12">1-3. 연령별 현황</th>
                    	<th scope="col" colspan="15">2. 상담경위</th>
                    	<th scope="col" colspan="15">3. 상담방법</th>
                    	<th scope="col" colspan="11">4-1. 상담내용</th>
                        <th scope="col" colspan="20">4-2. 정보 제공 및 연계</th>
                        <th scope="col" colspan="9">○ 4-3. 상담진행현황</th>
                        <th scope="col" colspan="11">○ 4-4. 심리검사</th>
                        <th scope="col" colspan="7">5. 상담지원봉사자 활동</th>
                        <th scope="col" colspan="7">6. 네트워크 활동</th>
                        <th scope="col" colspan="12">○ 7-1. 대상</th>
                        <th scope="col" colspan="6">○ 7-2. 진행형태</th>
                        <th scope="col" colspan="16">○ 7-3. 내용</th>
                        <th scope="col" colspan="13">8. 홍보</th>
                	</tr>
                    <tr>	
                        <th scope="col" colspan="2" rowspan="2">계</th>
                        <th scope="col" colspan="6">성별</th>
                        <th scope="col" rowspan="2">계</th>
                        <th scope="col" rowspan="2">본인</th>
                        <th scope="col" colspan="6">본인 외</th>
                        <th scope="col" colspan="2" rowspan="2">계</th>
                        <th scope="col" colspan="10">연령</th>
                        <th scope="col" rowspan="2">계</th>
                        <th scope="col" rowspan="2">소계</th>
                        <th scope="col">내부의뢰</th>
                        <th scope="col" colspan="8">외부의뢰</th>
                        <th scope="col" rowspan="2">자발적신청</th>
                        <th scope="col" rowspan="2">발굴</th>
                        <th scope="col" rowspan="2">신규 -기타</th>
                        <th scope="col" rowspan="2">기존<br>내담자(명)</th>
                        <th scope="col" rowspan="2">계(건)</th>
                        <th scope="col" colspan="6">개인상담(건)</th>
                        <th scope="col" colspan="8">집단상담(건)</th>
                        <th scope="col" rowspan="2">계(건)</th>
                        <th scope="col" colspan="10">주호소 문제</th>
                        <th scope="col" rowspan="2">계(건)</th>
                        <th scope="col" colspan="7">내부 연계</th>
                        <th scope="col" colspan="12">외부 연계</th>
                        <th scope="col" rowspan="2">계(건)</th>
                        <th scope="col" colspan="3">단회기 상담(1회 종결)</th>
                        <th scope="col" colspan="5">지속상담</th>
                        <th scope="col" rowspan="2">계(건)</th>
                        <th scope="col" colspan="10">심리검사</th>
                        <th scope="col" rowspan="2">계(건)</th>
                        <th scope="col" colspan="6">5. 상담지원봉사자 활동</th>
                        <th scope="col" rowspan="2">계(건)</th>
                        <th scope="col" colspan="6">6. 네트워크 활동</th>
                        <th scope="col" colspan="2" rowspan="2">계(건)</th>
                        <th scope="col" colspan="10">교육대상</th>
                        <th scope="col" colspan="2" rowspan="2">계</th>
                        <th scope="col" colspan="4">진행 형태</th>
                        <th scope="col" colspan="2" rowspan="2">계</th>
                        <th scope="col" colspan="14">교육 내용</th>
                        <th scope="col" colspan="3" rowspan="2">계</th>
                        <th scope="col" colspan="10">홍보</th>
                    </tr>
                    <tr>
                        <td colspan="2">소계</td>
                        <td colspan="2">남</td>
                        <td colspan="2">여</td>
                        <td>소계</td>
                    	<td>배우자</td>
                    	<td>자녀</td>
                    	<td>친인척</td>
                    	<td>이웃</td>
                    	<td>유관기관</td>
                    	<td colspan="2">60대</td>
                    	<td colspan="2">70대</td>
                    	<td colspan="2">80대</td>
                    	<td colspan="2">90대 이상</td>
                    	<td colspan="2">60대 미만</td>
                    	<td>수행기관</td>
                    	<td>소계</td>
                    	<td>치매관련<br>기관</td>
                    	<td>정신건강<br>자살예방센터</td>
                    	<td>노인보호<br>전문기관</td>
                    	<td>방문간호<br>센터</td>
                    	<td>재가노인관련기관</td>
                    	<td>행정기관</td>
                    	<td>기타-기관</td>
                    	<td>소계</td>
                    	<td>내방</td>
                    	<td>방문</td>
                    	<td>전화</td>
                    	<td>온라인</td>
                    	<td>기타</td>
                    	<td>소계</td>
                    	<td>사별애도</td>
                    	<td>죽음준비</td>
                    	<td>관계개선<br>의사소통</td>
                    	<td>심리·정서</td>
                    	<td>자아통합</td>
                    	<td>치매예방</td>
                    	<td>기타</td>
                    	<td>심리·정서</td>
                    	<td>대인관계</td>
                    	<td>건강</td>
                    	<td>자살</td>
                    	<td>경제,생활</td>
                    	<td>치매</td>
                    	<td>성</td>
                    	<td>학대</td>
                    	<td>가족</td>
                    	<td>기타</td>
                    	<td>소계</td>
                    	<td>여가</td>
                    	<td>법률,세무</td>
                    	<td>경제후원</td>
                    	<td>취업,일자리</td>
                    	<td>생활,식생활,<br>주거</td>
                    	<td>기타</td>
                    	<td>소계</td>
                    	<td>정신보건자살예방센터</td>
                    	<td>노인보호전문기관</td>
                    	<td>보건소방문간호</td>
                    	<td>일자리관련기관</td>
                    	<td>무한돌봄센터긴급지원</td>
                    	<td>법률기관</td>
                    	<td>성폭력,가정폭력상담소</td>
                    	<td>치매안심센터</td>
                    	<td>건강가정다문화가정</td>
                    	<td>행정기관주민센터</td>
                    	<td>기타</td>
                    	<td>소계</td>
                    	<td>단순정보상담</td>
                    	<td>복지서비스안내</td>
                    	<td>소계</td>
                    	<td>10회기이내</td>
                    	<td>20회기이내</td>
                    	<td>20회기이상30회기미만</td>
                    	<td>30회기이상</td>
                    	
                    	<td>DUKE-간략우울</td>
                    	<td>GDS-KR 노인우울</td>
                    	<td>GDS-SI노인우울 자살사고</td>
                    	<td>불안</td>
                    	<td>스트레스</td>
                    	<td>사별 스트레스</td>
                    	<td>대인관계 변화</td>
                    	<td>부부 의사소통</td>
                    	<td>MMSE-K 치매선별</td>
                    	<td>기타</td>
                    	
                    	<td>사후관리-안부확인(방문)</td>
                    	<td>사후관리-안부확인(전화)</td>
                    	<td>심리검사</td>
                    	<td>연계상담동행</td>
                    	<td>홍보활동</td>
                    	<td>기타</td>
                    	<td>권역네트워크회의</td>
                    	<td>네트워크회의</td>
                    	<td>실무회의</td>
                    	<td>기관내부사례회의</td>
                    	<td>지역사회네트워킹회의</td>
                    	<td>기타</td>
                    	<td colspan="2">노인</td>
                    	<td colspan="2">일반주민</td>
                    	<td colspan="2">소속기관</td>
                    	<td colspan="2">유관기관</td>
                    	<td colspan="2">기타</td>
                    	<td colspan="2">상담사</td>
                    	<td colspan="2">강사</td>
                    	<td colspan="2">심리정서</td>
                    	<td colspan="2">관계개선</td>
                    	<td colspan="2">사별애도</td>
                    	<td colspan="2">죽음준비</td>
                    	<td colspan="2">치매예방</td>
                    	<td colspan="2">학대예방</td>
						<td colspan="2">행사</td>
						<td colspan="2">행사</td>
						<td colspan="2">방문홍보</td>
						<td>대중매체</td>
						<td>인터넷</td>
						<td>설치물</td>
						<td colspan="2">홍보물품</td>
						<td>기타</td>
                    </tr>
                    <tr>
                    	<td>명</td>
                        <td>건</td>
                    	<td>명</td>
                    	<td>건</td>
                    	<td>명</td>
                    	<td>건</td>
                    	<td>명</td>
                    	<td>건</td>
                    	<td>건</td>
                    	<td>건</td>
                    	
                    	<td>건</td>
                    	<td>건</td>
                    	<td>건</td>
                    	<td>건</td>
                    	<td>건</td>
                    	<td>건</td>
                    	<td>명</td>
                        <td>건</td>
                        <td>명</td>
                        <td>건</td>
                        
                        <td>명</td>
                        <td>건</td>
                        <td>명</td>
                        <td>건</td>
                        <td>명</td>
                        <td>건</td>
                        <td>명</td>
                        <td>건</td>
                        <td>명</td>
                        <td>명</td>
                        
                        <td>명</td>
                        <td>명</td>
                        <td>명</td>
                        <td>명</td>
                        <td>명</td>
                        <td>명</td>
                        <td>명</td>
                        <td>명</td>
                        <td>명</td>
                        <td>명</td>
                        <td>명</td>
                        
                        <td>명</td>
                        <td>명</td>
                        
                        <%
                        	for(int i=0; i<80; i++) { // 69
                        		%><td>건</td><%
                        	}
                        %>
                        
                        <td>회</td>
                        <td>명</td>
                        <td>회</td>
                        <td>명</td>
                        <td>회</td>
                        <td>명</td>
                        <td>회</td>
                        <td>명</td>
                        <td>회</td>
                        <td>명</td>
                        <td>회</td>
                        <td>명</td>
                        
                        <td>회</td>
                        <td>명</td>
                        <td>회</td>
                        <td>명</td>
                        <td>회</td>
                        <td>명</td>
                        
                        <td>회</td>
                        <td>명</td>
                        <td>회</td>
                        <td>명</td>
                        <td>회</td>
                        <td>명</td>
                        <td>회</td>
                        <td>명</td>
                        <td>회</td>
                        <td>명</td>
                        <td>회</td>
                        <td>명</td>
                        <td>회</td>
                        <td>명</td>
                        <td>회</td>
                        <td>명</td>
                        
                        <td>회</td>
                        <td>명</td>
                        <td>개(매)</td>
                        <td>회</td>
                        <td>명</td>
                        <td>회</td>
                        <td>명</td>
                        <td>회</td>
                        <td>회</td>
                        <td>회</td>
                        <td>회</td>
                        <td>개(매)</td>
                        <td>회(건)</td>
                    </tr>
                    <tr>
                    	<td>&nbsp;</td>
                    	<td>합계</td>
                    	<td data-class='c1'>&nbsp;</td>
                    	<td data-class='c2'>&nbsp;</td>
                    	<td data-class='c3'>&nbsp;</td>
                    	<td data-class='c4'>&nbsp;</td>
                    	<td data-class='c5'>&nbsp;</td>
                    	<td data-class='c6'>&nbsp;</td>
                    	<td data-class='c7'>&nbsp;</td>
                    	<td data-class='c8'>&nbsp;</td>
                    	<td data-class='c9'>&nbsp;</td>
                    	<td data-class='c10'>&nbsp;</td>
                    	<td data-class='c11'>&nbsp;</td>
                    	<td data-class='c12'>&nbsp;</td>
                    	<td data-class='c13'>&nbsp;</td>
                    	<td data-class='c14'>&nbsp;</td>
                    	<td data-class='c15'>&nbsp;</td>
                    	<td data-class='c16'>&nbsp;</td>
                    	<td data-class='c17'>&nbsp;</td>
                    	<td data-class='c18'>&nbsp;</td>
                    	<td data-class='c19'>&nbsp;</td>
                    	<td data-class='c20'>&nbsp;</td>
                    	<td data-class='c21'>&nbsp;</td>
                    	<td data-class='c22'>&nbsp;</td>
                    	<td data-class='c23'>&nbsp;</td>
                    	<td data-class='c24'>&nbsp;</td>
                    	<td data-class='c25'>&nbsp;</td>
                    	<td data-class='c26'>&nbsp;</td>
                    	<td data-class='c27'>&nbsp;</td>
                    	<td data-class='c28'>&nbsp;</td>
                    	<td data-class='c29'>&nbsp;</td>
                    	<td data-class='c30'>&nbsp;</td>
                    	<td data-class='c31'>&nbsp;</td>
                    	<td data-class='c171'>&nbsp;</td>
                    	<td data-class='c32'>&nbsp;</td>
                    	<td data-class='c33'>&nbsp;</td>
                    	<td data-class='c34'>&nbsp;</td>
                    	<td data-class='c35'>&nbsp;</td>
                    	<td data-class='c36'>&nbsp;</td>
                    	<td data-class='c37'>&nbsp;</td>
                    	<td data-class='c38'>&nbsp;</td>
                    	<td data-class='c39'>&nbsp;</td>
                    	<td data-class='c40'>&nbsp;</td>
                    	<td data-class='c41'>&nbsp;</td>
                    	<td data-class='c42'>&nbsp;</td>
                    	<td data-class='c43'>&nbsp;</td>
                    	<td data-class='c44'>&nbsp;</td>
                    	<td data-class='c45'>&nbsp;</td>
                    	<td data-class='c46'>&nbsp;</td>
                    	<td data-class='c47'>&nbsp;</td>
                    	<td data-class='c48'>&nbsp;</td>
                    	<td data-class='c49'>&nbsp;</td>
                    	<td data-class='c50'>&nbsp;</td>
                    	<td data-class='c51'>&nbsp;</td>
                    	<td data-class='c52'>&nbsp;</td>
                    	<td data-class='c53'>&nbsp;</td>
                    	<td data-class='c54'>&nbsp;</td>
                    	<td data-class='c55'>&nbsp;</td>
                    	<td data-class='c56'>&nbsp;</td>
                    	<td data-class='c57'>&nbsp;</td>
                    	<td data-class='c58'>&nbsp;</td>
                    	<td data-class='c59'>&nbsp;</td>
                    	<td data-class='c60'>&nbsp;</td>
                    	<td data-class='c61'>&nbsp;</td>
                    	<td data-class='c62'>&nbsp;</td>
                    	<td data-class='c63'>&nbsp;</td>
                    	<td data-class='c64'>&nbsp;</td>
                    	<td data-class='c65'>&nbsp;</td>
                    	<td data-class='c66'>&nbsp;</td>
                    	<td data-class='c67'>&nbsp;</td>
                    	<td data-class='c68'>&nbsp;</td>
                    	<td data-class='c69'>&nbsp;</td>
                    	<td data-class='c70'>&nbsp;</td>
                    	<td data-class='c71'>&nbsp;</td>
                    	<td data-class='c72'>&nbsp;</td>
                    	<td data-class='c73'>&nbsp;</td>
                    	<td data-class='c74'>&nbsp;</td>
                    	<td data-class='c75'>&nbsp;</td>
                    	<td data-class='c76'>&nbsp;</td>
                    	<td data-class='c77'>&nbsp;</td>
                    	<td data-class='c78'>&nbsp;</td>
                    	<td data-class='c79'>&nbsp;</td>
                    	<td data-class='c80'>&nbsp;</td>
                    	<td data-class='c81'>&nbsp;</td>
                    	<td data-class='c82'>&nbsp;</td>
                    	<td data-class='c83'>&nbsp;</td>
                    	<td data-class='c84'>&nbsp;</td>
                    	<td data-class='c85'>&nbsp;</td>
                    	<td data-class='c86'>&nbsp;</td>
                    	<td data-class='c87'>&nbsp;</td>
                    	<td data-class='c88'>&nbsp;</td>
                    	<td data-class='c89'>&nbsp;</td>
                    	<td data-class='c90'>&nbsp;</td>
                    	<td data-class='c91'>&nbsp;</td>
                    	<td data-class='c92'>&nbsp;</td>
                    	<td data-class='c93'>&nbsp;</td>
                    	<td data-class='c94'>&nbsp;</td>
                    	<td data-class='c95'>&nbsp;</td>
                    	<td data-class='c96'>&nbsp;</td>
                    	<td data-class='c97'>&nbsp;</td>
                    	<td data-class='c98'>&nbsp;</td>
                    	<td data-class='c99'>&nbsp;</td>
                    	<td data-class='c100'>&nbsp;</td>
                    	<td data-class='c101'>&nbsp;</td>
                    	<td data-class='c102'>&nbsp;</td>
                    	<td data-class='c103'>&nbsp;</td>
                    	<td data-class='c104'>&nbsp;</td>
                    	<td data-class='c105'>&nbsp;</td>
                    	<td data-class='c106'>&nbsp;</td>
                    	<td data-class='c107'>&nbsp;</td>
                    	<td data-class='c108'>&nbsp;</td>
                    	<td data-class='c109'>&nbsp;</td>
                    	<td data-class='c110'>&nbsp;</td>
                    	<td data-class='c111'>&nbsp;</td>
                    	<td data-class='c112'>&nbsp;</td>
                    	<td data-class='c113'>&nbsp;</td>
                    	<td data-class='c114'>&nbsp;</td>
                    	<td data-class='c115'>&nbsp;</td>
                    	<td data-class='c116'>&nbsp;</td>
                    	<td data-class='c117'>&nbsp;</td>
                    	<td data-class='c118'>&nbsp;</td>
                    	<td data-class='c119'>&nbsp;</td>
                    	<td data-class='c120'>&nbsp;</td>
                    	<td data-class='c121'>&nbsp;</td>
                    	<td data-class='c122'>&nbsp;</td>
                    	<td data-class='c123'>&nbsp;</td>
                    	<td data-class='c124'>&nbsp;</td>
                    	<td data-class='c125'>&nbsp;</td>
                    	<td data-class='c126'>&nbsp;</td>
                    	<td data-class='c127'>&nbsp;</td>
                    	<td data-class='c128'>&nbsp;</td>
                    	<td data-class='c129'>&nbsp;</td>
                    	<td data-class='c130'>&nbsp;</td>
                    	<td data-class='c131'>&nbsp;</td>
                    	<td data-class='c132'>&nbsp;</td>
                    	<td data-class='c133'>&nbsp;</td>
                    	<td data-class='c134'>&nbsp;</td>
                    	<td data-class='c135'>&nbsp;</td>
                    	<td data-class='c136'>&nbsp;</td>
                    	<td data-class='c137'>&nbsp;</td>
                    	<td data-class='c138'>&nbsp;</td>
                    	<td data-class='c139'>&nbsp;</td>
                    	<td data-class='c140'>&nbsp;</td>
                    	<td data-class='c141'>&nbsp;</td>
                    	<td data-class='c142'>&nbsp;</td>
                    	<td data-class='c143'>&nbsp;</td>
                    	<td data-class='c144'>&nbsp;</td>
                    	<td data-class='c145'>&nbsp;</td>
                    	<td data-class='c146'>&nbsp;</td>
                    	<td data-class='c147'>&nbsp;</td>
                    	<td data-class='c148'>&nbsp;</td>
                    	<td data-class='c149'>&nbsp;</td>
                    	<td data-class='c150'>&nbsp;</td>
                    	<td data-class='c151'>&nbsp;</td>
                    	<td data-class='c152'>&nbsp;</td>
                    	<td data-class='c153'>&nbsp;</td>
                    	<td data-class='c154'>&nbsp;</td>
                    	<td data-class='c155'>&nbsp;</td>
                    	<td data-class='c156'>&nbsp;</td>
                    	<td data-class='c157'>&nbsp;</td>
                    	<td data-class='c158'>&nbsp;</td>
                    	<td data-class='c159'>&nbsp;</td>
                    	<td data-class='c160'>&nbsp;</td>
                    	<td data-class='c161'>&nbsp;</td>
                    	<td data-class='c162'>&nbsp;</td>
                    	<td data-class='c163'>&nbsp;</td>
                    	<td data-class='c164'>&nbsp;</td>
                    	<td data-class='c165'>&nbsp;</td>
                    	<td data-class='c166'>&nbsp;</td>
                    	<td data-class='c167'>&nbsp;</td>
                    	<td data-class='c168'>&nbsp;</td>
                    	<td data-class='c169'>&nbsp;</td>
                    </tr>                
                </tbody>                 
            </table>                     
                                         
		</div>                           
		<!-- end -->                     
                                         
	</section>                           
                                         
</html>                                  
                                         
                                         
                                         
                                         
                                         
                                         
                                         
                                         
                                         
                                         
                                         