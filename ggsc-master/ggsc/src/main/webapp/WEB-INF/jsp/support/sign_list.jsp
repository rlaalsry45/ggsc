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
		document.location.href = "/gnoincoundb/signDtl.do?num=0&mnuCd=${mnuCd}";
	}
	
	function fn_detail(num){
		document.location.href = "/gnoincoundb/signDtl.do?num=" + num+"&mnuCd=${mnuCd}";
	}

	function fn_search() {
		document.searchForm.method = 'get';
		document.searchForm.action = "/gnoincoundb/signList.do";
       	document.searchForm.submit(); 
	}
	
	function list(curPage) {
		$("#currentPageNo").val(curPage);
		document.searchForm.action = "/gnoincoundb/signList.do";
       	document.searchForm.submit();
	}
	
	$('input[type="text"]').keydown(function() {
		  if (event.keyCode === 13) {
		    list(1);
		  };
	});
	
</script>

<section id="content">
	<h2 class="h2-title"><i class="fa fa-check-square"></i>서명관리</h2>
		<div class="box-style1 x-scroll-auto" >
				<!-- 검색영역 -->
		<form name="searchForm" id="searchForm" method="get" onsubmit="return false">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			<input type="hidden" id="currentPageNo" name="currentPageNo" value="1" />
			<input type="hidden" id="mnuCd" name="mnuCd" value="${mnuCd }" />
			<div class="search-box">
				<div class="search-group">
					<span style="padding-left: 100px;">등록일</span> <input type="text" name="schStartDate" id="datepicker1" value="${vo.schStartDate }" style="width: 100px;" /> &nbsp;&nbsp;&nbsp; ~ &nbsp;<input type="text" name="schEndDate" id="datepicker2" value="${vo.schEndDate }" style="width: 100px;" />
					<span class="label">
						<select id="schType" name="schType" style="margin-left: 20px;">
							<option value="1"<c:if test="${vo.schType==1}">selected</c:if>>전체</option>
							<!-- <option value="2"<c:if test="${vo.schType==2}">selected</c:if>>기관명</option> -->
							<option value="3"<c:if test="${vo.schType==3}">selected</c:if>>직위</option>
							<option value="4"<c:if test="${vo.schType==4}">selected</c:if>>성명</option>
						</select>
					</span>
					<span class="form" style="margin-left: 25px;"><input type="text" name="schText" id="schText" value="${vo.schText }" enterSearch data-button='#searchBtn' /></span>
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
				<button type="button" class="btn-basic" onClick="javascript:fn_reg('${mnuCd}');" style="background-color:green; color:white;">내 서명 등록</button>
			</div>	
			<table class="table-style1" style="margin-bottom: 5px;">
				<colgroup> 
					<col width="5%"></col>
					<col width="35%"></col> 
					<col width="5%"></col>
					<col width="5%"></col>
					<col width="5%"></col>
				</colgroup>
				<thead>
					<tr>
						<th scope="col">순번</th>
						<th scope="col">기관명</th>
						<th scope="col">직위</th> 
						<th scope="col">성명</th>
						<th scope="col">등록일</th>
					</tr>
				</thead>
				<tbody id="tby1">
					<c:if test="${signList.size() == 0 }">
						<tr>
							<td colspan="5">정보가 없습니다.</td>
						</tr>
					</c:if>
					<c:if test="${signList.size() > 0 }">
						<c:forEach items="${signList }" var="result">
							<tr onclick="javascript:fn_detail('${result.num}')">
								<td>${result.rnum }</td>
								<td>${result.centerNm }</td>
								<td>${result.posi }</td>
								<td>${result.userNm }</td>
								<td>${result.dbInsTm }</td>
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

