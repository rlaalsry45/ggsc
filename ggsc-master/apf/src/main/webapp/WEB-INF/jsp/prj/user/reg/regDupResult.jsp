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
                
                
				
                <div class="col-md-9 col-sm-7">
                    <div class="row">
                        
                        <div class="txtR mgT10">
							
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
        
        window.onload = function() {
        	alert("이미 등록 하셨습니다.");  
        	document.regFrm.action = "/egovMainList.do";
           	document.regFrm.submit();
        }
        
        
    </script>

    