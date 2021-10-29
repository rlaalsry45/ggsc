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
		document.location.href =  "/gnoincoundb/chtrDtl.do?mnuCd=${mnuCd}";
	}
	
	function fn_detail(num){
		document.location.href = "/gnoincoundb/chtrDtl.do?num=" + num + "&mnuCd=${mnuCd}";
	}

	function fn_search() {
		document.searchForm.action = "/gnoincoundb/chtrList.do?mnuCd=${mnuCd}";
       	document.searchForm.submit(); 
	}
	
	function list(curPage) {
		document.searchForm.action = "/gnoincoundb/chtrList.do?mnuCd=${mnuCd}";
	}
	
	$('input[type="text"]').keydown(function() {
		  if (event.keyCode === 13) {
		    list(1);
		  };
	});
	
</script>

<section id="content">
	<h2 class="h2-title"><i class="fa fa-check-square"></i>문자관리</h2>
		<div class="box-style1 x-scroll-auto" >
				<!-- 검색영역 -->
		<form name="searchForm" id="searchForm" method="get" onsubmit="return false">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			<input type="hidden" id="currentPageNo" name="currentPageNo" value="1" />
			<input type="hidden" id="mnuCd" name="mnuCd" value="${mnuCd }" />
			<div class="search-box">
				<div class="search-group">
					<span style="padding-left: 100px;">발송일</span> 
						<input type="text" name="schSdate" id="datepicker1" value="${vo.schSdate}" style="width: 100px;" readOnly /> &nbsp;&nbsp;&nbsp; ~ &nbsp;
						<input type="text" name="schEdate" id="datepicker2" value="${vo.schEdate}" style="width: 100px;" readOnly/>
						
					<span class="form" style="margin-left: 25px;"><input type="text" name="schText" id="schText" value="${vo.schText}" enterSearch data-button='#searchBtn' placeholder='제목/내용/발송자'/></span>
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
					<col width="15%"></col>
					<col width="7%"></col>
					<col width="*"></col> 
					<col width="5%"></col>
					<col width="5%"></col>
					<col width="5%"></col>
					<col width="10%"></col>
				</colgroup>
				<thead>
					<tr>
						<th scope="col">발송일시</th>
						<th scope="col">발송 ID</th>
						<th scope="col">제목</th>
						<th scope="col">발송요청수</th>
						<th scope="col">발송자</th>
						<th scope="col">발송상태</th> 
						<th scope="col">발송번호</th>
					</tr>
				</thead>
				<tbody id="tby1">
					<c:if test="${mmsList.size() == 0 }">
						<tr>
							<td colspan="6">정보가 없습니다.</td>
						</tr>
					</c:if>
					<c:if test="${mmsList.size() > 0 }">
						<c:forEach items="${mmsList }" var="list">
							<tr onClick="fn_detail('${list.num}')">
								<td data-pattern='datetime'>${list.appdate}</td>
								<td>${list.msgid }</td>
								<td style='text-indent:10px; text-align:left; '>${list.subject}</td>
								<td>${list.sendcount }</td>
								<td>${list.adminname }</td>
								<td title='${list.resultmessage}'>${list.result }</td>
								<td data-pattern='mobile'>${list.callback }</td>
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

