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
    <style>
		ul.tabs{
		margin : 30px 0 30px 0;
		padding: 0px;
		list-style: none;
		border-bottom-style: solid;
		border-width: thin;
		}
		ul.tabs li{
			background: none;
			color: #222;
			display: inline-block;
			padding: 10px 15px;
			cursor: pointer;
		}
	</style>
  </head>
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
		
	});

	function fn_down(fileNm, sysFileNm, filePath){
		$("#fileNm").val(fileNm);
		$("#sysFileNm").val(sysFileNm);
		$("#filePath").val(filePath);
		document.downForm.action = "/gnoincoundb/fileDown.do";
       	document.downForm.submit();
	}
	
	function fn_reg(mnuCd){
		document.location.href = "/gnoincoundb/perCnsRegView.do?mnuCd=" + mnuCd;
	}
	
	function fn_detail(caseNo, num ,cnsDtlGbCd){
		if(cnsDtlGbCd == 1) {
			var mnuCd = $("#mnuCd").val();
			document.location.href = "/gnoincoundb/perCnsDtl.do?mnuCd="+mnuCd+"&caseNo="+caseNo+"&num="+num;
		} else if(cnsDtlGbCd == 2) {
			var mnuCd = $("#mnuCd").val();
			document.location.href = "/gnoincoundb/gCnsDtl.do?mnuCd="+mnuCd+"&caseNo=0"+"&num="+num;
		}
	}
	
	function fn_search(mnuCd) {
		document.searchForm.action = "/gnoincoundb/perCnsList.do";
       	document.searchForm.submit(); 
	}
	
	function list(curPage) {
		$("#currentPageNo").val(curPage);
		document.searchForm.action = "/gnoincoundb/perCnsList.do";
       	document.searchForm.submit();
	}
	
	$('input[type="text"]').keydown(function() {
		  if (event.keyCode === 13) {
		    list(1);
		  };
	});
	function fn_goLink(no){
		var url = "";
		
		if(no == 1){
			url = "/gnoincoundb/perCnsList.do?mnuCd=${mnuCd}";	
		}else if(no == 2){
			url = "/gnoincoundb/gCnsList.do?mnuCd=${mnuCd}";
		}else if(no == 3){
			url = "/gnoincoundb/psyCnsList.do?mnuCd=${mnuCd}";
		}else if(no == 4){
			url = "/gnoincoundb/linkageReqList.do?mnuCd=${mnuCd}";
		}else{
			url = "/gnoincoundb/superVisionList.do?mnuCd=${mnuCd}";
		}
		document.location.href = url;
	}
</script>

