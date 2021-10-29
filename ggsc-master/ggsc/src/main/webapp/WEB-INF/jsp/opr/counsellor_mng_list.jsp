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
		
		var page = "${page}";
		if(page == ""){
			page = 1;
		}
		list(page);
	});

	function fn_reg(no){
		if(no == 1) {
			document.location.href = "/gnoincoundb/counsellor_mng_dtl.do?mnuCd=${mnuCd}";			
		} else {
			var page = $("#currentPageNo").val();
			var mnuCd = $("#mnuCd").val();
			document.location.href = "/gnoincoundb/counsellor_mng_dtl.do?cnsrCd=" + no + "&page=" + page + "&mnuCd=${mnuCd}";
		}
	}
	
	/* function fn_popup(userId) {
		var oepnwin;
		var url = "/counsellor_mng_dtl.do";
		var name = "counsellor_mng_dtl";
		var option = "width=530, height=750, left=250, location=yes";
		oepnwin = window.open(url, name, option);
		
		document.tmpForm2.userId.value = userId;
		document.tmpForm2.method = 'post';
		document.tmpForm2.action = url;
		document.tmpForm2.target = name;
		document.tmpForm2.submit();		
	} */
	
	function fn_excelDown(){
		document.location.href = "/gnoincoundb/counsellor_ExcelDown.do";
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
			url : "/gnoincoundb/counsellor_mng_list_ajax.do",
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
					//num = json.totalPageCnt-1;
					html += '<tr>';
					//html += '<td>' + num + '</td>';
					html += '<td onclick="javascript:fn_popup(\''+ d.userId +'\');">' + num + '</td>';
					html += '<td onclick="javascript:fn_popup(\''+ d.userId +'\');">' + d.cnsGbNm+ '</td>';
					html += '<td style="text-align: left; text-indent:10px;" onclick="javascript:fn_popup(\''+ d.userId +'\');">' + d.centerNm + '</td>';
					html += '<td onclick="javascript:fn_popup(\''+ d.userId +'\');">' + d.cnsrGbNm + '</td>'; /* cnsrGb */
					html += '<td onclick="javascript:fn_popup(\''+ d.userId +'\');">' + d.cnsrNm + '</td>';
					html += '<td onclick="javascript:fn_popup(\''+ d.userId +'\');">' + d.userId + '</td>';
					if(d.securityYn == "Y") {
						html += '<td><button type="button" class="btn-basic" style="line-height:17px;" onClick="fn_securityDtl(\''+ d.userId +'\');">수정</button></td>';
					} else if(d.securityCk != null && d.securityYn == "N") {
						html += '<td><button type="button" class="btn-basic" style="line-height:17px;" onClick="fn_securityDtl(\''+ d.userId +'\');">수정필요</button></td>';
					} else if(d.useYn == 'N') {
						html += '<td></td>';
					} else {
						html += '<td><button type="button" class="btn-basic" style="line-height:17px;" onClick="fn_security(\''+ d.userId +'\',\''+ d.apprvYn +'\')">미작성</button></td>';
					}
					if(d.apprvYn == 'Y') {
						html += '<td>승인</td>';
					} else {
						html += '<td>미승인</td>';
					}
					if(d.useYn == 'Y') {
						html += '<td></td>';
					} else {
						html += '<td>탈퇴</td>';
					}
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
	
	function fn_popup(userId) {
		var oepnwin;
		var url = "/gnoincoundb/counsellor_mng_dtl.do";
		var name = "counsellor_mng_dtl";
		var option = "width=530, height=750, left=200, location=yes";
		oepnwin = window.open(url, name, option);
		
		document.tmpForm2.userId.value = userId;
		document.tmpForm2.method = 'post';
		document.tmpForm2.action = url;
		document.tmpForm2.target = name;
		document.tmpForm2.submit();		
	}
	
	function fn_security(userId,apprvYn) {
		if(apprvYn == "N") {
			alert("아직 승인되지 않은 상담사입니다.");
			return false;
		}
		var oepnwin;
		var url = "/gnoincoundb/securityPledge_popup.do";
		var name = "securityPledge_popup";
		var option = "width=735, height=750, left=100, location=yes";
		oepnwin = window.open(url, name, option);
		
		document.tmpForm2.userId.value = userId;
		document.tmpForm2.method = 'post';
		document.tmpForm2.action = url;
		document.tmpForm2.target = name;
		document.tmpForm2.submit();
	}
	
	function fn_securityDtl(userId) {
		var oepnwin;
		var url = "/gnoincoundb/securityPledge_dtl_popup.do";
		var name = "securityPledge_dtl_popup";
		var option = "width=735, height=750, left=100, location=yes";
		oepnwin = window.open(url, name, option);
		
		document.tmpForm2.userId.value = userId;
		document.tmpForm2.method = 'post';
		document.tmpForm2.action = url;
		document.tmpForm2.target = name;
		document.tmpForm2.submit();
	}
	
	function fn_join() {
		var oepnwin;
		var url = "/gnoincoundb/cnsr_join_info.do";
		var name = "상담사 가입";
		var option = "width=530, height=800, left=250, location=yes";
		oepnwin = window.open(url, name, option);
	}
	
</script>
<style>
	.search-group select{width:150px;}
	.label {margin-right:40px;}
	.label2 {display:inline-block;width:275px;color:#333;padding-right:5px;margin-bottom:2px;letter-spacing:-0.5px;text-align:right;}
</style>
<section id="content">
	<h2 class="h2-title"><i class="fa fa-check-square"></i>상담사관리</h2>
		<div class="box-style1 x-scroll-auto" >
		<form name='tmpForm2' method='post'>
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			<input type='hidden' name='userId' />
		</form>
		<!-- 검색영역 -->
		<form name="searchForm" id="searchForm" action="/bbsList.do" method="post" onsubmit="return false">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			<input type="hidden" id="currentPageNo" name="currentPageNo" value="1" />
			<input type="hidden" id="mnuCd" name="mnuCd" value="${mnuCd }" />
			
			<div class="search-box">
				<div class="search-group" style="margin-left:70px;">
					<span class="label"><label>상담구분</label></span>
					<span class="label2">
						<select id="cnsGb" name="schCnsGb" style="width:275px;">
							<option value="">전체</option>
							<c:forEach items="${cnsGbList }" var="list">
								<option value="${list.odr }" <c:if test="${list.odr == vo.schCnsGb}">selected</c:if>>${list.mclassNm }</option>
							</c:forEach>
						</select>
					</span>
					<!-- <span class="form"><input type="text" name="schText" id="schText" value="" /></span> -->
				</div>
				<div class="search-group" style="margin-left:70px;">
					<span class="label"><label>상담그룹</label></span>
					<span class="label2">
						<select name="schCnsrGb" style="width:275px;">
							<option value="">전체</option>
							<c:forEach items="${cnsrGbList }" var="list">
								<option value="${list.odr }" <c:if test="${list.odr == vo.schCnsrGb}">selected</c:if>>${list.mclassNm }</option>
							</c:forEach>
						</select>
					</span>
				</div>
				<br>
				<div class="btn" style="padding-bottom:32px;padding-right:120px;">
					<button type="button" class="btn-search" id="searchBtn" onclick="javascript:list(1);">
						<i class="fa fa-search"></i>검색
					</button>
				</div>
				<div class="search-group" style="margin-left:70px;">
					<span class="label"><label>센터명</label></span>
					<select name="schCenterGb" style="width:275px;">
						<option value="">전체</option>
						<c:forEach items="${cnsCenterList }" var="result">
							<c:choose>
							<c:when test="${authCd > 1 }">
								<c:if test="${ result.num eq vo.schCenterGb }" >
									<option value="${result.num }" >${result.centerGb }</option>
								</c:if>
							</c:when>
							<c:when test="${authCd <= 1 }">								
								<option value="${result.num }" >${result.centerGb }</option>
							</c:when>
							</c:choose>
						</c:forEach>
					</select>
				</div>
				<br>
				<div class="search-group" style="margin-left:70px;">
					<span class="label"><label>성     명</label></span>
					<span class="label2">
						<span class="form"><input type="text" name="schCnsrNm" style="width:275px;" value='${vo.schCnsrNm}' enterSearch data-button='#searchBtn'/></span>
					</span>
				</div>
				<div class="search-group" style="margin-left:70px;">
					<span class="label"><label>아이디</label></span>
					<span class="label2">
						<input type="text" name="schUserId" style="width:275px;" value='${vo.schUserId}' enterSearch data-button='#searchBtn'/>
					</span>
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
			<div class="btn" style="float: right; margin: 0;">
				<button type="button" class="btn-basic" onClick="javascript:fn_join();" style="background-color:green;color:white;">등록</button>
				<button type="button" class="btn-basic" onClick="fn_excelDownload(11, document.searchForm);" style="background-color:green;color:white;">Excel 다운로드</button>		
			</div>	
			<table class="table-style1" style="margin-bottom: 5px;">
				<colgroup> 
					<col width="4%"></col>
					<col width="5%"></col> 
					<col width="15%"></col>
					<col width="10%"></col>
					<col width="8%"></col>
					<col width="8%"></col>
					<col width="5%"></col>
					<col width="5%"></col>
					<col width="4%"></col>
				</colgroup>
							
				<thead>
					<tr>
						<th scope="col">순번</th>
						<th scope="col">상담구분</th>
						<th scope="col">센터명</th> 
						<th scope="col">상담그룹</th>
						<th scope="col">성명</th>
						<th scope="col">아이디</th>
						<th scope="col">보안서약서</th>
						<th scope="col">승인여부</th>
						<th scope="col">탈퇴여부</th>
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
