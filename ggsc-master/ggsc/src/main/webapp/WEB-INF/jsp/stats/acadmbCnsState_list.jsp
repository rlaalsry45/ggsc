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
			url : "/gnoincoundb/acadmbCnsStateList_ajax.do",
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

	<h2 class="h2-title"><i class="fa fa-check-square"></i>학력별상담현황</h2>
		
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
					<span class="label"><label>일자</label></span>
					<span class="label2">
						<input type="text" name="schDateGb" id="datepicker1" value="" style="width: 246px;" />
					</span>
				</div>
				<div class="search-group" style="margin-left:70px;">
					<span class="label"><label>성별</label></span>
					<span class="label2">
						<select name="schGenderGb" style="width:275px;">
							<option value="">전체</option>
							<option value="F">여성</option>
							<option value="M">남성</option>
						</select>
					</span>
				</div>
		</div>
		</form>
			<h3 class="h3-title" style="margin-top: 15px;">1. 학력별 내담자 현황</h3>
			<table class="table-style1">
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
                        <th scope="col" colspan="10">학력별 내담자 현황</th>
                    </tr>
                    <tr>
                        <td rowspan="2">명<br>(실인원)</td>
                        <td rowspan="2">건<br>(연인원)</td>
                        <td colspan="2">대졸이상</td>
                        <td colspan="2">대졸</td>
                        <td colspan="2">전졸</td>
                        <td colspan="2">고졸</td>
                        <td colspan="2">고졸이하</td>
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
            
            <h3 class="h3-title" style="margin-top: 15px;">2. 학력별 상담현황</h3>
			<table class="table-style1">
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
                        <th scope="col" rowspan="2">계(건)</th>
                        <th scope="col" colspan="6">개인상담(건)</th>
                        <th scope="col" colspan="8">집단상담(건)</th>
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
                    	<td>대졸이상</td>
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
                    <tr>
                    	<td>대졸</td>
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
                    <tr>
                    	<td>전졸</td>
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
                    <tr>
                    	<td>고졸</td>
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
                    <tr>
                    	<td>고졸이하</td>
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
            
            <h3 class="h3-title" style="margin-top: 15px;">3. 학력별 주호소 현황</h3>
			<table class="table-style1">
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
                        <th scope="col" colspan="11">주호소 현황</th>
                    </tr>
                    <tr>
                        <td>학력구분</td>
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
                    	<td>대졸이상</td>
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
                    <tr>
                    	<td>대졸</td>
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
                    <tr>
                    	<td>전졸</td>
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
                    <tr>
                    	<td>고졸</td>
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
                    <tr>
                    	<td>고졸이하</td>
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
            
            <h3 class="h3-title" style="margin-top: 15px;">3. 학력별 심리검사 현황</h3>
			<table class="table-style1">
                <colgroup>
                    <col style="width: 9%;" />
                    <col style="width: 9%;" />
                    <col style="width: 9%;" />
                    <col style="width: 10%;" />
                    <col style="width: 9%;" />
                    <col style="width: 9%;" />
                    <col style="width: 9%;" />
                    <col style="width: 9%;" />
                    <col style="width: 9%;" />
                    <col style="width: 9%;" />
                    <col style="width: 8%;" />
                </colgroup>
                <tbody>
                    <tr>
                    	<th scope="col" rowspan="2">학력구분</th>
                        <th scope="col" colspan="11">심리검사</th>
                    </tr>
                    <tr>
                        <td>DUKE-AD<br>간략우울</td>
                        <td>GDS-KR<br>노인우울</td>
                        <td>GDS-SI<br>노인우울자살사고</td>
                        <td>불안</td>
                        <td>스트레스</td>
                        <td>사별 스트레스</td>
                        <td>대인관계변화</td>
                        <td>부부의사소통</td>
                        <td>MMSE-K<br>치매선별</td>
                        <td>기타</td>
                    </tr>
                    <tr>
                    	<td>대졸이상</td>
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
                    <tr>
                    	<td>대졸</td>
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
                    <tr>
                    	<td>전졸</td>
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
                    <tr>
                    	<td>고졸</td>
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
                    <tr>
                    	<td>고졸이하</td>
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
			
		</div>
		<!-- end -->

	</section>

</html>
