<%@ page import="egovframework.rte.psl.dataaccess.util.EgovMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

	<script src="/gnoincoundb/js/util/paging.js"></script>
    <script src="/gnoincoundb/js/html2canvas.min.js" ></script>
    <script src="/gnoincoundb/js/jspdf.min.js" ></script>
    <style>
		ul.tabs{
		margin : 30px 0 30px 0;
		padding: 0px;
		list-style: none;
		border-bottom-style: solid;
		border-width: thin;
		}
		ul.tabs li{
			background: none;
			color: #222;
			display: inline-block;
			padding: 10px 15px;
			cursor: pointer;
		}
	</style>

<script type="text/javascript">
	$(document).ready(function() {
		var page = "${page}";
		if(page == ""){
			page = 1;
		}
	});

	function fn_excelDown(){
		document.location.href = "/gnoincoundb/cnsAcptExcelDown.do";
	}

	function fn_popup(type, caseNo){
		var url = "/gnoincoundb/cnsAcceptDtl.do?type=" + type + "&caseNo=" + caseNo;
		var name = "신청자정보";
		var option = "width = 530, height = 750, top = 50, left = 500, location = yes";
		window.open(url, name, option);
	}
	
	function fn_reg(mnuCd){
		document.location.href = "/gnoincoundb/superVisionDtl.do?mnuCd=" + mnuCd;
	}
	
	function fn_search(mnuCd) {
		document.searchForm.action = "/gnoincoundb/superVisionList.do?mnuCd="+mnuCd;
       	document.searchForm.submit(); 
	}
	
	function fn_detail(num){
		var mnuCd = $("#mnuCd").val();
		document.location.href = "/gnoincoundb/superVisionDtl.do?num=" + num + "&mnuCd=" + mnuCd;
	}
	

	function list(curPage) {
		$("#currentPageNo").val(curPage);
		document.searchForm.action = "/gnoincoundb/superVisionList.do?mnuCd=${mnuCd}";
       	document.searchForm.submit();
	}
	
	$('input[type="text"]').keydown(function() {
		  if (event.keyCode === 13) {
		    list(1);
		  };
	});
	
	function fn_goLink(no){
		var url = "";
		
		if(no == 1){
			url = "/gnoincoundb/perCnsList.do?mnuCd=${mnuCd}";	
		}else if(no == 2){
			url = "/gnoincoundb/gCnsList.do?mnuCd=${mnuCd}";
		}else if(no == 3){
			url = "/gnoincoundb/psyCnsList.do?mnuCd=${mnuCd}";
		}else if(no == 4){
			url = "/gnoincoundb/linkageReqList.do?mnuCd=${mnuCd}";
		}else{
			url = "/gnoincoundb/superVisionList.do?mnuCd=${mnuCd}";
		}
		document.location.href = url;
	}
	
</script>

