<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
  /**
  * @Class Name : egovSampleList.jsp
  * @Description : Sample List 화면
  * @Modification Information
  *
  *   수정일         수정자                   수정내용
  *  -------    --------    ---------------------------
  *  2009.02.01            최초 생성
  *
  * author 실행환경 개발팀
  * since 2009.02.01
  *
  * Copyright (C) 2009 by MOPAS  All right reserved.
  */
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>고령자미래설계지원센터</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="css/lightbox.css" rel="stylesheet"> 
    <link href="css/animate.min.css" rel="stylesheet"> 
	<link href="css/main.css" rel="stylesheet">
	<link href="css/responsive.css" rel="stylesheet">
	<link href="css/base.css" rel="stylesheet">

    <!--[if lt IE 9]>
	    <script src="js/html5shiv.js"></script>
	    <script src="js/respond.min.js"></script>
    <![endif]-->       
    <link rel="shortcut icon" href="images/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="images/ico/apple-touch-icon-57-precomposed.png">
    
    
    
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
</head>

<body style="text-align:center; margin:0 auto; display:inline; padding-top:100px;">
    <form:form>
	<input type="hidden" name="selectedId" />
       <div id="login_area"><c:import url="/EgovPageLink.do?link=main/inc/EgovIncTborder" /></div>
       <header id="header">      
        <div class="container">
            <div class="row">
                <div class="col-sm-12 overflow">
                   <div class="social-icons pull-right">
                        <ul class="nav nav-pills">
                            <li><a href="login.html" class="txtCB"><i class="fa fa-unlock-alt"></i> 로그인</a></li>
                            <li><a href="membership.html" class="txtCB"><i class="fa fa-user-plus"></i> 회원가입</a></li>
                        </ul>
                    </div> 
                </div>
             </div>
        </div>
        <div class="navbar navbar-inverse" role="banner">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>

                    <a class="navbar-brand" href="index.html">
                        <h1><img src="images/logo.png" alt="logo"></h1>
                    </a>
                    
                </div>
                <div class="collapse navbar-collapse">
                    <ul class="nav navbar-nav navbar-right">
                        <li class="dropdown"><a href="aboutus.html">센터소개 <i class="fa fa-angle-down"></i></a>
                            <ul role="menu" class="sub-menu">
                                <li><a href="aboutus.html">센터소개</a></li>
                                <li><a href="contact.html">오시는 길</a></li>
                            </ul>
                        </li>     
                        <li class="dropdown"><a href="business01.html">사업소개 <i class="fa fa-angle-down"></i></a>
                            <ul role="menu" class="sub-menu">
                                <li><a href="business01.html">법적미래설계</a></li>
                                <li><a href="business02.html">사전의료요양지시서</a></li>
                                <li><a href="business03.html">지속적대리권</a></li>
                                <li><a href="business04.html">고령자신택</a></li>
                            </ul>
                        </li>                    
                        <li class="dropdown"><a href="reg.html">등록하기 <i class="fa fa-angle-down"></i></a>
                            <ul role="menu" class="sub-menu">
                                <li><a href="reg.html">등록하기</a></li>
                            </ul>
                        </li>
                        <li class="dropdown"><a href="notice.html">소통안내 <i class="fa fa-angle-down"></i></a>
                            <ul role="menu" class="sub-menu">
                                <li><a href="notice.html">공지사항</a></li>
                                <li><a href="faq.html">FAQ</a></li>
                            </ul>
                        </li>                         
                        <li class="dropdown"><a href="member_info.html">마이페이지 <i class="fa fa-angle-down"></i></a>
                            <ul role="menu" class="sub-menu">
                                <li><a href="member_info.html">회원정보</a></li>
                                <li><a href="reg_info.html">등록정보</a></li>
                            </ul>
                        </li>                    
                    </ul>
                </div>
				 <div class="search">
                    <form role="form">
                        <i class="fa fa-search"></i>
                        <div class="field-toggle">
                            <input type="text" class="search-form" autocomplete="off" placeholder="Search">
                        </div>
                    </form>
                </div>
			</div>
        </div>
    </header>
    <!--/#header-->

    <section id="home-slider">
        <div class="container">
            <div id="carousel-container">
                <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                    <ol class="carousel-indicators visible-xs">
                        <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                        <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                        <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                    </ol>
                    <div class="carousel-inner">
                        <div class="item active">
                            <img src="images/home/h_pic1.jpg" class="img-responsive alt="메인이미지">
                            <div class="carousel-caption mgmL250">
                                <a href="#" class="btn btn-common">자세히보기</a>
                            </div>
                        </div>
                        <div class="item">
                            <img src="images/home/h_pic1.jpg" class="img-responsive  alt="메인이미지">
                            <div class="carousel-caption mgmL250">
                                <a href="#" class="btn btn-common">자세히보기</a>
                            </div>
                        </div>
                        <div class="item">
                            <img src="images/home/h_pic1.jpg" class="img-responsive  alt="메인이미지">
                            <div class="carousel-caption mgmL250">
                                <a href="#" class="btn btn-common">자세히보기</a>
                            </div>
                        </div>
                    </div>
                    <a class="left carousel-control hidden-xs" href="#carousel-example-generic" data-slide="prev">
                        <span class="glyphicon glyphicon-chevron-left"></span>
                    </a>
                    <a class="right carousel-control hidden-xs" href="#carousel-example-generic" data-slide="next">
                        <span class="glyphicon glyphicon-chevron-right"></span>
                    </a>
                </div><!--/#carousel-example-generic-->
            </div><!--/#carousel-container-->
        </div>
     </section>
    <!--/#home-slider-->
	
	<section id="action" class="responsive">
        <div class="vertical-center">
             <div class="container">
                <div class="row">
                    <div class="action take-tour">
                        <div class="col-sm-7 wow fadeInLeft" data-wow-duration="500ms" data-wow-delay="300ms">
                            <h1 class="title">어떻게 신청하나요?</h1>
                            <p>안내입니다(TEL. 02-2220-4279 / E-mail. koreanguardianship@gmail.com)</p>
                        </div>
                        <div class="col-sm-5 text-center wow fadeInRight" data-wow-duration="500ms" data-wow-delay="300ms">
                            <div class="tour-button">
                                <a href="#" class="btn btn-common mgL250"><i class="fa fa-heart"></i> 신청하기</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--/#action-->

    <section id="services">
        <div class="container">
            <div class="row">
                <div class="col-sm-4 text-center padding wow fadeIn" data-wow-duration="1000ms" data-wow-delay="300ms">
                    <div class="single-service">
                        <div class="wow scaleIn" data-wow-duration="500ms" data-wow-delay="300ms">
                            <a href=""><img src="images/home/pic1.jpg" alt="고령자의 자기옹호 지원이란?"></a>
                        </div>
                        <h2>자기옹호 지원</h2>
                        <p>고령자의 자기옹호 지원이란?에 대한 설명글을 여기에 나열해 줘야 합니다. 설명글이 필요합니다.</p>
                    </div>
                </div>
                <div class="col-sm-4 text-center padding wow fadeIn" data-wow-duration="1000ms" data-wow-delay="600ms">
                    <div class="single-service">
                        <div class="wow scaleIn" data-wow-duration="500ms" data-wow-delay="600ms">
                            <a href=""><img src="images/home/pic2.jpg" alt="센터 지원서비스"></a>
                        </div>
                        <h2>지원서비스</h2>
                        <p>고령자미래설계지원센터가 지원하는 서비의 대한 소개입니다. 설명글이 필요합니다.</p>
                    </div>
                </div>
                <div class="col-sm-4 text-center padding wow fadeIn" data-wow-duration="1000ms" data-wow-delay="900ms">
                    <div class="single-service">
                        <div class="wow scaleIn" data-wow-duration="500ms" data-wow-delay="900ms">
                            <a href=""><img src="images/home/pic3.jpg" alt="어떤 상황일때 이용하는게 좋을까요?"></a>
                        </div>
                        <h2>이용 서비스</h2>
                        <p>어떤 상황일때 이용하는게 가장 좋은 서비스를 받을 수 있을까요? 향후 더 나은 서비스입니다.</p>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--/#services-->

    <section id="features">
        <div class="container">
            <div class="row">
                <div class="single-features">
                    <div class="col-sm-6 wow fadeInLeft" data-wow-duration="500ms" data-wow-delay="300ms">
                        <a href=""><img src="images/home/image1.png" class="img-responsive" alt=""></a>
                    </div>
                    <div class="col-sm-6 wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="0ms">
                    <h2>공지사항</h2>
                    <ul class="elements">
                        <li class="wow fadeInUp"><i class="fa fa-angle-right"></i> <a href="">공지사항 제목입니다. 공지사항 제목입니다.</a><span class="time">2019.06.25</span></li>
                        <li class="wow fadeInUp"><i class="fa fa-angle-right"></i> <a href="">공지사항 제목입니다. 공지사항 제목입니다.</a><span class="time">2019.06.25</span></li>
                        <li class="wow fadeInUp"><i class="fa fa-angle-right"></i> <a href="">공지사항 제목입니다. 공지사항 제목입니다.</a><span class="time">2019.06.25</span></li>
                        <li class="wow fadeInUp"><i class="fa fa-angle-right"></i> <a href="">공지사항 제목입니다. 공지사항 제목입니다.</a><span class="time">2019.06.25</span></li>
                        <li class="wow fadeInUp"><i class="fa fa-angle-right"></i> <a href="">공지사항 제목입니다. 공지사항 제목입니다.</a><span class="time">2019.06.25</span></li>
                    </ul>
                </div>
                </div>
            </div>
        </div>
    </section>
     <!--/#features-->

    <section id="clients">
        <div class="container">
            <div id="feature-container">
                <div class="row">
                    <div class="col-sm-3 wow fadeInUp" data-wow-duration="500ms" data-wow-delay="300ms">
                        <div class="feature-inner">
                            <a href=""><div class="icon-wrapper"><i class="fa fa-2x fa-clipboard"></i></div></a>
                            <h2>센터정보</h2>
                            <p>고령자미래설계지원센터를 소개해 드립니다.</p>
                        </div>
                    </div>
                    <div class="col-sm-3 wow fadeInUp" data-wow-duration="500ms" data-wow-delay="600ms">
                        <div class="feature-inner">
                            <a href=""><div class="icon-wrapper"><i class="fa fa-2x fa-desktop"></i></div></a>
                            <h2>지원서비스</h2>
                            <p>센터에서 지원하는 모든 서비스 안내입니다.</p>
                        </div>
                    </div>
                    <div class="col-sm-3 wow fadeInUp" data-wow-duration="500ms" data-wow-delay="900ms">
                        <div class="feature-inner">
                            <a href=""><div class="icon-wrapper"><i class="fa fa-2x  fa-heart"></i></div></a>
                            <h2>FAQ</h2>
                            <p>자주 문는 질문에 대해 답해드립니다.</p>
                        </div>
                    </div>
                    <div class="col-sm-3 wow fadeInUp" data-wow-duration="500ms" data-wow-delay="1200ms">
                        <div class="feature-inner">
                            <a href=""><div class="icon-wrapper"><i class="fa fa-2x fa-comments-o"></i></div></a>
                            <h2>1:1온라인 상담</h2>
                            <p>고객님의 궁금증을 바로 해결해 드립니다.</p>
                        </div>
                    </div>                        
                </div>
            </div><!--/#feature-container-->
        </div>
     </section>
    <!--/#clients-->
	
	<section id="action" class="responsive">
        <div class="vertical-center">
             <div class="container">
                <div class="row">
                    <div class="action take-tour">
                        <div class="col-sm-7 wow fadeInLeft" data-wow-duration="500ms" data-wow-delay="300ms">
                            <h1 class="title">도움이 필요하세요?</h1>
                            <p><span class="txt_int20">고령자미래설계지원센터(대표) <strong>02.2220-4279</strong></span> / 운영시간 평일9:00~18:00</p>
                        </div>
                        <div class="col-sm-5 text-center wow fadeInRight" data-wow-duration="500ms" data-wow-delay="300ms">
                            <div class="bs-example">
                                <a href="#" class="btn btn-common"><i class="fa fa-heart"></i> 상담신청</a>
								<a href="#" class="btn btn-common mgL10"><i class="fa fa-comments"></i> 톡 상담</a>
							</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--/#action-->

    <footer id="footer">
        <div class="container">
            <div class="row">
                <div class="col-sm-12 paT20 paB20">
                    고령자미래설계지원센터 서울특별시 성동구 왕십리로 222 305, (한양대학교 에이치아이티) / tel : 02-2220-4279 / fax : 02-2220-4278<br />
					COPYRIGHT@ALL RIGHT RESERVED. 44444444444444444444444
                </div>
            </div>
        </div>
    </footer>
    <!--/#footer-->
	

    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/lightbox.min.js"></script>
    <script type="text/javascript" src="js/wow.min.js"></script>
    <script type="text/javascript" src="js/main.js"></script>   
       
       
    </form:form>
</body>
</html>
