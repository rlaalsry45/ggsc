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
				</ul>
				</div>
			</div> 
			<!-- //snb --> 
			<!-- content --> 
			<div class="content"> 
				<div class="paT40 paB25">
					<h1>수입지출관리 증빙자료 업로드</h1>
				</div>
				
				<h3 class="title"><b>* 증빙자료 다운로드</b></h3></br>
				<form id="admExpdDownFrm" name="admExpdDownFrm" method="post" enctype="multipart/form-data">
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
						<th scope="col">위탁자</th>
						<th scope="col">위탁자ID</th>
						<th scope="col">파일명</th>
						<th scope="col">삭제</th>
					</tr>
					</thead>
					<tbody>
					
					<input type="hidden" id="tmpMng_no" name="tmpMng_no" value="" />
					<input type="hidden" id="tmpClent_id" name="tmpClent_id" value="" />
					<input type="hidden" id="tmpExpd_num" name="tmpExpd_num" value="" />
					<input type="hidden" id="tmpCate_cd" name="tmpCate_cd" value="" />
					<input type="hidden" id="tmpSys_file_nm" name="tmpSys_file_nm" value="" />
					<input type="hidden" id="tmpOrg_file_nm" name="tmpOrg_file_nm" value="" />
					<input type="hidden" id="tmpFile_path" name="tmpFile_path" value="" />
					<input type="hidden" id="tmpFile_size" name="tmpFile_size" value="" />
					
					<c:forEach var="result" items="${expdUpfileList}" varStatus="status">
							<tr>
								<td><c:out value="${result.profNum}"/></td> 
								<td><c:out value="${result.mngNo}"/></td>
								<td><c:out value="${result.clentNm}"/></td>
								<td><c:out value="${result.clentId}"/></td> 
								<td>
									<a href="javascript:fn_file_download('<c:out value="${result.mngNo}"/>','<c:out value="${result.clentId}"/>','<c:out value="${result.cateCd}"/>','<c:out value="${result.expdNum}"/>','<c:out value="${result.sysFileNm}"/>','<c:out value="${result.orgFileNm}"/>','<c:out value="${result.filePath}"/>','<c:out value="${result.fileSize}"/>');" class="btn_big"><strong>${result.orgFileNm}</strong></a>
								</td> 
								<td>
									<a href="javascript:fn_delete('<c:out value="${result.mngNo}"/>','<c:out value="${result.clentId}"/>','<c:out value="${result.cateCd}"/>','<c:out value="${result.expdNum}"/>');" style="width:60px;">삭제하기</a>
								</td>
							</tr>
					</c:forEach>
					
					</tbody>
					</table>
				</form>
				</br></br></br>
				
				
				<h3 class="title"><b>* 증빙자료 업로드</b></h3></br>
				<!-- view  start -->
				<div class="form_table">
					<form id="admExpdFrm" name="admExpdFrm" method="post" enctype="multipart/form-data">
							<table class="notice_view" border="1" cellspacing="0" summary=""> 
								<caption>증빙자료 업로드</caption> 
								<colgroup> 
								<col width="150">
								<col width="*">
								</colgroup> 
								<tbody> 
								
								<input type="hidden" id="mng_no" name="mng_no" value="${usrMngVO.mng_no}" >
								<input type="hidden" id="clent_id" name="clent_id" value="${usrMngVO.clent_id}" >
								<input type="hidden" id="expd_num" name="expd_num" value="${usrMngVO.expd_num}" >
								<input type="hidden" id="cate_cd" name="cate_cd" value="${usrMngVO.cate_cd}" >
								
								<tr> 
									<th>관리번호</th> 
									<td>
										<div class="item">
										${usrMngVO.mng_no}
										</div>
									</td> 
								</tr> 
								<tr> 
									<th>보고서 업로드</th> 
									<td>
										<div class="item">
											<input type="file" id="expdFile" name="expdFile" value="" class="i_text wp95" >
										</div>
									</td> 
								</tr>  
								</tbody> 
							</table>
					</form>
				</div>
				<div class="fl_R mgT10">
					<a href="javascript:fn_list();" class="btn_big"><strong>목록</strong></a>
					<a href="javascript:fn_upload();" class="btn_big"><strong>저장</strong></a>
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
    
    	//파일 업로드
	    function fn_upload() {
	    	
			document.admExpdFrm.action = "/admExpdUpload.do";
	       	document.admExpdFrm.submit();
	    }
	    
	    //파일 다운로드
		function fn_file_download(mngNo, clentId, cateCd, expdNum, sysFileNm, orgFileNm, filePath, fileSize) {
			
			document.admExpdDownFrm.tmpMng_no.value = mngNo;
			document.admExpdDownFrm.tmpClent_id.value = clentId;
			document.admExpdDownFrm.tmpExpd_num.value = expdNum;
			document.admExpdDownFrm.tmpCate_cd.value = cateCd;
			document.admExpdDownFrm.tmpSys_file_nm.value = sysFileNm;
			document.admExpdDownFrm.tmpOrg_file_nm.value = orgFileNm;
			document.admExpdDownFrm.tmpFile_path.value = filePath;
			document.admExpdDownFrm.tmpFile_size.value = fileSize;
			
			
			document.admExpdDownFrm.action = "/admExpdDownLoad.do";
	       	document.admExpdDownFrm.submit();
	       	
	       	
	    	
	    }
	    
	    function fn_list() {
	    	document.admExpdFrm.action = "<c:url value='/admExpdList.do'/>";
	       	document.admExpdFrm.submit();
	    }
	    
	    
	  	//수입지출 증빙자료 삭제
	    function fn_delete(mngNo, clentId, cateCd, expdNum) {
	    	
	    	var data=new FormData();
	    	data.append("mng_no",mngNo);
	    	data.append("clent_id",clentId);
	    	data.append("cate_cd",cateCd);
	    	data.append("expd_num",expdNum);
	    	
	    	$.ajax({
		        data: data ,
		        type: "POST",
		        url: "/admExpdFileDel.do",
		        cache: false,
		        contentType: false,
		        processData: false,
		        dataType:"json",	        
		        success: function(json) {
		        	alert("삭제 되었습니다.");
		        	document.admExpdDownFrm.action = "/admExpdUploadMove.do";
		           	document.admExpdDownFrm.submit();
		        	
		        }     
		    });
	    }
	    
	    
        //-->
    </script>

    