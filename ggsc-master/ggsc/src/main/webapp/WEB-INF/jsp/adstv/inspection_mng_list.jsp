<%@ page import="egovframework.rte.psl.dataaccess.util.EgovMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="content-language" content="ko">
	<script src="/gnoincoundb/js/util/paging.js"></script>
    <!-- <link href="/css/style.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="/js/jquery-1.11.2.min.js" ></script>
    <script src="/js/html2canvas.min.js" ></script>
    <script src="/js/jspdf.min.js" ></script>
    <script src="/js/jquery-accordion-menu.js" ></script> -->

  </head>
<script type="text/javascript">
	$(document).ready(function() {
		/*
		var url = location.pathname;
		if(url.indexOf("bbs") != -1 && url.indexOf("Sign") == -1 ){
			$("#M01").addClass("active");
		}else if(url.indexOf("menu") != -1){
			$("#M03").addClass("active");
		}else if(url.indexOf("user") != -1){
			$("#M04").addClass("active");
		}else if(url.indexOf("Sign") != -1){
			$("#M0401").addClass("active");
		}else{
			$("#M05").addClass("active");
		}
		*/
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
		/* if(no == 0) {
			document.location.href = "/center_mng_dtl.do?mnuCd=${mnuCd}";			
		} else {
			var page = $("#currentPageNo").val();
			var mnuCd = $("#mnuCd").val();
			document.location.href = "/center_mng_dtl.do?num="+no+"&page="+page+"&mnuCd=${mnuCd}";
		} */
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
			url : "/gnoincoundb/inspection_mng_list_ajax.do",
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
					html += '<tr onclick="javascript:fn_reg(\''+ d.examDocCd +'\' , \''+ d.examDocNm +'\');">';
					html += '<td>' + d.rnum+ '</td>';
					if(d.cnsGb == '1') {
						html += '<td>노인상담</td>';
					} else if(d.cnsGb == '2') {
						html += '<td>중장년상담</td>';
					}
					html += '<td>' + d.examDocNm + '</td>';
					if(d.beingYn == '1') {
						html += '<td>필수</td>';
					} else if(d.beingYn == '2') {
						html += '<td>불필요</td>';
					} else if(d.beingYn == '3') {
						html += '<td>선택</td>';
					}
					html += '<td><button type="button" class="btn-basic">다운로드</button></td>';
					html += '<td>' + d.dbInsTm + '</td>';
					html += '</tr>';
					
				});
				if (json.list.length == 0) {
					html += '<tr><td colspan="6">정보가 없습니다.</td></tr>';
				}
				
				$("#tby1").html(html);
	
				var p = json.paginationInfo;
	        	var pageView = Paging(p.totalRecordCount,10,10,
	        			p.currentPageNo ,'list' ,1);
	        	// $("#page1").empty().html(pageView);
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

	<h2 class="h2-title"><i class="fa fa-check-square"></i>검사지관리</h2>
		
		<div class="box-style1 x-scroll-auto" >
				<!-- 검색영역 -->
		<form name="searchForm" id="searchForm" action="/inspection_mng_list.do" method="post" onsubmit="return false">
			<input type="hidden" id="currentPageNo" name="currentPageNo" value="1" />
			<input type="hidden" id="mnuCd" name="mnuCd" value="${mnuCd }" />
			<div class="search-box">
				<div class="search-group" style="margin-left:70px;">
					<span class="label"><label>상담구분</label></span>
					<span class="label2">
						 <select name="schCnsGb" style="width:275px;">
						 	<option value="">전체</option>
							<option value="1">노인상담</option>
							<option value="2">중장년상담</option>
						</select>
					</span>
					<!-- <span class="form"><input type="text" name="schText" id="schText" value="" /></span> -->
				</div>
				<div class="search-group" style="margin-left:70px;">
					<span class="label"><label>구분</label></span>
					<span class="label2">
						<select name="schBeingYn" style="width:275px;">
							<option value="">전체</option>
							<option value="1">필수</option>
							<option value="2">불필요</option>
							<option value="3">선택</option>
						</select>
					</span>
				</div>
				<br>
				<div class="btn" style="padding-bottom:15px; padding-right:100px;">
					<button type="button" class="btn-search" id="searchBtn" onclick="javascript:list(1);">
						<i class="fa fa-search"></i>검색
					</button>
				</div>
				<div class="search-group" style="margin-left:70px;">
					<span class="label"><label>검사지 종류</label></span>
					<span class="label2">
						<input type="text" name="schExamDocNm" id="schExamDocNm" value="" style="width: 275px;" enterSearch data-button='#searchBtn' />
					</span>
				</div>
			</div>
		</form>
			<span style="float:left; margin: 0;">
				검색 총수 : <span id="totalPageCnt"></span> 건 
			</span>
			<div class="btn" style="float: right; margin: 0;">
				<!-- <button type="button" class="btn-basic" onClick="javascript:fn_reg(0);" style="background-color:green;color:white;">등록</button>
				<button type="button" class="btn-basic" onClick="javascript:fn_excelDown();" style="background-color:green;color:white;">Excel 다운로드</button> -->		
			</div>	
			<table class="table-style1" style="margin-bottom: 5px;">
				<colgroup> 
					<col width="3%"></col>
					<col width="5%"></col> 
					<col width="25%"></col>
					<col width="4%"></col>
					<col width="4%"></col>
					<col width="5%"></col>
				</colgroup>
				<thead>
					<tr>
						<th scope="col">순번</th>
						<th scope="col">상담구분</th>
						<th scope="col">검사지종류</th> 
						<th scope="col">구분</th>
						<th scope="col">다운로드</th>
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

