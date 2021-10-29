<%@ page import="egovframework.rte.psl.dataaccess.util.EgovMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<script src="/gnoincoundb/js/util/paging.js"></script>
<script src="/gnoincoundb/js/html2canvas.min.js" ></script>
<script src="/gnoincoundb/js/jspdf.min.js" ></script>

<script type="text/javascript">
	$(document).ready(function() {
		var page = "${page}";
		if(page == ""){
			page = 1;
		}
		
		var schCnsGb = "${vo.schCnsGb}";
		var schCenterGb = "${vo.schCenterGb}";
		$("select[name=schCnsGb]").val(schCnsGb);
		$("select[name=schCenterGb]").val(schCenterGb);
		$("#totalPageCnt").html("${totalPageCnt}");
		
	});

	function fn_excelDown(){
		document.location.href = "/gnoincoundb/cnsAcptExcelDown.do";
	}
	
	function fn_down(fileNm, sysFileNm, filePath){
		$("#fileNm").val(fileNm);
		$("#sysFileNm").val(sysFileNm);
		$("#filePath").val(filePath);
		document.downForm.action = "/gnoincoundb/fileDown.do";
       	document.downForm.submit();
	}
	
	function fn_popup(type, caseNo){
		var url = "/gnoincoundb/cnsAcceptDtl.do?type=" + type + "&caseNo=" + caseNo;
		var name = "신청자정보";
		var option = "width = 530, height = 750, top = 50, left = 500, location = yes";
		window.open(url, name, option);
	}
	
	function fn_reg(mnuCd){
		document.location.href = "/gnoincoundb/ealyCnsDocDtl.do?mnuCd=" + mnuCd;
	}
	
	function fn_detail(caseNo){
		var mnuCd = $("#mnuCd").val();
		document.location.href = "/gnoincoundb/ealyCnsDocDtl.do?caseNo=" + caseNo + "&mnuCd=" + mnuCd;
	}
	
	function fn_search(mnuCd) {
		document.searchForm.action = "/gnoincoundb/ealyCnsDocList.do?mnuCd="+mnuCd;
       	document.searchForm.submit(); 
	}
	
	function list(curPage) {
		
		$("#currentPageNo").val(curPage);
		document.searchForm.action = "/gnoincoundb/ealyCnsDocList.do";
       	document.searchForm.submit();
	}
	
	$('input[type="text"]').keydown(function() {
		  if (event.keyCode === 13) {
		    list(1);
		  };
	});
	
</script>

<section id="content">
	<form name="downForm" id="downForm" method="post">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		<input type="hidden" id="fileNm" name="fileNm" value="" />
		<input type="hidden" id="sysFileNm" name="sysFileNm" value="" />
		<input type="hidden" id="filePath" name="filePath" value="" />
	</form>
	<h2 class="h2-title"><i class="fa fa-check-square"></i>초기상담신청서</h2>
		
		<div class="box-style1 x-scroll-auto" >
		<!-- 검색영역 -->
		<form name="searchForm" id="searchForm" action="/ealyCnsDocList.do" method="get" onsubmit="return false">
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
								<option value="${result.odr }" <c:if test="${result.odr eq vo.schCnsGb}">selected</c:if>>${result.mclassNm }</option>
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
					<span class="label">등록일</span> <input type="text" name="schStartDate" id="datepicker1" value="${vo.schStartDate }" style="width: 100px;" readOnly/> &nbsp;&nbsp;&nbsp; ~ &nbsp;<input type="text" name="schEndDate" id="datepicker2" value="${vo.schEndDate}" style="width: 100px;" readOnly/>
				</div>
				<div class="btn" style="padding-bottom:15px; padding-right:100px;">
					<button type="button" class="btn-search" id="searchBtn" onclick="javascript:fn_search('${mnuCd}');">
						<i class="fa fa-search"></i>검색
					</button>
				</div>
			</div>
		</form>
			<span style="float:left; margin: 0;">
				검색 총수 : <span id="totalPageCnt"></span> 건 
			</span>
			<div class="btn" style="float: right; margin: 0;">
				<button type="button" class="btn-basic" onClick="javascript:fn_reg('${mnuCd }');" style="background-color: green;color:white;">초기상담신청서작성</button>
				<button type="button" class="btn-basic" onClick="fn_excelDownload(29, document.searchForm);" style="background-color: green;color:white;">Excel 다운로드</button>
			</div>	
			<table class="table-style1" style="margin-bottom: 5px;">
				<colgroup> 
					<col width="5%"></col>
					<col width="7%"></col> 
					<col width="7%"></col>
					<col width="7%"></col>
					<col width="7%"></col>
					<col width="7%"></col>
					<col width="10%"></col>
					<col width="5%"></col>
					<col width="9%"></col>
					<col width="*"></col>
					<col width="7%"></col>
				</colgroup>
							
				<thead>
					<tr>
						<th scope="col">순번</th>
						<th scope="col">case.No</th>
						<th scope="col">상담구분</th>
						<th scope="col">내담자명</th> 
						<th scope="col">상담자</th>
						<th scope="col">상담방법</th>
						<th scope="col">상담경위</th>
						<th scope="col">성별</th>
						<th scope="col">주호소문제</th>
						<th scope="col">상담요약내용</th>
						<th scope="col">PDF</th>
						<th scope="col">최근상담일</th>
					</tr>
				</thead>
				<tbody id="tby1">
					<c:if test="${ealyList.size() == 0 }">
						<tr>
							<td colspan="12">정보가 없습니다.</td>
						</tr>
					</c:if>
					<c:if test="${ealyList.size() > 0 }">
						<c:forEach items="${ealyList }" var="result">
							<tr>
								<td onclick="fn_detail('${result.caseNo}');">${result.rnum }</td>
								<td onclick="fn_detail('${result.caseNo}');">${result.caseNo }</td>
								<td onclick="fn_detail('${result.caseNo}');">${result.cnsGbNm }</td>
								<td onclick="fn_detail('${result.caseNo}');">${result.cnsleNm }</td>
								<td onclick="fn_detail('${result.caseNo}');">${result.cnsrNm }</td>
								<td onclick="fn_detail('${result.caseNo}');">${result.cnsMethdNm }</td>
								<td onclick="fn_detail('${result.caseNo}');">${result.cnsDtlNm }</td>
								<td onclick="fn_detail('${result.caseNo}');">
									<c:if test="${result.gender eq 'M' }">남</c:if>
									<c:if test="${result.gender eq 'F' }">여</c:if>
								</td>
								<td onclick="fn_detail('${result.caseNo}');">${result.majorCd }</td>
								<td onclick="fn_detail('${result.caseNo}');" style="text-align:left; text-indent:5px;">
									<c:choose>
									   <c:when test="${fn:length(result.cnsCntn) > 25 }">
									      <c:out value="${fn:substring(result.cnsCntn,0,25) }..." escapeXml="false" />        
									   </c:when>
									   <c:otherwise>
									      <c:out value="${result.cnsCntn}" escapeXml="false" /> 
									   </c:otherwise>
									</c:choose>
								</td>
								<td>
									<%-- <button type="button" id="pdfBtn" class="btn-basic btn-primary" onclick="javascript:fn_down('초기상담신청서.pdf', '${result.sysFileNm }', 'pdf')">PDF 다운</button> --%>
									<button type="button" id="pdfBtn" class="btn-basic btn-primary" onclick="javascript:fn_pdfDownload(20, '${result.num }')">PDF 다운</button>
								</td>
								<td onclick="fn_detail('${result.caseNo}');">${result.cnsDt }</td>
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

