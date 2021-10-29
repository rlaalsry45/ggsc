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
	
	/* function fn_reg(){
		$("#authNo").val(0);
		var mnuCd = $("#mnuCd").val();
		document.searchForm.method = 'post';
		document.searchForm.action = "/authMngDtl.do";
       	document.searchForm.submit();
       	location.href = "/authMngDtl.do";
	}
	function fn_detail(num){
		$("#authNo").val(num);
		var mnuCd = $("#mnuCd").val();
		document.searchForm.method = 'post';
		document.searchForm.action = "/authMngDtl.do";
       	document.searchForm.submit();
       	location.href = "/authMngDtl.do?num="+num;
	}

	function fn_search() {
		document.searchForm.method = 'get';
		document.searchForm.action = "/authMngList.do";
       	document.searchForm.submit(); 
	}
	function list(curPage) {
		$("#currentPageNo").val(curPage);
		document.searchForm.method = 'get';
		document.searchForm.action = "/authMngList.do";
       	document.searchForm.submit();
	} */
	
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
			url : "/gnoincoundb/authMngListAjax.do",
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
					html += '<tr onclick="javascript:fn_reg(\''+ num +'\');">';
					html += '<td>' + num + '</td>';
					html += '<td>' + d.authNm + '</td>';
					html += '<td>' + d.authGrpGb + '</td>'; 
					html += '<td style="text-align: left;">' + d.cntn + '</td>';
					if(d.useYn == "Y") {
						html += '<td>사용</td>';
					} else {
						html += '<td>미사용</td>';
					}
					html += '<td>' + d.regId + '</td>';
					html += '<td>' + d.dbInsDt + '</td>';
					html += '</tr>';
					
				});
				if (json.list.length == 0) {
					html += '<tr><td colspan="7">정보가 없습니다.</td></tr>';
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
	
	function fn_reg(no){
		if(no == 0) {
			document.location.href = "/gnoincoundb/authMngDtl.do?mnuCd=${mnuCd}";			
		} else {
			var page = $("#currentPageNo").val();
			var mnuCd = $("#mnuCd").val();
			document.location.href = "/gnoincoundb/authMngDtl.do?num="+no+"&page="+page+"&mnuCd=${mnuCd}";
		}
	}
	
	
</script>

<%-- <section id="content">
	<h2 class="h2-title"><i class="fa fa-check-square"></i>권한관리</h2>
		<div class="box-style1 x-scroll-auto" >
				<!-- 검색영역 -->
		<form name="searchForm" id="searchForm" method="get" onsubmit="return false">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			<input type="hidden" id="currentPageNo" name="currentPageNo" value="1" />
			<input type="hidden" id="mnuCd" name="mnuCd" value="${mnuCd }" />
			<input type="hidden" id="authNo" name="authNo" value="" />
			<div class="search-box">
				<div class="search-group">
					<span class="label">
						<select id="schType" class="wd100" name="schType" style="margin-left: 20px;">
							<option value="schCd">개별권한코드</option>
							<option value="schNm">개별권한명</option>
						</select>
					</span>
					<span class="form" style="margin-left: 35px;"><input type="text" name="schText" id="schText" value="" /></span>
				</div>
				<div class="btn">
					<button type="button" class="btn-search" id="searchBtn" style="margin-right: 330px; margin-bottom: 2px;" onclick="javascript:fn_search();">
						<i class="fa fa-search"></i>검색
					</button>
				</div>
			</div>
			<span style="float: left; margin: 0;">
				검색 총수 : <span id="totalPageCnt"><c:out value="${totalPageCnt }"/></span> 건 
			</span>
			<div class="btn" style="float: right; margin: 0;">
				<button type="button" class="btn-basic" onClick="javascript:fn_reg();" style="background-color:#FF8224;color:white;">등록</button>
			</div>	
			<table class="table-style1" style="margin-bottom: 5px;">
				<colgroup> 
					<col width="5%"></col>
					<col width="15%"></col> 
					<col width="20%"></col>
					<col width="20%"></col>
					<col width="30%"></col>
					<col width="10%"></col>
				</colgroup>
				<thead>
					<tr>
						<th scope="col">번호</th>
						<th scope="col">개별권한코드</th>
						<th scope="col">개별권한명</th> 
						<th scope="col">그룹권한명</th>
						<th scope="col">설명</th>
						<th scope="col">사용여부</th>
					</tr>
				</thead>
				<tbody id="tby1">
					<c:if test="${authList.size() == 0 }">
						<tr>
							<td colspan="6">정보가 없습니다.</td>
						</tr>
					</c:if>
					<c:if test="${authList.size() > 0 }">
						<c:forEach items="${authList }" var="result">
							<tr onclick="javascript:fn_detail('${result.authNo}');">
								<td>${result.rnum}</td>
								<td>${result.authCd}</td>
								<td>${result.authNm}</td>
								<td>${result.authGrpCd}</td>
								<td>${result.cntn}</td>
								<td>${result.useYn}</td>
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
 --%>
 
 
 <section id="content">

	<h2 class="h2-title"><i class="fa fa-check-square"></i>권한관리</h2>
		
		<div class="box-style1 x-scroll-auto" >
		<!-- 검색영역 -->
		<form name="searchForm" id="searchForm" action="/bbsList.do" method="post" onsubmit="return false">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			<input type="hidden" id="currentPageNo" name="currentPageNo" value="1" />
			<input type="hidden" id="mnuCd" name="mnuCd" value="${mnuCd }" />
			<div class="search-box">
				<div class="search-group" style="margin-left:70px;">
					<span class="label"><label>권한명</label></span>
					<span class="label2">
						 <input type="text" name="schAuthNm" id="schAuthNm" value="" style="width: 275px;" enterSearch data-button='#searchBtn' />
					</span>
				</div>
				<div class="btn" style="padding-right:200px;">
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
				<button type="button" class="btn-basic" onClick="javascript:fn_reg(0);"<%-- onClick="javascript:fn_reg('${mnuCd}');" --%> style="background-color:green;color:white;">등록</button>
				<!-- <button type="button" class="btn-basic" onClick="fn_excelDownload(12, document.searchForm);" style="background-color:green;color:white;">Excel 다운로드</button> -->		
			</div>	
			<table class="table-style1" style="margin-bottom: 5px;">
				<colgroup> 
					<col width="3%"></col>
					<col width="8%"></col>
					<col width="8%"></col>
					<col width="15%"></col>
					<col width="3%"></col>
					<col width="5%"></col>
					<col width="5%"></col>
				</colgroup>
							
				<thead>
					<tr>
						<th scope="col">순번</th>
						<th scope="col">권한명</th>
						<th scope="col">그룹권한명</th> 
						<th scope="col">설명</th>
						<th scope="col">사용여부</th>
						<th scope="col">등록자</th>
						<th scope="col">등록일</th>
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

