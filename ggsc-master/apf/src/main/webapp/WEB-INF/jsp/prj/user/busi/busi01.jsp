<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
    
	<section id="page-breadcrumb">
        <div class="vertical-center sun">
             <div class="container">
                <div class="row">
                    <div class="action">
                        <div class="col-sm-12">
                            <h1 class="title">사업소개</h1>
                            <p>법적미래설계에 관련된 설명입니다.</p>
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
                                <li class="active"><a href="busi01.do">법적미래설계</a></li>
                                <li><a href="busi02.do">사전의료요양지시서</a></li>
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
                                    <img src="images/sub/business01.jpg" class="img-responsive" alt="">
                                </div>
                                <div class="post-content overflow">
                                    <h2 class="post-title bold mgB20 txtCB">고령자인구</h2>
                                    <p>우리나라 : 고령화 진척 속도 가장 빠름 / 2017년 65세 노인인구 738만명(14%)</p>
									<p>2017년 치매환자 70만명 / 치매유병율 10% / 고령자 가구 중 1인 가구 : 33.7% / 부부가구 : 33.4%</p>
									<p>(2/3이상의 고령자들이 독립하여 생활)</p>
                                    
                                </div>
                            </div>
                        </div>
						<div class="col-md-12 col-sm-12">
                            <div class="single-blog two-column">
                                <div class="post-content overflow">
                                    <h2 class="post-title bold mgB20 txtCB">경험하는 변화</h2>
                                    <p>①신체·생리 ▶ 주름, 척추, 디스크, 치매, 질병↑, 체력↓</p>
									<p>②인지 ▶ 지능, 기억력, 학습능력, 사고 및 문제해결 능력, 창의성↓</p>
									<p>③사회적 관계 ▶ 노동기회X, 사회적 관계망→←</p>
                                    <p>④성격 ▶ 신체·인지 + 사회적 관계 변화→ 성격 변화</p>
									<p>⑤죽음 ▶ 준비하여야하는 시기 </p>
                                </div>
                            </div>
                        </div>
						<div class="col-md-12 col-sm-12">
                            <div class="single-blog two-column">
                                <div class="post-content overflow">
                                    <h2 class="post-title bold mgB20 txtCB">고령에도 필요한 일상생활</h2>
                                    <img src="images/sub/business02_1.jpg" class="img-responsive" alt="고령에도 필요한 일상생활">
                                </div>
                            </div>
                        </div>
						<div class="col-md-12 col-sm-12">
                            <div class="single-blog two-column">
                                <div class="post-content overflow">
                                    <h2 class="post-title bold mgB20 txtCB">왜 우리의 희망과 노후가 다를까?</h2>
                                    <img src="images/sub/business02_2.jpg" class="img-responsive" alt="고령에도 필요한 일상생활">
                                </div>
                            </div>
							<div id="alert-container">
								<div class="row">
									<div class="col-md-12">
										<h2 class="page-header">법적설계가 없다면…(1) : 경제적 준비?</h2>
									</div>
									<div class="col-md-12">
										<div class="alert alert-danger fade in">
											<h4>- 잠자는 돈이 됨</h4>
											<h4>- 애먼사람 배불림</h4>
											<h4>- 자식들에게 부모재산 = 상속재산</h4>
										</div>
										<p class="txt1em">지식:(상속받으면)내 돈을 펑펑 쓰라니</p>
									</div>

									<div class="col-md-12">
										<h2 class="page-header">법적설계가 없다면…(1) : 건강관리?</h2>
									</div>
									<div class="col-md-12">
										<div class="alert alert-info fade in">
											<h4>- 몸짱할배도 피할 수 없는 운명 = 요양시설</h4>
											<h4>- 신체건강한 치매고령자 = 천덕꾸러기</h4>
											<h4>- 누가 나를 데리고 계속 병원에 갈까</h4>
											<h4>- 얼마나 더 산다고..</h4>
										</div>
										<p class="txt1em">얼마나 더 산다고 이 나이 먹고 수술은 NO</p>
										<p class="txt1em">얼마나 더 산다고 식이요법보단 먹고 싶은 음식</p>
									</div>
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

    