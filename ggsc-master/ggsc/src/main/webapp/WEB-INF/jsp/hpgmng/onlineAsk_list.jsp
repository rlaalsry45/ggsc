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
		document.location.href = "/gnoincoundb/onlineAskDtl.do?num=&mnuCd=${mnuCd}";
	}
	
	function fn_detail(num){
		document.location.href = "/gnoincoundb/onlineAskDtl.do?num=" + num + "&mnuCd=${mnuCd}";
	}

	function fn_search(mnuCd) {
		document.searchForm.action = "/gnoincoundb/onlineAskList.do?mnuCd=" + mnuCd;
       	document.searchForm.submit(); 
	}
	
	$('input[type="text"]').keydown(function() {
		  if (event.keyCode === 13) {
		    list(1);
		  };
	});
	
</script>

<section id="content">

	<h2 class="h2-title"><i class="fa fa-check-square"></i>온라인상담</h2>
		<div class="box-style1 x-scroll-auto" >
				<!-- 검색영역 -->
		<form name="searchForm" id="searchForm" method="get" onsubmit="return false">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			<input type="hidden" id="currentPageNo" name="currentPageNo" value="${vo.currentPageNo }" />
			<input type="hidden" id="mnuCd" name="mnuCd" value="${mnuCd }" />
			<div class="search-box">
				<div class="search-group">
					<span style="padding-left: 100px;">등록일</span> <input type="text" name="schOlaStartDate" id="datepicker1" value="${vo.schOlaStartDate}" style="width: 100px;" readonly/> &nbsp;&nbsp;&nbsp; ~ &nbsp;<input type="text" name="schOlaEndDate" id="datepicker2" value="${vo.schOlaEndDate}" style="width: 100px;" readonly/>
					<span class="label">
						<select id="schOlaType" name="schOlaType" style="margin-left: 20px;">
							<option value="1" <c:if test="${vo.schOlaType==1}">selected</c:if>>공지제목</option>
						    <option value="2" <c:if test="${vo.schOlaType==2}">selected</c:if>>작성자</option>
						    <option value="3" <c:if test="${vo.schOlaType==3}">selected</c:if>>내용</option>
						</select>
					</span>
					<span class="form" style="margin-left: 25px;"><input type="text" name="schOlaText" id="schOlaText" value="${vo.schOlaText}"  enterSearch data-button='#searchBtn'/></span>
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
			<table class="table-style1" style="margin-bottom: 5px;">
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
						<th scope="col">작성자</th> 
						<th scope="col">등록일</th>
						<th scope="col">답변</th>
					</tr>
				</thead>
				<tbody id="tby1">
					<c:if test="${onlineAskList.size() == 0 }">
						<tr>
							<td colspan="5">정보가 없습니다.</td>
						</tr>
					</c:if>
					<c:if test="${onlineAskList.size() > 0 }">
						<c:forEach items="${onlineAskList }" var="result">
							<tr onclick="javascript:fn_detail('${result.num}')">
								<td>${result.rnum }</td>
								<td style="text-align:left; text-indent:10px;">
									<c:choose>
										<c:when test="${fn:length(result.title) > 60 }">
											<c:out value="${fn:substring(result.title,0,60) }..."/>
										</c:when>
										<c:otherwise>
											<c:out value="${result.title }" />
										</c:otherwise>
									</c:choose>
								</td>
								<td>${result.writer }</td>
								<td>${result.dbInsTm}</td>
								<td>
									<c:if test="${result.ansYn == 'Y' }">
										답변완료
									</c:if>
									<c:if test="${result.ansYn == 'N' }">
										답변대기
									</c:if>
								</td>
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

