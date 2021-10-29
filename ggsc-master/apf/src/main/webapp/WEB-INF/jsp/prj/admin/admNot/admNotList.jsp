<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!-- wrap --> 
<div class="wrap"> 
	
	<!-- container --> 
	<div class="container">
		<!-- snb --> 
		<div class="snb">
			<div class="left_title">
				<h1>소통마당</h1>
			</div>
			<div class="nav-container">
				<ul class="left_nav">
					<li class="active">
						<a href="/admNotList.do">공지사항관리</a>
					</li>
				</ul>
			</div>
		</div> 
		<!-- //snb --> 
		
		<form commandName="searchVO" id="admNotFrm" name="admNotFrm" method="post">
		<!-- content --> 
		<div class="content"> 
			<div class="paT40 paB25">
				<h1>공지사항 목록</h1>
			</div>
			<!-- 검색영역 --> 
			<div class="search_box">
				<fieldset>
					<legend>검색영역</legend>
					<div class="search_group ">
						<strong>분류</strong>
						<span class="search_line">|</span>
						<select class="search_select">
							<option>제목</option> 
							<option>내용</option>
							<option>제목+내용</option>
						</select>
					</div>
					<div class="search_group mgT5">
						<strong>검색어</strong>
						<span class="search_line">|</span>
						<input title="검색어" class="search_input" accesskey="s" type="text">
						<a class="btn_search" href="#">검색</a>
					</div>
				</fieldset>   
			</div>
			<!-- //검색영역 -->
			<p class="board_total">Total : ${paginationInfo.totalRecordCount}</p>
			<!-- list  start -->
			<table class="notice_tbl" border="0" cellspacing="0" summary="공지사항관리입니다."> 
			<caption></caption> 
			<colgroup> 
				<col width="10%"></col>
				<col width="50%"></col>
				<col width="15%"></col>
				<col width="15%"></col>
				<col width="10%"></col>

			</colgroup> 
			<thead> 
			<tr> 
				<th scope="col">번호</th> 
				<th scope="col">제목</th> 
				<th scope="col">작성자</th> 
				<th scope="col">날짜</th> 
				<th scope="col">조회</th> 
			</tr> 
			</thead> 
			<tbody> 
			
			<input type="hidden" id="selectedId" name="selectedId" value=""/>
			
			
			<c:forEach var="result" items="${admNotList}" varStatus="status">
				<tr style="cursor:pointer;" onclick="javascript:fn_detail('<c:out value="${result.bdId}"/>');" onmouseover="this.style.backgroundColor='#f1f1f1'" onmouseout="this.style.backgroundColor='#ffffff'"> 
					<td><c:out value="${paginationInfo.totalRecordCount+1 - ((searchVO.pageIndex-1) * searchVO.pageSize + status.count)}"/></td> 
					<td class="txtL paL10"><c:out value="${result.bdTitle}"/></td> 
					<td><c:out value="${result.regId}"/></td> 
					<td><c:out value="${result.regTm}"/></td> 
					<td><c:out value="${result.bdCnt}"/></td> 
	 
				</tr>
			</c:forEach>
			
			</tbody>
			</table>
			<div class="paginate"> 
				<div id="paging">
                    <ul class="pagination">
                      	<ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="fn_egov_link_page" />
                      	<form:hidden path="pageIndex" />
                    </ul>
                </div>
			</div>
			<div class="fl_R"><a href="javascript:fn_Reg();" class="btn_big"><strong>등록하기</strong></a></div>
			<!-- <div>
				<fieldset class="srch"> 
				<legend>검색영역</legend> 
				<select> 
					<option>제목</option> 
					<option>내용</option>
					<option>제목+내용</option>				
				<input title="검색어" class="keyword" accesskey="s" type="text">
				<a class="btn_chk" href="sub_02_1_1.html"><strong>검색</strong></a>
				</fieldset> 
			</div> -->
			<!-- list  end -->
		</div> 
		<!-- //content --> 
		</form>
		
	</div> 
	<!-- //container --> 
	
</div>
<!-- /wrap -->  
	
	
	<!--/#action-->
    <script type="text/javaScript" language="javascript" defer="defer">
        
        /* 글 수정 화면 function */
        function fn_detail(id) {
        	
        	document.admNotFrm.selectedId.value = id;
        	
        	document.admNotFrm.action = "/admNot_view.do";
           	document.admNotFrm.submit();
        }
        
        /* pagination 페이지 링크 function */
        function fn_egov_link_page(pageNo){
        	
        	alert("pageNo ====  "+pageNo);
        	//document.admNotFrm.pageIndex.value = pageNo;
        	//alert("document.admNotFrm.pageIndex.value == "+document.admNotFrm.pageIndex.value);
        	
        	document.admNotFrm.action = "/admNotList.do";
           	document.admNotFrm.submit();
        }
        
        /* 글 목록 화면 function */
        function fn_egov_selectList() {
        	
        	document.admNotFrm.action = "/admNotList.do";
           	document.admNotFrm.submit();
        }
        
        /* 등록화면으로 이동 */
        function fn_Reg() {
        	
           	document.admNotFrm.action = "/admRegMove.do";
           	document.admNotFrm.submit();
        }
        
        
        //-->
    </script>
	
	
	<!-- footer --> 
	<div class="footer"> 
		<p>All Rights Reserved.</p>
	</div> 
	<!-- //footer --> 