<section id="content">

	<h2 class="h2-title"><i class="fa fa-check-square"></i>수퍼비전</h2>
		
		<div class="box-style1 x-scroll-auto" >
				<!-- 검색영역 -->
		<form name="searchForm" id="searchForm" action="/superVisionList.do" method="get" onsubmit="return false">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			<input type="hidden" id="currentPageNo" name="currentPageNo" value="1" />
			<input type="hidden" id="mnuCd" name="mnuCd" value="${mnuCd }" />
			
			<%-- <div class="search-box">
				<div class="search-group" style="margin-left:70px;">
					<span class="label"><label>상담구분</label></span>
					<span class="label2">
						 <select name="schCnsGb" style="width:275px;">
						 	<option value="">전체</option>
						 	<c:forEach items="${cnsGbList }" var="result">
								<option value="${result.odr }" <c:if test="${result.odr eq vo.schCnsGb}">selected</c:if>>${result.mclassNm }</option>
							</c:forEach>						 	
						</select>
					</span>
					<!-- <span class="form"><input type="text" name="schText" id="schText" value="" /></span> -->
				</div>
				<div class="search-group" style="margin-left:70px;">
					<span class="label"><label>시∙군</label></span>
					<span class="label2">
						<select name="schLocalGb" style="width:275px;">
							<option value="">전체</option>
						 	<c:forEach items="${localGbList }" var="result">
						 		<option value="${result.odr }">${result.mclassNm }</option>
						 	</c:forEach>
						</select>
					</span>
				</div>
				<br>
				<div class="btn" style="padding-bottom:15px;padding-right:500px;">
					<button type="button" class="btn-search" id="searchBtn" onclick="javascript:fn_search('${mnuCd}');">
						<i class="fa fa-search"></i>검색
					</button>
				</div>
				<div class="search-group" style="margin-left:70px;">
					<span class="label"><label>센터구분</label></span>
					<span class="label2">
						<select name="schCenterGb" style="width:275px;">
							<option value="">전체</option>
							<c:forEach items="${cnsCenterList }" var="result">
								<option value="${result.num }"  <c:if test="${result.num eq vo.schCenterGb}">selected</c:if> >${result.centerGb }</option>
							</c:forEach>
						</select>
					</span>
				</div>
				<div class="search-group" style="margin-left:70px;">
					<span class="label"><label>상담사명</label></span>
					<span class="label2">
						<input type="text" name="schCnsleNm" style="width:275px;" value="${vo.schCnsleNm}" enterSearch data-button='#searchBtn'>
					</span>
				</div>
			</div> --%>

			<div class="search-box">
				<div class="search-group" style="margin-left:70px;">
					<span class="label"><label>상담구분</label></span>
					<span class="label2">
						 <select name="schCnsGb" style="width:180px;">
						 	<option value="">전체</option>
						 	<c:forEach items="${cnsGbList }" var="result">
								<option value="${result.odr }" <c:if test="${result.odr eq vo.schCnsGb}">selected</c:if>>${result.mclassNm }</option>
							</c:forEach>						 	
						</select>
					</span>
					<!-- <span class="form"><input type="text" name="schText" id="schText" value="" /></span> -->
				</div>
				<div class="search-group" style="margin-left:70px;">
					<span class="label"><label>상담사명</label></span>
					<span class="label2">
						<input type="text" name="schCnsleNm" style="width:180px;" value="${vo.schCnsleNm}" enterSearch data-button='#searchBtn'>
					</span>
				</div>
				<div class="search-group" style="margin-left:70px;">
					<span class="label">등록일</span> <input type="text" name="schStartDate" id="datepicker1" value="${vo.schStartDate }" style="width: 100px;" readOnly/> &nbsp;&nbsp;&nbsp; ~ &nbsp;<input type="text" name="schEndDate" id="datepicker2" value="${vo.schEndDate}" style="width: 100px;" readOnly/>
				</div>
				<div class="btn" style="padding-right: 100px;">
					<button type="button" class="btn-search" id="searchBtn" onclick="javascript:fn_search('${mnuCd}');">
						<i class="fa fa-search"></i>검색
					</button>
				</div>
			</div>
			
		</form>
			<div>
				<ul class="tabs">
					<li style="border-style: solid; border-bottom-style:none; border-width: thin;" onclick="fn_goLink(1);">개인상담</li>
					<li style="border-style: solid; border-bottom-style:none; border-width: thin;" onclick="fn_goLink(2);">집단상담</li>
					<li style="border-style: solid; border-bottom-style:none; border-width: thin;" onclick="fn_goLink(3);">심리검사</li>
					<li style="border-style: solid; border-bottom-style:none; border-width: thin;" onclick="fn_goLink(4);">연계의뢰서</li>
					<li style="border-style: solid; border-bottom-style:none; border-width: thin;background-color: gray;">수퍼비전</li>
				</ul>
			</div>
			
			<%-- <h3 class="h3-title" style="display: inline-block;"><i class="fa fa-star"></i>상담내용</h3>
			<table class="table-style1" style="margin-bottom: 5px;">
				<colgroup> 
					<col width="5%"></col>
					<col width="7%"></col> 
					<col width="7%"></col>
					<col width="7%"></col>
					<col width="7%"></col>
					<col width="7%"></col>
					<col width="7%"></col>
					<col width="7%"></col>
					<col width="7%"></col>
					<col width="7%"></col>
					<col width="7%"></col>
					<col width="7%"></col>
				</colgroup>
							
				<thead>
					<tr>
						<th scope="col">순번</th>
						<th scope="col">case.No</th>
						<th scope="col">내담자명</th>
						<th scope="col">상담구분</th> 
						<th scope="col">총상담회기</th>
						<th scope="col">최근상담일</th>
						<th scope="col">상담진행상태</th>
						<th scope="col">상담자</th>
						<th scope="col">성별</th>
						<th scope="col">현재연령</th>
						<th scope="col">학력</th>
						<th scope="col">자살위험도</th>
					</tr>
				</thead>
				<tbody id="tby1">
					<c:if test="${list.size() == 0 }">
						<tr>
							<td colspan="12">정보가 없습니다.</td>
						</tr>
					</c:if>
					<c:if test="${list.size() > 0 }">
						<c:forEach items="${list }" var="result">
							<tr> onclick="javascript:fn_detail(1, '${result.caseNo}');"
								<td>${result.rnum }</td>
								<td>${result.caseNo }</td>
								<td>${result.cnsleNm }</td>
								<td>${result.cnsGbCd }</td>
								<td>${result.cnsCnt }회기</td>
								<td>${result.cnsDt }</td>
								<td>${result.cnsStatCd }</td>
								<td>${result.cnsrNm }</td>
								<td>
									<c:if test="${result.gender eq 'M' }">남</c:if>
									<c:if test="${result.gender eq 'F' }">여</c:if>
								</td>
								<td>${result.age }세</td>
								<td>${result.eduCd }</td>
								<td>${result.killsRskn }</td>
							</tr>
						</c:forEach>
					</c:if>
				</tbody>
			</table> --%>
			
			<h3 class="h3-title" style="display: inline-block;"><i class="fa fa-star"></i>수퍼비전</h3>
			<div style="float: right; display: inline-block;">
				<button type="button" class="btn-basic" onClick="javascript:fn_reg('${mnuCd }');" style="background-color: green;color:white;">신규등록</button>
			</div>
			
			<table class="table-style1" style="margin-bottom: 5px;">
				<colgroup> 
					<col width="3%"></col>
					<col width="7%"></col> 
					<col width="12%"></col>
					<col width="5%"></col>
					<col width="5%"></col>
					<col width="5%"></col>
					<col width="4%"></col>
					<col width="4%"></col>
				</colgroup>
				<thead>
					<tr>
						<th scope="col">순번</th>
						<th scope="col">상담구분</th>
						<th scope="col">센터명</th>
						<th scope="col">상담사구분</th> 
						<th scope="col">의뢰자</th>
						<th scope="col">의뢰일자</th>
						<th scope="col">수퍼바이저</th>
						<th scope="col">답변여부</th>
					</tr>
				</thead>
				<tbody id="tby2">
					<c:if test="${sList.size() == 0 }">
						<tr>
							<td colspan="8">정보가 없습니다.</td>
						</tr>
					</c:if>
					<c:if test="${sList.size() > 0 }">
						<c:forEach items="${sList }" var="result">
							<tr onclick="javascript:fn_detail('${result.num}');">
								<td>${result.rnum}</td>
								<c:if test="${result.cnsGb == '1' }"><td>노인상담</td></c:if>
								<c:if test="${result.cnsGb == '2' }"><td>중장년상담</td></c:if>
								<td>${result.relOrgNm }</td>
								<c:if test="${result.cnsrGb == '1' }"><td>전체운영자</td></c:if>
								<c:if test="${result.cnsrGb == '2' }"><td>센터운영자</td></c:if>
								<c:if test="${result.cnsrGb == '3' }"><td>전문상담사</td></c:if>
								<c:if test="${result.cnsrGb == '4' }"><td>생명사랑교육단</td></c:if>
								<c:if test="${result.cnsrGb == '5' }"><td>실버보듬이</td></c:if>
								<c:if test="${result.cnsrGb == '6' }"><td>실무자</td></c:if>
								<c:if test="${result.cnsrGb == '7' }"><td>기타</td></c:if>
								<td>${result.reqCnsr }</td>
								<td>${result.reqDt }</td>
								<td>${result.rplyCnsr }</td>
								<c:if test="${result.answerYn == 'Y' }"><td>답변완료</td></c:if>
								<c:if test="${result.answerYn == 'N' }"><td>답변요청중</td></c:if>
							</tr>
						</c:forEach>
					</c:if>
				</tbody>
			</table>
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

