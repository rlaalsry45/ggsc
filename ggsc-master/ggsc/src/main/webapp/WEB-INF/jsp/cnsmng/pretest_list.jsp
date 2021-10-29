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
		var schWriteYn = "${vo.schWriteYn}";
		$("select[name=schCnsGb]").val(schCnsGb);
		$("select[name=schCenterGb]").val(schCenterGb);
		$("select[name=schWriteYn]").val(schWriteYn);
		$("#totalPageCnt").html("${totalPageCnt}");
	});

	function fn_detail(caseNo){
		document.location.href = "/gnoincoundb/cnsAgreement.do?caseNo=" + caseNo + "&mnuCd=${mnuCd}";
	}
	
	
	function fn_popup(){
		
		var url = "/gnoincoundb/securityPledge.do";
		var name = "신청자정보";
		var option = "width = 500, height = 800, top = 50, left = 100, location = yes";
		window.open(url, name, option);
	}
	
	function list(curPage) {
		$("#currentPageNo").val(curPage);
		document.searchForm.action = "/gnoincoundb/pretestList.do";
       	document.searchForm.submit();
	}
	function fn_reg(mnuCd){
		document.location.href = "/gnoincoundb/cnsAgreement.do?mnuCd=" + mnuCd;
	}
	
	function fn_down(fileNm, sysFileNm, filePath){
		$("#fileNm").val(fileNm);
		$("#sysFileNm").val(sysFileNm);
		$("#filePath").val(filePath);
		document.downForm.action = "/gnoincoundb/fileDown.do";
       	document.downForm.submit();
	}

	$('input[type="text"]').keydown(function() {
		  if (event.keyCode === 13) {
		    list(1);
		  };
	});
	
	
</script>
<style>
	.fontRed{color: red; font-weight: 900;}
