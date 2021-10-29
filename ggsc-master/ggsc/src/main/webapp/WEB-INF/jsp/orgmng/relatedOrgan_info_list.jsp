<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="_csrf" th:content="${_csrf.token}"/>
<meta name="_csrf_header" th:content="${_csrf.headerName}"/>
<title>신청자 정보 팝업</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="/gnoincoundb/css/style.css">
<script src="/gnoincoundb/js/jquery-1.11.2.min.js" ></script>
<script src="/gnoincoundb/js/util/paging.js"></script>
<script type="text/javascript">
//
	$(document).ready(function() {
		var page = "${page}";
		if(page == ""){
			page = 1;
		}
		list(page);
	});
	
	function list(curPage) {
		$("#currentPageNo").val(curPage);
		var param = $("#searchForm").serialize(); //ajax로 넘길 data
		var token = $("meta[name='_csrf']").attr("th:content");
		var header = $("meta[name='_csrf_header']").attr("th:content");
		$.ajax({
			type : "POST",
			url : "/gnoincoundb/relatedOrgan_info_list_ajax.do",
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
					html += '<tr onclick="javascript:fn_reg(\''+ d.relOrgCd +'\',\''+ d.relOrgNm +'\',\''+ d.tel +'\');">';
					html += '<td>' + d.rnum + '</td>';
					html += '<td>' + d.relOrgCd + '</td>';
					html += '<td style="text-align: left; text-indent: 3px;">' + d.relOrgNm + '</td>';
					html += '</tr>';
				});
				if (json.list.length == 0) {
					html += '<tr><td colspan="3">정보가 없습니다.</td></tr>';
				}
				$("#tby1").html(html);
	
				var p = json.paginationInfo;
	        	var pageView = Paging(p.totalRecordCount,10,10,
	        			p.currentPageNo ,'list' ,1);
	        	// $("#page1").empty().html(pageView);
	        	$("#page1").html(pageView);
			},
			error : function(e) {
				alert("서버와 통신 오류입니다.");
			}
		});
	}
	
	function fn_reg(relOrgCd,relOrgNm,tel) {
		if(opener.document.getElementById("relOrgCd")){
			opener.document.getElementById("relOrgCd").value = relOrgCd;
		}
		if(opener.document.getElementById("helpDept")){
			opener.document.getElementById("helpDept").value = relOrgNm;
		}
		if(opener.document.getElementById("reqDept2")){
			opener.document.getElementById("reqDept2").value = relOrgNm;
		}
		if(opener.document.getElementById("reqName")){
			opener.document.getElementById("reqName").value = relOrgNm;
		}
		
		
		if(opener.document.getElementById("linkReqOrgTel")){
			opener.document.getElementById("linkReqOrgTel").value = tel;
		}
		
		if(opener.document.getElementById("linkReqOrgNm")){
			opener.document.getElementById("linkReqOrgNm").value = relOrgNm;
		}
		
		window.close();
	}
	
</script>
<style>
	td:nth-child(odd){text-align:center;} 
</style>
</head>
<body style="background:white;">
	<div class="h3-title" style="background: #1266FF;height:30px;color:white;line-height:32px;">
		&nbsp;&nbsp;&nbsp;유관기관 팝업
		<%-- <c:if test="${empty detail.cnsrCd }">센터정보 등록</c:if>
		<c:if test="${!empty detail.cnsrCd }">센터 상세보기</c:if> --%>
	</div>
	<h2 class="h2-title mg-t20 mg-l25">
		<i class="fa fa-circle"></i>유관기관 정보
	</h2>
	<div style="width:240px;height:20px;float:right;text-align:right;padding-top:10px;"><img src="/gnoincoundb/images/logo.png" style="width:240px;height:35px;"></div>
	<div style="border-top:1px solid black;width:500px;margin-left:10px;margin-top:10px;"></div>
	<div id="cnsrView_table" style="margin-top:10px;">
		<form name="searchForm" id="searchForm" action="/bbsList.do" method="post" onsubmit="return false">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			<div class="search-box">
				<div class="search-group" style="margin-left:70px;">
					<span class="label"><label>유관기관 명</label></span>
					<span class="label2">
						<input type="text" name="schRelOrgNm" id="schRelOrgNm" value="" style="width: 200px;" />
					</span>
				</div>
				<br>
				<div class="btn" style="padding-right:10px;">
					<button type="button" class="btn-search" id="searchBtn" onclick="javascript:list(1);">
						<i class="fa fa-search"></i>검색
					</button>
				</div>
			</div>
			
			<input type="hidden" id="currentPageNo" name="currentPageNo" value="1" />
			<table class="table-style1" style="margin-bottom: 5px;">
				<colgroup> 
					<col width="8%"></col>
					<col width="15%"></col> 
					<col width="45%"></col> 
				</colgroup>
				<thead>
					<tr>
						<th scope="col">순번</th>
						<th scope="col">기관구분</th>
						<th scope="col">기관명</th>
					</tr>
				</thead>
				<tbody id="tby1">
					
				</tbody>
			</table>
			<div class="paginate" id="page1">
	
			</div>
		</form>
	</div>
	<div style="float:right;margin-right:7px;">
		<button type="button" class="btn-basic" onclick="window.close();">닫기</button>
	</div>
</body>
</html>