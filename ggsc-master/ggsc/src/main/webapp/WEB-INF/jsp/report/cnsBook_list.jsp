<%@ page import="egovframework.rte.psl.dataaccess.util.EgovMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<script src="/gnoincoundb/js/util/paging.js"></script>

<script type="text/javascript">

	$(document).ready(function() {
		$("select[name=schCnsGb]").val("${vo.schCnsGb}");
		$("select[name=schCenterGb]").val("${vo.schCenterGb}");
	});
	function list(curPage) {
		$("#currentPageNo").val(curPage);
		document.searchForm.action = "/gnoincoundb/cnsBookList.do";
       	document.searchForm.submit();
	}
	
	$('input[type="text"]').keydown(function() {
		  if (event.keyCode === 13) {
		    list(1);
		  };
	});
	
	function fn_detail(caseNo){
		$("#caseNo").val(caseNo);
		document.searchForm.action = "/gnoincoundb/cnsEndDtl.do";
       	document.searchForm.submit();
	}

</script>
<style>
	.search-group select{width:150px;}
	.label {margin-right:40px;}
	.label2 {display:inline-block;width:275px;color:#333;padding-right:5px;margin-bottom:2px;letter-spacing:-0.5px;text-align:right;}
</style>
<section id="content">
	<h2 class="h2-title"><i class="fa fa-check-square"></i>상담대상자관리대장</h2>
		<div class="box-style1 x-scroll-auto" >
				<!-- 검색영역 -->
		<form name="searchForm" id="searchForm" method="get" onsubmit="return false">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			<input type="hidden" id="currentPageNo" name="currentPageNo" value="1" />
			<input type="hidden" id="mnuCd" name="mnuCd" value="${mnuCd }" />
			<input type="hidden" id="caseNo" name="caseNo" value="${vo.caseNo}" />
			
			<div class="search-box">
				<div class="search-group" style="margin-left:70px;">
					<span class="label"><label>상담구분</label></span>
					<span class="label2">
						 <select name="schCnsGb" style="width:275px;">
						 	<option value="">전체</option>
						 	<c:forEach items="${cnsGbList }" var="result">
								<option value="${result.odr }" <c:if test="${result.odr == vo.schCnsGb}">selected</c:if>>${result.mclassNm }</option>
							</c:forEach>
						</select>
					</span>
				</div>
				<div class="search-group" style="margin-left:70px;">
					<span class="label"><label>센터구분</label></span>
					<span class="label2">
						<select name="schCenterGb" style="width:275px;">
							<option value="">전체</option>
							<c:forEach items="${cnsCenterList }" var="result">
								<c:choose>
								<c:when test="${authCd > 1 }">
									<c:if test="${ result.num eq vo.schCenterGb }" >
										<option value="${result.num }" >${result.centerGb }</option>
									</c:if>
								</c:when>
								<c:when test="${authCd <= 1 }">								
									<option value="${result.num }" >${result.centerGb }</option>
								</c:when>
								</c:choose>
							</c:forEach>
						</select>
					</span>
				</div>
				<br>
				<div class="search-group" style="margin-left:70px;">
					<span class="label"><label>내담자</label></span>
					<span class="label2">
						<input type="text" name="schCnsleNm" style="width:275px;" value="${vo.schCnsleNm}" enterSearch data-button='#searchBtn'>
					</span>
				</div>
				<div class="search-group" style="margin-left:70px;">
					<span class="label">등록일</span> 
					<%-- <input type="text" name="schStartDate" id="datepicker1" value="${vo.schStartDate }" style="width: 100px;" readOnly/> &nbsp;&nbsp;&nbsp; ~ &nbsp;<input type="text" name="schEndDate" id="datepicker2" value="${vo.schEndDate}" style="width: 100px;" readOnly/> --%>
					<input type="text" name="schStartDate" id="datepicker1"  style="width: 100px;" value="${vo.schStartDate }" readOnly/> &nbsp;&nbsp;&nbsp; ~ &nbsp;<input type="text" name="schEndDate" id="datepicker2"  style="width: 100px;" value="${vo.schEndDate }" readOnly/>
				</div>
				<div class="btn" style="padding-bottom:15px; padding-right:120px;">
					<button type="button" class="btn-search" id="searchBtn" onclick="javascript:list(1);">
						<i class="fa fa-search"></i>검색
					</button>
				</div>
			</div>
		</form>
			
			<span style="float:left; margin: 0;">
				검색 총수 : <span id="totalPageCnt">${totalPageCnt }</span> 건 
			</span>
			<div class="btn" style="float: right; margin: 0;">
				<button type="button" class="btn-basic" onClick="fn_excelDownload(1, document.searchForm)" style="background-color:green;color:white;">Excel 다운로드</button>		
			</div>	
			<table class="table-style1" style="margin-bottom: 5px;">
				<colgroup> 
					<col width="5%"></col>
					<col width="10%"></col> 
					<col width="12%"></col>
					<col width="8%"></col>
					<col width="10%"></col>
					<col width="5%"></col>
					<col width="20%"></col>
					<col width="10%"></col>
					<col width="15%"></col>
					<%-- <col width="5%"></col> --%>
				</colgroup>
				<thead>
					<tr>
						<th scope="col">연번</th>
						<th scope="col">상담일시(회기)</th>
						<th scope="col">상담경위</th> 
						<th scope="col">성명</th>
						<th scope="col">생년월일</th>
						<th scope="col">성별</th>
						<th scope="col">주소</th>
						<th scope="col">연락처</th>
						<th scope="col">주호소내용</th>
						<!-- <th scope="col">연계</th> -->
					</tr>
				</thead>
				<tbody id="tby1">
					<c:if test="${cnsBookList.size() == 0 }">
						<tr>
							<td colspan="9">정보가 없습니다.</td>
						</tr>
					</c:if>
					<c:if test="${cnsBookList.size() > 0 }">
						<c:forEach items="${cnsBookList }" var="result">
							<tr>
								<td>${result.rnum }</td>
								<td><span data-pattern='birth'>${result.cnsDt }</span>(${result.cnsCnt }회)</td>
								<td>${result.cnsDtlNm }</td>
								<td>${result.cnsleNm }</td>
								<td data-pattern='birth'>${result.birthDt }</td>
								<td>${result.gender }</td>
								<td style='text-align:left; text-indent:10px'>${result.addr }</td>
								<td data-pattern='mobile'>${result.mobile }</td>
								<td>${result.majorApplNm }</td>
								<%-- <td>${result.linkReq }</td> --%>
							</tr> 
						</c:forEach>
					</c:if>
				</tbody>

			</table>
			<div class="paginate" id="page1">
				<div id="paging">
                    <ul class="pagination">
                      	<ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="list" />
                      	<form:hidden path="pageIndex" />
                    </ul>
                </div>
			</div>
			<!-- // 페이징 -->
		</div>
		<!-- end -->
	</section>

</html>

