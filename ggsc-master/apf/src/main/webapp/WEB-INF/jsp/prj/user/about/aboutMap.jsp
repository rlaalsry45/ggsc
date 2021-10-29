<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
    
      <section id="page-breadcrumb">
        <div class="vertical-center sun">
             <div class="container">
                <div class="row">
                    <div class="action">
                        <div class="col-sm-12">
                            <h1 class="title">오시는 길</h1>
                            <p>고령자미래설계지원센터 찾아오시는 길입니다.</p>
                        </div>
                     </div>
                </div>
            </div>
        </div>
    </section>
    <!--/#page-breadcrumb-->
    
     

    <section id="" class="padding">
        <div class="container">
           
            <div id="gmap">
            
	            <!-- start 오시는길 -->
			    <div class="details">
				   <div class="dir_map">
				       <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3162.8795113035144!2d127.04485235210547!3d37.55790243227878!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357ca4a5b72fccbb%3A0x455ab73c9cbe5787!2z7ISc7Jq47Yq567OE7IucIOyCrOq3vOuPmSDtlZzslpHrjIDtlZnqtZAg7KKF7ZWp6riw7Iig7Jew6rWs64-Z!5e0!3m2!1sko!2skr!4v1552639362039" width="100%" height="400" frameborder="0" style="border:0" allowfullscreen></iframe>
				</div>
			    <div class="mgT50">
				    <h4><strong>사단법인 한국후견협회</strong></h4>
				    <p class="para">
				      서울시 성동구 왕십리로 222, 305호 (사근동, 한양대학교 에이치아이티)<br />
				      전화 _ 02-2220-4279
				    </p>
			    </div>
			    <div class="clear"></div>
			    <!-- end 오시는길 -->
            </div>
           
			<div class="row">
               <div class="col-sm-12 wow fadeInDown mgT20" data-wow-duration="1000ms" data-wow-delay="0ms">
                    <p><strong>서울특별시 성동구 왕십리로 222, 305호(한양대학교 HIT)</strong></p>
                    <ul class="elements">
                        <li class="wow fadeInUp" data-wow-duration="900ms" data-wow-delay="100ms"><i class="fa fa-angle-right"></i> E-mail : koreanguardianhip@gmail.com</li>
                        <li class="wow fadeInUp" data-wow-duration="800ms" data-wow-delay="200ms"><i class="fa fa-angle-right"></i> Phone : 02-2220-4279</li>
                    </ul>
                </div>
            </div>
        </div>
    </section>
	<!--/#services-->
	
	
    <!--/#action-->
    <script type="text/javaScript" language="javascript" defer="defer">
        <!--
        /* 글 수정 화면 function */
        function fn_egov_select(id) {
        	document.listForm.selectedId.value = id;
           	document.listForm.action = "<c:url value='/updateSampleView.do'/>";
           	document.listForm.submit();
        }
        
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

    