</style>
<section id="content">
	<form name="downForm" id="downForm" method="post">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		<input type="hidden" id="fileNm" name="fileNm" value="" />
		<input type="hidden" id="sysFileNm" name="sysFileNm" value="" />
		<input type="hidden" id="filePath" name="filePath" value="" />
	</form>
	<h2 class="h2-title"><i class="fa fa-check-square"></i>사전검사</h2>
		
		<div class="box-style1 x-scroll-auto" >
		<!-- 검색영역 -->
		<form name="searchForm" id="searchForm" method="get" onsubmit="return false">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			<input type="hidden" id="currentPageNo" name="currentPageNo" value="1" />
			<input type="hidden" id="mnuCd" name="mnuCd" value="${mnuCd }" />
			<div class="search-box">
				<div class="search-group" style="margin-left:60px;">
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
				<div class="search-group" style="margin-left:60px;">
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
				<div class="search-group" style="margin-left:60px;">
					<span class="label">등록일</span> <input type="text" name="schStartDate" id="datepicker1" value="${vo.schStartDate }" style="width: 100px;" readOnly/> &nbsp;&nbsp;&nbsp; ~ &nbsp;<input type="text" name="schEndDate" id="datepicker2" value="${vo.schEndDate}" style="width: 100px;" readOnly/>
				</div>
				<br>
				<div class="search-group" style="margin-left:60px;">
					<span class="label"><label>내담자</label></span>
					<span class="label2">
						<input type="text" name="schCnsleNm" style="width:275px;" value='${vo.schCnsleNm}' onKeyDown='if(event.keyCode==13){this.form.submit()}' ">
					</span>
				</div>
				<div class="search-group" style="margin-left:60px;">
					<span class="label"><label>작성여부</label></span>
					<span class="label2">
						<select name="schWriteYn" style="width:275px;">
							<option value="">전체</option>
								<option value="Y">작성</option>
								<option value="N">미작성</option>
						</select>
					</span>
				</div>
				<div class="btn" style="padding-bottom:15px; padding-right:50px;">
					<button type="button" class="btn-search" id="searchBtn" onclick="javascript:list(1);">
						<i class="fa fa-search"></i>검색
					</button>
				</div>
			</div>
		</form>
			<span style="float:left; margin: 0;">
				검색 총수 : <span id="totalPageCnt"></span> 건 
			</span>
			<div class="btn" style="float: right; margin: 0;">
				<%-- <button type="button" class="btn-basic" onClick="javascript:fn_reg('${mnuCd }');" style="background-color: green;color:white;">등록</button> --%>
				<button type="button" class="btn-basic" onClick="fn_excelDownload(28, document.searchForm);" style="background-color: green;color:white;">Excel 다운로드</button>
			</div>	
			<table class="table-style1" style="margin-bottom: 5px;">
				<colgroup> 
					<col width="5%"></col>
					<col width="5%"></col>
					<col width="6%"></col>
					<col width="20%"></col> 
					<col width="5%"></col>
					<col width="5%"></col>
					<col width="5%"></col>
					<col width="5%"></col>
					<col width="5%"></col>
					<col width="6%"></col>
				</colgroup>
							
				<thead>
					<tr>
						<th scope="col">순번</th>
						<th scope="col">상담구분</th>
						<th scope="col">시군</th>
						<th scope="col">센터명</th>
						<th scope="col">내담자명</th> 
						<th scope="col">상담동의서</th>
						<th scope="col">개인정보동의서</th>
						<th scope="col">노인상담선별척도지</th>
						<th scope="col">상담대상자</th>
						<th scope="col">작성여부</th>
					</tr>
				</thead>
				<tbody id="tby1">
					<c:if test="${preList.size() == 0 }">
						<tr>
							<td colspan="10">정보가 없습니다.</td>
						</tr>
					</c:if>
					<c:if test="${preList.size() > 0 }">
						<c:forEach items="${preList }" var="result">
							<tr>
								<td onclick='fn_detail("${result.caseNo}")'>${result.rnum }</td>
								<td onclick='fn_detail("${result.caseNo}")'>${result.cnsGbNm }</td>
								<td style="text-indent:3px;" onclick='fn_detail("${result.caseNo}")'>${result.sigunCd }</td>
								<td style="text-align: left; text-indent:5px;" onclick='fn_detail("${result.caseNo}")'>${result.centerGbNm }</td>
								<td onclick='fn_detail("${result.caseNo}")'>${result.userNm }</td>
								<td>
									<c:choose>
										<c:when test="${result.agrePath != null }">
											<button type="button" class="btn-basic btn-primary" onclick="javascript:fn_pdfDownload(17, '${result.agrePath }')">다운로드</button>
										</c:when>
										<c:when test="${result.fileNm != null }">
											<button type="button" class="btn-basic btn-primary" onclick="javascript:fn_down('${result.fileNm}', '${result.sysFileNm }', '${result.filePath }')">다운로드</button>
										</c:when>
										<c:otherwise>
											<button type="button" class="btn-basic btn-danger" onclick="location.href='/gnoincoundb/cnsAgreement.do?mnuCd=${mnuCd}&caseNo=${result.caseNo}'">작성하기</button>
										</c:otherwise>
									</c:choose>
								</td>
								<td>
									<c:choose>
										<c:when test="${result.perInfoPath != null }">
											<button type="button" class="btn-basic btn-primary" onclick="fn_pdfDownload(18,'${result.perInfoPath}')">다운로드</button>
										</c:when>
										<c:when test="${result.fileNm2 != null }">
											<button type="button" class="btn-basic btn-primary" onclick="javascript:fn_down('${result.fileNm2}', '${result.sysFileNm2 }', '${result.filePath2 }')">다운로드</button>
										</c:when>
										<c:otherwise>
											<button type="button" class="btn-basic btn-danger" onclick="location.href='/gnoincoundb/privacyAgreement.do?mnuCd=${mnuCd}&caseNo=${result.caseNo}'">작성하기</button>
										</c:otherwise>
									</c:choose>
								</td>
								<td>
									<c:choose>
										<c:when test="${result.docCntnPath != null }">
											<button type="button" class="btn-basic btn-primary" onclick="javascript:fn_pdfDownload(19, '${result.docCntnPath }')">다운로드</button>
										</c:when>
										<c:when test="${result.fileNm3 != null }">
											<button type="button" class="btn-basic btn-primary" onclick="javascript:fn_down('${result.fileNm3}', '${result.sysFileNm3 }', '${result.filePath3 }')">다운로드</button>
										</c:when>
										<c:otherwise>
											<button type="button" class="btn-basic btn-danger" onclick="location.href='/gnoincoundb/scScreeningScale.do?mnuCd=${mnuCd}&caseNo=${result.caseNo}'">작성하기</button>
										</c:otherwise>
									</c:choose>
								</td>
								<td>
									<c:if test="${result.cnsTargetGb eq 'Y' }">
										<button type="button" class="btn-basic btn-success" onclick='fn_detail("${result.caseNo}")'>대상</button>
									</c:if>
								</td>
								<td>
									${result.dbInsTm }
								</td>
							</tr> 
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
			<!-- // 페이징 -->
		</div>
		<!-- end -->

	</section>

</html>

