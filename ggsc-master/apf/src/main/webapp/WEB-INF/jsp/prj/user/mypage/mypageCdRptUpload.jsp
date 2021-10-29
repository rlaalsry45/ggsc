<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


		
	    <section id="page-breadcrumb">
	        <div class="vertical-center sun">
	             <div class="container">
	                <div class="row">
	                    <div class="action">
	                        <div class="col-sm-12">
	                            <h1 class="title">보고서등록</h1>
	                            <p>보고서를 업로드 합니다.</p>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </section>
	    <!--/#page-breadcrumb-->
	
	
	
	<form id="mypageFrm" name="mypageFrm" method="post" enctype="multipart/form-data">
	    <section id="" class="padding">
	        <div class="container">
	            <div class="row">
					<div class="col-md-12 col-sm-12">
						
						<h3 class="title"><b>보고서 목록</b></h3>
						<table class="tbl_type" border="1" cellspacing="0" summary="공지사항리스트"> 
							<caption>리스트</caption> 
								<colgroup> 
									<col width="10%"></col>
									<col width="25%"></col>
									<col width="20%"></col>
									<col width="20%"></col>
									<col width="25%"></col>
								</colgroup> 
							<thead> 
								<tr> 
									<th scope="col">순번</th>
									<th scope="col">관리번호</th> 
									<th scope="col">작성자</th> 
									<th scope="col">제1대리인</th> 
									<th scope="col">파일명</th> 
								</tr> 
							</thead> 
							<tbody> 
						
							<input type="hidden" id="tmpMng_no" name="tmpMng_no" value="" />
							<input type="hidden" id="tmpWitr_id" name="tmpWitr_id" value="" />
							<input type="hidden" id="tmpWitr_name" name="tmpWitr_name" value="" />
							<input type="hidden" id="tmpRpt1_id" name="tmpRpt1_id" value="" />
							<input type="hidden" id="tmpRpt1_name" name="tmpRpt1_name" value="" />
							<input type="hidden" id="tmpSys_file_nm" name="tmpSys_file_nm" value="" />
							<input type="hidden" id="tmpOrg_file_nm" name="tmpOrg_file_nm" value="" />
							<input type="hidden" id="tmpFile_path" name="tmpFile_path" value="" />
							<input type="hidden" id="tmpFile_size" name="tmpFile_size" value="" />
							<c:forEach var="result" items="${cdList}" varStatus="status">

								<tr style="cursor:pointer;" onclick="javascript:fn_detail('<c:out value="${result.mngNo}"/>','<c:out value="${result.witrId}"/>','<c:out value="${result.witrName}"/>','<c:out value="${result.rpt1Id}"/>','<c:out value="${result.rpt1Name}"/>');" onmouseover="this.style.backgroundColor='#f1f1f1'" onmouseout="this.style.backgroundColor='#ffffff'">
									<td>${status.count}</td> 
									<td>
										<c:out value="${result.mngNo}"/>
									</td> 
									<td><c:out value="${result.witrName}"/></td> 
									<td><c:out value="${result.rpt1Name}"/></td> 
									<td>
										<a href="javascript:fn_file_download('<c:out value="${result.mngNo}"/>','<c:out value="${result.witrId}"/>','<c:out value="${result.rpt1Id}"/>','<c:out value="${result.sysFileNm}"/>','<c:out value="${result.orgFileNm}"/>','<c:out value="${result.filePath}"/>','<c:out value="${result.fileSize}"/>');" ><strong>${result.orgFileNm}</strong></a>
									</td>
								</tr> 
							</c:forEach>
						
												
							</tbody> 
						</table> 
						
						
	                    
	                    <!-- /List -->
        	
	                    
					</div>
	            </div>
	        </div>
	        
	        
	    </section>
		<!--/#services-->
	
	</form>
	
    <!--/#action-->
    <script type="text/javaScript" language="javascript" defer="defer">
        
    
    
	    //상세보기 화면으로 이동
	    function fn_detail(mngNo, witrId,witrName, rpt1Id,rpt1Name) {
	    	
	    	document.mypageFrm.tmpMng_no.value = mngNo;
			document.mypageFrm.tmpWitr_id.value = witrId;
			document.mypageFrm.tmpWitr_name.value = witrName;
			document.mypageFrm.tmpRpt1_id.value = rpt1Id;
			document.mypageFrm.tmpRpt1_name.value = rpt1Name;
	       	document.mypageFrm.action = "/mypageUploadMove.do";
	       	document.mypageFrm.submit();
	       	
	       	
	    }
    
	    
    
    
    	//보고서 다운로드
	    function fn_file_download(mng_no, witr_id, rpt1_id, sys_file_nm, org_file_nm, file_path,file_size) {
			
			
			document.mypageFrm.tmpMng_no.value = mng_no;
			document.mypageFrm.tmpWitr_id.value = witr_id;
			document.mypageFrm.tmpRpt1_id.value = rpt1_id;
			document.mypageFrm.tmpSys_file_nm.value = sys_file_nm;
			document.mypageFrm.tmpOrg_file_nm.value = org_file_nm;
			document.mypageFrm.tmpFile_path.value = file_path;
			document.mypageFrm.tmpFile_size.value = file_size;
			
			
			document.mypageFrm.action = "/mypageCdRptDownLoad.do";
	       	document.mypageFrm.submit();
	       	
	       	
	    	
	    }
        
        //-->
    </script>

    