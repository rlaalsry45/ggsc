<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


<form id="admRdFrm" name="admRdFrm" method="post">		
	<!-- wrap --> 
	<div class="wrap"> 
		
		<!-- container --> 
		<div class="container">
			<!-- snb --> 
			<div class="snb">
				<div class="left_title">
					<h1>요양지시서관리</h1>
				</div>
				<div class="nav-container">
					<ul class="left_nav">
						<li class="active">
							<a href="/admRdCntList.do">차수관리</a>
						</li>
						<li>
							<a href="/admRdBdList.do">신탁계약등록</a>
						</li>
						<li>
							<a href="/admRdBdRstList.do">신탁계약결과</a>
						</li>
						<li>
							<a href="/admRdDirList.do">요양지시서등록</a>
						</li>
						<li>
							<a href="/admRdDirRstList.do">요양지시서결과</a>
						</li>
						<li>
							<a href="/admRdEachList.do">개별등록</a>
						</li>
					</ul>
				</div>
			</div> 
			<!-- //snb --> 
			<!-- content --> 
			<div class="content"> 
				<div class="paT40 paB25">
					<h1>차수관리 상세정보</h1>
				</div>
				<!-- view  start -->
				<table class="notice_view" border="1" cellspacing="0" summary=""> 
					<caption>요양지시서관리 내용입니다.</caption> 
					<colgroup> 
					<col width="150">
					<col width="*">
					</colgroup> 
					<tbody> 
						<tr> 
							<th>일련번호</th> 
							<td>${admRdVO.rd_num}</td> 
						</tr>
						<input type="hidden" id="rd_num" name="rd_num" value="${admRdVO.rd_num}" />
						<input type="hidden" id="rd_gb" name="rd_gb" value="${admRdVO.rd_gb}" />
						<tr> 
							<th>제목</th> 
							<td><input type="text" id="title" name="title" value="${admRdVO.title}" size="90%"/></td> 
						</tr> 
						<tr> 
							<th>구분</th> 
							<td>
								<c:if test="${admRdVO.rd_gb=='1'}">
									신탁계약
								</c:if>
								<c:if test="${admRdVO.rd_gb=='2'}">
									의료요양지시서
								</c:if>
								<c:if test="${admRdVO.rd_gb=='3'}">
									개별등록
								</c:if>
							</td> 
						</tr> 
						<tr> 
							<th>년도</th> 
							<td>
								<select id="year" name="year" style="width:120px;"> 
									<option value="2021" <c:if test="${admRdVO.year=='2021'}"> selected </c:if>  >2021년</option>
									<option value="2020" <c:if test="${admRdVO.year=='2020'}"> selected </c:if>  >2020년</option>
									<option value="2019" <c:if test="${admRdVO.year=='2019'}"> selected </c:if>  >2019년</option> 
									<option value="2018" <c:if test="${admRdVO.year=='2018'}"> selected </c:if>  >2018년</option>
									<option value="2017" <c:if test="${admRdVO.year=='2017'}"> selected </c:if>  >2017년</option>	
								</select>
							</td> 
						</tr>
						<tr> 
							<th>월</th> 
							<td>
								<select id="month" name="month" style="width:120px;"> 
									<option value="12" <c:if test="${admRdVO.month=='12'}"> selected </c:if> > 12월</option>
							 		<option value="11" <c:if test="${admRdVO.month=='11'}"> selected </c:if> > 11월</option>
									<option value="10" <c:if test="${admRdVO.month=='10'}"> selected </c:if> > 10월</option>
									<option value="09" <c:if test="${admRdVO.month=='09'}"> selected </c:if> > 9월</option>
									<option value="08" <c:if test="${admRdVO.month=='08'}"> selected </c:if> > 8월</option>
									<option value="07" <c:if test="${admRdVO.month=='07'}"> selected </c:if> > 7월</option>
									<option value="06" <c:if test="${admRdVO.month=='06'}"> selected </c:if> > 6월</option>
									<option value="05" <c:if test="${admRdVO.month=='05'}"> selected </c:if> > 5월</option>
									<option value="04" <c:if test="${admRdVO.month=='04'}"> selected </c:if> > 4월</option>
									<option value="03" <c:if test="${admRdVO.month=='03'}"> selected </c:if> > 3월</option>
									<option value="02" <c:if test="${admRdVO.month=='02'}"> selected </c:if> > 2월</option>
									<option value="01" <c:if test="${admRdVO.month=='01'}"> selected </c:if> > 1월</option>
								</select>
							</td> 
						</tr>
						<tr> 
							<th>차수</th> 
							<td>
								<select id="cnt" name="cnt" style="width:120px;"> 
									<option value="5" <c:if test="${admRdVO.cnt=='5'}"> selected </c:if>  >5차</option>
									<option value="4" <c:if test="${admRdVO.cnt=='4'}"> selected </c:if>  >4차</option>
									<option value="3" <c:if test="${admRdVO.cnt=='3'}"> selected </c:if>  >3차</option> 
									<option value="2" <c:if test="${admRdVO.cnt=='2'}"> selected </c:if>  >2차</option>
									<option value="1" <c:if test="${admRdVO.cnt=='1'}"> selected </c:if>  >1차</option>	
								</select>
							</td> 
						</tr>
						<tr> 
							<th>사용여부</th> 
							<td>
								<select name="use_yn" style="width:30%;" >
								<c:if test="${admRdVO.use_yn eq 'Y'}">
								    <option value="Y" selected>사용</option>
								    <option value="N">미사용</option>
								</c:if>
								<c:if test="${admRdVO.use_yn eq 'N'}">
									<option value="Y">사용</option>
								    <option value="N" selected>미사용</option>
								</c:if>
								</select>
							</td> 
						</tr>
						<tr>
							<th>등록일</th> 
							<td>${admRdVO.reg_dt}</td> 
						</tr> 
					</tbody> 
				</table>
				<div class="fl_R mgT10">
					<a href="javascript:fn_update();" class="btn_big"><strong>수정하기</strong></a>
					<a href="javascript:fn_list();" class="btn_big"><strong>목록보기</strong></a>
				</div>
				<!-- view  end -->
			</div> 
			<!-- //content --> 
		</div> 
		<!-- //container -->
		<!-- footer --> 
		<div class="footer"> 
			<p>All Rights Reserved.</p>
		</div> 
		<!-- //footer --> 
	</div>
	<!-- /wrap -->  
</form>	
	
    <!--/#action-->
    <script type="text/javaScript" language="javascript" defer="defer">
        
    	window.onload = function () {
	    	
    	}
    
	    function fn_update() {
	    	
	       	document.admRdFrm.action = "/admRdCntUpdate.do";
	       	document.admRdFrm.submit();
	    }
	    function fn_list() {
	    	document.admRdFrm.action = "/admRdCntList.do";
	       	document.admRdFrm.submit();
	    }
	    
	  
        
        //-->
    </script>

    