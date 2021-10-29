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
					<li>
						<a href="/admCdList.do">지시서관리</a>
					</li>
					<li>
						<a href="/admTrstList.do">신탁계약서관리</a>
					</li>
					<li class="active">
						<a href="/admCdFileList.do">요양지지서첨부파일</a>
					</li>
					<li>
						<a href="/admTrstFileList.do">신탁계약서첨부파일</a>
					</li>
				</ul>
			</div>
		</div> 
		<!-- //snb --> 
		
		<form commandName="searchVO" id="admCdFileFrm" name="admCdFileFrm" method="post">
		<!-- content --> 
		<div class="content"> 
			<div class="paT40 paB25">
				<h1>사전의료요양지시서 첨부파일 다운로드</h1>
			</div>
			
			<!-- 검색영역 --> 
			<div class="search_box">
				<fieldset>
					<legend>검색영역</legend>
					<div class="search_group ">
						<strong>작성자명</strong>
						<span class="search_line">|</span>
						<input type="text" id="reg_name" name="reg_name" value="${reg_name}" size="24%"/>
					</div>
					<div class="search_group mgT5">
						<strong>년도</strong>
						<span class="search_line">|</span>
						<select id="sch_year" name="sch_year" style="width:20%;" >
							<option value="2020" <c:if test="${sch_year=='2020'}"> selected </c:if> >2020년</option>
						    <option value="2021" <c:if test="${sch_year=='2021'}"> selected </c:if> >2021년</option>
						    <option value="2022" <c:if test="${sch_year=='2022'}"> selected </c:if> >2022년</option>
						</select>
					</div>
					<div class="search_group mgT5">
						<strong>월</strong>
						<span class="search_line">|</span>
						<select id="sch_month" name="sch_month" style="width:20%;" >
							<option value="01" <c:if test="${sch_month=='01'}"> selected </c:if> >1월</option>
							<option value="02" <c:if test="${sch_month=='02'}"> selected </c:if> >2월</option>
						    <option value="03" <c:if test="${sch_month=='03'}"> selected </c:if> >3월</option>
						    <option value="04" <c:if test="${sch_month=='04'}"> selected </c:if> >4월</option>
						    <option value="05" <c:if test="${sch_month=='05'}"> selected </c:if> >5월</option>
						    <option value="06" <c:if test="${sch_month=='06'}"> selected </c:if> >6월</option>
						    <option value="07" <c:if test="${sch_month=='07'}"> selected </c:if> >7월</option>
						    <option value="08" <c:if test="${sch_month=='08'}"> selected </c:if> >8월</option>
						    <option value="09" <c:if test="${sch_month=='09'}"> selected </c:if> >9월</option>
						    <option value="10" <c:if test="${sch_month=='10'}"> selected </c:if> >10월</option>
						    <option value="11" <c:if test="${sch_month=='11'}"> selected </c:if> >11월</option>
						    <option value="12" <c:if test="${sch_month=='12'}"> selected </c:if> >12월</option>
						</select>
						
						<a class="btn_search" href="javascript:fn_sch();">검색</a>
					
					</div>
				</fieldset> 
			</div>
			<!-- //검색영역 -->
			
			 
			<p class="board_total"><font color="blue">Total : ${paginationInfo.totalRecordCount}</font> <font color="red"></font></b></p>
			<!-- list  start -->
			<table class="notice_tbl" border="0" cellspacing="0" summary="요양지시서관리입니다."> 
			<caption></caption> 
			<colgroup> 
				<col width="10%"></col>
				<col width="20%"></col>
				<col width="15%"></col>
				<col width="15%"></col>
				<col width="30%"></col>
				<col width="10%"></col>
			</colgroup> 
			<thead> 
			<tr> 
				<th scope="col">순번</th>
				<th scope="col">작성자ID</th> 
				<th scope="col">작성자</th> 
				<th scope="col">등록일자</th> 
				<th scope="col">파일명</th>
				<th scope="col">다운로드</th>
			</tr> 
			</thead> 
			<tbody> 
			
			<input type="hidden" id="tmpSys_file_nm" name="tmpSys_file_nm" value="" />
			<input type="hidden" id="tmpOrg_file_nm" name="tmpOrg_file_nm" value="" />
			<input type="hidden" id="tmpFile_path" name="tmpFile_path" value="" />
			<input type="hidden" id="tmpFile_size" name="tmpFile_size" value="" />
			
			<c:forEach var="result" items="${cdFileList}" varStatus="status">
			
				
					<tr>
						<td><c:out value="${result.cdFileNum}"/></td>
						<td><c:out value="${result.regId}"/></td>
						<td><c:out value="${result.regNm}"/></td> 
						<td><c:out value="${result.regTm}"/></td> 
						<td><c:out value="${result.orgFileNm}"/></td>
						<td>
							<c:if test="${result.orgFileNm != null}">
								<a href="javascript:fn_download('<c:out value="${result.cdFileNum}"/>','<c:out value="${result.orgFileNm}"/>','<c:out value="${result.sysFileNm}"/>','<c:out value="${result.filePath}"/>','<c:out value="${result.fileSize}"/>');" class="btn_big"><strong>다운로드</strong></a>
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
	    	
	    	
	       	document.admCdFileFrm.action = "/admCdFileList.do";
	       	document.admCdFileFrm.submit();
	       	
	    }
	    
	   
	    
	    /* 파일다운로드 */
	    function fn_download(cdFileNum, orgFileNm, sysFileNm, filePath, fileSize) {
	    	document.admCdFileFrm.tmpSys_file_nm.value = sysFileNm;
			document.admCdFileFrm.tmpOrg_file_nm.value = orgFileNm;
			document.admCdFileFrm.tmpFile_path.value = filePath;
			document.admCdFileFrm.tmpFile_size.value = fileSize;
			
			document.admCdFileFrm.action = "/admCdFileDwn.do";
	       	document.admCdFileFrm.submit();
	    	
	    }
	    
	    
        
        /* pagination 페이지 링크 function */
        function fn_egov_link_page(pageNo){
        	
        	alert("pageNo ====  "+pageNo);
        	//document.admNotFrm.pageIndex.value = pageNo;
        	//alert("document.admNotFrm.pageIndex.value == "+document.admNotFrm.pageIndex.value);
        	
        	document.admCdFileFrm.action = "/admCdFileList.do";
           	document.admCdFileFrm.submit();
        }
        
        
        
        
        //-->
    </script>
	
	
	<!-- footer --> 
	<div class="footer"> 
		<p>All Rights Reserved.</p>
	</div> 
	<!-- //footer --> 