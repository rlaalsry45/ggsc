<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="file:///C|/Users/asdf/Documents/favicon.ico">
    <title>상담문의하기 등록</title>
    <!-- Bootstrap core CSS -->
    <link href="/gnoincoun/assets/css/bootstrap.min.css" rel="stylesheet">
    <link href="/gnoincoun/assets/css/font-awesome.min.css" rel="stylesheet">
    <!--[if lt IE 9]><script src="assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="/gnoincoun/assets/js/ie-emulation-modes-warning.js"></script>
    <script src="/gnoincoun/js/jquery-1.11.2.min.js" ></script>
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="assets/js/html5shiv.min.js"></script>
      <script src="assets/js/respond.min.js"></script>
    <![endif]-->
    <!-- Custom styles for this template -->
    <link href="/gnoincoun/assets/css/theme.css" rel="stylesheet">
  </head>
  <script>
  	$(document).ready(function() {
  		$("#title").empty().
  		$("#pw").empty();
	});
  	
  	function fn_reg() {
		if(confirm("등록 하시겠습니까?")){
			document.frm.action = "/gnoincoun/cnsAskReg.do";
	       	document.frm.submit();
		}		
  	}
  </script>
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
                <li><a href="careLibraryList.do">마음돌봄 자료실<i class="fa fa-caret-right"></i></a></li>
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
        <h1 class="title"><i class="fa fa-comments-o"></i>상담문의하기</h1>
        <ol class="breadcrumb">
          <li><a href="/gnoincoun/">Home</a></li>
          <!--<li><a href="#">센터소개</a></li>-->
          <li class="active">마음돌봄 자료실</li>
        </ol>
      </div>
      <div class="content-area">
        <form class="form-wrap" id="frm" name="frm" method="post" enctype="multipart/form-data">
          <input type="hidden" id="save" name="save" value='<c:out value="${save }"/>' />
          <div class="form-group">
            <label class="control-label" for="title">제목</label>
            <input type="text" class="form-control" id="title" name="title">
          </div>
          <div class="form-group">
            <label class="control-label" for="pw">비밀번호</label>
            <input type="password" class="form-control" id="pw" name="pw">
          </div>
          <div class="form-group">
            <label class="control-label" for="cntn">문의내용</label>
            <textarea rows="5" class="form-control" id="cntn" name="cntn"></textarea>
          </div>
          <div class="btn-wrap line bt mt20 pt20 pb20">
            <button type="button" class="btn btn-primary btn-lg w100p" id="save" onClick="javascript:fn_reg();">등록하기</button>
          	<button type="button" class="btn btn-primary btn-lg w100p" id="save" onclick="location.href='/gnoincoun/cnsAskList.do'" style="color: #fff; background-color: #78849E; border-color: #78849E;">목록</button>
          </div>
        </form>
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
        
        // 첨부파일 
        var fileTarget = $('.filebox .upload-hidden'); 
        fileTarget.on('change', function(){  // 값이 변경되면 
          if(window.FileReader){ // modern browser 
            var filename = $(this)[0].files[0].name; 
          } 
          else {  // old IE 
              var filename = $(this).val().split('/').pop().split('\\').pop();  // 파일명만 추출 
          } 
          // 추출한 파일명 삽입 
          $(this).siblings('.upload-name').val(filename); 
          }); 
        
        
        });
		</script>
  </body>
</html>