<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="file:///C|/Users/asdf/Documents/favicon.ico">
    <title>알려드려요&amp;자유게시판</title>
    <!-- Bootstrap core CSS -->
    <link href="/gnoincoun/assets/css/bootstrap.min.css" rel="stylesheet">
    <link href="/gnoincoun/assets/css/font-awesome.min.css" rel="stylesheet">
    <!--[if lt IE 9]><script src="assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="/gnoincoun/assets/js/ie-emulation-modes-warning.js"></script>
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="assets/js/html5shiv.min.js"></script>
      <script src="assets/js/respond.min.js"></script>
    <![endif]-->
    <!-- Custom styles for this template -->
    <link href="/gnoincoun/assets/css/theme.css" rel="stylesheet">
  </head>
  <script>
  	function fn_fileDown() {
  		var sysFileNm = "${detail.sysFileNm}";
  		var filePath = "${detail.filePath}";
  		var fileNm = "${detail.fileNm}";
        document.location.href = "/gnoincoun/fileDown.do?sysFileNm="+sysFileNm+"&filePath="+filePath+"&fileNm="+fileNm;
  	}
  </script>
  <style>
  	textarea{border:1px solid #ccc;border-right:1px solid #a5a5a5;border-bottom:1px solid #a5a5a5;border-top:1px solid #ddd !important;width:100%;padding:5px;background:#f9f9f9;min-height:100px;}
  </style>
  <body>
    <!-- 헤더 ================================================== -->
    <header class="navbar-wrapper">
      <nav class="navbar navbar-static-top">
          <div class="container">
            <div class="navbar-header">
              <a class="navbar-brand" href="/gnoincoun/"><img src="/gnoincoun/assets/img/logo.png" alt="경기도노인종합상담센터" /></a>
              <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">전체메뉴</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
              </button>
            </div>
            <div id="navbar" class="navbar-collapse collapse">
              <ul class="nav navbar-nav">
                <li><a href="/gnoincoun/psyCnsIntro.do">이렇게 이용하세요<i class="fa fa-caret-right"></i></a></li>
                <li><a href="/gnoincoun/psyCnsList.do">간편한 심리검사<i class="fa fa-caret-right"></i></a></li>
                <li><a href="/gnoincoun/comfCnsInsert.do">맘편한 상담<i class="fa fa-caret-right"></i></a></li>
                <li><a href="/gnoincoun/mypageView.do">마이 페이지<i class="fa fa-caret-right"></i></a></li>
                <li class="active"><a href="/gnoincoun/freeBbsList.do">알려드려요 &amp; 자유게시판<i class="fa fa-caret-right"></i></a></li>
                <li><a href="/gnoincoun/careLibraryList.do">마음돌봄 자료실<i class="fa fa-caret-right"></i></a></li>
                <li><a href="/gnoincoun/cnsAskList.do">상담문의하기<i class="fa fa-caret-right"></i></a></li>                
              </ul>
            </div>
          </div>
        </nav>
        <div class="social-icons pull-right">
          <ul class="nav nav-pills">
            <li><a href="/gnoincoun/" class="btn btn-primary btn-xs"><i class="fa fa-home mr5"></i>홈</a></li>
            <li><a href="/gnoincoun/login.do" class="btn btn-primary btn-xs"><i class="fa fa-unlock-alt mr5"></i>로그인</a></li>
            <li><a href="/gnoincoun/agree.do" class="btn btn-primary  btn-xs"><i class="fa fa-user-plus mr5"></i>회원가입</a></li>
          </ul>
        </div>
    </header><!-- header.navbar-wrapper /-->
    <!-- 컨텐츠  ================================================== -->
    <div class="container content-wrapper">
      <div class="page-header">
        <h1 class="title"><i class="fa fa-comments-o"></i>알려드려요&amp;자유게시판</h1>
        <ol class="breadcrumb">
          <li><a href="/gnoincoun/">Home</a></li>
          <!--<li><a href="#">센터소개</a></li>-->
          <li class="active">마음돌봄 자료실</li>
        </ol>
      </div>
      <div class="content-area">
        <div class="article-area">
          <div class="board_box article-header" >
            <div class="txt_area">   
              <!-- 제목 -->
              <strong class="tit"><c:out value="${detail.title }"/></strong>
              <!-- 제목 //-->
              <!-- 글등록정보 -->
              <div class="user_area">
                <span class="nick">
                  <span class="ellip"><span class="ellip"><c:out value="${detail.writer }"/></span></span>
                  <span class="time"><c:out value="${detail.dbInsTm }"/></span>
                  <span class="no"><c:out value="${detail.num }"/></span>
                </span>
              </div>
              <!-- 글등록정보 //-->
            </div>
            <div class="file-area">
              <c:if test="${detail.fileNm != null }">
	              <a href="javascript:fn_fileDown()" class="btn btn-default btn-sm mb3"><i class="fa fa-download mr5"></i>첨부파일 다운로드</a>
              </c:if>
              <!-- <a href="" class="btn btn-default btn-sm mb3"><i class="fa fa-download mr5"></i>첨부파일2 다운로드</a>
              <a href="" class="btn btn-default btn-sm mb3"><i class="fa fa-download mr5"></i>첨부파일3 다운로드</a> -->
            </div>
          </div><!-- board_box //-->
          <div class="article-body">
            <div class="article">
              <textarea><c:out value="${detail.cntn }" escapeXml="false"/></textarea>
            </div>
            
          </div><!-- .article-body /-->
            
        </div><!-- .article-list-area /-->
        <div class="btn-wrap line bt bb pt10 pb10 mt20 text-center">
          <button type="button" class="btn btn-default fl" onclick="location.href='view.html'"><i class="fa fa-caret-left mr5"></i>이전글</button>
          <button type="button" class="btn btn-normal" onclick="location.href='/gnoincoun/freeBbsList.do'"><i class="fa fa-align-justify mr5"></i>목록</button>
          <button type="button" class="btn btn-default fr" onclick="location.href='view.html'">다음글<i class="fa fa-caret-right ml5"></i></button>
        </div>
      </div><!-- .content-area /-->
    </div><!-- .container.content-wrapper /-->
    <!-- FOOTER -->
    <footer>
      <div class="copyaddress">
        <ul>
          <li><b>경기도노인종합상담센터</b></li>
          <li><span>주소 : </span><a href="javascript:top_address()">경기도 수원시 장안구 경수대로 1150, 도서관 3층</a></li>
          <li><span>사업자등록번호 : </span>722-82-00367<span class="ml10">대표 : </span>김미나</li>
          <li><span> TEL : </span> <a href="javascript:top_tel()">031-222-1360</a></li>
          <li><span> FAX : </span><a href="javascript:top_fax()">070-4832-6366</a></li>
          <li><span>E-mail : </span><a href="javascript:top_email()">ggnoincoun@gmail.com</a></li>
          <li><span>개인정보담당자 : </span>김지원  </li>
          <li class="copyright">COPYRIGHT(c) <b>GNOIN</b> ALL RIGHT RESERVED</li>
        </ul>
      </div>
    </footer>

    <script src="/gnoincoun/assets/js/jquery.min.js"></script>
    <script src="/gnoincoun/assets/js/bootstrap.min.js"></script>
    <!--<script src="assets/js/docs.min.js"></script>-->
    <script src="/gnoincoun/assets/js/ie10-viewport-bug-workaround.js"></script>
    <script>
      $(document).ready(function(){ 
          // 로그인 회원가입 관리자 메뉴  
          $('.navbar-toggle').on('click', function() {
            $('.social-icons').fadeToggle(200);
          });
      });
		</script>
  </body>
</html>