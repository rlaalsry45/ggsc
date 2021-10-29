<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!-- container --> 
	<div class="container">
		<!-- snb --> 
		<div class="snb">
			<div class="left_title">
				<h1>회원관리</h1>
			</div>
			<div class="nav-container">
				<ul class="left_nav">
					<li class="active">
						<a href="/usrMngList.do">회원정보</a>
					</li>
				</ul>
			</div>
		</div> 
		<!-- //snb --> 
		
		
		<form commandName="searchVO" id="usrMngFrm" name="usrMngFrm" method="post">
		<!-- content --> 
		<div class="content"> 
			<div class="paT40 paB25">
				<h1>회원정보 목록</h1>
			</div>
			<!-- 검색영역 --> 
			<div class="search_box">
				<fieldset>
					<legend>검색영역</legend>
					<div class="search_group ">
						<strong>분류</strong>
						<span class="search_line">|</span>
						<select class="search_select">
							<option>아이디</option> 
							<option>성명</option>
							<option>전화번호</option>
							<option>이메일</option>
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
			<table class="notice_tbl" border="0" cellspacing="0" summary="회원정보입니다."> 
			<caption></caption> 
			<colgroup> 
				<col width="10%">
				<col width="10%">
				<col width="10%">
				<col width="10%"> 
				<col width="*">
				<col width="13%"> 
				<col width="17%"> 
			</colgroup> 
			<thead> 
			<tr> 
				<th scope="col">번호</th>
				<th scope="col">아이디</th>
				<th scope="col">비밀번호</th> 
				<th scope="col">성명</th> 
				<th scope="col">생년월일</th> 
				<th scope="col">주소</th> 
				<th scope="col">전화번호</th> 
				<th scope="col">이메일</th>
			</tr> 
			</thead> 
			<tbody> 
			
			<input type="hidden" id="selectedId" name="selectedId" value=""/>
			
				<c:forEach var="result" items="${usrMngList}" varStatus="status">
					<tr style="cursor:pointer;" onclick="javascript:fn_detail('<c:out value="${result.id}"/>');" onmouseover="this.style.backgroundColor='#f1f1f1'" onmouseout="this.style.backgroundColor='#ffffff'"> 
						<td><c:out value="${paginationInfo.totalRecordCount+1 - ((searchVO.pageIndex-1) * searchVO.pageSize + status.count)}"/></td>
						<td>${result.id}</td>
						<td>******</td>
						<td>${result.name}</td> 
						<td>${result.birthDt}</td> 
						<td class="txtL paL10">${result.addr}</td> 
						<td>${result.tel}</td> 
						<td>${result.email}</td> 
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
			<!--<div class="fl_R"><a href="#" class="btn_big"><strong>등록하기</strong></a></div>-->
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
	
	
	<!--/#action-->
    <script type="text/javaScript" language="javascript" defer="defer">
        
        /* 글 수정 화면 function */
        function fn_detail(id) {
        	document.usrMngFrm.selectedId.value = id;
        	document.usrMngFrm.action = "/admUsrMng_view.do";
           	document.usrMngFrm.submit();
        }
        
        /* pagination 페이지 링크 function */
        function fn_egov_link_page(pageNo){
        	document.notFrm.pageIndex.value = pageNo;
        	document.notFrm.action = "/notList.do";
           	document.notFrm.submit();
        }
        
        /* 글 목록 화면 function */
        function fn_egov_selectList() {
        	
        	document.notFrm.action = "/notList.do";
           	document.notFrm.submit();
        }
        
        
        <!--
        /* 글 등록 화면 function */
        function fn_egov_addView() {
           	document.listForm.action = "<c:url value='/addSample.do'/>";
           	document.listForm.submit();
        }
        
        //-->
    </script>
	
	
	<!-- footer --> 
	<div class="footer"> 
		<p>All Rights Reserved.</p>
	</div> 
	<!-- //footer --> 