<section id="content">
	<form name="downForm" id="downForm" method="post">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		<input type="hidden" id="fileNm" name="fileNm" value="" />
		<input type="hidden" id="sysFileNm" name="sysFileNm" value="" />
		<input type="hidden" id="filePath" name="filePath" value="" />
	</form>
	<h2 class="h2-title"><i class="fa fa-check-square"></i>개인상담관리</h2>
		<div class="box-style1 x-scroll-auto" >
		<!-- 검색영역 -->
		<form name="searchForm" id="searchForm" action="/perCnsList.do" method="get" onsubmit="return false">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			<input type="hidden" id="currentPageNo" name="currentPageNo" value="1" />
			<input type="hidden" id="mnuCd" name="mnuCd" value="${mnuCd }" />
			<input type="hidden" id="caseNo" name="caseNo" value="0" />
			<input type="hidden" id="num" name="num" value="0" />
			
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
				<div class="btn" style="padding-bottom:15px; padding-right:150px;">
					<button type="button" class="btn-search" id="searchBtn" onclick="javascript:fn_search('${mnuCd}');">
						<i class="fa fa-search"></i>검색
					</button>
				</div>
			</div>
		</form>
			<div>
				<ul class="tabs">
					<li style="border-style: solid; border-bottom-style:none; border-width: thin; background-color: gray;">개인상담</li>
					<li style="border-style: solid; border-bottom-style:none; border-width: thin;" onclick="fn_goLink(2);">집단상담</li>
					<li style="border-style: solid; border-bottom-style:none; border-width: thin;" onclick="fn_goLink(3);">심리검사</li>
					<li style="border-style: solid; border-bottom-style:none; border-width: thin;" onclick="fn_goLink(4);">연계의뢰서</li>
					<li style="border-style: solid; border-bottom-style:none; border-width: thin;" onclick="fn_goLink(5);">수퍼비전</li>
				</ul>
			</div>
			
			<%-- <h3 class="h3-title"><i class="fa fa-star"></i>초기상담신청서</h3>
			<table class="table-style1" style="margin-bottom: 35px;">
				<colgroup> 
					<col width="5%"></col>
					<col width="7%"></col> 
					<col width="7%"></col>
					<col width="7%"></col>
					<col width="7%"></col>
					<col width="7%"></col>
					<col width="9%"></col>
					<col width="5%"></col>
					<col width="7%"></col>
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
						<th scope="col">주요문제</th>
						<th scope="col">상담요약내용</th>
						<th scope="col">최근상담일</th>
					</tr>
				</thead>
				<tbody id="tby1">
					<c:if test="${ealyList.size() == 0 }">
						<tr>
							<td colspan="11">정보가 없습니다.</td>
						</tr>
					</c:if>
					<c:if test="${ealyList.size() > 0 }">
						<c:forEach items="${ealyList }" var="result">
							<tr>
								<td>${result.rnum }</td>
								<td>${result.caseNo }</td>
								<td>${result.cnsGbNm }</td>
								<td>${result.cnsleNm }</td>
								<td>${result.cnsrNm }</td>
								<td>${result.cnsMethdNm }</td>
								<td>${result.cnsDtlNm }</td>
								<td>
									<c:if test="${result.gender eq 'M' }">남</c:if>
									<c:if test="${result.gender eq 'F' }">여</c:if>
								</td>
								<td>${result.majorCd }</td>
								<td style="text-align: left; text-indent: 5px;">
									<c:choose>
									   <c:when test="${fn:length(result.cnsCntn) > 25 }">
									      <c:out value="${fn:substring(result.cnsCntn,0,25) }..." />        
									   </c:when>
									   <c:otherwise>
									      <c:out value="${result.cnsCntn}" /> 
									   </c:otherwise>
									</c:choose>									
								</td>
								<td>${result.cnsDt }</td>
							</tr>
						</c:forEach>
					</c:if>
				</tbody>
			</table> --%>
			
			<h3 class="h3-title" style="display: inline-block;"><i class="fa fa-star"></i>상담일지 이력정보</h3>
			<div style="float: right; display: inline-block;">
				<button type="button" class="btn-basic" onClick="javascript:fn_reg('${mnuCd }');" style="background-color: green;color:white;">개인상담일지등록</button>
				<button type="button" class="btn-basic" onClick="fn_excelDownload(22, document.searchForm);" style="background-color: green;color:white;">Excel 다운로드</button>
			</div>
			<table class="table-style1" style="margin-bottom: 5px;">
				<colgroup> 
					<col width="5%"></col>
					<col width="7%"></col> 
					<col width="7%"></col>
					<col width="7%"></col>
					<col width="7%"></col>
					<col width="5%"></col>
					<col width="*"></col>
					<col width="5%"></col>
					<col width="7%"></col>
					<col width="6%"></col>
					<col width="7%"></col>
					<col width="8%"></col>
				</colgroup>
				<thead>
					<tr>
						<th scope="col">순번</th>
						<th scope="col">case.No</th>
						<th scope="col">상담회기</th>
						<th scope="col">최근상담일시</th> 
						<th scope="col">내담자성명</th>
						<th scope="col">성별</th>
						<th scope="col">간략상담내용</th>
						<th scope="col">현재연령</th>
						<th scope="col">상담진행상태</th>
						<th scope="col">상담자</th>
						<th scope="col">PDF</th>
						<th scope="col">상담일지등록일</th>
					</tr>
				</thead>
				<tbody id="tby1">
					<c:if test="${cnsList.size() == 0 }">
						<tr>
							<td colspan="12">정보가 없습니다.</td>
						</tr>
					</c:if>
					<c:if test="${cnsList.size() > 0 }">
						<c:forEach items="${cnsList }" var="result">
							<c:if test="${result.cnsDtlGbCd eq '1' }">
								<tr>
									<td onclick="javascript:fn_detail('${result.caseNo}', '${result.num}', '${result.cnsDtlGbCd}');">${result.rnum }</td>
									<td onclick="javascript:fn_detail('${result.caseNo}', '${result.num}', '${result.cnsDtlGbCd}');">${result.caseNo }</td>
									<td onclick="javascript:fn_detail('${result.caseNo}', '${result.num}', '${result.cnsDtlGbCd}');">${result.cnsCnt }회기</td>
									<td onclick="javascript:fn_detail('${result.caseNo}', '${result.num}', '${result.cnsDtlGbCd}');">${result.cnsDt }</td>
									<td onclick="javascript:fn_detail('${result.caseNo}', '${result.num}', '${result.cnsDtlGbCd}');">${result.cnsleNm }</td>
									<td onclick="javascript:fn_detail('${result.caseNo}', '${result.num}', '${result.cnsDtlGbCd}');">
										<c:if test="${result.gender eq 'M' }">남</c:if>
										<c:if test="${result.gender eq 'F' }">여</c:if>
									</td>
									<td style="text-align: left; text-indent: 5px;" onclick="javascript:fn_detail('${result.caseNo}', '${result.num}', '${result.cnsDtlGbCd}');">
										<c:choose>
										   <c:when test="${fn:length(result.cnsCntn) > 25 }">
										      <c:out value="${fn:substring(result.cnsCntn,0,25) }..." escapeXml="false" />        
										   </c:when>
										   <c:otherwise>
										      <c:out value="${result.cnsCntn}" escapeXml="false" /> 
										   </c:otherwise>
										</c:choose>									 
									</td>
									<td onclick="javascript:fn_detail('${result.caseNo}', '${result.num}', '${result.cnsDtlGbCd}');">${result.age }세</td>
									<td onclick="javascript:fn_detail('${result.caseNo}', '${result.num}', '${result.cnsDtlGbCd}');">${result.cnsStatNm }</td>
									<td onclick="javascript:fn_detail('${result.caseNo}', '${result.num}', '${result.cnsDtlGbCd}');">${result.cnsrNm }</td>
									<td>
										<button type="button" id="pdfBtn" class="btn-basic btn-primary" onclick="javascript:fn_pdfDownload(21, '${result.num }')">PDF 다운</button>
									</td>
									<td onclick="javascript:fn_detail('${result.caseNo}', '${result.num}', '${result.cnsDtlGbCd}');">${result.dbInsTm }</td>
								</tr>
							</c:if>
							
							<c:if test="${result.cnsDtlGbCd eq '2' }">
								<tr>
									<td onclick="javascript:fn_detail('${result.caseNo}', '${result.gcnsNum}', '${result.cnsDtlGbCd}');">${result.rnum }</td>
									<td onclick="javascript:fn_detail('${result.caseNo}', '${result.gcnsNum}', '${result.cnsDtlGbCd}');">${result.caseNo }</td>
									<td onclick="javascript:fn_detail('${result.caseNo}', '${result.gcnsNum}', '${result.cnsDtlGbCd}');">${result.cnsCnt }회기</td>
									<td onclick="javascript:fn_detail('${result.caseNo}', '${result.gcnsNum}', '${result.cnsDtlGbCd}');">${result.cnsDt }</td>
									<td onclick="javascript:fn_detail('${result.caseNo}', '${result.gcnsNum}', '${result.cnsDtlGbCd}');">${result.cnsleNm }</td>
									<td onclick="javascript:fn_detail('${result.caseNo}', '${result.gcnsNum}', '${result.cnsDtlGbCd}');">
										<c:if test="${result.gender eq 'M' }">남</c:if>
										<c:if test="${result.gender eq 'F' }">여</c:if>
									</td>
									<td style="text-align: left; text-indent: 5px;" onclick="javascript:fn_detail('${result.caseNo}', '${result.gcnsNum}', '${result.cnsDtlGbCd}');">
										<c:choose>
										   <c:when test="${fn:length(result.cnsCntn) > 25 }">
										      <c:out value="${fn:substring(result.cnsCntn,0,25) }..." />        
										   </c:when>
										   <c:otherwise>
										      <c:out value="${result.cnsCntn}" /> 
										   </c:otherwise>
										</c:choose>									
									</td>
									<td onclick="javascript:fn_detail('${result.caseNo}', '${result.gcnsNum}', '${result.cnsDtlGbCd}');">${result.age }세</td>
									<td onclick="javascript:fn_detail('${result.caseNo}', '${result.gcnsNum}', '${result.cnsDtlGbCd}');">집단상담</td>
									<td onclick="javascript:fn_detail('${result.caseNo}', '${result.gcnsNum}', '${result.cnsDtlGbCd}');">${result.cnsrNm }</td>
									<td>
										<%-- <button type="button" id="pdfBtn" class="btn-basic btn-primary" onclick="javascript:fn_pdfDownload(21, '${result.num }')">PDF 다운</button> --%>
									</td>
									<td onclick="javascript:fn_detail('${result.caseNo}', '${result.gcnsNum}', '${result.cnsDtlGbCd}');">${result.dbInsTm }</td>
								</tr>
							</c:if>
						</c:forEach>
					</c:if>
				</tbody>
			</table>
			<!-- // 페이징 -->
			<div class="paginate" id="page1">
				<div id="paging">
                    <ul class="pagination">
                      	<ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="list" />
                      	<form:hidden path="pageIndex" />
                    </ul>
                </div>
			</div> 
			
		
			<!-- <h3 class="h3-title" style="margin-top:30px;"><i class="fa fa-star"></i>개인상담 종결</h3>
			<table class="table-style1" style="margin-bottom: 5px;">
				<colgroup> 
					<col width="5%"></col>
					<col width="7%"></col>
					<col width="7%"></col>
					<col width="7%"></col>
					<col width="7%"></col>
					<col width="7%"></col>
					<col width="7%"></col>
					<col width="7%"></col>
					<col width="7%"></col>
					<col width="7%"></col>
				</colgroup>
				<thead>
					<tr>
						<th scope="col">상담상태</th>
						<th scope="col">사유</th>
						<th scope="col">상담회기</th>
						<th scope="col">상담일시</th>
						<th scope="col">성명</th> 
						<th scope="col">성별</th>
						<th scope="col">현재연령</th>
						<th scope="col">자살위험도</th>
						<th scope="col">주호소</th>
						<th scope="col">상담자</th>
					</tr>
				</thead>
				<tbody id="tby1">
					<c:if test="${cnsCntEndList.size() == 0 }">
						<tr>
							<td colspan="10">정보가 없습니다.</td>
						</tr>
					</c:if>
					<c:if test="${cnsCntEndList.size() > 0 }">
						<c:forEach items="${cnsCntEndList }" var="result">
							<tr>
								<td>${result.cnsStatCd }</td>
								<td>${result.cnsEndCd }</td>
								<td>${result.cnsCnt }회기</td>
								<td>${result.cnsDt }</td>
								<td>${result.cnsleNm }</td>
								<td>
									<c:if test="${result.gender eq 'M' }">남</c:if>
									<c:if test="${result.gender eq 'F' }">여</c:if>
								</td>
								<td>${result.age }세</td>
								<td>${result.killsRskn }</td>
								<td>${result.majorCd }</td>
								<td>${result.cnsrNm }</td>
							</tr>
						</c:forEach>
					</c:if>
				</tbody>
			</table>  -->
		</div>
		<!-- end -->

	</section>

</html>
