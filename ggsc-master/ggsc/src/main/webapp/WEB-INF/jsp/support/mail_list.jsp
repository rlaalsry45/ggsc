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

	function fn_reg(){
		document.location.href =  "/gnoincoundb/mailDtl.do?mnuCd=${mnuCd}";
	}
	
	function fn_detail(num){
		document.location.href = "/gnoincoundb/mailDtl.do?num=" + num + "&mnuCd=${mnuCd}";
	}

	function fn_search() {
		document.searchForm.action = "/gnoincoundb/mailList.do";
       	document.searchForm.submit(); 
	}
	
	function list(curPage) {
		document.searchForm.action = "/gnoincoundb/mailList.do?mnuCd=${mnuCd}";
	}
	
	$('input[type="text"]').keydown(function() {
		  if (event.keyCode === 13) {
		    list(1);
		  };
	});
	
</script>

<section id="content">
	<h2 class="h2-title"><i class="fa fa-check-square"></i>메일발송관리</h2>
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
							<option value="1" <c:if test="${vo.schType==1}">selected</c:if>>발송목록</option>
							<option value="2" <c:if test="${vo.schType==2}">selected</c:if>>답변</option>
							<option value="3" <c:if test="${vo.schType==3}">selected</c:if>>등록자</option>
						</select>
					</span>
					<span class="form" style="margin-left: 25px;"><input type="text" name="schText" id="schText" value="${vo.schText}" enterSearch data-button='#searchBtn' /></span>
				</div>
				<div class="btn">
					<button type="button" class="btn-search" id="searchBtn" style="margin-right: 200px; margin-bottom: 2px;" onclick="javascript:fn_search();">
						<i class="fa fa-search"></i>검색
					</button>
				</div>
			</div>
			<span style="float: left; margin: 0;">
				검색 총수 : <span id="totalPageCnt"><c:out value="${totalPageCnt }"/></span> 건 
			</span>
			<div class="btn" style="float: right; margin: 0;">
				<button type="button" class="btn-basic" onClick="javascript:fn_reg('${mnuCd}');" style="background-color:green; color:white;">등록</button>
			</div>	
			<table class="table-style1" style="margin-bottom: 5px;">
				<colgroup> 
					<col width="8%"></col>
					<col width="20%"></col> 
					<col width="25%"></col>
					<col width="8%"></col>
					<col width="20%"></col>
					<col width="8%"></col>
				</colgroup>
				<thead>
					<tr>
						<th scope="col">발송일시</th>
						<th scope="col">제목</th>
						<th scope="col">내용</th> 
						<th scope="col">다운로드</th>
						<th scope="col">발송목록</th>
						<th scope="col">발송자</th>
					</tr>
				</thead>
				<tbody id="tby1">
					<c:if test="${mailList.size() == 0 }">
					
					
					
					
						<tr>
							<td colspan="6">정보가 없습니다.</td>
						</tr>
					</c:if>
					<c:if test="${mailList.size() > 0 }">
						<c:forEach items="${mailList }" var="result">
							<tr>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
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

