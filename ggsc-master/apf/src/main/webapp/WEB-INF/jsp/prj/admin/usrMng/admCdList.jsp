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
				<h1>신탁계약등록</h1>
			</div>
			<div class="nav-container">
				<ul class="left_nav">
					<li class="active">
						<a href="/admCdList.do">지시서관리</a>
					</li>
					<li>
						<a href="/admTrstList.do">신탁계약서관리</a>
					</li>
					<li>
						<a href="/admCdFileList.do">요양지지서첨부파일</a>
					</li>
					<li>
						<a href="/admTrstFileList.do">신탁계약서첨부파일</a>
					</li>
				</ul>
			</div>
		</div> 
		<!-- //snb --> 
		
		<form commandName="searchVO" id="admCdFrm" name="admCdFrm" method="post">
		<!-- content --> 
		<div class="content"> 
			<div class="paT40 paB25">
				<h1>사전의료요양지시서</h1>
			</div>
			
			<!-- 검색영역 --> 
			<div class="search_box">
				<fieldset>
					<legend>검색영역</legend>
					<div class="search_group ">
						<strong>작성자명</strong>
						<span class="search_line">|</span>
						<input type="text" id="witr_name" name="witr_name" value="" />
					</div>
					<div class="search_group mgT5">
						<strong>제1대리인</strong>
						<span class="search_line">|</span>
						<input type="text" id="rpt1_name" name="rpt1_name" value="" />
						<a class="btn_search" href="javascript:fn_sch();">검색</a>
					</div>
				</fieldset> 
			</div>
			<!-- //검색영역 -->
			
			 
			<p class="board_total"><font color="blue">Total : ${paginationInfo.totalRecordCount}</font> <font color="red">(관리번호를 누르면 상세페이지로 이동합니다.)</font></b></p>
			<!-- list  start -->
			<table class="notice_tbl" border="0" cellspacing="0" summary="요양지시서관리입니다."> 
			<caption></caption> 
			<colgroup> 
				<col width="8%"></col>
				<col width="14%"></col>
				<col width="10%"></col>
				<col width="10%"></col>
				<col width="10%"></col>
				<col width="15%"></col>
				<col width="10%"></col>
				<col width="10%"></col>
				<col width="10%"></col>
			</colgroup> 
			<thead> 
			<tr> 
				<th scope="col">순번</th>
				<th scope="col">관리번호</th> 
				<th scope="col">작성자</th> 
				<th scope="col">제1대리인</th> 
				<th scope="col">제2대리인</th>
				<th scope="col">pdf생성</th> 
				<th scope="col">다운로드</th>
				<th scope="col">보고서</br>업로드</th>
				<th scope="col">감독기록</br>업로드</th> 
			</tr> 
			</thead> 
			<tbody> 
			
			<input type="hidden" id="mng_no" name="mng_no" value=""/>
			<input type="hidden" id="witr_id" name="witr_id" value=""/>
			<input type="hidden" id="rpt1_id" name="rpt1_id" value=""/>
			<input type="hidden" id="rpt2_id" name="rpt2_id" value=""/>
			
			
			
			<c:forEach var="result" items="${cdList}" varStatus="status">
			
				
					<tr>
						<td><c:out value="${paginationInfo.totalRecordCount+1 - ((searchVO.pageIndex-1) * searchVO.pageSize + status.count)}"/></td> 
						<td style="cursor:pointer;" onclick="javascript:fn_detail('<c:out value="${result.mngNo}"/>','<c:out value="${result.witrId}"/>','<c:out value="${result.rpt1Id}"/>');" onmouseover="this.style.backgroundColor='#f1f1f1'" onmouseout="this.style.backgroundColor='#ffffff'">
							<c:out value="${result.mngNo}"/>
						</td>
						<td><c:out value="${result.witrName}"/></td>
						<td><c:out value="${result.rpt1Name}"/></td> 
						<td><c:out value="${result.rpt2Name}"/></td> 
					
						<td>
						<c:if test="${result.orgFileNm == null}">
							<a href="javascript:fn_make_pdf('<c:out value="${result.mngNo}"/>','<c:out value="${result.witrId}"/>');" class="btn_big"><strong>pdf생성</strong></a>
						</c:if>
						<c:if test="${result.orgFileNm != null}">
							생성됨
						</c:if>
						</td> 
					
					<c:if test="${result.orgFileNm != null}">	
						<td><a href="javascript:fn_pdf_download('<c:out value="${result.mngNo}"/>','<c:out value="${result.witrId}"/>');" class="btn_big"><strong>다운로드</strong></a></td>
					</c:if> 
					<c:if test="${result.orgFileNm == null}">				
						<td><c:out value="${result.orgFileNm}"/></td>	
					</c:if>		
						<td>
							<a href="javascript:fn_rpt('<c:out value="${result.mngNo}"/>','<c:out value="${result.witrId}"/>','<c:out value="${result.witrName}"/>','<c:out value="${result.rpt1Id}"/>','<c:out value="${result.rpt2Id}"/>');" class="btn_big"><strong>보고서</strong></a>
						</td> 
						<td>
							<c:if test="${result.rpt2Id != null}">
							<a href="javascript:fn_report('<c:out value="${result.mngNo}"/>','<c:out value="${result.witrId}"/>','<c:out value="${result.witrName}"/>','<c:out value="${result.rpt2Id}"/>');" class="btn_big"><strong>감독기록</strong></a>
							</c:if>
						</td>
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
			<!-- <div class="fl_R"><a href="javascript:fn_Reg();" class="btn_big"><strong>등록하기</strong></a></div> -->
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
        
	    /* 검색하기 */
	    function fn_sch() {
	    	
	    	
	       	document.admCdFrm.action = "/admCdList.do";
	       	document.admCdFrm.submit();
	       	
	    }
	    
	    
	    
	    /* pdf 생성 */
	    function fn_make_pdf(mng_no, witr_id) {
	    	var data=new FormData();
	    	data.append("mng_no",mng_no);
	    	data.append("witr_id",witr_id);
	    	
	       	$.ajax({
		        data: data ,
		        type: "POST",
		        url: "/admCdMakePdf.do",
		        cache: false,
		        contentType: false,
		        processData: false,
		        dataType:"json",	        
		        success: function(json) {
		        	alert("생성 되었습니다.");
		        	document.admCdFrm.action = "/admCdList.do";
			       	document.admCdFrm.submit();
		        	
		        }     
		    });
	    }
	    
	    
	    
	    /* 상세보기 화면으로 이동 */
        function fn_detail(mng_no, witr_id, rpt1_id) {
        	
	    	document.admCdFrm.mng_no.value = mng_no;
	    	document.admCdFrm.witr_id.value = witr_id;
	    	document.admCdFrm.rpt1_id.value = rpt1_id;
	    	
           	document.admCdFrm.action = "/admCdListView.do";
           	document.admCdFrm.submit();
           	
           	
        }
	    
	    
        
        
        /* pagination 페이지 링크 function */
        function fn_egov_link_page(pageNo){
        	
        	alert("pageNo ====  "+pageNo);
        	//document.admNotFrm.pageIndex.value = pageNo;
        	//alert("document.admNotFrm.pageIndex.value == "+document.admNotFrm.pageIndex.value);
        	
        	document.admRdFrm.action = "/admRdEachList.do";
           	document.admRdFrm.submit();
        }
        
        
        //보고서 업로드
        function fn_rpt(mng_no, witr_id, witr_name, rpt1_id, rpt2_id) {
        	
        	document.admCdFrm.mng_no.value = mng_no;
	    	document.admCdFrm.witr_id.value = witr_id;
	    	document.admCdFrm.witr_name.value = witr_name;
	    	document.admCdFrm.rpt1_id.value = rpt1_id;
	    	document.admCdFrm.rpt2_id.value = rpt2_id;
	    	
	    
	    	
           	document.admCdFrm.action = "/admCdRptMove.do";
           	document.admCdFrm.submit();
           	
       	}
        
        //감독기록 업로드
        function fn_report(mng_no, witr_id, witr_name, rpt2_id) {
        	
        	
        	document.admCdFrm.mng_no.value = mng_no;
	    	document.admCdFrm.witr_id.value = witr_id;
	    	document.admCdFrm.witr_name.value = witr_name;
	    	document.admCdFrm.rpt2_id.value = rpt2_id;
	    	
           	document.admCdFrm.action = "/admCdReportMove.do";
           	document.admCdFrm.submit();
           	
       	}
        
       
        
        
        //-->
    </script>
	
	
	<!-- footer --> 
	<div class="footer"> 
		<p>All Rights Reserved.</p>
	</div> 
	<!-- //footer --> 