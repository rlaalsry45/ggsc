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
			url : "/gnoincoundb/educationResultList_ajax.do",
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

	<h2 class="h2-title"><i class="fa fa-check-square"></i>교육실적</h2>
		
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
			</div>
		</form>
			<div class="btn-basic" style="width: 120px;text-align: center;">교육구분</div>
			<table class="table-style1">
                <colgroup>
                    <col style="width: 10%;" />
                    <col style="width: 10%;" />
                    <col style="width: 10%;" />
                    <col style="width: 10%;" />
                    <col style="width: 10%;" />
                    <col style="width: 10%;" />
                    <col style="width: 10%;" />
                    <col style="width: 10%;" />
                    <col style="width: 10%;" />
                    <col style="width: 10%;" />
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="col" colspan="2">소계</th>
                        <th scope="col" colspan="2">자살</th>
                        <th scope="col" colspan="2">학대</th>
                        <th scope="col" colspan="2">치매</th>
                        <th scope="col" colspan="2">일반</th>
                    </tr>
                    <tr>
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
                    </tr>
                </tbody>
            </table>
			
			<div class="btn-basic" style="margin-top: 15px; width: 120px;text-align: center;">교육시간</div>
			<table class="table-style1">
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
                    <col style="width: 7%;" />
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="col" colspan="2">소계(명,회)</th>
                        <th scope="col" colspan="6">단기</th>
                        <th scope="col" colspan="6">장기</th>
                    </tr>
                    <tr>
                    	<td rowspan="3">명</td>
                        <td rowspan="3">회</td>
                        <td colspan="3">명</td>
                        <td colspan="3">회</td>
                        <td colspan="3">명</td>
                        <td colspan="3">회</td>
                    </tr>
                    <tr>
                    	<td colspan="2">소규모</td>
                    	<td colspan="2">중규모</td>
                    	<td colspan="2">대규모</td>
                    	<td colspan="2">소규모</td>
                    	<td colspan="2">중규모</td>
                    	<td colspan="2">대규모</td>
                    </tr>
                    <tr>
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
                    </tr>
                </tbody>
            </table>
            
            <div class="btn-basic" style="margin-top: 15px; width: 120px;text-align: center;">교육세부(대상자)</div>
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
                    <col style="width: 6%;" />
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="col" colspan="2">소계</th>
                        <th scope="col" colspan="2">노인</th>
                        <th scope="col" colspan="2">일반주민</th>
                        <th scope="col" colspan="2">생사단</th>
                        <th scope="col" colspan="2">실버보듬이</th>
                        <th scope="col" colspan="2">실무자</th>
                        <th scope="col" colspan="2">공무원</th>
                        <th scope="col" colspan="2">청소년</th>
                    </tr>
                    <tr>
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
                    </tr>
                </tbody>
            </table>
            
            <div class="btn-basic" style="margin-top: 15px; width: 120px;text-align: center;">심리검사</div>
			<table class="table-style1">
                <colgroup>
                   	<col style="width: 33%;" />
                    <col style="width: 33%;" />
                    <col style="width: 33%;" />
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="col">소계</th>
                        <th scope="col">DUKE-AD</th>
                        <th scope="col">죽음, 학대 질문지</th>
                    </tr>
                    <tr>
                    	<td>건</td>
                    	<td>건</td>
                    	<td>건</td>
                    </tr>
                </tbody>
            </table>
            
		</div>
		<!-- end -->

	</section>

</html>
