<%@ page import="egovframework.rte.psl.dataaccess.util.EgovMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<script src="/gnoincoundb/js/util/paging.js"></script>
<link href="/gnoincoundb/css/style.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="/gnoincoundb/js/jquery-1.11.2.min.js" ></script>
<script src="/gnoincoundb/js/html2canvas.min.js" ></script>
<script src="/gnoincoundb/js/jspdf.min.js" ></script>
<script src="/gnoincoundb/js/jquery-accordion-menu.js" ></script>
<script type="text/javascript">
	$(document).ready(function() {
		var page = "${page}";
		if(page == ""){
			page = 1;
		}
		list(page);
	});

	function fn_detail(no){
		var page = $("#currentPageNo").val();
		document.location.href = "/gnoincoundb/bbsDetail.do?brdNo=" + no + "&page=" + page;
	}
	
	function fn_excelDown(){
		document.location.href = "/gnoincoundb/bbsExcelDown.do";
	}
	
	function fn_popup(){
		
		var url = "/cnsApplicantInfo.do";
		var name = "신청자정보";
		var option = "width = 500, height = 500, top = 100, left = 100, location = yes";
		window.open(url, name, option);
	}
	
	function list(curPage) {
		/*
		$("#currentPageNo").val(curPage);
		var param = $("#searchForm").serialize(); //ajax로 넘길 data
	
		$.ajax({
			type : "POST",
			url : "/bbsList_ajax.do",
			data : param,
			dataType : "json",
			success : function(json) {
				var html = '';
				$.each(json.list, function(i, d) {
					var num = 0;
					if(d.brdFileNm == null){
						d.brdFileNm = "";
					}
					//num = (json.totalPageCnt - d.rnum) + 1;
					html += '<tr>';
					//html += '<td>' + num + '</td>';
					html += '<td>' + d.brdNo + '</td>';
					html += '<td style="text-align: left;" onclick="javascript:fn_detail(\''+ d.brdNo +'\');">' + d.brdTitle;
					if(d.cmtCnt > 0){
						html += '  [ ' + d.cmtCnt + ' ]';
					}
					html += '</td>';
					html += '<td>' + d.brdWriter + '</td>';
					html += '<td>' + d.createDt + '</td>';
					if(d.brdFileNm != ""){
						html += '<td><a href="javascript:fn_down(\''+ d.brdFileNm + '\', \''+ d.brdFilePath + '\')"><img src="images/down.png" width="20" height="20"></a></td>';
					}else{
						html += '<td></td>';
					}
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
		*/
	}
	
	$('input[type="text"]').keydown(function() {
		  if (event.keyCode === 13) {
		    list(1);
		  };
	});
	
</script>

<section id="content">

	<h2 class="h2-title"><i class="fa fa-check-square"></i>초기상담신청서 - 내담자리스트</h2>
		
		<div class="box-style1 x-scroll-auto" >
				<!-- 검색영역 -->
		<form name="searchForm" id="searchForm" action="/bbsList.do" method="post" onsubmit="return false">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			<input type="hidden" id="currentPageNo" name="currentPageNo" value="1" />
			<div class="search-box">
				<div class="search-group" style="width: 98%;">
					<table style="width: 98%;">
				<colgroup> 
					<col width="20%"></col>
					<col width="*"></col> 
					<col width="20%"></col>
					<col width="20%"></col>
					<col width="20%"></col>
				</colgroup>						
				<tbody>
					<tr>
						<td>성별</td>
						<td>
							<span class="label">
								<select name="schCenterGb">
									<option value="1">선택</option>
									<option value="2">남</option>
									<option value="3">여</option>
								</select>
							</span>
						</td>
						<td>초기위험도</td>
						<td>
							<span class="label">
								<select name="schcCnsGb">
									<option value="1">선택</option>
									<option value="2">b</option>
									<option value="3">c</option>
								</select>
							</span>
						</td>
						<td rowspan="3">
							<div class="btn">
								<button type="button" class="btn-search" id="searchBtn"  style="background-color:#3781ba;color:white;" onclick="javascript:list(1);">
									<i class="fa fa-search"></i>검색
								</button>
							</div>
						</td>
					</tr>
					<tr><td>&nbsp;</td><td></td><td></td><td></td><td></td></tr>
					<tr>
						<td>내담자명</td>
						<td>
							<span class="form"><input type="text" name="schApctNm" id="schApctNm" value="" /></span>
						</td>
						<td>자살위험도</td>
						<td>
							<span class="label">
								<select name="schcCnsGb">
									<option value="1">선택</option>
									<option value="2">a</option>
									<option value="3">b</option>
								</select>
							</span>
						</td>
						<td>
						</td>
					</tr>
				</tbody>

			</table>
					
					
				</div>
		</div>
		</form>
		
			<div class="btn" style="float: right; margin: 0;">
				<button type="button" class="btn-basic" onClick="javascript:fn_excelDown();" style="background-color: green;color:white;">초기상담신청서 작성</button>
			</div>	
			
			<table class="table-style1" style="margin-bottom: 5px;">
				<colgroup> 
					<col width="7%"></col>
					<col width="7%"></col> 
					<col width="7%"></col>
					<col width="7%"></col>
					<col width="6%"></col>
					<col width="6%"></col>
					<col width="6%"></col>
					<col width="6%"></col>
					<col width="6%"></col>
					<col width="6%"></col>
					<col width="6%"></col>
					<col width="6%"></col>
					<col width="6%"></col>
					<col width="6%"></col>
					<col width="6%"></col>
					<col width="6%"></col>
				</colgroup>
							
				<thead>
					<tr>
						<th scope="col">순번</th>
						<th scope="col">caseNo</th>
						<th scope="col">내담자명</th> 
						<th scope="col">총상담회기</th>
						<th scope="col">최근상담일</th>
						<th scope="col">상담진행상태</th>
						<th scope="col">상담자</th>
						<th scope="col">성별</th>
						<th scope="col">현재연령</th>
						<th scope="col">학력</th>
						<th scope="col">초기위험도</th>
						<th scope="col">자살위험도</th>
						<th scope="col">초기상담신청서작성</th>
						<th scope="col">보류신청여부</th>
						<th scope="col">PDF다운로드</th>
						<th scope="col">프린트</th>
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

