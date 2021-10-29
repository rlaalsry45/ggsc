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
										
										<input type="hidden" id="mng_no" name="mng_no" value="${mypageVO.mng_no}" >
										<input type="hidden" id="witr_id" name="witr_id" value="${mypageVO.witr_id}" >
										<input type="hidden" id="witr_name" name="witr_name" value="${mypageVO.witr_name}" >
										<input type="hidden" id="rpt1_id" name="rpt1_id" value="${mypageVO.rpt1_id}" >
										<tr> 
											<th>작성자</th> 
											<td>${mypageVO.witr_name}</td> 
											<th>제1대리인</th> 
											<td>${mypageVO.rpt1_name}</td>
										</tr>
										<tr> 
											<th>보고서 업로드</th> 
											<td colspan="3">
												<div class="item">
													<input type="file" id="mypageFile" name="mypageFile" value="" class="i_text wp95" >
												</div>
											</td> 
										</tr>  
										</tbody> 
									</table>
							</form>
						</div>
	                    <div class="txtR mgT10">
							<a href="javascript:fn_list();" class="btn_big"><strong>목록</strong></a>
							<a href="javascript:fn_upload();" class="btn_big"><strong>저장</strong></a>
						</div>
	                    
	                    <!-- /List -->
        	
	                    
					</div>
	            </div>
	        </div>
	        
	        
	    </section>
		<!--/#services-->
	
	</form>
	
    <!--/#action-->
    <script type="text/javaScript" language="javascript" defer="defer">
        
        
    	//보고서 업로드 메인페이지로 이동
	    function fn_list() {
	    	
	    	document.mypageFrm.action = "/myRptReg.do";
	       	document.mypageFrm.submit();
	    }
    
    	//보고서 업로드
		function fn_upload() {
	    	
	    	document.mypageFrm.action = "/mypageCdRptUpload.do";
	       	document.mypageFrm.submit();
	    }
        
        //-->
    </script>

    