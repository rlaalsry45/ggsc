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
    <title>센터의 발자취</title>
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
                <li class="dropdown-item"><a href="/gnoincoun/salutation.do">인사말<i class="fa fa-caret-right"></i></a></li>
                <li class="dropdown-item"><a href="/gnoincoun/operatCorp.do">운영법인<i class="fa fa-caret-right"></i></a></li>
                <li class="dropdown-item"><a href="/gnoincoun/missionVis.do">미션관 비젼 <i class="fa fa-caret-right"></i></a></li>
                <li class="dropdown-item active"><a href="/gnoincoun/centerFoot.do">센터의 발자취<i class="fa fa-caret-right"></i></a></li>
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
        <h1 class="title">센터의 발자취</h1>
        <ol class="breadcrumb">
          <li><a href="/gnoincoun/homepageMainList.do">홈</a></li>
          <li><a href="#">센터소개</a></li>
          <li class="active">센터의 발자취</li>
        </ol>
      </div>
      <div class="content">
        <div class="yearhistory">
          <p><span> 2020 </span></p>
          <ul>
            <li><strong>4월</strong><span>경기도노인종합상담센터 위·수탁 협약 체결<br>(경기도사회서비스원)</span></li>
          </ul>
		  <p><span> 2019 </span></p>
          <ul>
            <li><strong>1월</strong><span>경기도노인종합상담센터 위·수탁 협약 체결<br>(경기복지재단)</span></li>
          </ul>
          <p><span> 2018 </span></p>
          <ul>
            <li><strong>2월</strong><span> 시군 노인상담센터 신입상담사 교육</span></li>
           <li><strong>3월</strong><span> 경기도 노인복지상담사 역량강화 프로젝트 “Jump up” 힐링워크숍</span></li>
           <li><strong>4월</strong><span> 경기도 노인복지상담사 역량강화 프로젝트 “Jump up” 해결중심상담모델 교육</span></li>
           <li><strong>5월</strong><span> 시군 노인상담센터 상담사 1차 보수교육</span></li>
           <li><strong>6월</strong><span> 경기도 노인복지상담사 역량강화 프로젝트 “Jump up” 사별애도상담교육<br>
			   시군 노인상담센터 상담사 2차 보수교육</span></li>
           <li><strong>8월</strong><span> 시군 노인상담센터 상담사 3차 보수교육</span></li>
           <li><strong>9월</strong><span> 시군 노인상담센터 2차 신입상담사 교육</span></li>
          <li><strong>10월</strong><span> 시군 노인상담센터 상담사 4차 보수교육<br>
                 시군 노인상담센터 상담사 공개 수퍼비전<br>
                 솔루션센터 MOU업무 협약체결</span></li>
           <li><strong>11월</strong><span> 2018년 동년배상담지원봉사자 양성을 위한 상담사 역량강화 교육<br>
				경기도정신건강증진센터(자살예방센터) 연계·협력 간담회</span></li>
          </ul>
          <p><span> 2017 </span></p>
          <ul>
            <li><strong>1월</strong><span> 경기도 사회복지공동모금회 신청사업 선정<br>
              '어르신 고민 zero를 위한 찾아가는 노인전문상담 프로젝트' </span></li>
            <li><strong>2월</strong><span> 경기도광역치매센터 2017 '아름다운 백세'사업 진행<br>
              (43개소 상담센터) </span></li>
            <li><strong>3월 </strong><span> 시·군 노인상담센터 실무자 DB교육 및 신규교육<br>
              어르신 고민 제로를 위한 찾아가는 노인전문상담 프로젝트<br>
              '지역밀착형 노인상담을 위한 실무자 네트워크 워크숍' 진행<br>
              노인돌봄기본서비스 경기도 수행인력 집합교육<br>
              노인학대 예방 및 노인상담사업 추진 방안 회의 참석 </span></li>
            <li><strong>4월</strong><span> 노인복지상담학교 '유앤아이' 진행 <br>
              노인복지상담 1차 보수교육 '메타기억교실' 진행 </span></li>
            <li><strong>5월</strong><span> 농촌지역 찾아가는 집단상담 진행 </span></li>
            <li><strong>6월</strong><span> 시·군 노인상담센터 2차 보수교육'내러티브 접근법을 활용한 노인상담 기술의 적용' 진행 </span></li>
            <li><strong>7월</strong><span> 경기도노인종합상담센터 김미나 센터장 취임 </span></li>
          </ul>
          <p><span>2016</span></p>
          <ul>
            <li><strong> 1월 </strong><span> 노인자살예방사업 건강증진과 이관 및 시군 노인상담센터 45개에서 56개소로 확대 설치<br>
              경기도노인종합상담센터 설치 및 운영에 관한 조례 제정<br>
              경기도노인종합상담센터 위·수탁 협약 체결<br>
              (경기도 - 한국노인종합복지관협회) </span></li>
            <li><strong> 2월 </strong><span> 경기도 노인종합상담센터 고유번호증 발급(722-82-00367) </span></li>
            <li><strong> 3월 </strong><span> 2016년 경기도노인상담사업 운영 지침 설명회 </span></li>
            <li><strong> 5월 </strong><span> 2016년 우체국 "행복배달부" 지원사업 수행기관 선정<br>
              2016년 노년 행복컨설턴트 경기도 남부권역 지원센터 지정 </span></li>
            <li><strong> 6월 </strong><span> 시·군 노인상담센터 56개소 현판전달 및 현장방문<br>
              경기도 광역치매센터 MOU 체결 </span></li>
            <li><strong> 7월 </strong><span> 동수원 우체국 MOU 체결 <br>
              독거노인 의료지원 협의체 업무협약 체결<br>
              (경기도노인복지관협회 외 20개 기관) </span></li>
            <li><strong> 10월 </strong><span> 경기도노인종합상담센터 개소식 </span></li>
            <li><strong> 11월 </strong><span> 제1회 경기도노인종합상담센터 세미나 개최 </span></li>
          </ul>
                    <p><span> 2012 </span></p>
          <ul>
            <li><strong> </strong><span> 42개 시·군 노인자살전문상담원 파견 </span></li>
          </ul>
          <p><span>2011 </span></p>
          <ul>
            <li><strong> </strong><span> 31개 시·군 노인자살전문상담원 파견 </span></li>
            <li><strong> </strong><span> 지역사회서비스투자사업 자살고위험군 건강증진서비스 진행 </span></li>
          </ul>
          <p><span>2010 </span></p>
          <ul>
            <li><strong> </strong><span> '노인복지 우수프로그램' 대통령상 수상 </span></li>
            <li><strong> </strong><span> 노인자살예방을 위한 교육용 DVD 제작 및 보급 </span></li>
          </ul>
          <p><span>2009 </span></p>
          <ul>
            <li><strong> </strong><span> '경기도노인종합상담센터' 지정 </span></li>
            <li><strong> </strong><span> 18개 시·군 노인자살전문상담원 파견 </span></li>
            <li><strong> </strong><span> '경기도 노인자살예방 지원 조례' 제정 (2009.10.30) </span></li>
          </ul>
          <p><span> 2008 </span></p>
          <ul>
            <li><strong> 1월 </strong><span> '경기도노인종합상담센터'로 기관 명칭 변경 </span></li>
          </ul>
          <p><span>1999 </span></p>
          <ul>
            <li><strong> 2월 </strong><span> 경기도노인복지상담실 설치 </span></li>
          </ul>
        </div>
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