<%@ page import="egovframework.rte.psl.dataaccess.util.EgovMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script src="/gnoincoundb/js/util/paging.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		
		var authCd = "${authCd}";
		if(authCd != "1") {
			$("#saveBtn").css("display", "none");
		}
		
		var page = "${page}";
		if(page == ""){
			page = 1;
		}
		list(page);
	});

	/* function fn_reg(mnuCd){
		document.location.href = "/bbsReg.do?mnuCd=" + mnuCd;
	} */
	
	function fn_reg(no){
		if(no == 0) {
			document.location.href = "/gnoincoundb/center_mng_dtl.do?mnuCd=${mnuCd}";			
		} else {
			var page = $("#currentPageNo").val();
			var mnuCd = $("#mnuCd").val();
			document.location.href = "/gnoincoundb/center_mng_dtl.do?num="+no+"&page="+page+"&mnuCd=${mnuCd}";
		}
	}
	
	function fn_excelDown(){
		document.location.href = "/gnoincoundb/center_ExcelDown.do";
	}
	/*
	function linkPage(pageNo) {
		search(pageNo);
	}
	
	function search(pageNo) {
		$("#currentPageNo").val(pageNo);
		$("#frm").submit();
	}
	*/
	
	function list(curPage) {
		$("#currentPageNo").val(curPage);
		var param = $("#searchForm").serialize(); //ajax로 넘길 data
		var token = $("meta[name='_csrf']").attr("th:content");
		var header = $("meta[name='_csrf_header']").attr("th:content");
		
		$.ajax({
			type : "POST",
			url : "/gnoincoundb/center_mng_list_ajax.do",
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
					var homepage = "";
					num = (json.totalPageCnt - d.rnum) + 1;
					//num = json.totalPageCnt-1;
					//html += '<td>' + num + '</td>';
					/* if(d.cmtCnt > 0){
						html += '  [ ' + d.cmtCnt + ' ]';
					} */
					html += '<tr onclick="javascript:fn_reg(\''+ num +'\');">';
					html += '<td>' + num + '</td>';
					html += '<td>' + d.zoneGb + '</td>';
					html += '<td style="text-align: center; text-indent:10px;">' + d.localNm + '</td>'; 
					html += '<td style="text-align: left; text-indent:10px;">' + d.centerNm + '</td>';
					html += '<td style="text-align: left; text-indent:10px;">' + d.addr + '</td>';
					if(d.homepage.length > 30) {
						homepage = d.homepage.substring(0,30);
						html += '<td style="text-align: left; text-indent:10px;">'+homepage+'...</td>';
					} else {
						html += '<td style="text-align: left; text-indent:10px;">' + d.homepage + '</td>';
					}
					html += '<td style="text-align: left; text-indent:10px;">' + phoneFormatter(d.tel) + '</td>';
					if(d.useYn == "Y") {
						html += '<td>사용</td>';
					} else {
						html += '<td>미사용</td>';
					}
					html += '<td>' + d.dbInsTm + '</td>';
					html += '</tr>';
					
				});
				if (json.list.length == 0) {
					html += '<tr><td colspan="9">정보가 없습니다.</td></tr>';
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
	
	$('input[type="text"]').keydown(function() {
		  if (event.keyCode === 13) {
		    list(1);
		  };
	});
	
</script>
<style>
	.search-group select{width:150px;}
	.label {margin-right:40px;}
	.label2 {display:inline-block;width:275px;color:#333;padding-right:5px;margin-bottom:2px;letter-spacing:-0.5px;text-align:right;}
	
</style>
<section id="content">

	<h2 class="h2-title"><i class="fa fa-check-square"></i>센터관리</h2>
		
		<div class="box-style1 x-scroll-auto" >
				<!-- 검색영역 -->
		<form name="searchForm" id="searchForm" action="/bbsList.do" method="post" onsubmit="return false">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			<input type="hidden" id="currentPageNo" name="currentPageNo" value="1" />
			<input type="hidden" id="mnuCd" name="mnuCd" value="${mnuCd }" />
			<div class="search-box">
				<div class="search-group" style="margin-left:70px;">
					<span class="label"><label>권역구분</label></span>
					<span class="label2">
						 <select name="schZoneGb" style="width:275px;">
						 	<option value="">전체</option>
						 	<c:forEach items="${zoneGbList }" var="result">
						 		<option value="${result.odr }">${result.mclassNm }</option>
						 	</c:forEach>
						</select>
					</span>
					<!-- <span class="form"><input type="text" name="schText" id="schText" value="" /></span> -->
				</div>
				<div class="search-group" style="margin-left:70px;">
					<span class="label"><label>시∙군</label></span>
					<span class="label2">
						<select name="schSigunNm" style="width:275px;">
							<option value="">전체</option>
						 	<c:forEach items="${localGbList }" var="result">
						 		<option value="${result.odr }">${result.mclassNm }</option>
						 	</c:forEach>
						</select>
					</span>
				</div>
				<br>
				<div class="btn" style="padding-bottom:15px;padding-right:120px;">
					<button type="button" class="btn-search" id="searchBtn" onclick="javascript:list(1);">
						<i class="fa fa-search"></i>검색
					</button>
				</div>
				<div class="search-group" style="margin-left:70px;">
					<span class="label"><label>센   터</label></span>
					<span class="label2">
						<input type="text" name="schCenterGb" id="schCenterGb" value="" style="width: 275px;" enterSearch data-button='#searchBtn' />
					</span>
				</div>
				<!-- <div class="search-group" style="margin-left:70px;">
					<span class="label"><label>시∙군 명</label></span>
					<span class="label2">
						<span class="form"><input type="text" name="schSigunNm" id="schSigunNm" value="" style="width: 275px;" /></span>
					</span>
				</div> -->
			</div>
		</form>
			<span style="float:left; margin: 0;">
				검색 총수 : <span id="totalPageCnt"></span> 건 
			</span>
			<div class="btn" style="float: right; margin: 0;">
				<button type="button" id="saveBtn" class="btn-basic" onClick="javascript:fn_reg(0);"<%-- onClick="javascript:fn_reg('${mnuCd}');" --%> style="background-color:green;color:white;">등록</button>
				<button type="button" class="btn-basic" onClick="fn_excelDownload(12, document.searchForm);" style="background-color:green;color:white;">Excel 다운로드</button>		
			</div>	
			<table class="table-style1" style="margin-bottom: 5px;">
				<colgroup> 
					<col width="2%"></col>
					<col width="5%"></col> 
					<col width="5%"></col>
					<col width="10%"></col>
					<col width="5%"></col>
					<col width="15%"></col>
					<col width="7%"></col>
					<col width="2%"></col>
					<col width="4%"></col>
				</colgroup>
							
				<thead>
					<tr>
						<th scope="col">순번</th>
						<th scope="col">권역구분</th>
						<th scope="col">시∙군명</th> 
						<th scope="col">센터명</th>
						<th scope="col">주소</th>
						<th scope="col">홈페이지</th>
						<th scope="col">전화번호</th>
						<th scope="col">사용여부</th>
						<th scope="col">등록일시</th>
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

