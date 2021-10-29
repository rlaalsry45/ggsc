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
    <title>인사말</title>
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
  <body>
    <!-- 헤더 ================================================== -->
    <header class="navbar-wrapper">
      <nav class="navbar navbar-static-top">
        <div class="navbar-header">
          <div class="container">
            <a class="navbar-brand" href="/gnoincoun/homepageMainList.do"><img src="/gnoincoun/assets/img/logo.png" alt="경기도노인종합상담센터" /></a>
            <div class="social-icons pull-right">
              <ul class="nav nav-pills">
                <li><a href="/gnoincoun/homepageMainList.do" class="btn btn-primary btn-xs"><i class="fa fa-home mr5"></i>홈</a></li>
                <c:choose>
				    <c:when test="${loginYn eq 'Y'}">
				        <li><a href="/gnoincoun/logout.do" class="btn btn-primary btn-xs"><i class="fa fa-lock mr5"></i>로그아웃</a></li>
				        <li><a href="/gnoincoun/mypageView.do" class="btn btn-primary  btn-xs"><i class="fa fa-user mr5"></i>마이페이지</a></li>
				    </c:when>
				    <c:otherwise>
				        <li><a href="/gnoincoun/login.do" class="btn btn-primary btn-xs"><i class="fa fa-unlock-alt mr5"></i>로그인</a></li>
				        <li><a href="/gnoincoun/agree.do" class="btn btn-primary  btn-xs"><i class="fa fa-user mr5"></i>회원가입</a></li>
				    </c:otherwise>
				</c:choose> 
              </ul>
            </div>
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
              <span class="sr-only">전체메뉴</span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
            </button>
          </div>
        </div>

        <div id="navbar" class="collapse navbar-collapse">
          <div class="container">
          <ul class="nav navbar-nav navbar-right">
            <li class="dropdown active">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">센터소개<i class="fa fa-angle-down"></i></a>
              <ul class="dropdown-menu"  role="menu">
                <li class="dropdown-item active"><a href="/gnoincoun/salutation.do">인사말<i class="fa fa-caret-right"></i></a></li>
                <li class="dropdown-item"><a href="/gnoincoun/operatCorp.do">운영법인<i class="fa fa-caret-right"></i></a></li>
                <li class="dropdown-item"><a href="/gnoincoun/missionVis.do">미션관 비젼 <i class="fa fa-caret-right"></i></a></li>
                <li class="dropdown-item"><a href="/gnoincoun/centerFoot.do">센터의 발자취<i class="fa fa-caret-right"></i></a></li>
                <li class="dropdown-item"><a href="/gnoincoun/peopleTg.do">함께하는 사람들<i class="fa fa-caret-right"></i></a></li>
                <li class="dropdown-item"><a href="/gnoincoun/directions.do">오시는길<i class="fa fa-caret-right"></i></a></li>
              </ul>
            </li>
            <li>
              <a href="/gnoincoun/oldCnsCenter.do">시&middot;군 노인상담센터</a>
            </li>
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">사업소개<i class="fa fa-angle-down"></i></a>
              <ul class="dropdown-menu"  role="menu">
                <li class="dropdown-item"><a href="/gnoincoun/cnsSupport.do">상담지원사업<i class="fa fa-caret-right"></i></a></li>
                <li class="dropdown-item"><a href="/gnoincoun/eduBusin.do">교육사업<i class="fa fa-caret-right"></i></a></li>
                <li class="dropdown-item"><a href="/gnoincoun/publicBusin.do">홍보사업<i class="fa fa-caret-right"></i></a></li>
                <li class="dropdown-item"><a href="/gnoincoun/linkBusin.do">연계협력사업<i class="fa fa-caret-right"></i></a></li>
              </ul>
            </li>
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">소통의 공간<i class="fa fa-angle-down"></i></a>
              <ul class="dropdown-menu"  role="menu">
                <li class="dropdown-item"><a href="/gnoincoun/centerNewsList.do">센터소식<i class="fa fa-caret-right"></i></a></li>
                <li class="dropdown-item"><a href="/gnoincoun/docLibraryList.do">문서자료실<i class="fa fa-caret-right"></i></a></li>
                <li class="dropdown-item"><a href="/gnoincoun/freeBoardList.do">자유게시판<i class="fa fa-caret-right"></i></a></li>
                <li class="dropdown-item"><a href="/gnoincoun/comfCnsWrite.do">맘편한 상담<i class="fa fa-caret-right"></i></a></li>
                <li class="dropdown-item"><a href="/gnoincoun/psyCnsList.do">간편한 심리검사<i class="fa fa-caret-right"></i></a></li>
              </ul>
            </li>
          </ul>
            </div>
        </div><!-- navbar-collapse -->
      </nav>
    </header>
    <!-- 컨텐츠  ================================================== -->
    <!-- 서브 비쥬얼 영역 -->
    <section class="title_explain hidden-xs">
      <div class="container">
        <dl>
          <dt>
            센터소개    </dt>
          <dd class="explanation">
            마음으로 만나는 어르신의 행복한 노후     </dd>
          <dd class="explanEng">
            GNOIN Hall Introdution    </dd>
        </dl>
      </div>
    </section>
    <!-- 서브 비쥬얼 영역 //-->
    <div class="container content-wrapper">
      <div class="page-header">
        <h1 class="title">인사말</h1>
        <ol class="breadcrumb">
          <li><a href="/gnoincoun/homepageMainList.do">홈</a></li>
          <li><a href="#">센터소개</a></li>
          <li class="active">인사말</li>
        </ol>
      </div>
      <div class="content">
        <dl class="intro">
          <dt>"<br>
            마음이 웃어야 진정 웃는 게지!<br>
            어르신들의 마음이 웃을 수 있도록 가까이에서 함께 하겠습니다.<br>
            " </dt>
          <dd> 정말로 열심히 사셨습니다. <br>
            어르신들의 삶은 오늘날 우리 사회의 발전과 안녕의 밑거름이 되었습니다. <br>
            또한 어르신들의 모습은 곧 우리의 미래이기도 합니다. </dd>
          <dd> 경기도노인종합상담센터는 이런 <strong>어르신들께 ‘사랑의 빚’을 갚는 마음</strong>으로 <br>
            평온한 노후를 저해하는 심리·사회적 어려움 해소에 도움이 되고자 합니다. </dd>
          <dd>첫째,<br>
			  우울, 상실, 불안, 성, 역할 변화, 관계 갈등에 대한 <strong>심리상담</strong>을 주축으로<br>
            학대, 자살, 치매 관련 등의 전문기관과 함께 하는 <strong>위기상담</strong>과<br>
            생활 상의 불편 및 어려움 등에 대한 복지정보제공 및 서비스 연계의 <strong>복지상담</strong>을 통해<br>
			어르신들과 어르신 가족들의 어려움을 덜어드리겠습니다. </dd>
			<dd>이를 위해 경기도는<strong>「경기도노인종합상담센터 설치 및 운영 조례」</strong>를 제정하고 이에 근거하여<br>
			어르신과 가족들께서 거주지와 가까운 곳에서 상담을 받으실 수 있도록<br>
			경기도 내 <strong>31개 시·군 58곳</strong>의 <strong>노인상담센터</strong>에 <strong>전문상담사</strong>를 배치하여 운영하고 있습니다. </dd>
          <dd> 둘째,<br>
			  어르신들의 안전한 일상을 지원해드리기 위해 마련된 보건복지부의<br>
			  1. <strong>독거노인기본돌봄서비스사업(경기도 내 40개소)</strong>과<br>
			  2. <strong>중증장애인·독거노인 응급안전 알림서비스사업(31개소)</strong>의 <strong>경기거점센터</strong>로서 <br>
			  정기적인 독거어르신의 안부확인, 혹서기-혹한기 보호 체계 운영 및 안전 확인 알림<br>
			  장비 설치 및 운영을 지원하고 있습니다. </dd>
          <dd> 저희 전 직원들은 어르신을 직접 모시는 마음으로 <br>
            경기도 내 노인상담과 돌봄서비스의 따뜻한 운영을 위하여 정성을 다하겠습니다. </dd>
          
          <dd>경기도노인종합상담센터<br>
            센터장 <span><img src="/gnoincoun/assets/img/intro/intro_n1.png" alt="" style="vertical-align:middle"></span> 드림 </dd>
        </dl>
      
      </div><!-- .content /-->
    </div><!-- .container /-->
    <!-- FOOTER -->
    <footer>
      <div class="copyaddress">
        <ul>
          <!--<li><b>경기도노인종합상담센터</b></li>-->
          <li><span>주소 : </span><a href="javascript:top_address()">경기도 수원시 장안구 경수대로 1150, 도서관 3층</a></li>
          <li><span>사업자등록번호 : </span>722-82-00367<span class="ml10">대표 : </span>김미나</li>
          <!--<li class="col col-xs-4 text-right"><span>대표 : </span>김미나</li>-->
          <li><span> TEL : </span> <a href="javascript:top_tel()">031-222-1360</a></li>
          <li><span> FAX : </span><a href="javascript:top_fax()">070-4832-6366</a></li>
          <li><span>E-mail : </span><a href="javascript:top_email()">ggnoincoun@gmail.com</a></li>
          <li><span>개인정보담당자 : </span>김지원  </li>
          <li class="copyright">COPYRIGHT(c) <b>GNOIN</b> ALL RIGHT RESERVED</li>
        </ul>
      </div>
     <!-- <p class="pull-right"><a href="#">Top</a></p>-->
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