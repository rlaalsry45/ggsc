<%@ page import="egovframework.rte.psl.dataaccess.util.EgovMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script src="/gnoincoundb/js/util/paging.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="/gnoincoundb/js/html2canvas.min.js" ></script>
<script src="/gnoincoundb/js/jspdf.min.js" ></script>
<script src="/gnoincoundb/js/jquery-accordion-menu.js" ></script>
<script type="text/javascript">
	$(document).ready(function() {
		
		var authCd = "${authCd}";
		
		if(authCd != 1) {
			$("#saveBtn").css("display","none");
		}
		
		var page = "${page}";
		if(page == ""){
			page = 1;
		}
		list(page);
	});

	function fn_reg(cd){
		var authCd = "${authCd}";
		if(authCd != 1) {
			alert("열람 권한이 없습니다.");
			return false;
		}
		if(cd == 1) {
			document.location.href = "/gnoincoundb/grouping_mng_dtl.do?mnuCd=${mnuCd}";			
		} else {
			var page = $("#currentPageNo").val();
			var mnuCd = $("#mnuCd").val();
			document.location.href = "/gnoincoundb/grouping_mng_dtl.do?mclassCd=" + cd + "&page=" + page + "&mnuCd=${mnuCd}";
		}
	}
	
	function fn_excelDown(){
		document.location.href = "/gnoincoundb/grouping_ExcelDown.do";
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
			url : "/gnoincoundb/grouping_mng_list_ajax.do",
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
					html += '<tr onclick="javascript:fn_reg(\''+ d.mclassCd +'\');">';
					html += '<td>' + num + '</td>';
					html += '<td>' + d.hclassNm;
					html += '</td>';
					html += '<td>' + d.mclassNm;
					html += '</td>';
					html += '<td>' + d.sclassNm + '</td>';
					html += '<td>' + d.odr + '</td>';
					html += '<td>' + d.cdDesc + '</td>';
					if(d.useYn == 'Y') {
						html += '<td>사용</td>';
					} else {
						html += '<td>미사용</td>';
					}
					html += '<td>' + d.dbInsTm + '</td>';
					html += '</tr>';
					
				});
				if (json.list.length == 0) {
					html += '<tr><td colspan="8">정보가 없습니다.</td></tr>';
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

	<h2 class="h2-title"><i class="fa fa-check-square"></i>분류관리</h2>
		
		<div class="box-style1 x-scroll-auto" >
				<!-- 검색영역 -->
		<form name="searchForm" id="searchForm" action="" method="post" onsubmit="return false">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			<input type="hidden" id="currentPageNo" name="currentPageNo" value="1" />
			<input type="hidden" id="mnuCd" name="mnuCd" value="${mnuCd }" />
			<div class="search-box">
				<div class="search-group" style="margin-left:70px;">
					<span class="label"><label>대분류명</label></span>
					<span class="label2">
						<input type='text' name='schHclassNm' maxLength=12 value='${vo.schHclassNm}' enterSearch data-button='#searchBtn'/>
					</span>
				</div>
				<div class="search-group" style="margin-left:70px;">
					<span class="label"><label>중분류명</label></span>
					<span class="label2">
						<input type='text' name='schMclassNm' maxLength=12 value='${vo.schMclassNm}' enterSearch data-button='#searchBtn'/>
					</span>
				</div>
				<br>
				<div class="search-group" style="margin-left:70px;">
					<span class="label"><label>소분류명</label></span>
					<span class="label2">
						<input type='text' name='schSclassNm' maxLength=12 value='${vo.schSclassNm}' enterSearch data-button='#searchBtn'/>
					</span>
				</div>
				<div class="btn" style="padding-bottom:15px;padding-right:120px;">
					<button type="button" class="btn-search" id="searchBtn" onclick="javascript:list(1);">
						<i class="fa fa-search"></i>검색
					</button>
				</div>
			<!-- <div class="btn">
				<button type="button" class="btn-search" id="searchBtn" onclick="javascript:list(1);">
					<i class="fa fa-search"></i>검색
				</button>
			</div> -->
		</div>
		</form>
			<span style="float:left; margin: 0;">
				검색 총수 : <span id="totalPageCnt"></span> 건 
			</span>
			<div class="btn" style="float:right; margin: 0;">
				<button type="button" id="saveBtn" class="btn-basic" onClick="javascript:fn_reg(1);"<%-- onClick="javascript:fn_reg('${mnuCd}');" --%> style="background-color:green;color:white;">등록</button>
				<button type="button" class="btn-basic" onClick="fn_excelDownload(13, document.searchForm);" style="background-color:green;color:white;">Excel 다운로드</button>		
			</div>	
			<table class="table-style1" style="margin-bottom: 5px;">
				<colgroup> 
					<col width="3%"></col>
					<col width="10%"></col> 
					<col width="10%"></col>
					<col width="10%"></col>
					<col width="3%"></col>
					<col width="15%"></col>
					<col width="5%"></col>
					<col width="5%"></col>
				</colgroup>
							
				<thead>
					<tr>
						<th scope="col">넘버</th>
						<th scope="col">대분류명</th>
						<th scope="col">중분류명</th>
						<th scope="col">소분류명</th> 
						<th scope="col">순번</th>
						<th scope="col">설명</th>
						<th scope="col">사용여부</th>
						<th scope="col">등록일자</th>
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

