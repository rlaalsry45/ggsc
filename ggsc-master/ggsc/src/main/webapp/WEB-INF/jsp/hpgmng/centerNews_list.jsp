<%@ page import="egovframework.rte.psl.dataaccess.util.EgovMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<link href="/gnoincoundb/css/style.css" rel="stylesheet">
<script src="/gnoincoundb/js/util/paging.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
		
	});
	
	function list(pageNo){
		var frm = document.searchForm;
			frm.method = 'get';
			frm.currentPageNo.value = pageNo;
			frm.submit();
	}

	function fn_reg(mnuCd){
		document.location.href = "/gnoincoundb/centerNewsDtl.do?mnuCd=" + mnuCd;
	}
	
	function fn_detail(num){
		document.location.href = "/gnoincoundb/centerNewsDtl.do?num=" + num + "&mnuCd=${mnuCd}";
	}

	function fn_search(mnuCd) {
		document.searchForm.method = 'get';
		document.searchForm.action = "/gnoincoundb/centerNewsList.do?mnuCd=" + mnuCd;
       	document.searchForm.submit(); 
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
 #table-style1 {
 width: "100px" height="200px"
 }
</style>

<section id="content">
	<form name="downForm" id="downForm" method="post">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		<input type="hidden" id="fileNm" name="fileNm" value="" />
		<input type="hidden" id="sysFileNm" name="sysFileNm" value="" />
		<input type="hidden" id="filePath" name="filePath" value="" />
	</form>
	<h2 class="h2-title"><i class="fa fa-check-square"></i>센터소식</h2>
		<div class="box-style1 x-scroll-auto" >
				<!-- 검색영역 -->
		<form name="searchForm" id="searchForm" method="get" onsubmit="return false">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			<input type="hidden" id="currentPageNo" name="currentPageNo" value="${vo.currentPageNo}" />
			<input type="hidden" id="mnuCd" name="mnuCd" value="${mnuCd }" />
			<div class="search-box">
				<div class="search-group">
					<span style="padding-left: 100px;">등록일</span> <input type="text" name="schStartDate" id="datepicker1" value="${vo.schStartDate}" style="width: 100px;" readonly /> &nbsp;&nbsp;&nbsp; ~ &nbsp;<input type="text" name="schEndDate" id="datepicker2" value="${vo.schEndDate}" style="width: 100px;"  readonly="readonly" />
					<span class="label">
						<select id="schType" name="schType" style="margin-left: 20px;">
							<option value="1" <c:if test="${vo.schType==1}">selected</c:if>>공지제목</option>
							<option value="2" <c:if test="${vo.schType==2}">selected</c:if>>작성자</option>
							<option value="3" <c:if test="${vo.schType==3}">selected</c:if>>내용</option>
						</select>
					</span>
					<span class="form" style="margin-left: 25px;"><input type="text" name="schText" id="schText" value="${vo.schText}" enterSearch data-button='#searchBtn'/></span>
				</div>
				<div class="btn">
					<button type="button" class="btn-search" id="searchBtn" style="margin-right: 200px; margin-bottom: 2px;" onclick="javascript:fn_search('${mnuCd}');">
						<i class="fa fa-search"></i>검색
					</button>
				</div>
			</div>
		</form>
		<form name="frm" id="frm" method="post" onsubmit="return false">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			<span style="float: left; margin: 0;">
				검색 총수 : <span id="totalPageCnt"><c:out value="${totalPageCnt }"/></span> 건
			</span>
			<div class="btn" style="float: right; margin: 0;">
				<c:choose>
					<c:when test="${authCdYn eq 'Y' }">
						<button type="button" class="btn-basic" onClick="javascript:fn_reg('${mnuCd}');" style="background-color:#FF8224;color:white;">등록</button>
					</c:when>
					<c:when test="${authCdYn eq 'SY' }">
						<button type="button" class="btn-basic" onClick="javascript:fn_reg('${mnuCd}');" style="background-color:#FF8224;color:white;">등록</button>
					</c:when>
					<c:otherwise>
				   </c:otherwise>
				</c:choose>
				<%-- <c:if test="${authCdYn eq 'Y' }">
					<button type="button" class="btn-basic" onClick="javascript:fn_reg('${mnuCd}');" style="background-color:#FF8224;color:white;">등록</button>
				</c:if> --%>
			</div>	
			&nbsp;&nbsp;
			<table class="table-style1" style= "margin-bottom: 5px;">
				<colgroup> 
					<col width="7%"></col>
					<col width="*"></col> 
					<col width="10%"></col>
					<col width="10%"></col>
					<col width="10%"></col>
				</colgroup>
				<thead>
					<tr>
						<th scope="col">번호</th>
						<th scope="col">제목</th> 
						<th scope="col">첨부파일</th>
						<th scope="col">등록자</th>
						<th scope="col">등록일</th>
					</tr>
				</thead>
				<tbody id="tby1">
					<c:if test="${newsList.size() == 0 }">
						<tr>
							<td colspan="5">정보가 없습니다.</td>
						</tr>
					</c:if>
					<c:if test="${newsList.size() > 0 }">
						<c:forEach items="${newsList }" var="result">
							<tr>
								<td onclick="javascript:fn_detail('${result.num}')">${result.rnum }</td>
								<td style='text-align:left;text-indent:10px' onclick="javascript:fn_detail('${result.num}')">
									<c:choose>
										<c:when test="${fn:length(result.title) > 60 }">
											<c:out value="${fn:substring(result.title,0,60) }..." escapeXml="false"/>
										</c:when>
										<c:otherwise>
											<c:out value="${result.title }" escapeXml="false" />
										</c:otherwise>
									</c:choose>
								</td>
								<td>
									<c:if test="${result.fileNm != null }">
										<button type="button" class="btn-basic" onclick="javascript:fn_down('${result.fileNm}', '${result.sysFileNm }', '${result.filePath }')">다운로드</button>
									</c:if>
								</td>
								<td onclick="javascript:fn_detail('${result.num}')">${result.writer }</td>
								<td onclick="javascript:fn_detail('${result.num}')">${result.dbInsTm}</td>
							</tr> 
						</c:forEach>
					</c:if>
				</tbody>
			</table>
		</form>
		
			<!-- // 페이징 -->
			<div class="paginate" id="page1">
				<div id="paging">
                    <ul class="pagination">
                      	<ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="list" />
                      	<form:hidden path="pageIndex" />
                    </ul>
                </div>
			</div>
		</div>
		<!-- end -->
	</section>

</html>

