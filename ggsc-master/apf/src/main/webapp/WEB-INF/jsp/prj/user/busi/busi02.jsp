<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
    
      <section id="page-breadcrumb">
        <div class="vertical-center sun">
             <div class="container">
                <div class="row">
                    <div class="action">
                        <div class="col-sm-12">
                            <h1 class="title">사업소개</h1>
                            <p>사전의료요양지시서에 관련된 설명입니다.</p>
                        </div>
                     </div>
                </div>
            </div>
        </div>
    </section>
    <!--/#page-breadcrumb-->

    <section id="blog" class="padding">
        <div class="container">
            <div class="row">
                <div class="col-md-3 col-sm-5">
                    <div class="sidebar blog-sidebar">
                        <div class="sidebar-item categories">
                            <h3>Business</h3>
                            <ul class="nav navbar-stacked">
                                <li><a href="busi01.do">법적미래설계</a></li>
                                <li class="active"><a href="busi02.do">사전의료요양지시서</a></li>
                                <li><a href="busi03.do">지속적대리권</a></li>
                                <li><a href="busi04.do">고령자신택</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-md-9 col-sm-7">
                    <div class="row">
                        <div class="col-md-12 col-sm-12">
                            <div class="single-blog two-column">
                                <div class="post-thumb mgB50">
                                    <img src="images/sub/business02.jpg" class="img-responsive" alt="">
                                </div>
                                <div class="post-content overflow">
                                    <h2 class="post-title bold mgB20 txtCB">사전의료요양지시서란?</h2>
                                    <p>내가 원하는 것을 이야기할 수 있을 때or 의사결정을 할 수 있을 때 자신이 원하는 노후가 어떤 것인지 미리 설계한 문서 (주거, 취미활동, 의료요양서비스 등)</p>
                                    
                                </div>
                            </div>
                        </div>
						<div class="col-md-12 col-sm-12">
							<div class="col-md-12">
								<div class="alert alert-success fade in">
									<h4>- 본인의 희망(요양, 의료, 음식, 돈, 자신만의 개성 등), 신뢰할 수 있는 대리인을 미리 준비</h4>
									<h4>- 사전의료요양지시서 작성(증인 입회)  “센터” 등록(전자)</h4>
									<h4>- 언제든지 추가, 수정, 철회 가능</h4>
									<h4>- 지시서의 내용대로 대리인이 나를 대변</h4>
								</div>
							</div>
                        </div>
						<div class="col-md-12 col-sm-12">
                            <div class="single-blog two-column">
                                <div class="post-content overflow">
                                    <h2 class="post-title bold mgB20 txtCB">사전의료요양지서의 주요내용</h2>
                                    <p>①작성자, 대리인, 증인</p>
									<p>②적용시기</p>
									<p>③대리인의 권한</p>
                                    <p>④주거와 요양에 관한 의사<span class="txt10">(주택개조,주거환경개선,요양서비스,질병치료 등)</span></p>
									<p>⑤적용철회 및 종료</p>
									<p>⑥보관기관과 권한</p>
                                </div>
                            </div>
                        </div>
						<div class="col-md-12 col-sm-12">
                            <div class="single-blog two-column">
                                <div class="post-content overflow">
                                    <h2 class="post-title bold mgB20 txtCB">사전의료요양지시서 이용절차</h2>
                                    <img src="images/sub/business02_3.jpg" class="img-responsive" alt="사전의료요양지시서 이용절차">
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

    