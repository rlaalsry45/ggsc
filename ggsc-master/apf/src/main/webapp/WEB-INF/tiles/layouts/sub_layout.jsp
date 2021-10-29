<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
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
</head><!--/head-->

<body>
	<tiles:insertAttribute name="header" />

<!-- 	<tiles:insertAttribute name="body" /> -->
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
                                <li><a href="business01.html">법적미래설계</a></li>
                                <li class="active"><a href="business02.html">사전의료요양지시서</a></li>
                                <li><a href="business03.html">지속적대리권</a></li>
                                <li><a href="business04.html">고령자신택</a></li>
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

    

	<tiles:insertAttribute name="footer" />
    <!--/#footer-->


    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
	 <script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=true"></script>
    <script type="text/javascript" src="js/gmaps.js"></script>
    <script type="text/javascript" src="js/lightbox.min.js"></script>
    <script type="text/javascript" src="js/wow.min.js"></script>
    <script type="text/javascript" src="js/main.js"></script>   
</body>
</html>
