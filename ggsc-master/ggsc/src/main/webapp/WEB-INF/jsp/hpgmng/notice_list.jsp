<%@ page import="egovframework.rte.psl.dataaccess.util.EgovMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script type="text/javascript">
	$(document).ready(function() {
		
	});

	function fn_reg(mnuCd){
		document.location.href = "/gnoincoundb/hNoticeDtl.do?mnuCd=" + mnuCd;
	}
	
	function fn_detail(num){
		document.location.href = "/gnoincoundb/hNoticeDtl.do?num=" + num + "&mnuCd=${mnuCd}";
	}

	function fn_search(mnuCd) {
		document.searchForm.action = "/gnoincoundb/hNoticeList.do?mnuCd=" + mnuCd;
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

<section id="content">
	<form name="downForm" id="downForm" method="post">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		<input type="hidden" id="fileNm" name="fileNm" value="" />
		<input type="hidden" id="sysFileNm" name="sysFileNm" value="" />
		<input type="hidden" id="filePath" name="filePath" value="" />
	</form>
	<h2 class="h2-title"><i class="fa fa-check-square"></i>공지사항</h2>
		<div class="box-style1 x-scroll-auto" >
				<!-- 검색영역 -->
		<form name="searchForm" id="searchForm" method="get" onsubmit="return false">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			<input type="hidden" id="currentPageNo" name="currentPageNo" value="1" />
			<input type="hidden" id="mnuCd" name="mnuCd" value="${mnuCd }" />
			<div class="search-box">
				<div class="search-group">
					<span style="padding-left: 100px;">등록일</span> <input type="text" name="schCenterGb" id="datepicker1" value="" style="width: 100px;" /> &nbsp;&nbsp;&nbsp; ~ &nbsp;<input type="text" name="schCenterGb" id="datepicker2" value="" style="width: 100px;" />
					<span class="label">
						<select id="schType" name="schType" style="margin-left: 20px;">
							<option value="1">공지제목</option>
							<option value="2">작성자</option>
							<option value="3">내용</option>
						</select>
					</span>
					<span class="form" style="margin-left: 25px;"><input type="text" name="schText" id="schText" value="" /></span>
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
				<button type="button" class="btn-basic" onClick="javascript:fn_reg('${mnuCd}');" style="background-color:#FF8224;color:white;">등록</button>
			</div>	
			<table class="table-style1" style="margin-bottom: 5px;">
				<colgroup> 
					<col width="7%"></col>
					<col width="10%"></col> 
					<col width="20%"></col>
					<col width="20%"></col>
					<col width="5%"></col>
					<col width="5%"></col>
				</colgroup>
				<thead>
					<tr>
						<th scope="col">번호</th>
						<th scope="col">등록일</th>
						<th scope="col">공지제목</th> 
						<th scope="col">내용</th>
						<th scope="col">첨부파일</th>
						<th scope="col">등록자</th>
					</tr>
				</thead>
				<tbody id="tby1">
					<c:if test="${noticeList.size() == 0 }">
						<tr>
							<td colspan="6">정보가 없습니다.</td>
						</tr>
					</c:if>
					<c:if test="${noticeList.size() > 0 }">
						<c:forEach items="${noticeList }" var="result">
							<tr>
								<td onclick="javascript:fn_detail('${result.num}')">${result.rnum }</td>
								<td onclick="javascript:fn_detail('${result.num}')">${result.dbInsTm}</td>
								<td onclick="javascript:fn_detail('${result.num}')">
									<c:choose>
										<c:when test="${fn:length(result.title) > 60 }">
											<c:out value="${fn:substring(result.title,0,60) }..."/>
										</c:when>
										<c:otherwise>
											<c:out value="${result.title }" />
										</c:otherwise>
									</c:choose>
								</td>
								<td onclick="javascript:fn_detail('${result.num}')">${result.cntn }</td>
								<td>
									<c:if test="${result.fileNm != null }">
										<button type="button" class="btn-basic" onclick="javascript:fn_down('${result.fileNm}', '${result.sysFileNm }', '${result.filePath }')">다운로드</button>
									</c:if>
								</td>
								<td onclick="javascript:fn_detail('${result.num}')">${result.writer }</td>
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

