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
		
	});

	function fn_down(fileNm, sysFileNm, filePath){
		$("#fileNm").val(fileNm);
		$("#sysFileNm").val(sysFileNm);
		$("#filePath").val(filePath);
		document.downForm.action = "/gnoincoundb/fileDown.do";
       	document.downForm.submit();
	}
	
	function fn_reg(mnuCd){
		document.location.href = "/gnoincoundb/gCnsRegView.do?mnuCd=" + mnuCd;
	}
	
	function fn_detail(caseNo, num){
		var mnuCd = $("#mnuCd").val();
		document.location.href = "/gnoincoundb/gCnsDtl.do?caseNo=" + caseNo + "&num=" + num + "&mnuCd=" + mnuCd;
		/* $("#caseNo").val(caseNo);
		$("#num").val(num);
		document.searchForm.action = "/gCnsDtl.do";
       	document.searchForm.submit(); */
	}
	
	function list(curPage) {
		
		$("#currentPageNo").val(curPage);
		document.searchForm.action = "/gnoincoundb/gCnsList.do";
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
			url = "/gnoincoundb/perCnsList.do?mnuCd=${mnuCd}";
		}
		document.location.href = url;
	}
	
	function fn_search(mnuCd) {
		document.searchForm.action = "/gnoincoundb/gCnsList.do?mnuCd="+mnuCd;
       	document.searchForm.submit(); 
	}
	
</script>

