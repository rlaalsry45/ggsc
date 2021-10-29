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
                            <h1 class="title">등록안내</h1>
                            <p>등록안내에 관련된 설명입니다.</p>
                        </div>
                     </div>
                </div>
            </div>
        </div>
    </section>
    <!--/#page-breadcrumb-->

	<form id="regFrm" name="regFrm" method="post">
    <section id="blog" class="padding">
        <div class="container">
            <div class="row">
                <div class="col-md-3 col-sm-5">
                    <div class="sidebar blog-sidebar">
                        <div class="sidebar-item categories">
                            <h3>Registration Info</h3>
                            <ul class="nav navbar-stacked">
                                <li>등록안내</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                
                <input type="hidden" id="file_num" name="file_num" value="${notVO.file_num}"/>
				<input type="hidden" id="org_file_nm" name="org_file_nm" value="${notVO.org_file_nm}"/>
				<input type="hidden" id="sys_file_nm" name="sys_file_nm" value="${notVO.sys_file_nm}"/>
				<input type="hidden" id="file_path" name="file_path" value="${notVO.file_path}"/>
				<input type="hidden" id="file_size" name="file_size" value="${notVO.file_size}"/>
				
                <div class="col-md-9 col-sm-7">
                    <div class="row">
                        
                        <div class="txtR mgT10">
							<a href ="javascript:fn_downloadFile();">${notVO.org_file_nm}
							</a>
						</div>
						
						<div class="col-md-12 col-sm-12">
                            <div class="single-blog two-column">
                                <div class="post-content overflow">
                                    <h2 class="post-title bold mgB20 txtCB">사전의료요양지시서 이용절차</h2>
                                    <img src="images/sub/business02_3.jpg" class="img-responsive" alt="사전 의료요양지시서 이용절차">
                                </div>
                            </div>
                        
                        </div>
                        
						
                        
						<div class="col-md-12 col-sm-12">
                            <div class="single-blog two-column">
                                <div class="post-content overflow">
                                    <img src="images/sub/business02_4.jpg" class="img-responsive" alt="사전의료요양지시서 이용절차">
                                </div>
                            </div>
						</div>
						<div class="col-md-12 col-sm-12">
                            <div class="single-blog two-column">
                                <div class="post-content overflow">
                                    <img src="images/sub/business02_5.jpg" class="img-responsive" alt="사전의료요양지시서 이용절차">
                                </div>
                            </div>
						</div>
                    </div>
                 </div>
            </div>
        </div>
    </section>
	<!--/#services-->
	</form>
	
	
    <!--/#action-->
    <script type="text/javaScript" language="javascript" defer="defer">
        
        function fn_downloadFile(){ 
        	//var idx = obj;
        	   
        	document.regFrm.action = "/regDownloadFile.do";
           	document.regFrm.submit();
        	
        } 
        
        
    </script>

    