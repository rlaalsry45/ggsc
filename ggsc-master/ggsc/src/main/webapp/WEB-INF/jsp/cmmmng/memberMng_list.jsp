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
		var page = "${page}";
		if(page == ""){
			page = 1;
		}
		list(page);
	});

	function fn_detail(id){
		document.location.href = "/gnoincoundb/memberMngDtl.do?userId="+id+"&mnuCd=${mnuCd}";
	}

	function fn_search() {
		document.searchForm.action = "/gnoincoundb/memberMngList.do?mnuCd=${mnuCd}";
       	document.searchForm.submit(); 
	}
	$('input[type="text"]').keydown(function() {
		  if (event.keyCode === 13) {
		    list(1);
		  };
	});
		
		
	function list(curPage) {
		$("#currentPageNo").val(curPage);
		var param = $("#searchForm").serialize(); //ajax로 넘길 data
		var token = $("meta[name='_csrf']").attr("th:content");
		var header = $("meta[name='_csrf_header']").attr("th:content");
		 
		$.ajax({
			type : "POST",
			url : "/gnoincoundb/memberMngListAjax.do",
			data : param,
			dataType : "json",
			beforeSend : function(xhr){
				xhr.setRequestHeader(header, token);
			},
			success : function(json) {
				var html = '';
				$("#totalPageCnt").html(json.totalPageCnt);
				$.each(json.list, function(i, d) {
					var num = 0;
					num = (json.totalPageCnt - d.rnum) + 1;
					html += '<tr onclick="javascript:fn_detail(\''+ d.userId +'\');">';
					html += '<td>' + num + '</td>';
					html += '<td>' + d.userId + '</td>';
					html += '<td>' + d.userNm + '</td>'; 
					html += '<td>' + d.birthDt + '</td>';
					html += '<td>' + d.authCd + '</td>';
					html += '</tr>';
					
				});
				if (json.list.length == 0) {
					html += '<tr><td colspan="5">정보가 없습니다.</td></tr>';
				}
				$("#tby1").html(html);
	
				var p = json.paginationInfo;
	        	var pageView = Paging(p.totalRecordCount,10,10,
	        			p.currentPageNo ,'list' ,1);
	        	$("#page1").empty().html(pageView);
			},
			error : function(e) {
				alert("서버와 통신 오류입니다.");
			}
		});
	}	
</script>

<section id="content">
	<h2 class="h2-title"><i class="fa fa-check-square"></i>회원관리</h2>
		<div class="box-style1 x-scroll-auto" >
				<!-- 검색영역 -->
		<form name="searchForm" id="searchForm" method="get" onsubmit="return false">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			<input type="hidden" id="currentPageNo" name="currentPageNo" value="1" />
			<input type="hidden" id="mnuCd" name="mnuCd" value="${mnuCd }" />
			<input type="hidden" id="userId" name="userId" value="" />
			<div class="search-box">
				<div class="search-group">
					<span class="label">
						<select id="schType" name="schType" style="margin-left: 20px;">
							<option value="schId">ID</option>
							<option value="schNm">회원명</option>
							<option value="schAuth">권한</option>
						</select>
					</span>
					<span class="form" style="margin-left: 25px;"><input type="text" name="schText" id="schText" value="" enterSearch data-button='#searchBtn' /></span>
				</div>
				<div class="btn">
					<button type="button" class="btn-search" id="searchBtn" style="margin-right: 200px; margin-bottom: 2px;" onclick="javascript:list(1);">
						<i class="fa fa-search"></i>검색
					</button>
				</div>
			</div>
			</form>
			<%-- <form name="frm" id="frm" method="post" onsubmit="return false">
				<span style="float: left; margin: 0;">
					검색 총수 : <span id="totalPageCnt"><c:out value="${totalPageCnt }"/></span> 건 
				</span>
				<table class="table-style1" style="margin-bottom: 5px;">
					<colgroup> 
						<col width="10%"></col>
						<col width="20%"></col> 
						<col width="30%"></col>
						<col width="30%"></col>
						<col width="10%"></col>
					</colgroup>
					<thead>
						<tr>
							<th scope="col">번호</th>
							<th scope="col">ID</th>
							<th scope="col">회원명</th> 
							<th scope="col">생년월일</th>
							<th scope="col">권한</th>
						</tr>
					</thead>
					<tbody id="tby1">
						<c:if test="${memberList.size() == 0 }">
							<tr>
								<td colspan="5">정보가 없습니다.</td>
							</tr>
						</c:if>
						<c:if test="${memberList.size() > 0 }">
							<c:forEach items="${memberList }" var="result">
								<tr onclick="javascript:fn_detail('${result.userId}');">
									<td>${result.rnum}</td>
									<td>${result.userId}</td>
									<td>${result.userNm}</td>
									<td>${result.birthDt}</td>
									<td>${result.authCd}</td>
								</tr> 
							</c:forEach>
						</c:if>
					</tbody>
				</table>
			</form> --%>
		
			<!-- // 페이징 -->
			<%-- <div class="paginate" id="page1">
				<div id="paging">
                    <ul class="pagination">
                      	<ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="list" />
                      	<form:hidden path="pageIndex" />
                    </ul>
                </div>
			</div> --%>
			

			<span style="float:left; margin: 0;">
				검색 총수 : <span id="totalPageCnt"></span> 건 
			</span>
			<%-- <div class="btn" style="float: right; margin: 0;">
				<button type="button" class="btn-basic" onClick="javascript:fn_detail(0);"onClick="javascript:fn_reg('${mnuCd}');" style="background-color:green;color:white;">등록</button>	
			</div> --%>	
			<table class="table-style1" style="margin-bottom: 5px;">
				<colgroup> 
					<col width="10%"></col>
					<col width="20%"></col> 
					<col width="30%"></col>
					<col width="30%"></col>
					<col width="10%"></col>
				</colgroup>
							
				<thead>
					<tr>
						<th scope="col">번호</th>
						<th scope="col">ID</th>
						<th scope="col">회원명</th> 
						<th scope="col">생년월일</th>
						<th scope="col">권한</th>
					</tr>
				</thead>
				<tbody id="tby1">
				
				</tbody>

			</table>
			<div class="paginate" id="page1">

			</div>
			<!-- // 페이징 -->
			
			
		</div>
		<!-- end -->
	</section>

</html>

