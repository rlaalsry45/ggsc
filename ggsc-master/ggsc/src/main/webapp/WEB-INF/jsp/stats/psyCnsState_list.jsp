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
			url : "/gnoincoundb/psyCnsStateList_ajax.do",
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

	<h2 class="h2-title"><i class="fa fa-check-square"></i>심리검사별현황</h2>
		
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
							<c:forEach items="${cnsGbList }" var="list">
								<option value="${list.odr }" <c:if test="${list.odr == vo.schCnsGb}">selected</c:if>>${list.mclassNm }</option>
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
					<span class="label"><label>기간</label></span>
					<span class="label2">
						<input type="text" name="schDateGb" id="datepicker1" value="" style="width: 246px;" readOnly />
					</span>
				</div>
			</div>
		</form>
			<h3 class="h3-title" style="margin-top: 15px; margin-bottom:15px; ">○ 심리검사
				<div class="btn" style="float: right; margin: 0;">
					<button type="button" class="btn-basic" onclick="fn_excelDownload(1, document.searchForm)" style="background-color:green;color:white;">Excel 다운로드</button>		
				</div>
			</h3>
			
			
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
                        <td>대안관계변화</td>
                        <td>부부의사소통</td>
                        <td>MMSE-K 치매선별</td>
                        <td>기타</td>
                    </tr>
                    <tr>
                    	<td data-class='cntPsyTotal'>&nbsp;</td>
                    	<td data-class='cntPsyDukead'>&nbsp;</td>
                    	<td data-class='cntPsyGdskr'>&nbsp;</td>
                    	<td data-class='cntPsyGdssi'>&nbsp;</td>
                    	<td data-class='cntPsyPersonrel'>&nbsp;</td>
                    	<td data-class='cntPsyAnxiety'>&nbsp;</td>
                    	<td data-class='cntPsyStress'>&nbsp;</td>
                    	<td data-class='cntPsyBervstress'>&nbsp;</td>
                    	<td data-class='cntPsyCoupletk'>&nbsp;</td>
                    	<td data-class='cntPsyMmsek'>&nbsp;</td>
                    	<td data-class='cntPsyEtc'>&nbsp;</td>
                    </tr>
                </tbody>
            </table>
			
		</div>
		<!-- end -->

	</section>

</html>