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
					<h1>개별등록</h1>
				</div>
				<div class="nav-container">
					<ul class="left_nav">
						<li>
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
						<li class="active">
							<a href="/admRdEachList.do">개별등록</a>
						</li>
					</ul>
				</div>
			</div> 
			<!-- //snb --> 
			<!-- content --> 
			<div class="content"> 
				<div class="paT40 paB25">
					<h1>개별등록 상세페이지</h1>
				</div>
				<!-- view  start -->
				<table class="notice_view" border="1" cellspacing="0" summary=""> 
					<caption>요양지시서관리 내용입니다.</caption> 
					<colgroup> 
					<col width="150">
					<col width="*">
					</colgroup> 
					<tbody> 
					<input type="hidden" id="file_num" name="file_num" value="${admRdVO.file_num}"/>
					<input type="hidden" id="rd_num" name="rd_num" value="${admRdVO.rd_num}"/>
					<input type="hidden" id="rd_gb" name="rd_gb" value="${admRdVO.rd_gb}"/>
					<input type="hidden" id="id" name="id" value="${admRdVO.id}"/>
					<input type="hidden" id="name" name="name" value="${admRdVO.name}"/>
					<input type="hidden" id="title" name="title" value="${admRdVO.title}"/>
					<input type="hidden" id="year" name="year" value="${admRdVO.year}"/>
					<input type="hidden" id="month" name="month" value="${admRdVO.month}"/>
					<input type="hidden" id="cnt" name="cnt" value="${admRdVO.cnt}"/>
					<input type="hidden" id="org_file_nm" name="org_file_nm" value="${admRdVO.org_file_nm}"/>
					<input type="hidden" id="sys_file_nm" name="sys_file_nm" value="${admRdVO.sys_file_nm}"/>
					<input type="hidden" id="file_path" name="file_path" value="${admRdVO.file_path}"/>
					<input type="hidden" id="file_size" name="file_size" value="${admRdVO.file_size}"/>
					<input type="hidden" id="reg_dt" name="reg_dt" value="${admRdVO.reg_dt}"/>
					<tr> 
						<th>일련번호</th> 
						<td>${admRdVO.rd_num}</td> 
					</tr>
					<tr> 
						<th>아이디</th> 
						<td>${admRdVO.id}</td> 
					</tr>
					<tr> 
						<th>성명</th> 
						<td>${admRdVO.name}</td> 
					</tr>
					<tr> 
						<th>제목</th> 
						<td>${admRdVO.title}</td> 
					</tr> 
					<tr> 
						<th>년도</th> 
						<td>${admRdVO.year}</td> 
					</tr>
					<tr> 
						<th>월</th> 
						<td>${admRdVO.month}</td> 
					</tr>
					<tr> 
						<th>차수</th> 
						<td>${admRdVO.cnt}</td> 
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
					<tr>
						<th>첨부파일</th> 
						<td><a href ="javascript:fn_downloadFile('${admRdVO.org_file_nm}')">${admRdVO.org_file_nm}</a></td> 
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
	    	
	       	document.admRdFrm.action = "/admRdEachUpdate.do";
	       	document.admRdFrm.submit();
	    }
	    function fn_list() {
	    	document.admRdFrm.action = "/admRdEachList.do";
	       	document.admRdFrm.submit();
	    }
	    
	    function fn_downloadFile(obj){ 
        	var idx = obj;
        	   	
        	document.admRdFrm.action = "/admRdEachDownloadFile.do";
           	document.admRdFrm.submit();
        	
        } 

       
        <!--
        /* 글 등록 화면 function */
        function fn_egov_addView() {
           	document.listForm.action = "<c:url value='/addSample.do'/>";
           	document.listForm.submit();
        }
        
        /* 글 목록 화면 function */
        function fn_egov_selectList() {
        	document.listForm.action = "<c:url value='/egovSampleList.do'/>";
           	document.listForm.submit();
        }
        
        /* pagination 페이지 링크 function */
        function fn_egov_link_page(pageNo){
        	document.listForm.pageIndex.value = pageNo;
        	document.listForm.action = "<c:url value='/egovSampleList.do'/>";
           	document.listForm.submit();
        }
        
        //-->
    </script>

    