<section id="content">
	<form name="downForm" id="downForm" method="post">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		<input type="hidden" id="fileNm" name="fileNm" value="" />
		<input type="hidden" id="sysFileNm" name="sysFileNm" value="" />
		<input type="hidden" id="filePath" name="filePath" value="" />
	</form>
	<h2 class="h2-title"><i class="fa fa-check-square"></i>집담상담관리</h2>
		
		<div class="box-style1 x-scroll-auto" >
				<!-- 검색영역 -->
		<form name="searchForm" id="searchForm" action="" method="get" onsubmit="return false">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			<input type="hidden" id="currentPageNo" name="currentPageNo" value="1" />
			<input type="hidden" id="mnuCd" name="mnuCd" value="${mnuCd }" />
			<!-- <input type="hidden" id="caseNo" name="caseNo" value="" />
			<input type="hidden" id="num" name="num" value="" /> -->

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
					<span class="label"><label>프로그램명</label></span>
					<span class="label2">
						<input type="text" name="schPgrmNm" style="width:275px;" value="${vo.schPgrmNm }" enterSearch data-button='#searchBtn'>
					</span>
				</div>
				<div class="search-group" style="margin-left:60px;">
					<span class="label"><label>리더명</label></span>
					<span class="label2">
						<input type="text" name="schLeaderNm" style="width:275px;" value="${vo.schLeaderNm }" enterSearch data-button='#searchBtn'>
					</span>
				</div>
				<div class="btn" style="padding-bottom:15px; padding-right:50px;">
					<button type="button" class="btn-search" id="searchBtn" onclick="javascript:fn_search('${mnuCd}');">
						<i class="fa fa-search"></i>검색
					</button>
				</div>
			</div>
		</form>
			<div>
				<ul class="tabs">
					<li style="border-style: solid; border-bottom-style:none; border-width: thin;" onclick="fn_goLink(1);">개인상담</li>
					<li style="border-style: solid; border-bottom-style:none; border-width: thin; background-color: gray;">집단상담</li>
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
							<td colspan="13">정보가 없습니다.</td>
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
									<c:if test="${result.gender eq 'M'}">남</c:if>
									<c:if test="${result.gender eq 'F'}">여</c:if>
								</td>
								<td>${result.majorCd }</td>
								<td style="text-align: left; text-indent: 5px;">
									<c:choose>
									   <c:when test="${fn:length(result.cnsCntn) > 35 }">
									      <c:out value="${fn:substring(result.cnsCntn,0,35) }..." />        
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
			
			<h3 class="h3-title" style="display: inline-block;"><i class="fa fa-star"></i>집단상담일지 이력정보</h3>
			<div style="float: right; display: inline-block;">
				<button type="button" class="btn-basic" onClick="javascript:fn_reg('${mnuCd }');" style="background-color: green;color:white;">집단상담일지등록</button>
				<button type="button" class="btn-basic" onClick="fn_excelDownload(23, document.searchForm);" style="background-color: green;color:white;">Excel 다운로드</button>
			</div>
			<table class="table-style1" style="margin-bottom: 5px;">
				<colgroup> 
					<col width="5%"></col>
					<col width="7%"></col> 
					<col width="7%"></col>
					<%-- <col width="6%"></col> --%>
					<col width="12%"></col>
					<col width="6%"></col>
					<col width="12%"></col>
					<col width="6%"></col>
					<col width="6%"></col>
					<col width="*"></col>
					<col width="5%"></col>
					<col width="7%"></col>
				</colgroup>
				<thead>
					<tr>
						<th scope="col">순번</th>
						<th scope="col">상담구분</th>
						<th scope="col">작성자</th>
						<!-- <th scope="col">현재연령</th> -->
						<th scope="col">프로그램명</th>
						<th scope="col">참석인원</th>
						<th scope="col">활동장소</th> 
						<th scope="col">회기</th>
						<th scope="col">리더</th>
						<th scope="col">프로그램내용</th>
						<th scope="col">PDF</th>						
						<th scope="col">상담일지등록일</th>
					</tr>
				</thead>
				<tbody id="tby1">
					<c:if test="${gCnsList.size() == 0 }">
						<tr>
							<td colspan="12">정보가 없습니다.</td>
						</tr>
					</c:if>
					<c:if test="${gCnsList.size() > 0 }">
						<c:forEach items="${gCnsList }" var="result">
							<tr>
								<td onclick="javascript:fn_detail('${result.caseNo}', '${result.num}');">${result.rnum }</td>
								<td onclick="javascript:fn_detail('${result.caseNo}', '${result.num}');">${result.cnsGbNm }</td>
								<td onclick="javascript:fn_detail('${result.caseNo}', '${result.num}');">${result.inputNm }</td>
								<%-- <td>${result.age }세</td> --%>
								<td onclick="javascript:fn_detail('${result.caseNo}', '${result.num}');">${result.pgrmNm }</td>
								<td onclick="javascript:fn_detail('${result.caseNo}', '${result.num}');">${result.atdeCnt }명</td>
								<td onclick="javascript:fn_detail('${result.caseNo}', '${result.num}');">${result.atvyPlace }</td>
								<td onclick="javascript:fn_detail('${result.caseNo}', '${result.num}');">${result.cnsCnt }회기</td>
								<td onclick="javascript:fn_detail('${result.caseNo}', '${result.num}');">${result.leader }</td>
								<td onclick="javascript:fn_detail('${result.caseNo}', '${result.num}');" style="text-align: left; text-indent: 5px;">
									<c:choose>
									   <c:when test="${fn:length(result.pgrmCntn) > 25 }">
									      <c:out value="${fn:substring(result.pgrmCntn,0,25) }..." escapeXml="false" />        
									   </c:when>
									   <c:otherwise>
									      <c:out value="${result.pgrmCntn}" escapeXml="false" /> 
									   </c:otherwise>
									</c:choose>									
								</td>
								<td>
									<button type="button" id="pdfBtn" class="btn-basic btn-primary" onclick="javascript:fn_pdfDownload(22, '${result.num }')">PDF 다운</button>
								</td>
								<td onclick="javascript:fn_detail('${result.caseNo}', '${result.num}');">${result.dbInsTm2 }</td>
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
			<!-- 
			<h3 class="h3-title"><i class="fa fa-star"></i>집단상담 재신청</h3>
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
					<col width="*"></col>
					<col width="7%"></col>
					<col width="7%"></col>
				</colgroup>
				<thead>
					<tr>
						<th scope="col">상담상태</th>
						<th scope="col">case.No</th>
						<th scope="col">상담회기</th>
						<th scope="col">상담일시</th>
						<th scope="col">성명</th> 
						<th scope="col">성별</th>
						<th scope="col">현재연령</th>
						<th scope="col">자살위험도</th>
						<th scope="col">주호소</th>
						<th scope="col">주결과</th>
						<th scope="col">상담자</th>
						<th scope="col">상담일지수정</th>
					</tr>
				</thead>
				<tbody id="tby1">
					<c:if test="${cnsCntReList.size() == 0 }">
						<tr>
							<td colspan="12">정보가 없습니다.</td>
						</tr>
					</c:if>
					<c:if test="${cnsCntReList.size() > 0 }">
						<c:forEach items="${cnsCntReList }" var="result">
							<tr onclick="javascript:fn_detail('${result.caseNo}');">
								<td>상담상태</td>
								<td>${result.caseNo }</td>
								<td>${result.cnsCnt }</td>
								<td>${result.cnsDt }</td>
								<td>${result.cnsleNm }</td>
								<td>${result.gender }</td>
								<td>현재연령</td>
								<td>${result.killsRskn }</td>
								<td>${result.majorApplCd }</td>
								<td>주결과</td>
								<td>${result.cnsrNm }</td>
								<td>상담일지수정</td>
							</tr>
						</c:forEach>
					</c:if>
				</tbody>
			</table>
		
			<h3 class="h3-title" style="margin-top:30px;"><i class="fa fa-star"></i>집단상담 종결</h3>
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
					<col width="*"></col>
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
						<th scope="col">주결과</th>
						<th scope="col">상담자</th>
						<th scope="col">상담일지수정</th>
					</tr>
				</thead>
				<tbody id="tby1">
					<c:if test="${cnsCntEndList.size() == 0 }">
						<tr>
							<td colspan="12">정보가 없습니다.</td>
						</tr>
					</c:if>
					<c:if test="${cnsCntEndList.size() > 0 }">
						<c:forEach items="${cnsCntEndList }" var="result">
							<tr onclick="javascript:fn_detail('${result.caseNo}');">
								<td>상담상태</td>
								<td>${result.cnsEndResn }</td>
								<td>${result.cnsCnt }</td>
								<td>${result.cnsDt }</td>
								<td>${result.cnsleNm }</td>
								<td>${result.gender }</td>
								<td>현재연령</td>
								<td>${result.killsRskn }</td>
								<td>${result.majorApplCd }</td>
								<td>주결과</td>
								<td>${result.cnsrNm }</td>
								<td>상담일지수정</td>
							</tr>
						</c:forEach>
					</c:if>
				</tbody>
			</table>
			
			<h3 class="h3-title" style="margin-top:30px;"><i class="fa fa-star"></i>심리검사</h3>
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
					<col width="*"></col>
					<col width="7%"></col>
				</colgroup>
				<thead>
					<tr>
						<th scope="col">case.No</th>
						<th scope="col">상담회기</th>
						<th scope="col">일자</th>
						<th scope="col">C-SRS</th>
						<th scope="col">GDS-K-R</th> 
						<th scope="col">SSI</th>
						<th scope="col">GHS</th>
						<th scope="col">GSIS</th>
						<th scope="col">이사</th>
						<th scope="col">거주지</th>
						<th scope="col">사별</th>
					</tr>
				</thead>
				<tbody id="tby1">
					<c:if test="${cnsCntEndList.size() == 0 }">
						<tr>
							<td colspan="11">정보가 없습니다.</td>
						</tr>
					</c:if>
					<c:if test="${cnsCntEndList.size() > 0 }">
						<c:forEach items="${cnsCntEndList }" var="result">
							<tr onclick="javascript:fn_detail('${result.caseNo}');">
								<td>상담상태</td>
								<td>${result.cnsEndResn }</td>
								<td>${result.cnsCnt }</td>
								<td>${result.cnsDt }</td>
								<td>${result.cnsleNm }</td>
								<td>${result.gender }</td>
								<td>현재연령</td>
								<td>${result.killsRskn }</td>
								<td>${result.majorApplCd }</td>
								<td>주결과</td>
								<td>${result.cnsrNm }</td>
							</tr>
						</c:forEach>
					</c:if>
				</tbody>
			</table>
			-->
		</div>
		<!-- end -->
	</section>
</html>
