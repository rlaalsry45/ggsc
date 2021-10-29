<%@ page import="egovframework.rte.psl.dataaccess.util.EgovMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
	<script src="/js/util/paging.js"></script>

  </head>
<script type="text/javascript">
	$(document).ready(function() {

		$("select[name=schJoinOrgCd]").val("${vo.schJoinOrgCd}");
		$("select[name=schCenterGb]").val("${vo.schCenterGb}");
	});
	

	function list(curPage) {
		$("#currentPageNo").val(curPage);
		document.searchForm.action = "/gnoincoundb/ntwkMeetRptList.do";
       	document.searchForm.submit();
	}
	
	$('input[type="text"]').keydown(function() {
		  if (event.keyCode === 13) {
		    list(1);
		  };
	});
	
	function fn_detail(ntwkMeetNo){
		$("#ntwkMeetNo").val(ntwkMeetNo);
		document.searchForm.action = "/gnoincoundb/ntwkMeetRptDtl.do";
       	document.searchForm.submit();
	}
	
	function fn_reg(){
		$("#ntwkMeetNo").val(0);
		document.searchForm.action = "/gnoincoundb/ntwkMeetRptDtl.do";
       	document.searchForm.submit();
	}
	
	
	function fn_pdf() {
		
	}
	
	
</script>
<style>
	.search-group select{width:150px;}
	.label {margin-right:40px;}
	.label2 {display:inline-block;width:275px;color:#333;padding-right:5px;margin-bottom:2px;letter-spacing:-0.5px;text-align:right;}
</style>
<section id="content">
	<h2 class="h2-title"><i class="fa fa-check-square"></i>네트워크구축회의보고서</h2>
		<div class="box-style1 x-scroll-auto" >
				<!-- 검색영역 -->
		<form name="searchForm" id="searchForm" method="get" onsubmit="return false">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			<input type="hidden" id="currentPageNo" name="currentPageNo" value="1" />
			<input type="hidden" id="mnuCd" name="mnuCd" value="${mnuCd }" />
				<input type="hidden" id="ntwkMeetNo" name="ntwkMeetNo" value="0" />
			
			<div class="search-box">
				<div class="search-group" style="margin-left:70px;">
					<span class="label"><label>회의구분</label></span>
					<span class="label2">
						 <%-- <select name="schCnsGb" style="width:275px;">
						 	<option value="">전체</option>
						 	<c:forEach items="${cnsGbList }" var="result">
								<option value="${result.odr }" <c:if test="${result.odr == vo.schCnsGb}">selected</c:if>>${result.mclassNm }</option>
							</c:forEach>
						</select> --%>
						<select name="schJoinOrgCd" style="width:275px;">
							<option value="">전체</option>
							<c:forEach items="${partiInstList }" var="list">
								<option value="${list.odr }" <c:if test="${ list.odr eq result.joinOrgCd }">selected</c:if> >${list.mclassNm }</option>
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
					<span class="label"><label>상담실무자</label></span>
					<span class="label2">
						<input type="text" name="schCnsrNm" style="width:275px;" value='${vo.schCnsrNm}' enterSearch data-button='#searchBtn'>
					</span>
				</div>
				<div class="search-group" style="margin-left:70px;">
					<span class="label">등록일</span> 
					<%-- <input type="text" name="schStartDate" id="datepicker1" value="${vo.schStartDate }" style="width: 100px;" readOnly/> &nbsp;&nbsp;&nbsp; ~ &nbsp;<input type="text" name="schEndDate" id="datepicker2" value="${vo.schEndDate}" style="width: 100px;" readOnly/> --%>
					<input type="text" name="schStartDate" id="datepicker1" style="width: 100px;" value="${vo.schStartDate }" readOnly/> &nbsp;&nbsp;&nbsp; ~ &nbsp;<input type="text" name="schEndDate" id="datepicker2" style="width: 100px;" value="${vo.schEndDate }" readOnly/>
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
				<button type="button" class="btn-basic" onClick="javascript:fn_reg();" style="background-color:green;color:white;">등록</button>	
				<button type="button" class="btn-basic" onClick="fn_excelDownload(3, document.searchForm);" style="background-color:green;color:white;">Excel 다운로드</button>	
			</div>	
			<table class="table-style1" style="margin-bottom: 5px;">
				<colgroup> 
					<col width="5%"></col>
					<%-- <col width="15%"></col> --%> 
					<col width="25%"></col>
					<col width="10%"></col>
					<col width="10%"></col>
					<col width="10%"></col>
					<col width="25%"></col>
					<col width="10%"></col>
				</colgroup>
				<thead>
					<tr>
						<th scope="col">순번</th>
						<!-- <th scope="col">지역</th> -->
						<th scope="col">참여기관</th> 
						<th scope="col">회의일자</th>
						<th scope="col">참여인원</th>
						<th scope="col">상담실무자</th>
						<th scope="col">장소</th>
						<th scope="col">등록일자</th>
					</tr>
				</thead>
				<tbody id="tby1">
					<c:if test="${ntwkMeetRptList.size() == 0 }">
						<tr>
							<td colspan="7">정보가 없습니다.</td>
						</tr>
					</c:if>
					<c:if test="${ntwkMeetRptList.size() > 0 }">
						<c:forEach items="${ntwkMeetRptList }" var="result">
							<tr onclick="javascript:fn_detail('${result.ntwkMeetNo}');">
								<td>${result.rnum }</td>
								<%-- <td>${result.localGbNm }</td> --%>
								<td>${result.joinOrgCdNm }</td>
								<td data-pattern='birth'>${result.meetDt }</td>
								<td>${result.joinMan }명</td>
								<td>${result.inputNm }</td>
								<td>${result.joinPlace }</td>
								<td data-pattern='birth' >${fn:substring(result.dbInsTm, 0, 10) }</td>
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

