<%@ page import="egovframework.rte.psl.dataaccess.util.EgovMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<script src="/gnoincoundb/js/util/paging.js"></script>

<script type="text/javascript">
	$(function(){
		list();
	});
	function fn_excelDown(){
		document.location.href = "/gnoincoundb/center_ExcelDown.do";
	}

	function list() {
		var token = $("meta[name='_csrf']").attr("th:content");
		var header = $("meta[name='_csrf_header']").attr("th:content");
		
		$.ajax({
			type : "POST",
			url : "/gnoincoundb/personalCnsStateList_ajax.do",
			data : $("#searchForm").serialize(),
			dataType : "json",
			beforeSend : function(xhr){
				xhr.setRequestHeader(header, token);
			}
		}).done(function(json){
			$("#tbl_item_box tr.item").remove();
			for(var i=0;i<json.list.length;i++){
				var obj = json.list[i];
				
				if(obj.majorStr==null){
					$("#tbl_item_box").append('<tr class="item"><td colspan=13>등록된 정보가 없습니다.</td></tr>'); 
				}else{
					$("#tbl_item_box").append('<tr class="item">' + 
							'<td>' + obj.majorStr + '</td>' +
							'<td>' + obj.p0 + '</td>' +
							'<td>' + obj.p1 + '</td>' +
							'<td>' + obj.p2 + '</td>' +
							'<td>' + obj.p3 + '</td>' +
							'<td>' + obj.p4 + '</td>' +
							'<td>' + obj.p5 + '</td>' +
							'<td>' + obj.p6 + '</td>' +
							'<td>' + obj.p7 + '</td>' +
							'<td>' + obj.c1 + '</td>' +
							'<td>' + obj.c2 + '</td>' +
							'<td>' + obj.c3 + '</td>' +
							'<td>' + obj.c4 + '</td>' +
							'<td>' + obj.c5 + '</td>' +
							'<td>' + obj.c6 + '</td>' +
							'</tr>'
					);					
				};
			}
		}).fail(function(e){
			alert("서버와 통신 오류입니다.");
		});
	}
</script>
<style>
	.search-group select{width:150px;}
	.label {margin-right:40px;}
	.label2 {display:inline-block;width:275px;color:#333;padding-right:5px;margin-bottom:2px;letter-spacing:-0.5px;text-align:right;}
	
</style>
<section id="content">

	<h2 class="h2-title"><i class="fa fa-check-square"></i>개인상담현황</h2>
		
		<div class="box-style1 x-scroll-auto" >
				<!-- 검색영역 -->
		<form name="searchForm" id="searchForm" action="/bbsList.do" method="post" onsubmit="return false">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			<input type="hidden" id="currentPageNo" name="currentPageNo" value="1" />
			<input type="hidden" id="mnuCd" name="mnuCd" value="${mnuCd }" />
			<div class="search-box">
				<div class="search-group" style="margin-left:70px;">
					<span class="label"><label>상담구분</label></span>
					<span class="label2">
						 <select name=schCnsGb style="width:275px;">
						 	<option value="">전체</option>
							<c:forEach items="${cnsGbList }" var="result">
								<option value="${result.odr }">${result.mclassNm }</option>
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
							<c:forEach items="${cnsCenterList}" var="list">
								<c:choose>
									<c:when test="${authCd > 1}">
										<c:if test="${ list.num eq vo.schCenterGb }" >
											<option value="${list.num}" selected >${list.centerGb}</option>
										</c:if>
									</c:when>
									<c:when test="${authCd <= 1 }">								
										<option value="${list.num}" >${list.centerGb}</option>
									</c:when>
								</c:choose>
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
					<span class="label"><label>년도</label></span>
					<span class="label2">
						<input type="text" name="schYearGb" value="" style="width: 275px;" maxlength="4" onlyNumber />
					</span>
				</div>
				<div class="search-group" style="margin-left:70px;">
					<span class="label"><label>월</label></span>
					<span class="label2">
						<select name="schMonthGb" style="width:275px;">
							<option value="">전체</option>
							<c:forEach begin="1" end="12" step="1" var="month">
							<%--<fmt:formatNumber value="${month}" pattern="00" var="month"/>--%>
								<option value="${month}">${month}</option>
							</c:forEach>
						</select>
					</span>
				</div>
			</div>
		</form>
			<h3 class="h3-title" style="margin-top: 15px;">개인상담현황</h3>
			<table class="table-style1">
                <colgroup>
                    <col style="width: 7%;" />
                    <col style="width: 5%;" />
                    <col style="width: 5%;" />
                    <col style="width: 5%;" />
                    <col style="width: 5%;" />
                    <col style="width: 5%;" />
                    <col style="width: 5%;" />
                    <col style="width: 5%;" />
                    <col style="width: 5%;" />
                    <col style="width: 7%;" />
                    <col style="width: 7%;" />
                    <col style="width: 7%;" />
                    <col style="width: 7%;" />
                    <col style="width: 7%;" />
                    <col style="width: 7%;" />
                </colgroup>
               <tbody id='tbl_item_box'>
                    <tr>
                        <th scope="col" rowspan="2">주호소별</th>
                        <th scope="col" colspan="8">개인상담(건)</th>
                        <th scope="col" colspan="6">회기</th>
                    </tr>
                    <tr>
                        <td>소계</td>
                        <td>내방</td>
                        <td>방문</td>
                        <td>면접상담</td>
                        <td>전화상담</td>
                        <td>홈페이지</td>
                        <td>모바일</td>
                        <td>기타</td>
                        <td>5회기미만</td>
                        <td>5 ~ 10회기</td>
                        <td>10 ~ 15회기</td>
                        <td>15 ~ 20회기</td>
                        <td>20 ~ 25회기</td>
                        <td>25회기이상</td>
                    </tr>
                </tbody>
            </table>
            
		</div>
		<!-- end -->

	</section>

</html>
