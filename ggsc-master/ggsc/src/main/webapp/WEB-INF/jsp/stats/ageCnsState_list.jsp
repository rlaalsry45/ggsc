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
		// list();
	});
	function fn_excelDown(){
		document.location.href = "/gnoincoundb/center_ExcelDown.do";
	}
	
	function list2(){
		var token = $("meta[name='_csrf']").attr("th:content");
		var header = $("meta[name='_csrf_header']").attr("th:content");
		
		$.ajax({
			type : "POST",
			url : "/gnoincoundb/ageCnsStateList2_ajax.do",
			data : $("#searchForm").serialize(),
			dataType : "json",
			beforeSend : function(xhr){
				xhr.setRequestHeader(header, token);
			}
		}).done(function(json){
			$("#tbl_item_box tr.item, #tbl_item_box2 tr.item, #tbl_item_box3 tr.item").remove();
			for(var i=0;i<json.list.length;i++){
				var obj = json.list[i];
				
				if(obj.ageStr==null){
					$("#tbl_item_box").append('<tr class="item"><td colspan=15>등록된 정보가 없습니다.</td></tr>'); 
					$("#tbl_item_box2").append('<tr class="item"><td colspan=12>등록된 정보가 없습니다.</td></tr>');
					$("#tbl_item_box3").append('<tr class="item"><td colspan=11>등록된 정보가 없습니다.</td></tr>');
				}else{
					$("#tbl_item_box").append('<tr class="item">' + 
							'<td>' + obj.ageStr + '</td>' +
							'<td>' + obj.c0 + '</td>' +
							'<td>' + obj.c1 + '</td>' +
							'<td>' + obj.c2 + '</td>' +
							'<td>' + obj.c3 + '</td>' +
							'<td>' + obj.c4 + '</td>' +
							'<td>' + obj.c5 + '</td>' +
							'<td>' + obj.c6 + '</td>' +
							'<td>' + obj.c7 + '</td>' +
							'<td>' + obj.g0 + '</td>' +
							'<td>' + obj.g1 + '</td>' +
							'<td>' + obj.g2 + '</td>' +
							'<td>' + obj.g3 + '</td>' +
							'<td>' + obj.g4 + '</td>' +
							'<td>' + obj.g5 + '</td>' +
							'<td>' + obj.g6 + '</td>' +
							'<td>' + obj.g7 + '</td>' +
							'</tr>'
					);
					$("#tbl_item_box2").append("<tr class='item'>" + 
							'<td>' + obj.ageStr + '</td>' +
							'<td>' + obj.m1 + '</td>' +
							'<td>' + obj.m2 + '</td>' +
							'<td>' + obj.m3 + '</td>' +
							'<td>' + obj.m4 + '</td>' +
							'<td>' + obj.m5 + '</td>' +
							'<td>' + obj.m6 + '</td>' +
							'<td>' + obj.m7 + '</td>' +
							'<td>' + obj.m8 + '</td>' +
							'<td>' + obj.m9 + '</td>' +
							'<td>' + ( Number(obj.m10) + Number(obj.m11) ) + '</td>' +
							'</tr>'
					);
					
					$("#tbl_item_box3").append("<tr class='item'>" + 
							'<td>' + obj.ageStr + '</td>' +
							'<td>' + obj.p1 + '</td>' +
							'<td>' + obj.p2 + '</td>' +
							'<td>' + obj.p3 + '</td>' +
							'<td>' + obj.p4 + '</td>' +
							'<td>' + obj.p5 + '</td>' +
							'<td>' + obj.p6 + '</td>' +
							'<td>' + obj.p7 + '</td>' +
							'<td>' + obj.p8 + '</td>' +
							'<td>' + obj.p9 + '</td>' +
							'<td>' + obj.p10 + '</td>' +
							'</tr>'
					);
									
				};
			}
		}).fail(function(e){
			alert("서버와 통신 오류입니다.");
		});
	}

	function list() {
		var token = $("meta[name='_csrf']").attr("th:content");
		var header = $("meta[name='_csrf_header']").attr("th:content");
		$.ajax({
			type : "POST",
			url : "/gnoincoundb/ageCnsStateList_ajax.do",
			data : $("#searchForm").serialize(),
			dataType : "json",
			beforeSend : function(xhr){
				xhr.setRequestHeader(header, token);
			}
		}).done(function(json){
			var d = json.list[0];
			var obj = Object.entries(d);
			for(var i=0;i<obj.length;i++){
				var c = obj[i];
				$("td[data-class='" + c[0] + "']").text(c[1]);
			}
			list2();
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

	<h2 class="h2-title"><i class="fa fa-check-square"></i>연령별상담현황</h2>
		
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
						 <select name="schCnsGb" style="width:275px;">
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
					<span class="label"><label>일   자</label></span>
					<span class="label2">
						<input type="text" name="schDateGb" id="datepicker1" value="" style="width: 246px;" />
					</span>
				</div>
			</div>
		</form>
			<h3 class="h3-title" style="margin-top: 15px;">1. 연령별 내담자 현황</h3>
			<table class="table-style1">
                <colgroup>
                    <col style="width: 6%;" />
                    <col style="width: 6%;" />
                    <col style="width: 6%;" />
                    <col style="width: 6%;" />
                    <col style="width: 6%;" />
                    <col style="width: 6%;" />
                    <col style="width: 6%;" />
                    <col style="width: 6%;" />
                    <col style="width: 6%;" />
                    <col style="width: 6%;" />
                    <col style="width: 6%;" />
                    <col style="width: 6%;" />
                    <col style="width: 6%;" />
                    <col style="width: 6%;" />
                    <col style="width: 6%;" />
                    <col style="width: 6%;" />
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="col" colspan="2">계</th>
                        <th scope="col" colspan="14">연령별 내담자 현황</th>
                    </tr>
                    <tr>
                        <td rowspan="2">명(실인원)</td>
                        <td rowspan="2">건(연인원)</td>
                        <td colspan="2">85세 이상</td>
                        <td colspan="2">80세 ~ 85세</td>
                        <td colspan="2">75세 ~ 80세</td>
                        <td colspan="2">70세 ~ 75세</td>
                        <td colspan="2">65세 ~ 70세</td>
                        <td colspan="2">60세 ~ 65세</td>
                        <td colspan="2">60세 이하</td>
                    </tr>
                    <tr>
                    	<td>명</td>
                    	<td>건</td>
                    	<td>명</td>
                    	<td>건</td>
                    	<td>명</td>
                    	<td>건</td>
                    	<td>명</td>
                    	<td>건</td>
                    	<td>명</td>
                    	<td>건</td>
                    	<td>명</td>
                    	<td>건</td>
                    	<td>명</td>
                    	<td>건</td>
                    </tr>
                    <tr>
                    	<td data-class='p0'>&nbsp;</td>
                    	<td data-class='c0'>&nbsp;</td>
                    	<td data-class='p1'>&nbsp;</td>
                    	<td data-class='c1'>&nbsp;</td>
                    	<td data-class='p2'>&nbsp;</td>
                    	<td data-class='c2'>&nbsp;</td>
                    	<td data-class='p3'>&nbsp;</td>
                    	<td data-class='c3'>&nbsp;</td>
                    	<td data-class='p4'>&nbsp;</td>
                    	<td data-class='c4'>&nbsp;</td>
                    	<td data-class='p5'>&nbsp;</td>
                    	<td data-class='c5'>&nbsp;</td>
                    	<td data-class='p6'>&nbsp;</td>
                    	<td data-class='c6'>&nbsp;</td>
                    	<td data-class='p7'>&nbsp;</td>
                    	<td data-class='c7'>&nbsp;</td>
                    </tr>
                </tbody>
            </table>
			
			<h3 class="h3-title" style="margin-top: 15px;">2. 연령별 상담 현황</h3>
			<table class="table-style1">
                <colgroup>
                    <col style="width: 6%;" />
                    <col style="width: 5%;" />
                    <col style="width: 5%;" />
                    <col style="width: 5%;" />
                    <col style="width: 5%;" />
                    <col style="width: 5%;" />
                    <col style="width: 5%;" />
                    <col style="width: 5%;" />
                    <col style="width: 5%;" />
                    <col style="width: 6%;" />
                    <col style="width: 6%;" />
                    <col style="width: 6%;" />
                    <col style="width: 6%;" />
                    <col style="width: 6%;" />
                    <col style="width: 6%;" />
                    <col style="width: 6%;" />
                    <col style="width: 6%;" />
                </colgroup>
                <tbody id='tbl_item_box'>
                    <tr>
                        <th scope="col" rowspan="2">연령</th>
                        <th scope="col" colspan="8">개인상담(건)</th>
                        <th scope="col" colspan="8">집단상담(건)</th>
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
                        <td>소계</td>
                        <td>사별애도</td>
                        <td>죽음준비</td>
                        <td>관계개선<br>의사소통</td>
                        <td>심리정서</td>
                        <td>자아통합</td>
                        <td>치매예방</td>
                        <td>기타</td>
                    </tr>
                </tbody>
            </table>
            
            <h3 class="h3-title" style="margin-top: 15px;">3. 연령별 주호소 현황</h3>
			<table class="table-style1">
                <colgroup>
                    <col style="width: 9%;" />
                    <col style="width: 9%;" />
                    <col style="width: 9%;" />
                    <col style="width: 9%;" />
                    <col style="width: 9%;" />
                    <col style="width: 9%;" />
                    <col style="width: 9%;" />
                    <col style="width: 9%;" />
                    <col style="width: 9%;" />
                    <col style="width: 9%;" />
                    <col style="width: 9%;" />
                </colgroup>
                <tbody id='tbl_item_box2'>
                    <tr>
                        <th scope="col" colspan="11">연령별 주호소 현황</th>
                    </tr>
                    <tr>
                        <td>연령구분</td>
                        <td>심리정서</td>
                        <td>대인관계</td>
                        <td>건강</td>
                        <td>자살</td>
                        <td>경제,생활</td>
                        <td>치매</td>
                        <td>성</td>
                        <td>학대</td>
                        <td>가족</td>
                        <td>기타</td>
                    </tr>
                   
                </tbody>
            </table>
            
            <h3 class="h3-title" style="margin-top: 15px;">3. 연령별 심리검사 현황</h3>
			<table class="table-style1">
                <colgroup>
                    <col style="width: 9%;" />
                    <col style="width: 9%;" />
                    <col style="width: 9%;" />
                    <col style="width: 10%;" />
                    <col style="width: 9%;" />
                    <col style="width: 9%;" />
                    <col style="width: 9%;" />
                    <col style="width: 9%;" />
                    <col style="width: 9%;" />
                    <col style="width: 9%;" />
                    <col style="width: 8%;" />
                </colgroup>
                <tbody id='tbl_item_box3'>
                    <tr>
                    	<th scope="col" rowspan="2">연령구분</th>
                        <th scope="col" colspan="11">심리검사</th>
                    </tr>
                    <tr>
                        <td>DUKE-AD<br>간략우울</td>
                        <td>GDS-KR<br>노인우울</td>
                        <td>GDS-SI<br>노인우울자살사고</td>
                        <td>불안</td>
                        <td>스트레스</td>
                        <td>사별 스트레스</td>
                        <td>대인관계변화</td>
                        <td>부부의사소통</td>
                        <td>MMSE-K<br>치매선별</td>
                        <td>기타</td>
                    </tr>
                </tbody>
            </table>
            
		</div>
		<!-- end -->

	</section>

</html>