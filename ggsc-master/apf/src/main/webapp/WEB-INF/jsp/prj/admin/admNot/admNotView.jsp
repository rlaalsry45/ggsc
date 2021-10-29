<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


<form id="admNotFrm" name="admNotFrm" method="post">		
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
			<!-- content --> 
			<div class="content"> 
				<div class="paT40 paB25">
					<h1>공지사항 상세정보</h1>
				</div>
				<!-- view  start -->
				<table class="notice_view" border="1" cellspacing="0" summary=""> 
					<caption>공지사항 내용입니다.</caption> 
					<colgroup> 
					<col width="150">
					<col width="*">
					</colgroup> 
					<tbody> 
					<input type="hidden" id="bd_id" name="bd_id" value="${admNotVO.bd_id}"/>
					<input type="hidden" id="bd_cnt" name="bd_cnt" value="${admNotVO.bd_cnt}"/>
					<input type="hidden" id="reg_id" name="reg_id" value="${admNotVO.reg_id}"/>
					<input type="hidden" id="reg_tm" name="reg_tm" value="${admNotVO.reg_tm}"/>
					<input type="hidden" id="upd_id" name="upd_id" value="${admNotVO.upd_id}"/>
					<input type="hidden" id="upd_tm" name="upd_tm" value="${admNotVO.upd_tm}"/>
					<tr> 
						<th>일련번호</th> 
						<td>${admNotVO.bd_id}</td> 
					</tr>
					<tr> 
						<th>제목</th> 
						<td><input type="text" id="bd_title" name="bd_title" value="${admNotVO.bd_title}" size="90%"/></td> 
					</tr> 
					<tr> 
						<th>게시판구분</th> 
						<td><input type="text" id="bd_gb" name="bd_gb" value="${admNotVO.bd_gb}" size="90%"/></td> 
					</tr> 
					<tr> 
						<th>조회수</th> 
						<td>${admNotVO.bd_cnt}</td> 
					</tr> 
					<tr> 
						<th>사용여부</th> 
						<td>
							<select name="use_yn" style="width:30%;" >
							<c:if test="${admNotVO.use_yn eq 'Y'}">
							    <option value="Y" selected>사용</option>
							    <option value="N">미사용</option>
							</c:if>
							<c:if test="${admNotVO.use_yn eq 'N'}">
								<option value="Y">사용</option>
							    <option value="N" selected>미사용</option>
							</c:if>
							</select>
						</td> 
					</tr>
					<tr> 
						<th>작성자</th> 
						<td>${admNotVO.reg_id}</td> 
					</tr>
					<tr>
						<th>등록일</th> 
						<td>${admNotVO.reg_tm}</td> 
					</tr> 
					<tr> 
						<th>수정자</th> 
						<td>${admNotVO.upd_id}</td> 
					</tr>
					<tr>
						<th>수정일</th> 
						<td>${admNotVO.upd_tm}</td> 
					</tr> 
					<tr>
						<th>첨부파일</th> 
						<td><a href ="javascript:fn_downloadFile('${admNotVO.org_file_nm}')">${admNotVO.org_file_nm}</a></td> 
					</tr> 
					
					<input type="hidden" id="org_file_nm" name="org_file_nm" value="${admNotVO.org_file_nm}"/>
					<input type="hidden" id="sys_file_nm" name="sys_file_nm" value="${admNotVO.sys_file_nm}"/>
					<input type="hidden" id="file_path" name="file_path" value="${admNotVO.file_path}"/>
					<input type="hidden" id="file_size" name="file_size" value="${admNotVO.file_size}"/>
					
					
					<tr> 
						<td class="cont" colspan="2"> 
							<input type="text" id="bd_content" name="bd_content" value="${admNotVO.bd_content}" size="90%"/>
						</td> 
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
	    	
	       	document.admNotFrm.action = "<c:url value='/admNotUpdate.do'/>";
	       	document.admNotFrm.submit();
	    }
	    function fn_list() {
	    	document.admNotFrm.action = "<c:url value='/admNotList.do'/>";
	       	document.admNotFrm.submit();
	    }
	    
	    function fn_downloadFile(obj){ 
        	var idx = obj;
        	   	
        	document.admNotFrm.action = "/admNotDownloadFile.do";
           	document.admNotFrm.submit();
        	
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

    