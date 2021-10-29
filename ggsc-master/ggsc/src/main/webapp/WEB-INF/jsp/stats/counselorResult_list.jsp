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
			url : "/gnoincoundb/counselorResultList_ajax.do",
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
			console.log(d);
		}).fail(function(e){
			alert("서버와 통신 오류입니다.");
		});
	}
</script>

<style>
	.search-group select{width:150px;}
	.label {margin-right:40px;}
	.label2 {display:inline-block;width:275px;color:#333;padding-right:5px;margin-bottom:2px;letter-spacing:-0.5px;text-align:right;}
	
</style>
<section id="content">

	<h2 class="h2-title"><i class="fa fa-check-square"></i>상담사별 실적</h2>
		
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
						 <select name="schCnsGb" style="width:275px;">
						 	<option value="">전체</option>
							<c:forEach items="${cnsGbList }" var="result">
								<option value="${result.odr }">${result.mclassNm }</option>
							</c:forEach>
						</select>
					</span>
					<!-- <span class="form"><input type="text" name="schText" id="schText" value="" /></span> -->
				</div>
				<div class="search-group" style="margin-left:70px;">
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
				<div class="btn" style="padding-bottom:15px;padding-right:120px;">
					<button type="button" class="btn-search" id="searchBtn" onclick="javascript:list(1);">
						<i class="fa fa-search"></i>검색
					</button>
				</div>
				<div class="search-group" style="margin-left:70px;">
					<span class="label"><label>일   자</label></span>
					<span class="label2">
						<input type="text" name="schDateGb" id="datepicker1" value="" style="width: 246px;" />
					</span>
				</div>
				<div class="search-group" style="margin-left:70px;">
					<span class="label"><label>상담사</label></span>
					<span class="label2">
						<span class="form"><input type="text" name="schSigunNm" id="schSigunNm" value="" style="width: 275px;" /></span>
					</span>
				</div>
			</div>
		</form>
			<%-- <table class="table-style1" style="margin-top:1px;">
                <colgroup>
                    <col style="width: 25%;" />
                    <col style="width: 10%;" />
                    <col style="width: 65%;" />
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="col">구분</th>
                        <th scope="col" colspan="2">모든 자료 입력 후 일치여부 꼭 확인하여 제출 부탁드립니다.</th>
                    </tr>
                    <tr>
                        <td>실적(명) 일치여부</td>
                        <td>○</td>
                        <td>일치합니다.</td>
                    </tr>
                    <tr>
                        <td>실적(건) 일치여부</td>
                        <td>○</td>
                        <td>일치합니다.</td>
                    </tr>
                    <tr>
                        <td>교육(회) 일치여부</td>
                        <td>○</td>
                        <td>일치합니다.</td>
                    </tr>
                    <tr>
                        <td>교육(명) 일치여부</td>
                        <td>○</td>
                        <td>일치합니다.</td>
                    </tr>
                </tbody>
            </table> --%>
            
			<table class="table-style1" style="margin-top:15px;">
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
                        <th scope="col" colspan="9" style="text-align: left;">1-1. 성별</th>
                    </tr>
                    <tr>
                        <td rowspan="3">구분</td>
                        <td rowspan="2" colspan="2">계</td>
                        <td colspan="6">성별</td>
                    </tr>
                    <tr>
                    	<td colspan="2">소계</td>
                    	<td colspan="2">남</td>
                    	<td colspan="2">여</td>
                    </tr>
                    <tr>
                    	<td>명(실인원)</td>
                    	<td>건(연인원)</td>
                    	<td>명</td>
                    	<td>건</td>
                    	<td>명</td>
                    	<td>건</td>
                    	<td>명</td>
                    	<td>건</td>
                    </tr>
                    <tr>
                    	<td>5월</td>
                    	<td data-class='c1'>&nbsp;</td>
                    	<td data-class='c2'>&nbsp;</td>
                    	<td data-class='c3'>&nbsp;</td>
                    	<td data-class='c4'>&nbsp;</td>
                    	<td data-class='c5'>&nbsp;</td>
                    	<td data-class='c6'>&nbsp;</td>
                    	<td data-class='c7'>&nbsp;</td>
                    	<td data-class='c8'>&nbsp;</td>
                    </tr>
                </tbody>
            </table>
			
			<table class="table-style1" style="margin-top:15px;">
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
                        <th scope="col" colspan="9" style="text-align: left;">1-2. 내담자와의 관계</th>
                    </tr>
                    <tr>
                        <td rowspan="3">구분</td>
                        <td rowspan="2">계</td>
                        <td rowspan="2">본인</td>
                        <td colspan="6">본인외</td>
                    </tr>
                    <tr>
                    	<td>소계</td>
                    	<td>배우자</td>
                    	<td>자녀</td>
                    	<td>친인척</td>
                    	<td>이웃</td>
                    	<td>유관기관</td>
                    </tr>
                    <tr>
                    	<td>건(연인원)</td>
                    	<td>건</td>
                    	<td>명</td>
                    	<td>건</td>
                    	<td>건</td>
                    	<td>건</td>
                    	<td>건</td>
                    	<td>건</td>
                    </tr>
                    <tr>
                    	<td>5월</td>
                    	<td data-class='c9'>&nbsp;</td>
                    	<td data-class='c10'>&nbsp;</td>
                    	<td data-class='c11'>&nbsp;</td>
                    	<td data-class='c12'>&nbsp;</td>
                    	<td data-class='c13'>&nbsp;</td>
                    	<td data-class='c14'>&nbsp;</td>
                    	<td data-class='c15'>&nbsp;</td>
                    	<td data-class='c16'>&nbsp;</td>
                    </tr>
                </tbody>
            </table>
			
			<table class="table-style1" style="margin-top:15px;">
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
                        <th scope="col" colspan="13" style="text-align: left;">1-3. 연령별 현황</th>
                    </tr>
                    <tr>
                        <td rowspan="3">구분</td>
                        <td rowspan="2" colspan="2">계</td>
                        <td colspan="10">연령</td>
                    </tr>
                    <tr>
                    	<td colspan="2">60대</td>
                    	<td colspan="2">70대</td>
                    	<td colspan="2">80대</td>
                    	<td colspan="2">90대</td>
                    	<td colspan="2">60대 미만</td>
                    </tr>
                    <tr>
                    	<td>명(실인원)</td>
                    	<td>건(연인원)</td>
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
                    	<td>5월</td>
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
                    </tr>
                </tbody>
            </table>
            
            <table class="table-style1" style="margin-top:15px;">
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
                        <th scope="col" colspan="15" style="text-align: left;">2. 상담경위</th>
                    </tr>
                    <tr>
                        <td rowspan="3">구분</td>
                        <td rowspan="3">계(명)</td>
                        <td colspan="12">상담경위</td>
                        <td rowspan="3">기존내<br>담당자(명)</td>
                    </tr>
                    <tr>
                    	<td rowspan="2">소계</td>
                    	<td>내부의뢰</td>
                    	<td colspan="7">외부의뢰</td>
                    	<td rowspan="2">자발적신청</td>
                    	<td rowspan="2">발굴</td>
                    	<td rowspan="2">기타</td>
                    </tr>
                    <tr>
                    	<td>수행기관</td>
                    	<td>소계</td>
                    	<td>치매예방센터</td>
                    	<td>정신겅강복지센터</td>
                    	<td>노인보호전문기관</td>
                    	<td>방문간호센터</td>
                    	<td>행정기관</td>
                    	<td>기타</td>
                    </tr>
                    <tr>
                    	<td>5월</td>
                    	<td data-class='c29'>&nbsp;</td>
                    	<td data-class='c30'>&nbsp;</td>
                    	<td data-class='c31'>&nbsp;</td>
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
                    </tr>
                </tbody>
            </table>
            
             <table class="table-style1" style="margin-top:15px;">
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
                        <th scope="col" colspan="16" style="text-align: left;">3. 상담방법</th>
                    </tr>
                    <tr>
                        <td rowspan="2">구분</td>
                        <td rowspan="2">계(건)</td>
                        <td colspan="6">개인상담(건)</td>
                        <td colspan="8">집단상담(건)</td>
                    </tr>
                    <tr>
                    	<td>소계</td>
                    	<td>내방</td>
                    	<td>방문</td>
                    	<td>전화</td>
                    	<td>온라인</td>
                    	<td>기타</td>
                    	<td>소계</td>
                    	<td>사별애도</td>
                    	<td>죽음준비</td>
                    	<td>관계개선의사소통</td>
                    	<td>심리정서</td>
                    	<td>자아통합</td>
                    	<td>치매예방</td>
                    	<td>기타</td>
                    </tr>
                    <tr>
                    	<td>5월</td>
                    	<td data-class='c43'></td>
                    	<td data-class='c44'></td>
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
                        <th scope="col" colspan="12" style="text-align: left;">○&nbsp; 4-1. 상담</th>
                    </tr>
                    <tr>
                        <td>구분</td>
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
                    	<td>5월</td>
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
                    </tr>
                </tbody>
            </table>
            
            <table class="table-style1" style="margin-top:15px;">
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
                        <th scope="col" colspan="9" style="text-align: left;">○&nbsp; 4-2. 연계(내부)</th>
                    </tr>
                    <tr>
                        <td rowspan="2">구분</td>
                        <td rowspan="2">합계(건)<br>(내부+외부)</td>
                        <td colspan="7">내부연계(수행기관)</td>
                    </tr>
                    <tr>
                    	<td>내부연계 소계</td>
                    	<td>여가</td>
                    	<td>법률,세무</td>
                    	<td>경제후원</td>
                    	<td>취업,일자리</td>
                    	<td>생활,식생활,주거</td>
                    	<td>기타</td>
                    </tr>
                    <tr>
                    	<td>5월</td>
                    	<td data-class='c69'>&nbsp;</td>
                    	<td data-class='c70'>&nbsp;</td>
                    	<td data-class='c71'>&nbsp;</td>
                    	<td data-class='c72'>&nbsp;</td>
                    	<td data-class='c73'>&nbsp;</td>
                    	<td data-class='c74'>&nbsp;</td>
                    	<td data-class='c75'>&nbsp;</td>
                    	<td data-class='c76'>&nbsp;</td>
                    </tr>
                </tbody>
            </table>
            
            <table class="table-style1" style="margin-top:15px;">
                <colgroup>
                    <col style="width: 5%;" />
                    <col style="width: 7%;" />
                    <col style="width: 7%;" />
                    <col style="width: 7%;" />
                    <col style="width: 7%;" />
                    <col style="width: 7%;" />
                    <col style="width: 7%;" />
                    <col style="width: 7%;" />
                    <col style="width: 9%;" />
                    <col style="width: 7%;" />
                    <col style="width: 9%;" />
                    <col style="width: 7%;" />
                    <col style="width: 5%;" />
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="col" colspan="13" style="text-align: left;">○&nbsp; 4-2. 연계(외부)</th>
                    </tr>
                    <tr>
                        <td rowspan="2">구분</td>
                        <td colspan="12">외부연계</td>
                    </tr>
                    <tr>
                    	<td>외부연계소계</td>
                    	<td>정신보건자살<br>예방센터</td>
                    	<td>노인보호<br>전문기관</td>
                    	<td>보건소<br>방문간호</td>
                    	<td>일자리<br>관련기관</td>
                    	<td>무한돌봄센터<br>긴급지원</td>
                    	<td>법률기관</td>
                    	<td>성폭력<br>가정폭력상담소</td>
                    	<td>치매안심센터</td>
                    	<td>건강가정다문화<br>가정지원센터</td>
                    	<td>행정기관<br>주민센터</td>
                    	<td>기타</td>
                    </tr>
                    <tr>
                    	<td>5월</td>
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
                    </tr>
                </tbody>
            </table>
            
            <table class="table-style1" style="margin-top:15px;">
                <colgroup>
                    <col style="width: 6%;" />
                    <col style="width: 6%;" />
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
                        <th scope="col" colspan="10" style="text-align: left;">○&nbsp; 4-3. 상담진행현황</th>
                    </tr>
                    <tr>
                        <td rowspan="2">구분</td>
                        <td rowspan="2">계(건)</td>
                        <td colspan="3">단회기 상담(1회 종결)<br>단순 정보 상담 및 복지서비스 안내</td>
                        <td colspan="5">지속상담 : 초기 상담 후 지속적인 상담이 필요한 경우</td>
                    </tr>
                    <tr>
                    	<td>소계</td>
                    	<td>단순 정보 상담</td>
                    	<td>복지서비스안내</td>
                    	<td>소계</td>
                    	<td>10회기이내</td>
                    	<td>20회기이내</td>
                    	<td>20회기 이상<br>30회기 미만</td>
                    	<td>30회기 이상</td>
                    </tr>
                    <tr>
                    	<td>5월</td>
                    	<td data-class='c89'>&nbsp;</td>
                    	<td data-class='c90'>&nbsp;</td>
                    	<td data-class='c91'>&nbsp;</td>
                    	<td data-class='c92'>&nbsp;</td>
                    	<td data-class='c93'>&nbsp;</td>
                    	<td data-class='c94'>&nbsp;</td>
                    	<td data-class='c95'>&nbsp;</td>
                    	<td data-class='c96'>&nbsp;</td>
                    	<td data-class='c97'>&nbsp;</td>
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
                        <th scope="col" colspan="12" style="text-align: left;">○&nbsp; 4-4. 심리검사</th>
                    </tr>
                    <tr>
                        <td>구분</td>
                        <td>계(건)</td>
                        <td>DUKE-AD<br>간략우울</td>
                        <td>GDS-KR<br>노인우울</td>
                        <td>GDS-SI<br>노인우울자살사고</td>
                        <td>불안</td>
                        <td>스트레스</td>
                        <td>사별스트레스</td>
                        <td>대인관계변화</td>
                        <td>부부의사소통</td>
                        <td>MVSE-K<br>치매선별</td>
                        <td>기타</td>
                    </tr>
                    <tr>
                    	<td>5월</td>
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
                        <th scope="col" colspan="8" style="text-align: left;">5. 상담지원봉사자 활동</th>
                    </tr>
                    <tr>
                        <td>구분</td>
                        <td>계(건)</td>
                        <td>사후관리<br>안부확인(방문)</td>
                        <td>사후관리<br>안부확인(전화)</td>
                        <td>심리검사</td>
                        <td>연계상담동행</td>
                        <td>홍보활동</td>
                        <td>기타</td>
                    </tr>
                    <tr>
                    	<td>5월</td>
                    	<td data-class='c109'>&nbsp;</td>
                    	<td data-class='c110'>&nbsp;</td>
                    	<td data-class='c111'>&nbsp;</td>
                    	<td data-class='c112'>&nbsp;</td>
                    	<td data-class='c113'>&nbsp;</td>
                    	<td data-class='c114'>&nbsp;</td>
                    	<td data-class='c115'>&nbsp;</td>
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
                        <th scope="col" colspan="8" style="text-align: left;">6. 네트워크 활동</th>
                    </tr>
                    <tr>
                        <td>구분</td>
                        <td>계(건)</td>
                        <td>권역네트워크회의</td>
                        <td>네트워크회의<br>(구.권역장회의)</td>
                        <td>실무회의</td>
                        <td>기관내부사례회의</td>
                        <td>지역사회네트워킹회의</td>
                        <td>기타</td>
                    </tr>
                    <tr>
                    	<td>5월</td>
                    	<td data-class='c116'>&nbsp;</td>
                    	<td data-class='c117'>&nbsp;</td>
                    	<td data-class='c118'>&nbsp;</td>
                    	<td data-class='c119'>&nbsp;</td>
                    	<td data-class='c120'>&nbsp;</td>
                    	<td data-class='c121'>&nbsp;</td>
                    	<td data-class='c122'>&nbsp;</td>
                    </tr>
                </tbody>
            </table>
            
            <table class="table-style1" style="margin-top:15px;">
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
                        <th scope="col" colspan="13" style="text-align: left;">○&nbsp;7-1. 대상</th>
                    </tr>
                    <tr>
                        <td rowspan="2">구분</td>
                        <td colspan="2">계</td>
                        <td colspan="2">노인</td>
                        <td colspan="2">일반주민</td>
                        <td colspan="2">소속기관</td>
                        <td colspan="2">유관기관</td>
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
                    </tr>
                    <tr>
                    	<td>5월</td>
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
                    </tr>
                </tbody>
            </table>
            
            <table class="table-style1" style="margin-top:15px;">
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
                        <th scope="col" colspan="13" style="text-align: left;">○&nbsp;7-2. 진행형태</th>
                    </tr>
                    <tr>
                        <td rowspan="2">구분</td>
                        <td colspan="2">계</td>
                        <td colspan="2">상담사</td>
                        <td colspan="2">강사</td>
                    </tr>
                    <tr>
                    	<td>회</td>
                    	<td>명</td>
                    	<td>회</td>
                    	<td>명</td>
                    	<td>회</td>
                    	<td>명</td>
                    </tr>
                    <tr>
                    	<td>5월</td>
                    	<td data-class='c135'>&nbsp;</td>
                    	<td data-class='c136'>&nbsp;</td>
                    	<td data-class='c137'>&nbsp;</td>
                    	<td data-class='c138'>&nbsp;</td>
						<td data-class='c139'>&nbsp;</td>
                    	<td data-class='c140'>&nbsp;</td>       
                    </tr>
                </tbody>
            </table>
            
            <table class="table-style1" style="margin-top:15px;">
                <colgroup>
                    <col style="width: 5%;" />
                    <col style="width: 5%;" />
                    <col style="width: 5%;" />
                    <col style="width: 5%;" />
                    <col style="width: 5%;" />
                    <col style="width: 5%;" />
                    <col style="width: 5%;" />
                    <col style="width: 5%;" />
                    <col style="width: 5%;" />
                    <col style="width: 5%;" />
                    <col style="width: 5%;" />
                    <col style="width: 5%;" />
                    <col style="width: 5%;" />
                    <col style="width: 5%;" />
                    <col style="width: 5%;" />
                    <col style="width: 5%;" />
                    <col style="width: 5%;" />
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="col" colspan="17" style="text-align: left;">○&nbsp;7-3. 내용</th>
                    </tr>
                    <tr>
                        <td rowspan="2">구분</td>
                        <td colspan="2">계</td>
                        <td colspan="2">심리정서</td>
                        <td colspan="2">관계개선</td>
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
                    	<td>회</td>
                    	<td>명</td>
                    </tr>
                    <tr>
                    	<td>5월</td>
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
                    </tr>
                </tbody>
            </table>
            
            <table class="table-style1" style="margin-top:15px;">
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
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="col" colspan="14" style="text-align: left;">8. 홍보</th>
                    </tr>
                    <tr>
                        <td rowspan="2">구분</td>
                        <td colspan="3">계</td>
                        <td colspan="2">행사홍보(지역축제,기관행사 등)</td>
                        <td colspan="2">방문홍보</td>
                        <td>대중매체</td>
                        <td>인터넷</td>
                        <td>설치물(현수막,베너)</td>
                        <td colspan="2">홍보물품(해당 월 <br>제작 물품만 기재)</td>
                        <td>기타(벽보 등)</td>
                    </tr>
                    <tr>
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
                    	<td>5월</td>
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
                    	<!-- <td data-class='c170'>&nbsp;</td>
                    	<td data-class='c171'>&nbsp;</td>
                    	<td data-class='c171'>&nbsp;</td>
                    	<td data-class='c171'>&nbsp;</td> -->
                    </tr>
                </tbody>
            </table>
            
		</div>
		<!-- end -->

	</section>

</html>
