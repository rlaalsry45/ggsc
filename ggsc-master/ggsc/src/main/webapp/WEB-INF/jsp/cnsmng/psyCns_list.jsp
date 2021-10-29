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
  </head>
<script type="text/javascript">
	$(document).ready(function() {
		var page = "${page}";
		if(page == ""){
			page = 1;
		}
		
		var schCnsGb = "${vo.schCnsGb}";
		var schCenterGb = "${vo.schCenterGb}";
		$("select[name=schCnsGb]").val(schCnsGb);
		$("select[name=schCenterGb]").val(schCenterGb);
		
		psy_list('${param.caseNo}', '${param.gIdx}');
	});

	function fn_excelDown(){
		document.location.href = "/gnoincoundb/cnsAcptExcelDown.do";
	}

	function fn_popup(type, caseNo){
		var url = "/gnoincoundb/cnsAcceptDtl.do?type="+type+"&caseNo="+caseNo;
		var name = "신청자정보";
		var option = "width = 530, height = 750, top = 50, left = 500, location = yes";
		window.open(url, name, option);
	}
	
	function fn_popupDoc(psyNum, gIdx, dtlIdx, rnum){
		
		if(psyNum == "106" || psyNum == "107" || psyNum == "113") {
			alert("사용하지 않는 심리검사지입니다.");
			return false;
		}
		
		var mnuCd = "${mnuCd}";
		var url = "/gnoincoundb/psyCnsDoc.do?mnuCd="+mnuCd+"&psyNum="+psyNum+"&gIdx="+gIdx+"&dtlIdx="+dtlIdx + "&rnum=" + rnum;
		var name = "상담사전사후기록지";
		var option = "width = 1100, height = 750, top = 50, left = 200, location = yes";
		window.open(url, name, option);
	}
	
	function fn_search(mnuCd) {
		document.searchForm.action = "/gnoincoundb/psyCnsList.do?mnuCd="+mnuCd;
       	document.searchForm.submit(); 
	}
	
	function fn_detail(caseNo){
		var mnuCd = $("#mnuCd").val();
		document.location.href = "/gnoincoundb/ealyCnsDocDtl.do?caseNo="+caseNo+"&mnuCd="+mnuCd;
	}
	
	function list(curPage) {
		
		$("#currentPageNo").val(curPage);
		document.searchForm.action = "/gnoincoundb/psyCnsList.do";
       	document.searchForm.submit();
	}
	
	function fn_list() {
		var mnuCd = $("#mnuCd").val();
		document.location.href = "/gnoincoundb/psyCnsList.do?mnuCd="+mnuCd;
	}
	
	function psy_list(caseNo, gIdx) {
		var param = {g_idx : gIdx};
		if ( gIdx == undefined) return;
		var token = $("meta[name='_csrf']").attr("th:content");
		var header = $("meta[name='_csrf_header']").attr("th:content");
		$.ajax({
			type : "POST",
			url : "/gnoincoundb/psyCnsList_ajax.do",
			data:param,
			dataType : "json",
			beforeSend : function(xhr){
				xhr.setRequestHeader(header, token);
			},
			success : function(json) {
				
				var html = '';
				
				if (json.psyCnsList.length == 0 || gIdx == 0) {
					html += '<tr><td colspan="6">정보가 없습니다.</td></tr>';
					$("#tby2").html(html);
					return;
				}
				console.log(json.psyCnsList);
				$.each(json.psyCnsList, function(i, d) {
					html += '<tr>';
					html += '<td onclick="javascript:fn_popupDoc(\''+d.psyNum+'\' , \''+d.gIdx+'\', \''+d.dtlIdx+'\', \'' + d.psyOrder + '\');">' + d.psyOrder + '</td>';
					html += '<td onclick="javascript:fn_popupDoc(\''+d.psyNum+'\' , \''+d.gIdx+'\', \''+d.dtlIdx+'\', \'' + d.psyOrder + '\');" style="text-align:left; text-indent:10px;">' + d.psyName + '</td>';
					html += '<td onclick="javascript:fn_popupDoc(\''+d.psyNum+'\' , \''+d.gIdx+'\', \''+d.dtlIdx+'\', \'' + d.psyOrder + '\');">'+ d.psyGubun +'</td>';
					/* html += '<td>' + ( d.psyCustomer == null ? '' : d.psyCustomer) + '</td>' +
							'<td>' + ( d.psyStart == null ? '' : d.psyStart) + '</td>' + 
							'<td>' + ( d.psyEnd == null ? '' : d.psyEnd) + '</td>' + 
							'</tr>'; */
					html += '<td>' + ( d.psyCustomer == null ? '' : d.psyCustomer) + '</td>';
						if(d.psyCustomer == null) {
							html += '<td></td>';
						} else {
							html += '<td><button type="button" id="pdfBtn" class="btn-basic btn-primary" onclick="javascript:fn_pdfDownload(\''+d.psyOrder+'\',\''+d.dtlIdx+'\');">PDF 다운</button></td>';
						}	
							//+'</td>'	
							//'+'</tr>';
					html += '</tr>';
					
				});
				
				$("#tby2").html(html);
				$(".caseNo").text("caseNo. " + caseNo);
	
			},
			error : function(e) {
				alert("서버와 통신 오류입니다.");
			}
		});
	}
	/*
	$('input[type="text"]').keydown(function() {
		  if (event.keyCode === 13) {
		    list(1);
		  };
	});
	*/
	
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

	<h2 class="h2-title"><i class="fa fa-check-square"></i>심리검사</h2>
		
		<div class="box-style1 x-scroll-auto" >
		<!-- 검색영역 -->
		<form name="searchForm" id="searchForm" action="/psyCnsList.do" method="get" onsubmit="return false">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			<input type="hidden" id="currentPageNo" name="currentPageNo" value="1" />
			<input type="hidden" id="mnuCd" name="mnuCd" value="${mnuCd}" />
			<div class="search-box">
				<div class="search-group" style="margin-left:170px;">
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
					<span class="label"><label>센터구분</label></span>
					<span class="label2">
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
					</span>
				</div>
				<br>
				<div class="btn" style="padding-bottom:15px;padding-right:50px;">
					<button type="button" class="btn-search" id="searchBtn" onclick="javascript:fn_search('${mnuCd}');">
						<i class="fa fa-search"></i>검색
					</button>
				</div>
				<div class="search-group" style="margin-left:170px;">
					<span class="label"><label>내담자명</label></span>
					<span class="label2">
						<input type="text" name="schCnsleNm" style="width:275px;" value="${vo.schCnsleNm}" enterSearch data-button='#searchBtn'>
					</span>
				</div>
				<div class="search-group" style="margin-left:70px;">
					<span class="label">등록일</span> <input type="text" name="schStartDate" id="datepicker1" value="${vo.schStartDate }" style="width: 100px;" readOnly/> &nbsp;&nbsp;&nbsp; ~ &nbsp;<input type="text" name="schEndDate" id="datepicker2" value="${vo.schEndDate}" style="width: 100px;" readOnly/>
				</div>
			</div>
		</form>
			<div>
				<ul class="tabs">
					<li style="border-style: solid; border-bottom-style:none; border-width: thin;" onclick="fn_goLink(1);">개인상담</li>
					<li style="border-style: solid; border-bottom-style:none; border-width: thin;" onclick="fn_goLink(2);">집단상담</li>
					<li style="border-style: solid; border-bottom-style:none; border-width: thin; background-color: gray;">심리검사</li>
					<li style="border-style: solid; border-bottom-style:none; border-width: thin;" onclick="fn_goLink(4);">연계의뢰서</li>
					<li style="border-style: solid; border-bottom-style:none; border-width: thin;" onclick="fn_goLink(5);">수퍼비전</li>
				</ul>
			</div>
			
			<!-- 
			<div class="btn" style="float: right; margin: 0;">
				<button type="button" class="btn-basic" onClick="javascript:fn_reg('${mnuCd }');" style="background-color: green;color:white;">초기상담신청서작성</button>
			</div>
			 -->	
			<h3 class="h3-title"><i class="fa fa-star"></i>상담내용</h3>
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
					<c:if test="${psyList.size() == 0 }">
						<tr>
							<td colspan="12">정보가 없습니다.</td>
						</tr>
					</c:if>
					<c:if test="${psyList.size() > 0 }">
						<c:forEach items="${psyList }" var="result">
							<tr onclick="javascript:psy_list('${result.caseNo}', '${result.num}');">
								<td>${result.rnum }</td>
								<td>${result.caseNo }</td>
								<td>${result.cnsleNm }</td>
								<td>${result.cnsGbCd}</td>
								<td>${result.cnsCnt }회기</td>
								<td>${result.cnsDt }</td>
								<td>${result.cnsStatCd }</td>
								<td>${result.cnsrNm }</td>
								<td>
									<c:if test="${result.gender eq 'M'}">남</c:if>
									<c:if test="${result.gender eq 'F'}">여</c:if>
								</td>
								<td>${result.age }세</td>
								<td>${result.eduCd }</td>
								<td>${result.killsRskn }</td>
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
			
			<h3 class="h3-title" style="margin-top:50px;"><i class="fa fa-star"></i>심리검사 <span class='caseNo'></span></h3>
			<%-- <table class="table-style1" style="margin-bottom: 5px;">
				<colgroup> 
					<col width="2%"></col>
					<col width="7%"></col> 
					<col width="7%"></col>
					<col width="5%"></col>
					<col width="7%"></col>
					<col width="7%"></col>
				</colgroup>
				<thead>
					<tr>
						<th scope="col">순번</th>
						<th scope="col">구분명</th>
						<th scope="col">구분</th>
						<th scope="col">상담자</th> 
						<th scope="col">시작일자</th>
						<th scope="col">종결일자</th>
					</tr>
				</thead>
				<tbody id="tby1">
					<c:if test="${examDocList.size() == 0 }">
						<tr>
							<td colspan="13">정보가 없습니다.</td>
						</tr>
					</c:if>
					<c:if test="${examDocList.size() > 0 }">
						<c:forEach items="${examDocList }" var="result">
							<tr onclick="javascript:fn_detail('${result.examDocCd}');">
								<td>${result.rnum }</td>
								<td>${result.examDocNm }</td>
								<c:if test="${result.beingYn == '1' }"><td>필수</td></c:if>
								<c:if test="${result.beingYn == '2' }"><td>불필요</td></c:if>
								<c:if test="${result.beingYn == '3' }"><td>선택</td></c:if>
								<td>${result.regId }</td>
								<td>${result.dbInsTm }</td>
								<td>종결일자</td>
							</tr>
						</c:forEach>
					</c:if>
				</tbody>
			</table> --%>
			
			<table class="table-style1" style="margin-bottom: 5px;">
				<colgroup> 
					<col width="2%"></col>
					<col width="7%"></col> 
					<col width="7%"></col>
					<col width="5%"></col>
					<col width="7%"></col>
					<%-- <col width="7%"></col> --%>
				</colgroup>
				<thead>
					<tr>
						<th scope="col">순번</th>
						<th scope="col">구분명</th>
						<th scope="col">구분</th>
						<th scope="col">상담자</th> 
						<th scope="col">PDF</th>
						<!-- <th scope="col">종결일자</th> -->
					</tr>
				</thead>
				<tbody id="tby2">
				
				</tbody>
			</table>
			
		</div>
		<!-- end -->

	</section>

</html>

