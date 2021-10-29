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
					<h1>회원관리</h1>
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
			<!-- content --> 
			<div class="content"> 
				<div class="paT40 paB25">
					<h1>사전의료요양지시서 보고서 업로드</h1>
				</div>
				
				<h3 class="title"><b>보고서 다운로드</b></h3>
				<form id="admCdDownFrm" name="admCdDownFrm" method="post" enctype="multipart/form-data">
					<table class="notice_tbl" border="0" cellspacing="0" summary="요양지시서관리입니다."> 
					<caption></caption> 
					<colgroup> 
						<col width="10%"></col>
						<col width="20%"></col>
						<col width="15%"></col>
						<col width="15%"></col>
						<col width="25%"></col>
						<col width="15%"></col>
						
					</colgroup> 
					<thead> 
					<tr> 
						<th scope="col">순번</th>
						<th scope="col">관리번호</th>
						<th scope="col">작성자</th>
						<th scope="col">제1대리인</th>
						<th scope="col">파일명</th>
						<th scope="col">삭제</th>
					</tr> 
					</thead> 
					<tbody> 
					
					<input type="hidden" id="tmpMng_no" name="tmpMng_no" value="" />
					<input type="hidden" id="tmpWitr_id" name="tmpWitr_id" value="" />
					<input type="hidden" id="tmpRpt1_id" name="tmpRpt1_id" value="" />
					<input type="hidden" id="tmpSys_file_nm" name="tmpSys_file_nm" value="" />
					<input type="hidden" id="tmpOrg_file_nm" name="tmpOrg_file_nm" value="" />
					<input type="hidden" id="tmpFile_path" name="tmpFile_path" value="" />
					<input type="hidden" id="tmpFile_size" name="tmpFile_size" value="" />
					
					<c:forEach var="result" items="${cdList}" varStatus="status">
							<tr >
								<td><c:out value="${status.count}"/></td>
								<td><c:out value="${result.mngNo}"/></td>
								<td><c:out value="${result.witrName}"/></td>
								<td><c:out value="${result.rpt1Name}"/></td>
								<td>
									<a href="javascript:fn_file_download('<c:out value="${result.mngNo}"/>','<c:out value="${result.witrId}"/>','<c:out value="${result.rpt1Id}"/>','<c:out value="${result.sysFileNm}"/>','<c:out value="${result.orgFileNm}"/>','<c:out value="${result.filePath}"/>','<c:out value="${result.fileSize}"/>');" class="btn_big"><strong>${result.orgFileNm}</strong></a>
								</td>
								<td>
									<a href="javascript:fn_delete('<c:out value="${result.mngNo}"/>','<c:out value="${result.witrId}"/>','<c:out value="${result.rpt1Id}"/>','<c:out value="${result.rpt1Num}"/>');" style="width:60px;">삭제하기</a>
								</td>
								
							</tr>
					</c:forEach>
					
					</tbody>
					</table>
				</form>
				</br></br></br>
				
				
				<h3 class="title"><b>보고서 업로드</b></h3>
				<!-- view  start -->
				<div class="form_table">
					<form id="admCdFrm" name="admCdFrm" method="post" enctype="multipart/form-data">
							<table class="notice_view" border="1" cellspacing="0" summary=""> 
								<caption>보고서 업로드</caption> 
								<colgroup> 
								<col width="150">
								<col width="*">
								</colgroup> 
								<tbody> 
								
								<input type="hidden" id="mng_no" name="mng_no" value="${usrMngVO.mng_no}" >
								<input type="hidden" id="witr_id" name="witr_id" value="${usrMngVO.witr_id}" >
								<input type="hidden" id="witr_name" name="witr_name" value="${usrMngVO.witr_name}" >
								<input type="hidden" id="rpt1_id" name="rpt1_id" value="${usrMngVO.rpt1_id}" >
								<input type="hidden" id="rpt2_id" name="rpt2_id" value="${usrMngVO.rpt2_id}" >
								<tr> 
									<th>작성자</th> 
									<td>
										<div class="item">
										${usrMngVO.witr_name}
										</div>
									</td> 
								</tr> 
								<tr> 
									<th>보고서 업로드</th> 
									<td>
										<div class="item">
											<input type="file" id="rptFile" name="rptFile" value="" class="i_text wp95" >
										</div>
									</td> 
								</tr>  
								</tbody> 
							</table>
					</form>
				</div>
				<div class="fl_R mgT10">
					<a href="javascript:fn_upload();" class="btn_big"><strong>저장하기</strong></a>
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

	
    <!--/#action-->
    <script type="text/javaScript" language="javascript" defer="defer">
        
    	window.onload = function () {
    		
    	}
    
	    function fn_upload() {
	    	
			document.admCdFrm.action = "/admCdRptUpload.do";
	       	document.admCdFrm.submit();
	    }
	    
	    
		function fn_file_download(mng_no, witr_id, rpt1_id, sys_file_nm, org_file_nm, file_path,file_size) {
			
			
			document.admCdDownFrm.tmpMng_no.value = mng_no;
			document.admCdDownFrm.tmpWitr_id.value = witr_id;
			document.admCdDownFrm.tmpRpt1_id.value = rpt1_id;
			document.admCdDownFrm.tmpSys_file_nm.value = sys_file_nm;
			document.admCdDownFrm.tmpOrg_file_nm.value = org_file_nm;
			document.admCdDownFrm.tmpFile_path.value = file_path;
			document.admCdDownFrm.tmpFile_size.value = file_size;
			
			
			document.admCdDownFrm.action = "/admCdRptDownLoad.do";
	       	document.admCdDownFrm.submit();
	       	
	       	
	    	
	    }
	    
	    function fn_list() {
	    	document.admCdFrm.action = "<c:url value='/admCdList.do'/>";
	       	document.admCdFrm.submit();
	    }
	    
	    
	    //보고서 삭제
	    function fn_delete(mngNo, witrId, rpt1Id, rpt1Num) {
	    	
	    	var data=new FormData();
	    	data.append("mng_no",mngNo);
	    	data.append("witr_id",witrId);
	    	data.append("rpt1_id",rpt1Id);
	    	data.append("rpt1_num",rpt1Num);
	    	
	    	$.ajax({
		        data: data ,
		        type: "POST",
		        url: "/admCdRptDel.do",
		        cache: false,
		        contentType: false,
		        processData: false,
		        dataType:"json",	        
		        success: function(json) {
		        	alert("삭제 되었습니다.");
		        	document.admCdFrm.action = "/admCdRptMove.do";
		           	document.admCdFrm.submit();
		        	
		        }     
		    });
	    }
	    
        //-->
    </script>

    